Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X4tp-0003JI-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 16:19:25 +0000
Message-ID: <38D64F12.C11D7F06@nexus-tech.net>
Date: Mon, 20 Mar 2000 11:17:22 -0500
From: Kyle Harris <kharris@nexus-tech.net>
MIME-Version: 1.0
To: Oron Ogdan <Orono@m-sys.com>
CC: David Woodhouse <dwmw2@infradead.org>, Dvir Oren <dvir@lucidvon.com>,
        MTD <mtd@infradead.org>
Subject: Re: Questions about MTD
References: <B17893052A17D211A9860060978F7E63014A0542@mail.msys.co.il>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



Oron Ogdan wrote:
> 
> Kyle Harris Wrote :
> > I've seen reference to "saving the bad block table" in a couple of
> > places now. It seems that the file system should be able to
> > dynamically
> > create/maintain the bad block table. Is this not true?
> >
> No It's not true, The Bad Block table is static and should not change
> during the life cycle of the device. Just think of the possibility of
> a power failure during the update to this table.
> 
> When talking about new bad blocks that occur during the life cycle of the
> device, it is very
> hard to determine when a new "bad block" is really bad. Just think of
> situations such as power down, Noisy hardware etc. Our philosophy now
> (in M-Systems) is marking new bed blocks only in the copy of the bad
> block table that resides in RAM. So further writes to this block will be
> prevented until the next reset.
> 
> In the next reset, Either the block is bad and then the first write
> will fail again and further writes will be prevented, Or it's good and
> then can be reused.

So will the device still work if the static table has been deleted?

Kyle.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
