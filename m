Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CvdHv-0006SX-Gq
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 10:16:30 -0500
Received: from [10.1.1.195] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	31 Jan 2005 10:16:14 -0500
Date: Mon, 31 Jan 2005 10:14:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


  just for curiosity's sake, after i build a JFFS2 image using
mkfs.jffs2, i want to mount out to verify its contents.  to do that, i
use a recipe i patched together a while back involving loading the
appropriate modules, creating /dev/mtdblock/0, dd'ing the image to
that device, then mounting it.

  however, this morning, in trying this with a larger-than-normal
JFFS2 image, i get:

  # dd bs=4096 if=soefsimage of=/dev/mtdblock/0
  # dd: writing `/dev/mtdblock/0': No space left on device
  1025+0 records in
  1024+0 records out

IOW, it dies after 4M.  is this a limit imposed by the ramdisk limit
in the kernel configuration?  is this a configurable parameter at
module load time?  thanks for any pointers.

rday
