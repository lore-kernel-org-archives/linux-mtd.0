Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18MBMQ-0000OE-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2002 18:13:31 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700144D9E1@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: linux-mtd@lists.infradead.org
Subject: 2.4.20 + mtd+jffs2 problem
Date: Wed, 11 Dec 2002 13:45:33 -0500
MIME-Version: 1.0
Content-Type: text/plain
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

  I just tried 2.4.20 kernel with the latest mtd+jffs2 code ( I updated my
cvs tree 12/09 night). When compiling
the kernel, I patched in jffs/jffs2 from mtd side as well, so I have the
latest of almost everything.

  Before I state my problem, here is my setup:
     board: MPC8260ADS
     bootloader: ppcboot-2.0.0
     flash: 8M, 4-way interleave
     mapping:
    Creating 4 MTD partitions on "MPC8260ADS Bank 0":
    0x00000000-0x00700000 : "jffs2"
    0x00700000-0x00740000 : "ppcboot"
    0x00740000-0x00780000 : "environment"
    0x00780000-0x00800000 : "spare"
  I use NFS for my root file system, and tftp for the kernel image
     
  My problem is that in either of the following two situations my flash will
consistantly be in the wrong state, 
standalone or with my BDI2000 connected, so the board  won't boot:
  1. If I do a "eraseall /dev/mtd1", then do a power cycle ...
  2. or if I copy more files to jffs2 file system can hold, jffs2 gives
error message, linux and jffs2 continues to
      work, then I do a power cycle ... (this happens for jffs file system
too)

  Other than that, JFFS2 works just fine. If the linux is on, the above
situations are not a problem. But I am testing
the power loss situations. I also tried power cycle when jffs/jffs2 mounted,
those work fine.
 
  When that happens, I have to reset the flash (4 times, one for each chip)
through BDI2000, then everything
in the flash shows up and now the board is able to boot up. During the whole
test, there is no data loss, it's
just the flash lock-up.

  Any ideas?

  Thanks a lot

- Junping Zhang
  
