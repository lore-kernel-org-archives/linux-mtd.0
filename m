Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hfXe-00065v-00
	for mtd-list@infradead.org; Mon, 26 Mar 2001 23:32:50 +0100
Date: Mon, 26 Mar 2001 17:32:33 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <mtd@infradead.org>
Subject: Re: Directory restructure?
In-Reply-To: <Pine.LNX.4.30.0103262244130.27497-100000@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.33.0103261730010.747-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 26 Mar 2001, David Woodhouse wrote:

>
> It's getting a bit cluttered... I'm pondering the wisdom of rearranging it
> into something like...
>
> drivers/mtd/chips - CFI, JEDEC, ROM, RAM, amd_flash, etc.
> drivers/mtd/maps - all the map drivers
> drivers/mtd/devices - all-in-one drivers like mtdram, doc2000, etc.
> drivers/mtd/users - nftl,ftl,mtdblock,mtdchar etc.
>
> Then there's the core code and the helper stuff like mtdpart.c and
> redboot.c - maybe that and the 'users' code should all remain in
> drivers/mtd - there's not too much of that.
>
> Thoughts? Suggestions?

Fine with me.

Hopefully you can play that game directly within the repository so not to
lose log history.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
