Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Gcmn-0003MU-00
	for mtd-list@infradead.org; Mon, 24 Jul 2000 08:36:25 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Gcml-0003MO-00
	for mtd@infradead.org; Mon, 24 Jul 2000 08:36:23 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC729B2A2@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: Gregory Schallert <gschallert@dawning.com>, mtd@infradead.org
Subject: RE: ELANSC400
Date: Mon, 24 Jul 2000 08:36:17 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi Greg,

My company's using a board with an ElanSC410 and 4 AM29LV017B flash chips,
connected as yours are. I've just got MTD working on it, and have mounted
and used JFFS on them. 

I don't believe the 29F016 is a CFI compliant device, so you won't be able
to use the cfi_xxxxx routines from MTD directly, but it wouldn't be too hard
to get a driver going for the 29F016 - you could probably use the actual
read/write/erase functions from cfi_cmdset_0002.c directly.

Simon

========================================================
Simon Munton				simonm@m4data.co.uk
M4 Data Ltd					Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells		Fax: 44-1749-673928
Somerset, BA5 3DG, England




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
