Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12y09z-0003HL-00
	for mtd-list@infradead.org; Fri, 02 Jun 2000 23:43:23 +0100
From: Patrick Higgins <phiggins@transzap.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Date: Fri, 2 Jun 2000 16:47:12 -0600 (MDT)
Subject: Vacation
Message-ID: <Pine.LNX.4.21.0006021631400.13387-101000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463810046-1527699588-959986032=:13387"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463810046-1527699588-959986032=:13387
Content-Type: TEXT/PLAIN; charset=US-ASCII


I'm going on vacation for a week.  I'll be taking my books on
Reed-Solomon coding, but I won't be doing any hacking for a while.  I'm
attaching the current state of my work (it's completely undocumented,
unfortunately) in case anyone wants to look.

Basically, I've collected data files by dumping out the buffer and
syndroms on every read and write.  These are in ASCII form in the files
ecc.*.  ecc.err contains a known failure, and the rest are ok.  The ones
named ecc.ok* are from reads, and ecc.wr* are from writes.  The files
named data.* are binary versions of the same files.  The files syn.* are
the decoded syndromes from these data files.  Nothing is special about the
decoding, it just turns them from their odd six-byte interleaved format
into something readable.

The files polys and polynomials contain the 60 primitive polynomials over
GF(2^10).  They are in numeric format in polys, and polynomials contains
just the exponents of terms whose coefficient is 1.  For example,

10 3 0  really means  x^10 + x^3 + 1

Most of the C programs are just for converting data formats.  The main one
of interest is gf.c, which actually attempts to compute the syndromes, but
I haven't been able to get a match with what the hardware returns yet.

I'm not sure if this will be of any use to anyone, but have a look if
you're interested.  I wasn't able to find any good references on the web
for Reed-Solomon, but there were several good books at the library on
it.  I really wouldn't recommend diving into this without a reference.

Patrick


---1463810046-1527699588-959986032=:13387
Content-Type: APPLICATION/x-gzip; name="rs.tar.gz"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.21.0006021647120.13387@phiggins.transzap.com>
Content-Description: 
Content-Disposition: attachment; filename="rs.tar.gz"

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
/z8YMGDAgAEDJw/+H9uj1YcAyAAA

---1463810046-1527699588-959986032=:13387--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
