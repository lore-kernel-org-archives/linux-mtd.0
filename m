Received: from external.zumanetworks.com ([64.161.185.13])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sSVU-00037Z-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Apr 2002 18:55:44 +0100
Date: Tue, 2 Apr 2002 09:55:05 -0800
To: Andrew Dixon <andrew.dixon@seranoa.com>
Cc: ppcboot-users <ppcboot-users@lists.sourceforge.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [Ppcboot-users] PPCBoot can't read my jffs2 image
Message-ID: <20020402175505.GA19814@zumanetworks.com>
References: <3CA9BFFB.CDE0382B@seranoa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3CA9BFFB.CDE0382B@seranoa.com>
From: Nye Liu <nyet@zumanetworks.com>
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

Andrew:

Until *very* recently, linux mtd has been a bit behind the main mtd
development; check your linux/include/linux/jffs2.h;

If the structures are missing "attribute packed" you have an older
kernel.

I recommend recompiling either 1) ppcboot with unpacked structures or
2) updating your linux kernel AND mtdtools (your mkfs.jffs2 may also be
out of date), making sure that the include file matches for all three
when you are done ;)

On Tue, Apr 02, 2002 at 09:28:11AM -0500, Andrew Dixon wrote:
> Hi Everyone,
> 
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
> 
> Any ideas?  
> 
> Thanks,
> Andy 
> -- 
> Andrew Dixon
> Software Engineer
> Seranoa Networks
> 978.897.3434 x231
> 
> _______________________________________________
> Ppcboot-users mailing list
> Ppcboot-users@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/ppcboot-users

-- 
Nye Liu
nyet@zumanetworks.com

"Who would be stupid enough to quote a fictitious character?"
	-- Don Quixote
