Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZalU-0000h7-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 15:45:12 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZalS-0000h1-00
	for mtd@infradead.org; Mon, 27 Mar 2000 15:45:10 +0100
Date: Mon, 27 Mar 2000 16:44:57 +0200 (CEST)
From: Bjorn Wesen <bjorn.wesen@axis.com>
To: Scott Anderson <sanders@mvista.com>
cc: Alexander Larsson <alex@cendio.se>, mtd@infradead.org,
        SeokKuon Kwon <kwonsk@mutech.co.kr>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD
In-Reply-To: <38DF728E.3F04C812@mvista.com>
Message-ID: <Pine.LNX.3.96.1000327164003.31589G-100000@fafner.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, Scott Anderson wrote:
> Thanks to Alexander, I may not have to.  I'm under the impression that Axis'
> file system implements wear-leveling, so if there isn't an FTL, then the
> file system itself must rotate through free blocks to prevent a given sector
> from being worn out.  Is this correct?  If not, would you mind educating me?

The flash is not divided into blocks in our JFFS. The flash is logically a
single circular append-only file (but with random access of course).
Wear-leveling comes implicitely in that model, since the log-file is
circular.

The only way the flash's sector-coarseness comes into view, is when areas
not in use anymore need to be reclaimed - the garbage collector can only
reclaim if an entire sector is unused (or contains redundant information).

We're in the process of writing a white-paper about this. The concept is
extremely simple; the implementation is not always as simple :) 

-Bjorn



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
