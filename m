Received: from skellington.ics.uci.edu ([128.195.1.40])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVXvx-0000T7-MF
	for linux-mtd@lists.infradead.org; Wed, 12 Sep 2007 15:31:40 -0400
Received: from igor.ics.uci.edu (igor.ics.uci.edu [128.195.10.104])
	by skellington.ics.uci.edu (8.13.7+Sun/8.13.7) with ESMTP id
	l8CJRae9000591 for <linux-mtd@lists.infradead.org>;
	Wed, 12 Sep 2007 12:27:36 -0700 (PDT)
Received: from localhost (sid@localhost)
	by igor.ics.uci.edu (8.13.7+Sun/8.13.6/Submit) with ESMTP id
	l8CJRYqY006615 for <linux-mtd@lists.infradead.org>;
	Wed, 12 Sep 2007 12:27:36 -0700 (PDT)
Date: Wed, 12 Sep 2007 12:27:34 -0700 (PDT)
From: Siddharth Choudhuri <sid@igor.ics.uci.edu>
To: linux-mtd@lists.infradead.org
Subject: mount problem with JFFS2 summary feature on NOR flash
Message-ID: <Pine.GSO.4.64.0709121212450.4433@igor.ics.uci.edu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am trying to enable JFFS2 summary feature on NOR flash (Erase Block 
Summary). However it breaks the JFFS2 mount with the following message:

Mounting root file system jffs2 as /dev/mtdblock0...
jffs2_scan_eraseblock(): Node at 0x002a0000 {0x1985, 0x2000, 0x00000008) 
has invalid CRC 0xed38)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0004: 
0x0008 instead
...
>From the MTD FAQs, this message is being generated probably because the 
image is not a valid JFFS2 image. I did the following steps:

1. run mkfs.jffs2 -o out.img -q -e 128KiB -d rootdir
2. sumtool -l -i out.img -o out.img.summary -e 128KiB

I do erase flash (/dev/mtd0) before running nandwrite -p

The kernel configuration is as follows:
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_SUMMARY=y
# CONFIG_JFFS2_FS_XATTR is not set
CONFIG_JFFS2_COMPRESSION_OPTIONS=y
CONFIG_JFFS2_ZLIB=y
CONFIG_JFFS2_RTIME=y # CONFIG_JFFS2_RUBIN is not set
# CONFIG_JFFS2_CMODE_NONE is not set
CONFIG_JFFS2_CMODE_PRIORITY=y

If I omit the sumtool step i.e., JFFS2 without summary, there is no 
problem mounting the image. Is there something that I am missing here ?

thanks,
-siddharth
