Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17wOvq-0000uN-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 Oct 2002 16:27:30 +0100
Received: from mail.hamburg.pop.de ([193.98.9.7] helo=mail.provi.de)
	by smtp-out.hamburg.pop.de with esmtp (Exim 3.22 #1)
	id 17wOof-0007uz-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 17:20:05 +0200
Received: from mail.jena.pop.de ([195.222.197.3])
	by mail.provi.de with esmtp (Exim 3.20 #2)
	id 17wOuE-0001KJ-00
	for linux-mtd@lists.infradead.org; Tue, 01 Oct 2002 17:25:50 +0200
Received: from goepel2.jena.provi.de (goepel2.jena.provi.de [195.222.197.91])
	by mail.jena.pop.de (8.9.3/8.9.3) with ESMTP id RAA14934
	for <linux-mtd@lists.infradead.org>; Tue, 1 Oct 2002 17:27:24 +0200
Message-ID: <3D99BE0F.40602@goepel.com>
Date: Tue, 01 Oct 2002 17:23:59 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: Michael Palme <m.palme@goepel.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem - magic bitmask not found
References: <3D998F83.9000803@goepel.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

hello again :-)

after lots of time playing around that thing put me really into madness...

but could be i am doing something wrong!?
please verify:

i want to use jffs2 on my strongarmboard with 32Mb Intel strata flash.
so i think things to do to get a working jffs2 partition are as follows:

* built kernel with mtd and jffs2 support (i have done this ... kernel 
2.4.18-rmk7 with patched in mtd-cvs)

* built mtd-utils (successfully done -- crossbuilt for running on arm 
native)

* create partitions on flash (i have done this via commmand line 
partition table parsing -- CONFIG_CMDLINE="root=/dev/ram0 
mtdparts=sa1100:256k(blob),256k(parm),1M(krnl),4M(rd),1M(krnl2),4M(rd2),-(jffs2)")

* erase the jffs2 partition (done via "eraseall /dev/mtd6" -- also tried 
to delete it via jtag, so im sure theres no crap in after erasing...)

* verify things ("cat /proc/mtd" and "mtd_debug info /dev/mtd6" -- okay, 
everything as expected)

* create a jffs2 image (done via "mkfs.jffs2 -r foo -o jffs2.img -p -e 
262144"  -- image contains only a dummy file and is very small)

* copy the image to the mtd partition ("cp jffs2.img /dev/mtd6")

* mounting the jffs2 partition 1st time (works okay via "mount -t jffs2 
/dev/mtdblock6 /mnt/jffs2")

* verify contents (okay "ls /mnt/jffs2" shows the dummy file)

BUT THEN:

* umount jffs2 part ("umount /mnt/jffs2") takes *very* long

* immediately remount of the jffs2 part brings lots of error messages:

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040000:
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0x000c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0xdc6d instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000:
0x2003 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
0x000c instead

* but after that, "mount" shows the jffs2 part as mounted and i can see 
the dummy file again

* now unmounting again -- now very fast!?

i've tried again and again... no success.

please who can help
i need the fs for production use...

thanks in advance ... Michael Palme
