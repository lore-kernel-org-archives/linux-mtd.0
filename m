Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q2Lf-0003DY-6o
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:56:56 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5BA04D23357
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 13:00:04 +0300 (EEST)
Message-ID: <3EE6FC72.10107@intracom.gr>
Date: Wed, 11 Jun 2003 12:54:58 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Jasmine Strong <jasmine@regolith.co.uk>
References: <4A3DE310-9BEB-11D7-B76F-000393AD6294@regolith.co.uk>
In-Reply-To: <4A3DE310-9BEB-11D7-B76F-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jasmine Strong wrote:

>
> On Wednesday, Jun 11, 2003, at 09:43 Europe/London, Pantelis Antoniou 
> wrote:
> [snip]
>
> 1)  Where are you going to store this bad block list?
>
> There isn't anywhere on the Flash that can be guaranteed good.
> You can't pick a set location for the bad block list, so you must scan
> for it-  and once you have found it you must have some way to
> check that you are looking at a good copy of it.
>
> If you plan to generate it at mount time, you run the risk that
> a block has gone bad while the device has been dormant, and
> thus you may generate a block list that does not match the one
> the device was written with,  which could render a block
> -structured filesystem like cramfs unreadable.
>
> Also, all this scanning takes time, which makes mounting slow.

I'm talking about a read only filesystem, and generating
the bad block info at mount time.

Perhaps I could also use some kind of lazy bad block scanning technique
in which the list would only be generated up to point where
someone requested a read.

Well, and if a block goes bad what was written as good there
is nothing any filesystem can do but die complaining.

>
> 2)  What about blocks that go bad while the system is in service?
>
> Flash blocks go bad randomly, and often while they are in use.
> You must use a strategy to cope with this-  JFFS and YAFFS use
> Reed-Solomon forward error correction.

Well, blocks go bad generally at writting, something that is
quite rare at a read only filesystem.
As for error correction I won't reinvent the wheel, I'll use the
JFFS2 error correction.

>
> 3)  What about wear-levelling?
>
> Flash blocks do not last indefinitely.  Every erase brings the Flash
> block you are erasing closer to the end of its lifespan.  Obviously
> this is less of a concern on a static filesystem like cramfs.
>
> Why not put a cramfs filesystem into a file on a YAFFS or JFFS2
> filesystem and use a loopback to mount it?
>
> -Jas.
>
>
>
Again, no need for that on a read-only filesystem. The number of erases
I expect during the life of the device is lower than 100.

And using the loopback trick is impossible for the root filesystem.

Anyway thanks for the input.

Regards

Pantelis
