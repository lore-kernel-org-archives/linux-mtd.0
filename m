Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13pYBY-0008G5-00
	for mtd-list@infradead.org; Sat, 28 Oct 2000 16:46:20 +0100
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13pYBU-0008Fz-00
	for mtd@infradead.org; Sat, 28 Oct 2000 16:46:19 +0100
Date: Sat, 28 Oct 2000 16:45:12 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: John Whipple <john@broadlink.com>
cc: mtd@infradead.org
Subject: Re: DOC + MTD + Advantech Biscuit = nothing?
In-Reply-To: <39FA2171.E9D9EB63@broadlink.com>
Message-ID: <Pine.LNX.4.21.0010281639090.19542-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 27 Oct 2000, John Whipple wrote:

> Obviously the DOC is not being found,

Looks like it - can you check it's not turning up in /proc/mtd? 
When using modules, make sure doc2000.o and doc2001.o are either loaded
before docprobe.o, or they're somewhere where modprobe can find and
autoload them.


> but If I have the address jumpered to something other than D400, I get:
> unable to register NFTL block device

That really shouldn't depend on where the DiskOnChip is jumpered to or
whether it's found or not. Play with different locations for it until you
get it to turn up in /proc/mtd. Worry about NFTL later. The error message
you quoted looks like you tried to load the NFTL module into a kernel with
NFTL support builtin. Check for nftl in /proc/devices.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
