Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sPNI-0002wQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 15:35:04 +0100
Message-ID: <3CA9BFFB.CDE0382B@seranoa.com>
Date: Tue, 02 Apr 2002 09:28:11 -0500
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: ppcboot-users <ppcboot-users@lists.sourceforge.net>,
   "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: PPCBoot can't read my jffs2 image
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi Everyone,

Sorry for the cross post but this a problem with the way the linux-mtd
layer and PPCBoot are interacting.

So here's the situation, I've got PPCBoot+Linux running on a custom
board.  I've formatted the flash to be one small raw partition for
PPCBoot and the rest is a jffs2 filesystem.  PPCBoot is reading Linux
and an initial ramdisk out of the jffs2.  In my original testing I was
booting the board via tftp and nfs and then copying copying the
filesystem onto the flash via /dev/mtdblock1.  This works great.  I
reboot and PPCBoot sees everything in the jffs2.  Now I'm trying to
automate this a little more so enhanced my build to give me a jffs2
image "wombat.jffs2".  I create this image with mkfs.jffs2 and put it
onto the flash by dd'ing it to /dev/mtd1:

	dd if=/wombat.jffs2 of=/dev/mtd1

now when I mount /dev/mtdblock1 I can see the filesystem that I've put
over there but when I reboot PPCBoot doesn't see any of the files that
are there.  But if I boot back up Linux can still see all of those files
OK.

Any ideas?  

Thanks,
Andy 
-- 
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
