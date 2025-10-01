"use client";

import { useEffect, useState } from "react";

export default function HomePage() {
  const [message, setMessage] = useState<string>("Loading...");

  useEffect(() => {
    fetch("/api/hello")
      .then((res) => res.json())
      .then((data) => setMessage(data.message))
      .catch(() => setMessage("Failed to load API"));
  }, []);

  return (
    <div>
      <p>API Response:</p>
      <p>Jep Jep</p>
      <pre>{message}</pre>
    </div>
  );
}
