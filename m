Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZalZ-0000hP-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:45:17 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZalY-0000h9-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:45:16 +0100
Date: Mon, 27 Mar 2000 16:44:28 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: Scott Anderson <sanders@mvista.com>
cc: mtd@infradead.org, Bjorn Wesen <bjorn.wesen@axis.com>,
        SeokKuon Kwon <kwonsk@mutech.co.kr>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD
In-Reply-To: <38DF728E.3F04C812@mvista.com>
Message-ID: <Pine.LNX.3.96.1000327164236.26529B-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, Scott Anderson wrote:

> Alexander Larsson wrote:
> > While i haven't read the M-systems patent I think the Axis fs doesn't
> > violate it, because it uses no translation array. It is a fully
> > log-structured filesystem directly on the flash memory, and not a flash to
> > block device translator.
> 
> Let me give a bit more background.  I have *not* looked at Axis' filesystem
> so my "guesses" should not be viewed as authoritative.  Figuring out the
> patent implications was something that I hadn't yet gotten around to yet.
> 
> Thanks to Alexander, I may not have to.  I'm under the impression that Axis'
> file system implements wear-leveling, so if there isn't an FTL, then the
> file system itself must rotate through free blocks to prevent a given sector
> from being worn out.  Is this correct?  If not, would you mind educating me?

Since it is log-based wear-leveling is automatically built-in. Think of
it as a circular buffer. When it is full, data is compacted from the tail
of the log and put on the head.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
