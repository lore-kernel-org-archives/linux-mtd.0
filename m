Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195olC-0005UG-1v
	for <linux-mtd@lists.infradead.org>; Wed, 16 Apr 2003 16:23:42 +0100
Date: Wed, 16 Apr 2003 17:23:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Dave Ellis <DGE@sixnetio.com>
Message-ID: <20030416152316.GB21697@wohnheim.fh-wedel.de>
References: <00512BA4F9D3D311912A009027E9B8F407E4D9@NT>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00512BA4F9D3D311912A009027E9B8F407E4D9@NT>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 April 2003 10:17:49 -0400, Dave Ellis wrote:
> 
> I have also seen poor performance with jffs2 and a ramdisk. At first
> writes are fast, but after a little while there are pauses of almost
> 5 seconds for a single write. Then it is fast again for less than a 
> second, then the big pause. The problem is worse with a small (512K)
> ramdisk. I don't think it is possible to write to flash fast enough
> to cause the problem.
> 
> The problem is that garbage collection only puts the block to erase
> on the erase list. It then triggers the erase by marking the superblock
> dirty. It can be up to 5 seconds later (with default kupdate times)
> when kupdate writes the superblock and starts the erase.
> 
> I don't want to run kupdate 10 times a second, so I patched nodemgmt.c
> to do the erase directly for MTD_RAM devices. This solves the problem,
> but I am not sure if it is the right (or even safe) solution.

Interesting patch. Thanks!

> +			if (c->mtd->type == MTD_RAM) {

It might be cleaner to put another capability in the flags field, set
it for MTD_RAM and do something like this

			if (c->mtd->flags & MTD_DIRECT_ERASE) {

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
