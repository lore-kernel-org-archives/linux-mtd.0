Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13v6Wm-0006mh-00
	for mtd-list@infradead.org; Sun, 12 Nov 2000 23:27:12 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13v6Wl-0006mb-00
	for mtd@infradead.org; Sun, 12 Nov 2000 23:27:11 +0000
Date: Sun, 12 Nov 2000 23:27:08 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Adam Agnew <agnew@glue.umd.edu>
cc: <mtd@infradead.org>
Subject: Re: Detecting the Disk-On-Chip 2800
In-Reply-To: <Pine.GSO.4.21.0011111836570.1496-100000@y.glue.umd.edu>
Message-ID: <Pine.LNX.4.30.0011122323360.4815-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 11 Nov 2000, Adam Agnew wrote:

> Is it common to be unable to detect the DOC after you've flashed a bios to
> it?

Yes. You've removed the 0x55 0xaa signature at the beginning of the device
which the probe code uses to detect it.

> Can you get around that by explicitly stating the the memory address
> and length for it?

You can disable the check for that signature by turning off
CONFIG_MTD_DOCPROBE_55AA. It should still do the rest of the probe as
normal.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
