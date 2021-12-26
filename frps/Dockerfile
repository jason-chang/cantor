FROM snowdreamtech/frps

COPY frps.ini /etc/frp/frps.ini

RUN apk add sed

RUN sed -i 's/dashboard_pwd = admin/dashboard_pwd = ${FRPS_DASHBOARD_PWD}/' /etc/frp/frps.ini

EXPOSE ${FRPS_EXPOSE_POSTS}
