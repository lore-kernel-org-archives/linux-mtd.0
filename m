Received: from mail1.speakeasy.net ([216.254.0.201])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CONHU-0008Hl-Vx
	for linux-mtd@lists.infradead.org; Sun, 31 Oct 2004 16:30:34 -0500
From: Jeff Angielski <jangiels@speakeasy.net>
To: Wolfgang Denk <wd@denx.de>
In-Reply-To: <20041031210540.B0558C146B@atlas.denx.de>
References: <20041031210540.B0558C146B@atlas.denx.de>
Content-Type: text/plain
Message-Id: <1099258204.10498.12.camel@nighteyes.localdomain>
Mime-Version: 1.0
Date: Sun, 31 Oct 2004 16:30:04 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2 with DENX 2.4 kernel on MPC8260
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-10-31 at 16:05, Wolfgang Denk wrote:
> In message <1099172137.30440.8.camel@nighteyes.localdomain> you wrote:
> > 
> > Using the default rootfs image from the ELDK toolkit and with the
> > MTD/jffs2 debugging turned on, this is what I see:
> 
> You may want to update your kernel tree. On our CVS server  you  will
> find a kernel tree which includes a much more recent MTD snapshot.

My 2.4 kernel source is up-to-date with the latest code from the DENX
CVS linuxppc_2_4_devel tree.

It is the ramdisk_image from ELDK 3.0 that I am using for the rootfs. 
In fact, I tried todays buildroot image from uclibc/busybox and it did
not work either

The only "unusual" think about my flash is that it is configured for a
64bit bus (4x16).  The DENX kernel was the only 2.4 kernel that would
even work this much with the 64bit bus configuration - due mainly to
your efforts to hand merge the MTD code before it went 2.6-only.

Jeff Angielski
