CREATE TABLE warmups (
    id INTEGER PRIMARY KEY,
    warmup_date TIMESTAMP NOT NULL,
    duration_minutes INTEGER CHECK (duration_minutes > 0)
);

CREATE TABLE amplitudes (
    id INTEGER PRIMARY KEY,
    warmup_id INTEGER NOT NULL,
    joint_name VARCHAR(30) CHECK (joint_name REGEXP '^[A-Za-z]+$'),
    max_safe_angle FLOAT CHECK (
        max_safe_angle >= 0.0 AND max_safe_angle <= 180.0
    ),
    FOREIGN KEY (warmup_id) REFERENCES warmups(id)
);

CREATE TABLE feedbacks (
    id INTEGER PRIMARY KEY,
    amplitude_id INTEGER NOT NULL,
    reaction_type VARCHAR(10) CHECK (reaction_type IN ('audio', 'visual')),
    feedback_time TIMESTAMP NOT NULL,
    FOREIGN KEY (amplitude_id) REFERENCES amplitudes (id)
);
