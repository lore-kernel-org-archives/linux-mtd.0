Received: from web50805.mail.re2.yahoo.com ([206.190.38.114])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRU7R-0007zN-Ig
	for linux-mtd@lists.infradead.org; Tue, 19 Feb 2008 15:10:53 +0000
Date: Tue, 19 Feb 2008 07:04:12 -0800 (PST)
From: Mangesh Edake <m_edake@yahoo.com>
Subject: JFFS2 as rootfs on DataFlash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <109598.62836.qm@web50805.mail.re2.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am using atmel dataflash (AT45DB321D) to store the
jffs2 image which is a rootfs. I am downloading the
image to SDRAM and then writing this image to
dataflash using uboot copy (cp) command like this,
u-boot# cp 21000000 14a000 192000

Once I boot the system, jffs2 is mounted as rootfs but
then I continuously get the "Node header CRC failed"
messages and then finally kernel panic with no init
found. 

I'm using mkfs.jffs2 to create an image like,
mkfs.jffs2 -p -l -e 0x2100 -s 0x210 -n -d
/home/me/rootdir -o jffs2.img

I am totally lost and cannot figure out the reason for
the errors. I'd appericiate if anybody help to find
out the reason. 

Following is the ouput LOG.
----------------------------

JFFS2 write-buffering enabled buffer (528) erasesize
(8448)
VFS: Mounted root (jffs2 filesystem) read-write.

Freeing init memory: 76K

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02fc70. {0807,0000,05c2764e,ab6f10c8}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02fbfc. {fb1d,98f7,00000034,00000001}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02fb88. {4269,67af,b497cad1,31616468}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02faa0. {8f02,47b6,00000000,00000000}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02fa2c. {584b,9ef4,e0011985,0000002c}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02f9b8. {8f02,47b6,00000804,f3086019}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02f944. {fb1d,98f7,00000046,00000001}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header 
       .
       .

Warning: unable to open an initial console.

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x0df814. {000e,0000,000000ef,000000f1}

JFFS2 notice: (1) read_unknown: unknown
RWCOMPAT_DELETE nodetype 0X2000 at 0x0df78c
JFFS2 notice: (634) jffs2_get_inode_nodes: Node header
CRC failed at 0x00017c. {6ee6,7d26,00000003,0000005f}

JFFS2 warning: (634) jffs2_do_read_inode_internal: no
data nodes found for ino #5


       .
       .


JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x02c168. {fb1d,98f7,00000062,00000001}

JFFS2 notice: (1) jffs2_get_inode_nodes: Node header
CRC failed at 0x000630. {89ed,0000,00000000,00031db0}

JFFS2 error: (1) jffs2_do_read_inode_internal: CRC
failed for read_inode of inode 2 at physical location
0x2c794

Kernel panic - not syncing: No init found.  Try
passing init= option to kernel.




  --
  Best Regards...
Mangesh Edake.


      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 
