Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11xT0D-00028B-00
	for mtd-list@infradead.org; Mon, 13 Dec 1999 10:46:49 +0000
Received: from [62.6.164.226] (helo=mail.linuxgrrls.org ident=postfix)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11xT0C-000285-00
	for mtd@imladris.mvhi.com; Mon, 13 Dec 1999 10:46:48 +0000
Date: Mon, 13 Dec 1999 10:46:11 +0000 (GMT)
From: Kira Brown <kira@linuxgrrls.org>
To: Bjorn Eriksson <mdeans@algonet.se>
Cc: 'Bob Canup' <rcanup@go2fax.com>, MTD <mtd@imladris.mvhi.com>
Subject: RE: Data Reliability
In-Reply-To: <01BF40F3.C37F6580.mdeans@algonet.se>
Message-ID: <Pine.LNX.4.10.9912131042330.24338-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 7 Dec 1999, Bjorn Eriksson wrote:

> >I have already given two ways to avoid the problem: use the flash in
> >Read Only mode, or have a power supply which signals impending power
> >loss and holds itself up long enough to allow an ordered shut down.
> 
> Definitely my choice. Anyone else working on this?

We've already done it.  Since we have not a lot running on the system, a
shutdown -h takes less than a third of a second on a 99MHz AMD Elan SC410
driving an 8Mbyte DoC2000.  We didn't write any special code other than a
little thingy (technical term) that watches one of the processor GPIO pins
for a falling edge and executes a shutdown if it sees one.  One of those
funky 1F memory retention caps provides the power to do this.  (Do those
things scare anyone else or is it just me?)

kira.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
