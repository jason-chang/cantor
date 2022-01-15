
FROM snowdreamtech/frps



COPY frps.ini /etc/frp/frps.ini

RUN apk add sed

ARG FRPS_DASHBOARD_PWD
ARG FRPS_AUTH_TOKEN

RUN sed -i "s/dashboard_pwd = admin/dashboard_pwd = ${FRPS_DASHBOARD_PWD}/" /etc/frp/frps.ini
RUN sed -i "s/token = 12345678/token = ${FRPS_AUTH_TOKEN}/" /etc/frp/frps.ini

