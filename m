Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FdLF-00041b-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 14:59:53 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FdLE-00041V-00
	for mtd@infradead.org; Fri, 21 Jul 2000 14:59:52 +0100
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.9.3/8.9.3) with ESMTP id PAA26378
	for <mtd@infradead.org>; Fri, 21 Jul 2000 15:00:55 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC729B274@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>
Subject: 
Date: Fri, 21 Jul 2000 14:59:48 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01BFF31B.F093DC50"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01BFF31B.F093DC50
Content-Type: text/plain;
	charset="iso-8859-1"

I've added a set of xxx_2_by_8 routines to cfi_cmdset_0002.c to support the
hardware I'm using.

I also added code in cfi_amdext_setup() to select the correct routines based
on buswidth and interleave.


 <<cfi_cmdset_0002.c.diff.gz>> 

Simon


========================================================
Simon Munton	simonm@m4data.co.uk
M4 Data Ltd	Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells	Fax: 44-1749-673928
Somerset, BA5 3DG, England



------_=_NextPart_000_01BFF31B.F093DC50
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002.c.diff.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c.diff.gz"

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

------_=_NextPart_000_01BFF31B.F093DC50--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
