Received: from samwise.efn.org ([12.33.21.33])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DoWC2-0005jj-Ci
	for linux-mtd@lists.infradead.org; Fri, 01 Jul 2005 20:49:16 -0400
Received: from amazonia.client.comcast.net (c-24-20-117-59.hsd1.or.comcast.net
	[24.20.117.59])
	by samwise.efn.org (Postfix) with ESMTP id 42F06170476
	for <linux-mtd@lists.infradead.org>;
	Fri,  1 Jul 2005 17:31:46 -0700 (PDT)
Received: from rick by amazonia.client.comcast.net with local (Exim 3.36 #1
	(Debian)) id 1DoVv7-0004wL-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2005 17:31:45 -0700
To: linux-mtd@lists.infradead.org
Message-Id: <E1DoVv7-0004wL-00@amazonia.client.comcast.net>
From: Rick Bronson <rick@efn.org>
Date: Fri, 01 Jul 2005 17:31:45 -0700
Subject: endless loop in wbuf.c?
Reply-To: rick@efn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I seem to encounter an endless loop in wbuf.c starting at:

	} else while (old_wbuf_len &&
		      old_wbuf_ofs == c->wbuf_ofs) {

  I get hung in this loop if I do this:

umount /reserved
/usr/src/mtd/util/flash_eraseall --jffs2 /dev/mtd1
mount /reserved
cd /reserved
# < using a C program, make 5000 files of 170 bytes each in current dir,
#   copying from /dev/urandom and naming "test00000.bin" thru "test04999.bin" >
cd
umount /reserved
mount /reserved
ls -Rl /reserved > ~/xx
rm -rf /reserved/* # locks up after command prompt returns + 2 seconds

  My fstab looks like:

/dev/mtdblock1          /reserved       jffs2    noauto,defaults        0 0     

  My cpu is a AT91RM9200, the mtd part is a NAND:
NAND device: Manufacturer ID: 0x98, Chip ID: 0x75 (Toshiba NAND 32MiB 3,3V 8-bit

  My .config has these set:

CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_AT91=y
CONFIG_MTD_NAND_IDS=y
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
CONFIG_JFFS2_FS_WRITEBUFFER=y
CONFIG_JFFS2_CMODE_PRIORITY=y

  When I set breakpoints I find it goes thru this loop:

#0  jffs2_mark_node_obsolete (c=0xc03d5ccc, ref=0xc03d5ccc) at nodemgmt.c:390
#1  0xc00aeff8 in jffs2_garbage_collect_deletion_dirent (c=0xc03d5ccc, 
    jeb=0xc3614f50, f=0xc361d3a0, fd=0xc3619660) at gc.c:881
#2  0xc00add3c in jffs2_garbage_collect_live (c=0xc03d5ccc, jeb=0xc3614f50, 
    raw=0xc35add10, f=0xc361d3a0) at gc.c:473
#3  0xc00ad9a4 in jffs2_garbage_collect_pass (c=0xc03d5ccc) at gc.c:371
#4  0xc00b461c in jffs2_flush_wbuf_gc (c=0xc03d5ccc, ino=3277511952)
    at wbuf.c:567
#5  0xc00b2a1c in jffs2_write_super (sb=0xc03d5ccc) at fs.c:381
#6  0xc00527b0 in sync_supers (dev=23756) at super.c:439
#7  0xc00516c4 in sync_old_buffers () at buffer.c:2888
#8  0xc0051b14 in kupdate (startup=0xc00164b8) at buffer.c:3060
#9  0xc001c008 in kernel_thread (fn=0xc35ce3a0, arg=0xc02e1ff8, 
    flags=3277644640) at process.c:389

  continuously with "raw" iterating and fd->name iterating over each
  file in order ie. "test00000.bin", "test00001.bin", etc

raw iterates from this line in gc.c:

		raw = raw->next_phys;

  Anyone else seen anything like this?

  Thanks so much for any help.

  Rick Bronson

                                                                   _
                                                                  | |
                                                                  / /__
.----------------------------------------------------------._____/ (___)
| Rick Bronson rick@efn.org     Tel 541-485-7264           |       (___)
| Amazonia Computing http://www.efn.org/~rick      __ o    |_____  (___)
| 5050 Donald Street     "Onde esta dinheiro?"    _`\<,    |     \_(___)
| Eugene, OR  97405       -- Gal Costa         __( )/( )__ |
`----------------------------------------------------------'
