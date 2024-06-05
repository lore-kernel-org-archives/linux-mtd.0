Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D088C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 03:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GrnU+MA8OZLhNoO7yNtMfusyXz4/4gVEsAp3K/5n5iI=; b=k665zaUKk8s28n
	hi7CORllKG1VIcRMI1J06LPD8fikt3kdj3l1k6MP2ySSIgA6Jal2n0GluaD3ZI03j6T1lCaXmDEoa
	CMUK0dUDWOs2IolRF6at2uOIPMX/8C8lE77X3UTkCHknwzMA42jSQo/b+ILTgKOp7gAhWuBVIKQdS
	fE8TIsPKynuBZSEN5RvIrWc6lCx1E02bKvCER5iMBzRIKf09OWfe8W+HqRW1ybrFUlTWYiDt4nEFu
	iG8B0wPueY4a+VT6J13qVj1EL/HoU7/T2AtmD1OqNmlt+rcdUFngRS7m8ElZZEPljuZpv6TWWsQyo
	ifeXXEJjeSrrsfvjAndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEhH7-00000004XBY-1vDa;
	Wed, 05 Jun 2024 03:25:21 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEhH3-00000004XB9-3yd2
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 03:25:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VvCRB3YvVzwRkJ;
	Wed,  5 Jun 2024 11:21:10 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id B2E1318007A;
	Wed,  5 Jun 2024 11:25:06 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:25:05 +0800
