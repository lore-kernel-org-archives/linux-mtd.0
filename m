Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15yWJs-0001Fg-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 10:40:32 +0000
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id LAA06504
	for <linux-mtd@lists.infradead.org>; Tue, 30 Oct 2001 11:47:51 +0100
Date: Tue, 30 Oct 2001 11:49:53 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning rewrite
Message-ID: <20011030114953.B27906@wohnheim.fh-wedel.de>
References: <20011017105143.B319@wohnheim.fh-wedel.de> <20011024142842.A16290@wohnheim.fh-wedel.de> <20011026150826.A19450@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20011026150826.A19450@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Fri, Oct 26, 2001 at 03:08:26PM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> New version, less FIXME's less TODO's. It is now running on my
> hardware with the rw block driver. Next will be a new physmap
> driver,
> then char, then block_ro.

http://wh.fh-wedel.de/~joern/software/kernel/mtd-0.0.6.tar.gz

Two people have downloaded the last version, but noone told me that I
forgot to include mtdblock.c. Well...

Now the char driver and the procfs file are working, too. The physmap
driver *might* be working with multiple devices, it *is* working with
only one. Since this might be a problem with either my code or my
hardware, this is postponed for a while.

I haven't done any tests without devfs support, yet. That should work,
but I haven't even proven it correct.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct,
but not tried it.
  -- Donald Knuth
