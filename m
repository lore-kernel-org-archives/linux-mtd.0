Received: from n75.bullet.mail.sp1.yahoo.com ([98.136.44.51])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KEzN4-0003lV-QU
	for linux-mtd@lists.infradead.org; Sat, 05 Jul 2008 04:27:39 +0000
Date: Fri, 4 Jul 2008 21:27:36 -0700 (PDT)
From: Josef Tran <josefctran@yahoo.com>
Subject: problem with jffs
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <960230.9247.qm@web45110.mail.sp1.yahoo.com>
Reply-To: josefctran@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On startup by GESBC-2440 board has problems with the JFFS2 on the flash memory.  Here is what it says.  Can anyone tell me why i am getting this error?  Thank in advance.

s3c2410-rtc s3c2410-rtc: setting the system clock to 2008-04-03
 20:38:50
(1207255130)
Empty flash at 0x01f40580 ends at 0x01f40600
Empty flash at 0x01f40a18 ends at 0x01f40c00
Empty flash at 0x01f41930 ends at 0x01f41a00
JFFS2 notice: (243) read_dnode: node CRC failed on dnode at 0x1f409d4:
 read
0xffffffff, calculated 0x95b410e6
JFFS2 notice: (243) check_node_data: wrong data CRC in data node at
0x01f42200: read 0xab6032e, calculated 0xd95d2064.
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 112K
s3c2410-sdi s3c2410-sdi: powered down.
mount /etc as ramfs
mount /var/nfs as nfs
mount /dev as tmpfs
mounting all 
