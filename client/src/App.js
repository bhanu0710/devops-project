import React, { useEffect, useState } from "react";

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    fetch("/api/tutorials")
      .then((res) => res.json())
      .then((data) => {
        console.log(data);
        setData(data);
      })
      .catch((err) => console.error(err));
  }, []);

  return (
    <div style={{ padding: "20px" }}>
      <h1>DevOps 3-Tier App</h1>
      <h2>Backend Data:</h2>

      {data.length === 0 ? (
        <p>No data found</p>
      ) : (
        <ul>
          {data.map((item, index) => (
            <li key={index}>
              <strong>{item.title}</strong> - {item.description}
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

export default App;
