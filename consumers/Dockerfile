FROM python:3.8.8-slim-buster


WORKDIR /usr/app
ADD ./requirements.txt ./
RUN pip install -r requirements.txt && \
    useradd -ms /bin/bash -g users sfu && \
    chown -R sfu:users /usr/app && \
    mkdir /usr/app/data && \
    chown -R sfu:users /usr/app/data
USER sfu
COPY --chown=sfu:users nltk_data ./nltk_data
COPY --chown=sfu:users python ./python
CMD ["python", "-u", "python/classifier.py"]
