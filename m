Received: from mail.utstar.com ([65.200.123.6])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNyoZ-0008AP-3x
	for linux-mtd@lists.infradead.org; Wed, 12 May 2004 19:50:47 +0100
From: "Linda Zhu" <lindazhu@utstar.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 12 May 2004 14:50:23 -0400
Message-ID: <LCENIFAENEHNMKDCGDGBEECGCJAA.lindazhu@utstar.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: Janar Thoguluva <janar@utstar.com>
cc: Kasturi Raghunath <kasturi@utstar.com>
Subject: JFFS2 problems on 32M AMD AM29LV128
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is Linda. In our system, we run JFFS2 on AMD AM29LV128. We have total
32M
flash memory. It is partitioned into two part. First 1M memory is used by
loader,
the rest is used by JFFS2.

Originally, we use 16M flash. The JFFS2 run well on it. Recently, after we
increased the memory to 32M, we constantly encounter error messages as
indicated
below. If you can explain to me what these error messages mean, it is deeply
appreciated.

===============problem no.1 =====================
172.16.133.223 login: root
Password:
sh-2.05# mount -t jffs2 /dev/mtdblock/1 /mnt/jffs2
jffs2_scan_inode_node(): Data CRC failed on node at 0x00fc49a0: Read
0x140e2b245
jffs2_scan_inode_node(): CRC failed on node at 0x01696db0: Read 0xffffffff,
cal5
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01696db8:
0x4a78 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01696dc0:
0x0004 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01696dcc:
0x0001 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x01696ddc:
0x0001 id
jffs2_scan_empty(): Empty block at 0x01696de4 ends at 0x016971ac (with
0x1985c0y
jffs2_scan_inode_node(): Data CRC failed on node at 0x01a90a60: Read
0x4eec817c6
sh-2.05# cd /mnt/jffs2/tftpboot/
sh-2.05# cp /home/lindazhu/icm3/icm2_upgrade.gz .
Warning: DQ5 raised while program operation was in progress, however
operation K
Warning: DQ5 raised while program operation was in progress, however
operation K
Warning: DQ5 raised while program operation was in progress, however
operation K
Warning: DQ5 raised while program operation was in progress, however
operation K
Warning: DQ5 raised while program operation was in progress, however
operation K
Warning: DQ5 raised while program operation was in progress, however
operation K

======================================================
The problems occurred when we login in from NFS, then tried to mount to
jffs2.
And then tried to copy a gz file from NFS file server to flash.



============= problem no. 2 ==========================
bash-2.05# cp /mnt/nfs/home/lindazhu/icm3/icm2_upgrade.gz .
Warning: DQ5 raised while program operation was in progress, however
operation c
ompleted OK
Warning: DQ5 raised while program operation was in progress, however
operation c
ompleted OK
Warning: DQ5 raised while program operation was in progress, however
operation c
ompleted OK
Waiting for write to complete timed out in do_write_oneword.<5>Write of 4164
byt
es at 0x011a71e8 failed. returned -5, retlen 1528
cp: write: Input/output error
========================================================
The problem occurred when we login in with FLASH file system. Then tried to
copy
a 3M file from NFS server to flash. The copy couldn't complete, because the
writing
operation failed.

Please advice what might be the problem and how to resolve it.

Many many thanks,
Linda
