Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wPOE-0000wY-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 16:56:50 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Michael Palme" <m.palme@goepel.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: jffs2 problem - magic bitmask not found
Date: Tue, 1 Oct 2002 17:56:47 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLGEMOFGAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D99BE0F.40602@goepel.com>
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

> 
> hello again :-)
> 
> after lots of time playing around that thing put me really into madness...
> 
> but could be i am doing something wrong!?
> please verify:
> 
> i want to use jffs2 on my strongarmboard with 32Mb Intel strata flash.
> so i think things to do to get a working jffs2 partition are as follows:
> 
> * built kernel with mtd and jffs2 support (i have done this ... kernel 
> 2.4.18-rmk7 with patched in mtd-cvs)
> 
> * built mtd-utils (successfully done -- crossbuilt for running on arm 
> native)
> 
> * create partitions on flash (i have done this via commmand line 
> partition table parsing -- CONFIG_CMDLINE="root=/dev/ram0 
> mtdparts=sa1100:256k(blob),256k(parm),1M(krnl),4M(rd),1M(krnl2),4M(rd2),-(jffs2)")
> 
> * erase the jffs2 partition (done via "eraseall /dev/mtd6" -- also tried 
> to delete it via jtag, so im sure theres no crap in after erasing...)
> 
> * verify things ("cat /proc/mtd" and "mtd_debug info /dev/mtd6" -- okay, 
> everything as expected)
> 
> * create a jffs2 image (done via "mkfs.jffs2 -r foo -o jffs2.img -p -e 
> 262144"  -- image contains only a dummy file and is very small)
> 
> * copy the image to the mtd partition ("cp jffs2.img /dev/mtd6")
> 
> * mounting the jffs2 partition 1st time (works okay via "mount -t jffs2 
> /dev/mtdblock6 /mnt/jffs2")
> 
> * verify contents (okay "ls /mnt/jffs2" shows the dummy file)
> 
> BUT THEN:
> 
> * umount jffs2 part ("umount /mnt/jffs2") takes *very* long

JFFS2 is probaly erasing and putting a CLEANMARKER on all unused erase blocks
and will block until it's finished. I think this can be fixed.

What happens if you wait 5-10 minutes before you unmount the FS for the time?
While waiting, do a couple of 'df' commands and see if the Use field slowly increases to
100% and then drops back your expected usage.

> 
> * immediately remount of the jffs2 part brings lots of error messages:
> 
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000:
> 0x2003 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
> 0x000c instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
> 0xdc6d instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000:
> 0x2003 instead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
> 0x000c instead

No idea why this happens.

> 
> * but after that, "mount" shows the jffs2 part as mounted and i can see 
> the dummy file again
> 
> * now unmounting again -- now very fast!?

That's because JFFS2 already has marked all unused erase blocks with a CLEANMARKER.

 Jocke

> 
> i've tried again and again... no success.
> 
> please who can help
> i need the fs for production use...
> 
> thanks in advance ... Michael Palme
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
