Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13r6pa-0000IT-00
	for mtd-list@infradead.org; Wed, 01 Nov 2000 22:58:06 +0000
Date: Wed, 1 Nov 2000 17:52:44 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Gregory Schallert <gschallert@dawning.com>,
        "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: mtdblock module & I'm Back again 
In-Reply-To: <Pine.LNX.4.21.0011012242220.19994-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.10.10011011750540.3584-100000@xanadu.vipswitch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Wed, 1 Nov 2000, David Woodhouse wrote:

> On Wed, 1 Nov 2000, Nicolas Pitre wrote:
> 
> > However, in the mean time, you might consider investigating JFFS which
> > might just do what you want.  Even if JFFS requires mtdblock it is used
> > only to identify the flash device so the issue with mtdblock write support
> > doesn't apply to JFFS.
> 
> That's also being worked on. It won't take too much to remove the
> FS_REQUIRES_DEV flag from the jffs filesystem and allow you to use it
> without having to have the placebo mtdblock device present. 

Be sure it is still usable for root filesystems as it does now...


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
