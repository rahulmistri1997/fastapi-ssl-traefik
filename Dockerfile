FROM python:3.10.8-bullseye

WORKDIR /app

RUN pip install --upgrade pip

RUN pip install pipenv

COPY Pipfile.lock Pipfile.lock

COPY Pipfile Pipfile

RUN pipenv install --system --deploy --ignore-pipfile

COPY . .

EXPOSE 8000

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0"]