Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 140o0c-0004JK-00
	for mtd-list@infradead.org; Tue, 28 Nov 2000 16:53:34 +0000
Message-ID: <00B4D286538DD311BC6E005004E9EFC73B0F6E@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org, "JFFS (E-mail)" <jffs-dev@axis.com>
Subject: RE: Oops in JFFS 
Date: Tue, 28 Nov 2000 16:53:29 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> -----Original Message-----
> 
> Which didn't happen before?
> 

No - after the first oops, anything that was talking to JFFS just stopped,
and trying to unmount JFFS came back with device busy.

Simon


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
