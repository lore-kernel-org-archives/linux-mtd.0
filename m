Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13r6bd-0008J2-00
	for mtd-list@infradead.org; Wed, 01 Nov 2000 22:43:41 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13r6bc-0008Iw-00
	for mtd@infradead.org; Wed, 01 Nov 2000 22:43:40 +0000
Date: Wed, 1 Nov 2000 22:43:30 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
cc: Gregory Schallert <gschallert@dawning.com>,
    "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: mtdblock module & I'm Back again 
In-Reply-To: <Pine.LNX.4.10.10011011431390.3482-100000@xanadu.vipswitch.com>
Message-ID: <Pine.LNX.4.21.0011012242220.19994-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Wed, 1 Nov 2000, Nicolas Pitre wrote:

> IMHO mtdblock is currently broken.  It works read-only.  I'm implementing
> the write support at the moment.
> 
> However, in the mean time, you might consider investigating JFFS which
> might just do what you want.  Even if JFFS requires mtdblock it is used
> only to identify the flash device so the issue with mtdblock write support
> doesn't apply to JFFS.

That's also being worked on. It won't take too much to remove the
FS_REQUIRES_DEV flag from the jffs filesystem and allow you to use it
without having to have the placebo mtdblock device present. 

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
