Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=ocean.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bn5Ee-0003Y6-C0
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 20:45:30 -0400
Received: from [203.26.222.199] (unknown [203.26.222.199])
	by ocean.magtech.com.au (Postfix) with ESMTP id 3F461458DC0D
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Jul 2004 10:45:22 +1000 (EST)
Message-ID: <40FDBCA2.30102@magellan-technology.com>
Date: Wed, 21 Jul 2004 10:45:22 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
References: <40FCDE5A.6080504@magellan-technology.com>
	<1090316488.6864.0.camel@lap02.tec.linutronix.de>
In-Reply-To: <1090316488.6864.0.camel@lap02.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: problems mounting >3.3MB JFFS2 partitions on Dataflash
	on	AT91RM9200DK
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thomas Gleixner wrote:
> Turn on MTD_DEBUG and JFFS2_DEBUG and provide the output of those
> 
> tglx
> 

OK, three examples:

(1) mounting a small jffs2 partition

[root@AT91RM9200DK /root]$more /proc/mtd
dev:    size   erasesize  name
mtd0: 00200000 00010000 "Physically mapped flash"
mtd1: 000ffc00 00000420 "kernel_image"
mtd2: 00400080 00000420 "4MB_part"
mtd3: 00300060 00000420 "3MB_part"
mtd4: 00040320 00000420 "the_rest"

[root@AT91RM9200DK /root]$mount /dev/mtdblock/4 /mnt/4
mtdblock_open
ok
mtdblock: read on "the_rest" at 0x0, size 0x800
mtdblock: read on "the_rest" at 0x800, size 0x800
mtdblock: read on "the_rest" at 0x2000, size 0x800
mtdblock: read on "the_rest" at 0x2800, size 0x800
mtdblock: read on "the_rest" at 0x3000, size 0x800
mtdblock: read on "the_rest" at 0x3800, size 0x800
mtdblock: read on "the_rest" at 0x8000, size 0x800
mtdblock: read on "the_rest" at 0x8800, size 0x800
mtdblock: read on "the_rest" at 0x9000, size 0x800
mtdblock: read on "the_rest" at 0x9800, size 0x800
mtdblock_release
ok
mtdblock_open
ok


(2) mounting a large jffs2 partition, no fs type specified

[root@AT91RM9200DK /root]$mount /dev/mtdblock/2 /mnt/2
mtdblock_open
ok
mtdblock: read on "4MB_part" at 0x0, size 0x800
mtdblock: read on "4MB_part" at 0x800, size 0x800
mtdblock: read on "4MB_part" at 0x2000, size 0x800
mtdblock: read on "4MB_part" at 0x2800, size 0x800
mtdblock: read on "4MB_part" at 0x3000, size 0x800
mtdblock: read on "4MB_part" at 0x3800, size 0x800
mtdblock: read on "4MB_part" at 0x8000, size 0x800
mtdblock: read on "4MB_part" at 0x8800, size 0x800
mtdblock: read on "4MB_part" at 0x9000, size 0x800
mtdblock: read on "4MB_part" at 0x9800, size 0x800
mtdblock_release
ok
mtdblock_open
ok
mtdblock_release
ok
mount: you must specify the filesystem type

(3) mounting a large jffs2 partition, jffs2 type specified

[root@AT91RM9200DK /root]$mount -t jffs2 /dev/mtdblock/2 /mnt/2
mtdblock_open
ok
mtdblock_release
ok
mountmtdblock_open
:ok
  wrong fsmtdblock_release
  ok
type, bad option, bad superblock on /dev/mtdblock/2,
        or too many mounted file systems
[root@AT91RM9200DK /root]$
