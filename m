Received: from el-out-1112.google.com ([209.85.162.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IwYQJ-0000RR-4v
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 02:30:39 -0500
Received: by el-out-1112.google.com with SMTP id r27so73820ele
	for <linux-mtd@lists.infradead.org>;
	Sun, 25 Nov 2007 23:30:29 -0800 (PST)
Message-ID: <d7ca49770711252330p6fccbabcm8cfa4f92b79956f5@mail.gmail.com>
Date: Mon, 26 Nov 2007 13:00:28 +0530
From: "Manish D" <manish2312@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: kernel panic with 2.4
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

( If this is not the right alias, pardon me and please direct to an
appropriate one.
Also the query is for 2.4.25 kernel. )

I am seeing a kernel panic on trying to copy a recently mounted flash partition.
The actual steps are,

1) mount a partition,
2) read files into a ramdisk.
3) umount partition
4) reflash the partition
5) mount the partition again
6) update the files read earlier onto flash.

I hit error at step 6.

The oops details are below.

>>$1; 802d0000 <console_drivers+215c/315c>
>>$15; 00590000 <_binary_ramdisk_gz_size+449e48/7febbe48>
>>$31; 8007ffe0 <jffs2_new_inode+3d0/4d8>

>>PC;  80080000 <jffs2_new_inode+3f0/4d8>   <=====

Trace; 80126ba0 <zlib_inflate+3a8/588>
Trace; 80126b1c <zlib_inflate+324/588>
Trace; 800790d0 <zlib_decompress+15c/298c>
Trace; 80080150 <jffs2_write_dnode+68/260>
Trace; 80077e4c <jffs2_decompress+74/d8>

My query is, is this known issue with 2.4 kernel ? (i understand only
2.6 discussions are allowed here, still daring to ask this)
I tried searching but could not find any.


Regards,
Manish



ksymoops -v ./vmlinux.stripped -m ./System.map -a mipsel -t elf2-mips
ksymoops 2.4.11 on i686 2.6.21-1.3194.fc7.  Options used

<...>

Reading Oops report from the terminal


$0 : 00000000 802d0000 00000000 81070ba4 81070b90 00000000 00000001 81897d38
$8 : ffffffff ffffffff ffffffff ffffffff 00000000 001225dc 00000000 00590000
$16: 81897d38 00000010 8198e100 8185c5a8 001225cc 8185c5a8 001225cc 00000000
$24: 00000000 8108e460                   81896000 81897cf0 81b880f8 8007ffe0
Hi : 00000000
Lo : 00000000
epc   : 80080000    Not tainted
Status: 1000c903
Cause : 00800008
PrId  : 00018009
Process config_migrate (pid: 799, stackpage=81896000)
Stack:    81897d30 fffffffb 80126ba0 80126b1c 00000010 81897d48 81897d38
 81070b40 8017b870 000001b0 8017b870 800790d0 81092200 8195f160 00000000
 81896000 810929b0 00000000 ffffffff ffffffff ffffffff ffffffff 00000010
 00000000 00000000 00000048 8198e100 8185c5a8 81b880f8 80080150 81890000
 81092800 819a9a60 80077e4c 8198e100 81b88128 8185c480 81b880f8 8198e100
 00000044 ...
Call Trace:   [<80126ba0>] [<80126b1c>] [<800790d0>] [<80080150>] [<80077e4c>]
 [<8007bd20>] [<8007ba40>] [<80059038>] [<8003bcb8>] [<8004a4f4>] [<8004a3fc>]
 [<8004c1d0>] [<8002d410>] [<8003cf08>] [<8003d410>] [<8003d5fc>] [<8000bd44>]
 [<800124bc>]

Code: 8fbf0074  02003821  00002821 <80080028> 80080030  8008003b
80080044  8008004f  8008005

>>$1; 802d0000 <console_drivers+215c/315c>
>>$15; 00590000 <_binary_ramdisk_gz_size+449e48/7febbe48>
>>$31; 8007ffe0 <jffs2_new_inode+3d0/4d8>

>>PC;  80080000 <jffs2_new_inode+3f0/4d8>   <=====

Trace; 80126ba0 <zlib_inflate+3a8/588>
Trace; 80126b1c <zlib_inflate+324/588>
Trace; 800790d0 <zlib_decompress+15c/298c>
Trace; 80080150 <jffs2_write_dnode+68/260>
Trace; 80077e4c <jffs2_decompress+74/d8>
Trace; 8007bd20 <jffs2_setattr+418/6a0>
Trace; 8007ba40 <jffs2_setattr+138/6a0>
Trace; 80059038 <notify_change+78/1a8>
Trace; 8003bcb8 <do_truncate+90/130>
Trace; 8004a4f4 <path_release+7c/2ec>
Trace; 8004a3fc <permission+3c/48>
Trace; 8004c1d0 <open_namei+5d8/82c>
Trace; 8002d410 <generic_file_read+9c/550>
Trace; 8003cf08 <filp_open+38/60>
Trace; 8003d410 <sys_open+58/f0>
Trace; 8003d5fc <sys_close+98/a4>
Trace; 8000bd44 <handle_sys+e4/198>
Trace; 800124bc <handle_tlbs+17c/1a0>
