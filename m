Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 134Pkg-0007gY-00
	for mtd-list@infradead.org; Tue, 20 Jun 2000 16:15:46 +0100
Date: Tue, 20 Jun 2000 16:16:07 +0200 (CEST)
From: <dwmw2@infradead.org>
To: Nick Ivanter <nick@auriga.ru>
cc: mtd@infradead.org, jffs-dev@axis.com
Subject: Re: garbage collect
In-Reply-To: <394F7351.BC878E0D@auriga.ru>
Message-ID: <Pine.LNX.4.10.10006201614120.7301-100000@impact-pc01.gnk.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 20 Jun 2000, Nick Ivanter wrote:

> I've compiled JFFS and MTD into the kernel and tried to play with it on
> the mtdram device. It seems to work, but when I tried to mount device
> without manually specifying a filesystem type, I got error: "Unable to
> handle kernel NULL pointer dereference at virtual address ...........
> Process mount........... Segmentation fault". When specifying -t jffs,
> everything seems to be ok.
> Does anyone have ideas about what may cause that?

Probably the mtdblock device falling over when a 'real' filesystem
actually causes a block read request, which jffs will never do because it
goes straight to the underlying MTD device.

What kernel version? Can you give me a backtrace of the oops?

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
