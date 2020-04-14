package by.epam.buber.controller.util.impl.get;

import by.epam.buber.controller.util.Command;
import by.epam.buber.controller.util.Page;
import by.epam.buber.controller.util.RequestAttribute;
import by.epam.buber.controller.util.impl.post.PostCancelOrder;
import by.epam.buber.exception.ControllerException;
import by.epam.buber.exception.ServiceException;
import by.epam.buber.service.OrderService;
import by.epam.buber.service.ServiceFactory;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class GetUserPage implements Command {
    private static final Logger logger = LogManager.getLogger(GetUserPage.class);

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,
            ControllerException {
        OrderService orderService = ServiceFactory.getInstance().getOrderService();
        HttpSession session = request.getSession();
        try {
            request.setAttribute(RequestAttribute.ORDERED, orderService.orderMade((Integer) session.getAttribute("userId")));
        }
        catch (ServiceException e){
            logger.error("error during command GetUserPage", e);
            throw new ControllerException(e);
        }
        request.getRequestDispatcher(Page.USER_PAGE).forward(request, response);
    }
}
