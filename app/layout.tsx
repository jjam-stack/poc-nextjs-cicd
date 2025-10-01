import "./globals.css";
import type { Metadata } from "next";
import { ReactNode } from "react";

export const metadata: Metadata = {
  title: "Next.js POC",
  description: "Proof of Concept app with Next.js 14",
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <body>
        <main style={{ padding: "20px", fontFamily: "sans-serif" }}>
          <h1>Next.js POC</h1>
          {children}
        </main>
      </body>
    </html>
  );
}
