package by.epam.buber.controller.util.impl.get;

import by.epam.buber.controller.util.Command;
import by.epam.buber.controller.util.Page;
import by.epam.buber.controller.util.RequestAttribute;
import by.epam.buber.repository.RepositoryFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetChangeName implements Command {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute(RequestAttribute.ERROR, false);
        request.getRequestDispatcher(Page.USER_NAME).forward(request, response);
    }
}
