Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43AJ-0004cZ-8R
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:16:44 +0000
Message-ID: <53BA491E.8060502@huawei.com>
Date: Mon, 7 Jul 2014 15:15:42 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC] ubi-utils:  Add a new utility ubidump
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I would like to show my work about a new utility named ubidump.
This utility is different from jffs2dump. It can dump a specific
leb to user space(maybe a arrange of lebs in the future).

We have two logic layers in UBIFS and data on the eraseblocks
is separated into two parts: UBI header which include EC header
and VID header, UBIFS filesystem data which is formatted as
different kinds of NODEs.

We don't have a direct way to get both UBI info and UBIFS info
in the past(really?) because these two layers are transparent to
each other. Furthermore, when debugging with UBIFS, I found some
key information is invisible and I need to modify the kernel to
get them. For example, when I was dealing with commit 642f63e
(UBIFS: fix fatal race condition), I can't find a way to dump the
whole LOG area.

I think dynamic debug is a helpful mechanism but in some embedded
environment, kernel messages are stored in a ring buffer and are
wrapped commonly.

So I want to make a new utility to get data on eraseblocks in
user space and analysis filesystem behaviors in an easy way.
This utility can dump both UBI info and UBIFS info and all the
prints are formatted as UBI or UBIFS style.

I just want to make it a lighter utility but I have to copy lots
of ubifs-media codes and debug codes to mtd-utils. UBI headers are
got from a new ioctl(is there other way?) and UBIFS NODEs are got
from a simply read(), then print them by functions copied from
UBI/UBIFS debug.c in kernel.


Usage: ubidump <UBI volume node file name> [-l <lnum>] [-i]
			[--help] [--version]

Example 1: ubidump /dev/ubi0_1 -n 2 - dump leb 2 in volume 1
Example 2: ubidump /dev/ubi0_0 -n 1234 -i - dump leb 1234 with explicit info


-h, --help		print help message
-n, --lnum		logic eraseblock num to dump
-i, --info		show explicit information about NODEs
-H, --header		show only header information
-N, --node		show only NODEs information
-V, --version		print program version


# ./ubidump /dev/ubi0_0 -n 0 -i
lnum 0 is mapped to pnum 2054
Erase counter header dump:
	magic          0x55424923
	version        1
	ec             1
	vid_hdr_offset 256
	data_offset    512
	image_seq      1256176231
	hdr_crc        0x7758fc8b
Volume identifier header dump:
	magic     55424921
	version   1
	vol_type  1
	copy_flag 0
	compat    0
	vol_id    0
	lnum      0
	data_size 0
	used_ebs  0
	data_pad  0
	sqnum     8
	hdr_crc   29b2783a
scan LEB 0:0
look at LEB 0:0 (15872 bytes left)
scanning superblock node at LEB 0:0
	magic          0x6101831
	crc            0x88b345d6
	node_type      6 (superblock node)
	group_type     0 (no node group)
	sqnum          1
	len            4096
	key_hash       0 (R5)
	key_fmt        0 (simple)
	flags          0x2
	big_lpt      1
	space_fixup  0
	min_io_size    512
	leb_size       15872
	leb_cnt        8028
	max_leb_cnt    8028
	max_bud_bytes  5920256
	log_lebs       28
	lpt_lebs       11
	orph_lebs      2
	jhead_cnt      1
	fanout         8
	lsave_cnt      256
	default_compr  1
	rp_size        5242880
	rp_uid         0
	rp_gid         0
	fmt_version    4
	time_gran      1000000000
	UUID           0x105248cUB
look at LEB 0:4096 (11776 bytes left)
hit empty space at LEB 0:4096
stop scanning LEB 0 at offset 15872
