Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12XEux-00050J-00
	for mtd-list@infradead.org; Tue, 21 Mar 2000 03:01:15 +0000
Received: from tisch.mail.mindspring.net ([207.69.200.157])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12XEuw-00050D-00
	for mtd@infradead.org; Tue, 21 Mar 2000 03:01:14 +0000
Message-ID: <38D6E583.3C2E1334@nexus-tech.net>
Date: Mon, 20 Mar 2000 21:59:15 -0500
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
To: Oron Ogdan <Orono@m-sys.com>
CC: MTD <mtd@infradead.org>
Subject: Re: Questions about MTD
References: <B17893052A17D211A9860060978F7E63014A0544@mail.msys.co.il>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



Oron Ogdan wrote:
> 
> Kyle Harris Wrote:
> > So will the device still work if the static table has been deleted?
> >
> Yes and no, Yes after you format it again the bad block table will be empty,
> So all blocks (including the originally bad ones will be used) which will
> work 99.99% of the time. But No I would not go to manufacturing with such
> devices. It can only be used for R&D and even this is pretty risky.
> 

I don't mean to drag this on.... but I'd really like to understand this.
How are the original bad blocks determined (if they work 99.99% of the
time). Are they the bad blocks indicated by the virgin flash device
(e.g., Samsung indicates bad blocks by writing zero data to the first
page)? Or are they determined by some testing process? I'm guessing the
0.01% failure would be such that data is not retained, since if the
block fails on a write/verify it will simply be mapped as bad and
skipped.

Thanks for any additional info, Kyle.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
