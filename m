Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143JJR-00006R-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 14:43:21 +0000
Date: Tue, 5 Dec 2000 09:43:13 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <mark.langsdorf@amd.com>, <mtd@infradead.org>
Subject: Re: Odd behavior of JFFS with AMD chips - kernel panic! 
In-Reply-To: <5734.976006984@redhat.com>
Message-ID: <Pine.LNX.4.30.0012050937380.2601-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 5 Dec 2000, David Woodhouse wrote:

>
> nico@cam.org said:
> >  David --> This is really really misleading and non-intuitive.  Is
> > there a good reason to have a separate device node only for read-only
> > access?
>
> No good reason. I inherited the device nodes from a previous driver - as
> they're already been registered, it made sense at the time to use them as
> they were.

Well... At the time of my original inquiry my device nodes were as follows:
crw-rw-r--   1 root     root      90,   0 Dec  1 17:21 /dev/mtd0
crw-rw-r--   1 root     root      90,   1 Dec  1 17:21 /dev/mtd1
crw-rw-r--   1 root     root      90,   2 Dec  1 17:21 /dev/mtd2
crw-rw-r--   1 root     root      90,   3 Dec  1 17:21 /dev/mtd3
crw-rw-r--   1 root     root      90,   4 Dec  1 17:21 /dev/mtd4
crw-rw-r--   1 root     root      90,   5 Dec  1 17:21 /dev/mtd5

Now having discovered mtd/util/MAKEDEV things aren't as bad as before.

;-)


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
