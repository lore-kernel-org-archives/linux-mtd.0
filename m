Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1482Zp-0004iJ-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 15:51:49 +0000
Date: Mon, 18 Dec 2000 10:50:56 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Erwin Authried <eauth@softsys.co.at>
cc: David Woodhouse <dwmw2@infradead.org>, <mtd@infradead.org>
Subject: Re: module registration changes
In-Reply-To: <000e01c068f3$13881180$5201a8c0@home.at>
Message-ID: <Pine.LNX.4.30.0012181049550.997-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 18 Dec 2000, Erwin Authried wrote:

> there were a couple of small changes necessary to compile on 2.0.
> Here are some other changes that I would like to commit too, please let me
> know if its ok.:
>
> * Use #ifdef NO_MM in mtdchar.c to avoid vmalloc if no MMU is used
> (uClinux).
>
> * "list.h" is missing in the 2.0 kernel source. The best thing that I could
> think of is to simply add it
> to MTD in linux/mtd/list.h.

Well...  I would suggest you add it where it belongs i.e.
include/linux/list.h.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
