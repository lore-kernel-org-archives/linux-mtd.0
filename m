Received: from tomts19.bellnexxia.net ([209.226.175.73] helo=tomts19-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dIw8-0000uu-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 22:40:36 +0000
Received: from superbt.com ([65.93.122.2]) by tomts19-srv.bellnexxia.net
          (InterMail vM.4.01.03.23 201-229-121-123-20010418) with ESMTP
          id <20020219225151.BEZH22905.tomts19-srv.bellnexxia.net@superbt.com>
          for <linux-mtd@lists.infradead.org>;
          Tue, 19 Feb 2002 17:51:51 -0500
Received: from localhost (ilatypov@localhost)
	by superbt.com (8.11.4/8.11.4) with ESMTP id g1JMpl409998
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 17:51:47 -0500
Date: Tue, 19 Feb 2002 17:51:46 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: DiskOnChip 2000 and Millenium support in GRUB bootloader
Message-ID: <Pine.LNX.4.44.0202191736490.9975-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hello,

I copied the Millenium-specific operations from the existing MTD driver to
the GRUB bootloader.  Thanks a lot to David for his original
implementation of the GRUB-compatible booloader.

Can anybody with DOC Millenium try the patch?  It's
    patches/grub-2002-02-19-doc.patch
in the Linux MTD repository described at
    http://linux-mtd.infradead.org/

The patch can be applied against the 2002-02-19 version of GRUB CVS at 
    http://savannah.gnu.org/cvs/?group_id=68

I tested the patch with a 64M DiskOnChip 2000.  The GRUB configure command 
was as follows:
    ./configure --enable-diskonchip --disable-ffs --disable-xfs 
                --disable-jfs --disable-vstafs --disable-reiserfs 
                --disable-minix --disable-fat

This left only ext2 read access in GRUB to load the kernel, as my 
DiskOnChip was split into ext2 and ext3 partitions.

The firmware file will be generated in the GRUB's stage1 directory.  I 
copied the stage1 source code to generate a stand-alone patch against 
GRUB repository.

Ilguiz
