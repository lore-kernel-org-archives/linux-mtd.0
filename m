Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sSYo-00038A-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 18:59:10 +0100
Date: Tue, 2 Apr 2002 19:58:56 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Andrew Dixon <andrew.dixon@seranoa.com>
Cc: ppcboot-users <ppcboot-users@lists.sourceforge.net>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: PPCBoot can't read my jffs2 image
Message-ID: <20020402195856.A13802@wohnheim.fh-wedel.de>
References: <3CA9BFFB.CDE0382B@seranoa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3CA9BFFB.CDE0382B@seranoa.com>; from andrew.dixon@seranoa.com on Tue, Apr 02, 2002 at 09:28:11AM -0500
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

> Sorry for the cross post but this a problem with the way the linux-mtd
> layer and PPCBoot are interacting.
> 
> So here's the situation, I've got PPCBoot+Linux running on a custom
> board.  I've formatted the flash to be one small raw partition for
> PPCBoot and the rest is a jffs2 filesystem.  PPCBoot is reading Linux
> and an initial ramdisk out of the jffs2.  In my original testing I was
> booting the board via tftp and nfs and then copying copying the
> filesystem onto the flash via /dev/mtdblock1.  This works great.  I
> reboot and PPCBoot sees everything in the jffs2.  Now I'm trying to
> automate this a little more so enhanced my build to give me a jffs2
> image "wombat.jffs2".  I create this image with mkfs.jffs2 and put it
> onto the flash by dd'ing it to /dev/mtd1:
> 
> 	dd if=/wombat.jffs2 of=/dev/mtd1
> 
> now when I mount /dev/mtdblock1 I can see the filesystem that I've put
> over there but when I reboot PPCBoot doesn't see any of the files that
> are there.  But if I boot back up Linux can still see all of those files
> OK.

Did you do the following before the dd?

	eraseall /dev/mtd1

Does the following give you a difference?

	dd if=/dev/mtdblock1 of=readback.jffs2 count=1 bs=<image size>
	diff readback.jffs2 wombat.jffs2

With <image size> being the size of wombat.jffs2.

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
