-- Run this in Supabase SQL Editor: https://supabase.com/dashboard/project/bscsogmiwpmrzgqoskix/sql

-- Create rsvps table
CREATE TABLE IF NOT EXISTS rsvps (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT,
  guests TEXT,
  response TEXT NOT NULL CHECK (response IN ('yes', 'no')),
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security (RLS)
ALTER TABLE rsvps ENABLE ROW LEVEL SECURITY;

-- Allow anyone to INSERT (so the invite form can save RSVPs)
CREATE POLICY "Allow anonymous insert" ON rsvps
  FOR INSERT WITH CHECK (true);

-- Allow anyone to SELECT (so the admin page can read - keep admin URL private)
CREATE POLICY "Allow anonymous select" ON rsvps
  FOR SELECT USING (true);
