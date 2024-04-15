CREATE INDEX "models.maintenance"
    ON project.models
    USING btree
    (maintenance_cost);

CREATE INDEX "passengers.trip_no"
    ON project.passengers
    USING btree
    (trip_no);

CREATE INDEX "planes.plane_series"
    ON project.planes
    USING btree
    (plane_series);
