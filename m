Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14abGW-0006bD-00
	for mtd-list@infradead.org; Wed, 07 Mar 2001 10:33:56 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14abGU-0006b7-00
	for mtd@infradead.org; Wed, 07 Mar 2001 10:33:55 +0000
Message-ID: <01C0A6FA.76F3D520@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: 2.0 kernel doesn't compile again :-(
Date: Wed, 7 Mar 2001 11:33:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

In physmap.c, the readb[wl], writeb[wl] calls have been replaced by __raw_read*/__raw_write*.
It seems that those functions have been introduced in the 2.4 kernel . So far, I couldn't figure
out a difference to the old functions. It seems that they should use the processors 'native' byteorder,
but aren't the old functions doing the same thing? In addition, it seems that the new function are not (yet)
implemented for the m68k architecture in the 2.4 kernel, at least I couldn't find anything in 2.4.2.

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