To: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, "zhangyi (F)" <yi.zhang@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Subject: UBIFS: problem report: about lpt LEB scanning failed (no issue)
Message-ID: <97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com>
Date: Wed, 5 Jun 2024 11:25:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_202518_365631_F0AEC49B 
X-CRM114-Status: GOOD (  15.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Problem description

Recently I was testing UBIFS with fsstress on a nor flash(simulated by 
mtdram, 64M size,16K PEB, which means big lpt mode for UBIFS), the 
utilization rate of one CPU(fsstress program) is 100%, and the fsstress 
program cannot be killed. The fsstress program stucks in a dead loop:

do_commit -> ubifs_lpt_start_commit:

   while (need_write_all(c)) {

     mutex_unlock(&c->lp_mutex);

     err = lpt_gc(c);

     if (err)

       return err;

     mutex_lock(&c->lp_mutex);

   }

Then I found that lpt_gc_lnum handles the same LEB(lnum 8) every time, 
and the c->ltab[i].dirty for LEB 8 is not equal to c->leb_size after 
invoking lpt_gc_lnum(). After analyzing the lpt nodes on LEB 8, 
lpt_gc_lnum returns early before scanning all lpt nodes. The lpt LEB 8 
is shown as(partial):

[  104.740309] LEB 8:14383 len 13, nnode num 31,
[  104.740689] dirty 1
[  104.740905] LEB 8:14396 len 13, nnode num 7,
[  104.741277] dirty 1
[  104.741486] LEB 8:14409 len 13, nnode num 1,
[  104.741870] dirty 1
[  104.742078] LEB 8:14422 len 16, pnode num 745
[  104.742475] dirty 1
[  104.742682] B type 8 0
[  104.742925] LEB 8:14438, pad 2 bytes min_io_size 8
[  104.743301] LEB 8:14440, free 1368 bytes  // Actually, the left 1368 
bytes are not 0xff, the scanning function(dump_lpt_leb) parses lpt nodes 
in a wrong way
[  104.743674] (pid 1095) finish dumping LEB 8

The binary image for LEB 8 is(partial):

0x3840 = 14400

  00003840: 6a e4 60 cf 91 b1 f3 82 03 17 59 11 40 ac b9 fc 99 11 83 c3 
83 03  ff  ff   90 6e c3 ec 04 f3 26 a1  j.`.......Y.@.......... 
..n....&.
  00003860: bf 09 41 a2 6f 94 15 09 58 ee 5f ce 97 7e 09 b8 86 a0 d8 2c 
62 3b 47 37 62 e5 e8 59 86 be 82 fe  ..A.o...X._..~.....,b;G      7b..Y....
  00003880: 17 6d 63 95 ce 80 76 6e ad e6 44 af f6 43 06 ab 41 28 04 99 
72 1f 31 91 cb 96 b1 ef 43 6e 22 2c  .mc...vn..D..C..A(..r.1      .....Cn",
  000038a0: 26 57 d0 9c b5 76 8b 08 1d fc 41 07 8c ba 26 3b 45 e1 7b 23 
de d5 19 63 f3 6c e8 95 b7 02 5a 89  &W...v....A...&;E.{#...      c.l....Z.
  000038c0: 83 81 0e 72 7c 4b 59 a3 c4 c0 e1 e5 22 7c 27 8d 85 ad c2 93 
25 ac 5b 32 c8 02 07 2f 24 f9 e0 f6  ...r|KY....."|'.....%.[      2.../$...
  000038e0: e3 87 f2 bb 62 23 d5 e4 2e b7 8c 41 61 43 2a a4 2f ce 92 4f 
62 47 88 a2 11 a6 51 1f da 51 e7 a4  ....b#.....AaC*./..ObG.      ...Q..Q..


Let's parse above data by lpt_gc_lnum().

The nnode(1) is at 8: 14409~14421, corresponding data is '17 59 11 40 ac 
b9 fc 99 11 83 c3 83 03',  the type field is the lower 
UBIFS_LPT_TYPE_BITS(4) bits in '0x11' according to ubifs_pack_nnode(), 
and the data looks good and it can be parsed as a nnode. The next 2 
bytes(8: 14422~14423) are 0xff, which means that lpt data is written 
into flash with an alignment of 8 bytes(See write_cnodes). After 
modifying the code of lpt_gc_lnum(), let UBIFS skip the 2 bytes(0xff), 
UBIFS could parse all lpt nodes in LEB 8. But in fact, UBIFS parses 
these 2 bytes(0xff) as the crc field of pnode(8: 14422~14437), and the 
crc16 result of the pnode is just 0xffff, so the field(8: 14422~14437) 
is parsed as a pnode, and the left lpt nnodes cannot be parsed because 
of the wrong parsing offset.


Why it can happen?

The root cause is that the implementation of lpt area disk layout is 
simple, it would be better if UBIFS has a length field in LPT node. 
Otherwise, it could be possible that the crc16 result is right both for 
offset_A~offset_B(node X) and  offset_A+2~ offset_C(node Y).


Will it happen on a nand flash?

In theory, I would say 'yes'. But I never meet it after testing for a 
whole day. I guess that the min_io_size for nand is (at least) 512, the 
length of pending bytes(0xff) is hardly less than 3 bytes, so it is hard 
to reproduce that the crc16 result is right both for 
offset_A~offset_B(node X) and  offset_A+2~ offset_C(node Y).


How to reproduce it?

You can generate a problem image by a script test.sh (When you see hung 
task warning or the utilization rate of one CPU becomes 100%, it means 
the problem occurs).

#!/bin/sh

DEV=/dev/ubi0_0
KEY_FILE=/tmp/key
MNT=/root/temp
mtdram_patt="mtdram test device"

function fatal()
{
     echo "Error: $1" 1>&2
     exit 1
}

function find_mtd_device()
{
     printf "%s" "$(grep "$1" /proc/mtd | sed -e 
"s/^mtd\([0-9]\+\):.*$/\1/")"
}

# Load mtdram with specified size and PEB size
# Usage: load_mtdram <flash size> <PEB size>
# 1. Flash size is specified in MiB
# 2. PEB size is specified in KiB
function load_mtdram()
{
     local size="$1";     shift
     local peb_size="$1"; shift

     size="$(($size * 1024))"
     modprobe mtdram total_size="$size" erase_size="$peb_size"
}


function run_test()
{
     local size="$1";
     local peb_size="$2";
     local page_size="$3";

     echo 
"======================================================================"
     printf "%s" "MTDRAM ${size}MiB PEB size ${peb_size}KiB"
     echo ""

     load_mtdram "$size" "$peb_size" || echo "cannot load mtdram"
     mtdnum="$(find_mtd_device "$mtdram_patt")"

     flash_eraseall /dev/mtd$mtdnum
     modprobe ubi mtd="$mtdnum,$page_size" || fatal "modprobe ubi fail"
     ubimkvol -N vol_test -m -n 0 /dev/ubi0 || fatal "mkvol fail"
     modprobe ubifs || fatal "modprobe ubifs fail"
     mount -t ubifs $DEV $MNT || fatal "mount ubifs fail"

     fsstress -d $MNT -l0 -p4 -n10000 &
     sleep $((RANDOM % 120))

     ps -e | grep -w fsstress > /dev/null 2>&1
     while [ $? -eq 0 ]
     do
         killall -9 fsstress > /dev/null 2>&1
         sleep 1
         ps -e | grep -w fsstress > /dev/null 2>&1
     done

     while true
     do
         res=`mount | grep "$MNT"`
         if [[ "$res" == "" ]]
         then
             break;
         fi
         umount $MNT
         sleep 0.1
     done

     modprobe -r ubifs
     modprobe -r ubi
     modprobe -r mtdram

     echo 
"----------------------------------------------------------------------"
}

while true
do
     run_test "64" "16" "512"
done

https://bugzilla.kernel.org/show_bug.cgi?id=218935

Or you can mount the problem image(disk.tar.gz) directly by following 
script:
#!/bin/sh
DEV=/dev/ubi0_0
KEY_FILE=/tmp/key
MNT=/root/temp
mtdram_patt="mtdram test device"

function fatal()
{
	echo "Error: $1" 1>&2
	exit 1
}

function find_mtd_device()
{
	printf "%s" "$(grep "$1" /proc/mtd | sed -e "s/^mtd\([0-9]\+\):.*$/\1/")"
}

# Load mtdram with specified size and PEB size
# Usage: load_mtdram <flash size> <PEB size>
# 1. Flash size is specified in MiB
# 2. PEB size is specified in KiB
function load_mtdram()
{
	local size="$1";     shift
	local peb_size="$1"; shift

	size="$(($size * 1024))"
	modprobe mtdram total_size="$size" erase_size="$peb_size"
}


function run_test()
{
	local size="$1";
	local peb_size="$2";
	local page_size="$3";

	echo 
"======================================================================"
	printf "%s" "MTDRAM ${size}MiB PEB size ${peb_size}KiB"
	echo ""

	load_mtdram "$size" "$peb_size" || echo "cannot load mtdram"
	mtdnum="$(find_mtd_device "$mtdram_patt")"

	flash_eraseall /dev/mtd$mtdnum
	tar xvzf disk.tar.gz
	dd if=disk of=/dev/mtd0 bs=1M
	modprobe ubi mtd=0,512
	mount /dev/ubi0_0 /root/temp
}

run_test "64" "16" "512"


PS: I report the problem as no issue, because I don't think we can fix 
it without modifying disk layout. I think it's just a designment nit, no 
need to fix it. I just want people know the problem if someone meet it 
one day.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
