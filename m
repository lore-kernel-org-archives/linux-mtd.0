Received: from tethra.basler.com ([206.107.254.19])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORYNS-0004Xe-Q2
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 22:25:04 +0000
Received: from exchserver.basler.com (unknown [192.168.1.5])
	by tethra.basler.com (Postfix) with ESMTP id 8CCC83411
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Jun 2010 17:24:40 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 corruption when mounting filesystem with filenames of length > 7
Date: Wed, 23 Jun 2010 17:20:48 -0500
Message-ID: <181804936ABC2349BE503168465576460F1AAEC6@exchserver.basler.com>
From: "Steve Deiters" <SteveDeiters@BASLER.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found an archived post which seems to be identical to my issue.
However, this is quite old and there never seemed to be any resolution.

http://www.infradead.org/pipermail/linux-mtd/2006-September/016491.html

If I mount a filesystem that has filenames greater than 7 characters in
length, the files are corrupted when I mount.  In my case, I am making=
 a
JFFS2 image with mkfs.jffs2 and flashing it in with u-boot.  However,=
 I
have attached a workflow where I erase the Flash and create a new
filesystem completely within Linux and it gives the same behavior.  I
can list the files with the 'ls' command from within u-boot.  If I mount
from within Linux, and then reboot into u-boot, it will not display any
files that had a filename greater than 7 characters.

I enabled the MTD debug verbosity at level 2 for the attached example
session.

I am running on a custom board with a MPC5121 and Linux 2.6.33.4.

Thanks in advance for any help.


----------------------

[root@freescale /]# cat /proc/version=20
Linux version 2.6.33.4 (steved@teutatis) (gcc version 4.1.2) #1 PREEMPT
Wed Jun 23 21:29:57 UTC 2010
[root@freescale /]# uname -r
2.6.33.4
[root@freescale /]# flash_eraseall /dev/mtd0
[  476.694877] MTD_open
[  476.697768] MTD_ioctl
[  476.700995] MTD_ioctl
Erasing 128 Kiby[  476.705074] MTD_ioctl
te @ 0 --  0 % complete.Erasing 128 Kiby[  477.311449] MTD_ioctl
te @ 20000 --  0 % complete.Erasing 128 Kiby[  477.937350] MTD_ioctl
te @ 40000 --  1 % complete.Erasing 128 Kiby[  478.543415] MTD_ioctl
te @ 60000 --  2 % complete.Erasing 128 Kiby[  479.169413] MTD_ioctl
te @ 80000 --  3 % complete.Erasing 128 Kiby[  479.797409] MTD_ioctl
te @ a0000 --  4 % complete.Erasing 128 Kiby[  480.385415] MTD_ioctl
te @ c0000 --  5 % complete.Erasing 128 Kiby[  481.005417] MTD_ioctl
te @ e0000 --  5 % complete.Erasing 128 Kiby[  481.613412] MTD_ioctl
te @ 100000 --  6 % complete.Erasing 128 Kiby[  482.207417] MTD_ioctl
te @ 120000 --  7 % complete.Erasing 128 Kiby[  482.777411] MTD_ioctl
te @ 140000 --  8 % complete.Erasing 128 Kiby[  483.341414] MTD_ioctl
te @ 160000 --  9 % complete.Erasing 128 Kiby[  483.937408] MTD_ioctl
te @ 180000 -- 10 % complete.Erasing 128 Kiby[  484.539407] MTD_ioctl
te @ 1a0000 -- 10 % complete.Erasing 128 Kiby[  485.129387] MTD_ioctl
te @ 1c0000 -- 11 % complete.Erasing 128 Kiby[  485.711408] MTD_ioctl
te @ 1e0000 -- 12 % complete.Erasing 128 Kiby[  486.307414] MTD_ioctl
te @ 200000 -- 13 % complete.Erasing 128 Kiby[  486.859403] MTD_ioctl
te @ 220000 -- 14 % complete.Erasing 128 Kiby[  487.405413] MTD_ioctl
te @ 240000 -- 15 % complete.Erasing 128 Kiby[  487.949406] MTD_ioctl
te @ 260000 -- 15 % complete.Erasing 128 Kiby[  488.501398] MTD_ioctl
te @ 280000 -- 16 % complete.Erasing 128 Kiby[  489.039463] MTD_ioctl
te @ 2a0000 -- 17 % complete.Erasing 128 Kiby[  489.597407] MTD_ioctl
te @ 2c0000 -- 18 % complete.Erasing 128 Kiby[  490.135431] MTD_ioctl
te @ 2e0000 -- 19 % complete.Erasing 128 Kiby[  490.667421] MTD_ioctl
te @ 300000 -- 20 % complete.Erasing 128 Kiby[  491.225421] MTD_ioctl
te @ 320000 -- 20 % complete.Erasing 128 Kiby[  491.801422] MTD_ioctl
te @ 340000 -- 21 % complete.Erasing 128 Kiby[  492.359406] MTD_ioctl
te @ 360000 -- 22 % complete.Erasing 128 Kiby[  492.929373] MTD_ioctl
te @ 380000 -- 23 % complete.Erasing 128 Kiby[  493.517406] MTD_ioctl
te @ 3a0000 -- 24 % complete.Erasing 128 Kiby[  494.081421] MTD_ioctl
te @ 3c0000 -- 25 % complete.Erasing 128 Kiby[  494.657392] MTD_ioctl
te @ 3e0000 -- 25 % complete.Erasing 128 Kiby[  495.239480] MTD_ioctl
te @ 400000 -- 26 % complete.Erasing 128 Kiby[  495.785315] MTD_ioctl
te @ 420000 -- 27 % complete.Erasing 128 Kiby[  496.337561] MTD_ioctl
te @ 440000 -- 28 % complete.Erasing 128 Kiby[  496.890433] MTD_ioctl
te @ 460000 -- 29 % complete.Erasing 128 Kiby[  497.448404] MTD_ioctl
te @ 480000 -- 30 % complete.Erasing 128 Kiby[  498.006428] MTD_ioctl
te @ 4a0000 -- 30 % complete.Erasing 128 Kiby[  498.558430] MTD_ioctl
te @ 4c0000 -- 31 % complete.Erasing 128 Kiby[  499.104345] MTD_ioctl
te @ 4e0000 -- 32 % complete.Erasing 128 Kiby[  499.656398] MTD_ioctl
te @ 500000 -- 33 % complete.Erasing 128 Kiby[  500.188449] MTD_ioctl
te @ 520000 -- 34 % complete.Erasing 128 Kiby[  500.752413] MTD_ioctl
te @ 540000 -- 35 % complete.Erasing 128 Kiby[  501.310413] MTD_ioctl
te @ 560000 -- 35 % complete.Erasing 128 Kiby[  501.886407] MTD_ioctl
te @ 580000 -- 36 % complete.Erasing 128 Kiby[  502.438414] MTD_ioctl
te @ 5a0000 -- 37 % complete.Erasing 128 Kiby[  502.970403] MTD_ioctl
te @ 5c0000 -- 38 % complete.Erasing 128 Kiby[  503.534406] MTD_ioctl
te @ 5e0000 -- 39 % complete.Erasing 128 Kiby[  504.078407] MTD_ioctl
te @ 600000 -- 40 % complete.Erasing 128 Kiby[  504.642422] MTD_ioctl
te @ 620000 -- 40 % complete.Erasing 128 Kiby[  505.168390] MTD_ioctl
te @ 640000 -- 41 % complete.Erasing 128 Kiby[  505.720386] MTD_ioctl
te @ 660000 -- 42 % complete.Erasing 128 Kiby[  506.260435] MTD_ioctl
te @ 680000 -- 43 % complete.Erasing 128 Kiby[  506.794364] MTD_ioctl
te @ 6a0000 -- 44 % complete.Erasing 128 Kiby[  507.334434] MTD_ioctl
te @ 6c0000 -- 45 % complete.Erasing 128 Kiby[  507.860302] MTD_ioctl
te @ 6e0000 -- 45 % complete.Erasing 128 Kiby[  508.406415] MTD_ioctl
te @ 700000 -- 46 % complete.Erasing 128 Kiby[  508.964411] MTD_ioctl
te @ 720000 -- 47 % complete.Erasing 128 Kiby[  509.516411] MTD_ioctl
te @ 740000 -- 48 % complete.Erasing 128 Kiby[  510.048430] MTD_ioctl
te @ 760000 -- 49 % complete.Erasing 128 Kiby[  510.580409] MTD_ioctl
te @ 780000 -- 50 % complete.Erasing 128 Kiby[  511.120408] MTD_ioctl
te @ 7a0000 -- 50 % complete.Erasing 128 Kiby[  511.658412] MTD_ioctl
te @ 7c0000 -- 51 % complete.Erasing 128 Kiby[  512.190418] MTD_ioctl
te @ 7e0000 -- 52 % complete.Erasing 128 Kiby[  512.736399] MTD_ioctl
te @ 800000 -- 53 % complete.Erasing 128 Kiby[  513.262410] MTD_ioctl
te @ 820000 -- 54 % complete.Erasing 128 Kiby[  513.778481] MTD_ioctl
te @ 840000 -- 55 % complete.Erasing 128 Kiby[  514.298396] MTD_ioctl
te @ 860000 -- 55 % complete.Erasing 128 Kiby[  514.818489] MTD_ioctl
te @ 880000 -- 56 % complete.Erasing 128 Kiby[  515.358407] MTD_ioctl
te @ 8a0000 -- 57 % complete.Erasing 128 Kiby[  515.898442] MTD_ioctl
te @ 8c0000 -- 58 % complete.Erasing 128 Kiby[  516.492418] MTD_ioctl
te @ 8e0000 -- 59 % complete.Erasing 128 Kiby[  517.026409] MTD_ioctl
te @ 900000 -- 60 % complete.Erasing 128 Kiby[  517.560417] MTD_ioctl
te @ 920000 -- 60 % complete.Erasing 128 Kiby[  518.120397] MTD_ioctl
te @ 940000 -- 61 % complete.Erasing 128 Kiby[  518.654387] MTD_ioctl
te @ 960000 -- 62 % complete.Erasing 128 Kiby[  519.188439] MTD_ioctl
te @ 980000 -- 63 % complete.Erasing 128 Kiby[  519.722411] MTD_ioctl
te @ 9a0000 -- 64 % complete.Erasing 128 Kiby[  520.268410] MTD_ioctl
te @ 9c0000 -- 65 % complete.Erasing 128 Kiby[  520.808371] MTD_ioctl
te @ 9e0000 -- 65 % complete.Erasing 128 Kiby[  521.340426] MTD_ioctl
te @ a00000 -- 66 % complete.Erasing 128 Kiby[  521.886375] MTD_ioctl
te @ a20000 -- 67 % complete.Erasing 128 Kiby[  522.406406] MTD_ioctl
te @ a40000 -- 68 % complete.Erasing 128 Kiby[  522.932404] MTD_ioctl
te @ a60000 -- 69 % complete.Erasing 128 Kiby[  523.466408] MTD_ioctl
te @ a80000 -- 70 % complete.Erasing 128 Kiby[  523.986405] MTD_ioctl
te @ aa0000 -- 70 % complete.Erasing 128 Kiby[  524.520416] MTD_ioctl
te @ ac0000 -- 71 % complete.Erasing 128 Kiby[  525.060405] MTD_ioctl
te @ ae0000 -- 72 % complete.Erasing 128 Kiby[  525.588414] MTD_ioctl
te @ b00000 -- 73 % complete.Erasing 128 Kiby[  526.108414] MTD_ioctl
te @ b20000 -- 74 % complete.Erasing 128 Kiby[  526.624459] MTD_ioctl
te @ b40000 -- 75 % complete.Erasing 128 Kiby[  527.144416] MTD_ioctl
te @ b60000 -- 75 % complete.Erasing 128 Kiby[  527.664407] MTD_ioctl
te @ b80000 -- 76 % complete.Erasing 128 Kiby[  528.184584] MTD_ioctl
te @ ba0000 -- 77 % complete.Erasing 128 Kiby[  528.723423] MTD_ioctl
te @ bc0000 -- 78 % complete.Erasing 128 Kiby[  529.275406] MTD_ioctl
te @ be0000 -- 79 % complete.Erasing 128 Kiby[  529.815405] MTD_ioctl
te @ c00000 -- 80 % complete.Erasing 128 Kiby[  530.349408] MTD_ioctl
te @ c20000 -- 80 % complete.Erasing 128 Kiby[  530.869434] MTD_ioctl
te @ c40000 -- 81 % complete.Erasing 128 Kiby[  531.409400] MTD_ioctl
te @ c60000 -- 82 % complete.Erasing 128 Kiby[  531.937449] MTD_ioctl
te @ c80000 -- 83 % complete.Erasing 128 Kiby[  532.465425] MTD_ioctl
te @ ca0000 -- 84 % complete.Erasing 128 Kiby[  533.025384] MTD_ioctl
te @ cc0000 -- 85 % complete.Erasing 128 Kiby[  533.559411] MTD_ioctl
te @ ce0000 -- 85 % complete.Erasing 128 Kiby[  534.081395] MTD_ioctl
te @ d00000 -- 86 % complete.Erasing 128 Kiby[  534.597458] MTD_ioctl
te @ d20000 -- 87 % complete.Erasing 128 Kiby[  535.113484] MTD_ioctl
te @ d40000 -- 88 % complete.Erasing 128 Kiby[  535.641426] MTD_ioctl
te @ d60000 -- 89 % complete.Erasing 128 Kiby[  536.161425] MTD_ioctl
te @ d80000 -- 90 % complete.Erasing 128 Kiby[  536.677463] MTD_ioctl
te @ da0000 -- 90 % complete.Erasing 128 Kiby[  537.197360] MTD_ioctl
te @ dc0000 -- 91 % complete.Erasing 128 Kiby[  537.717470] MTD_ioctl
te @ de0000 -- 92 % complete.Erasing 128 Kiby[  538.251328] MTD_ioctl
te @ e00000 -- 93 % complete.Erasing 128 Kiby[  538.777539] MTD_ioctl
te @ e20000 -- 94 % complete.Erasing 128 Kiby[  539.337395] MTD_ioctl
te @ e40000 -- 95 % complete.Erasing 128 Kiby[  539.871411] MTD_ioctl
te @ e60000 -- 95 % complete.Erasing 128 Kiby[  540.393400] MTD_ioctl
te @ e80000 -- 96 % complete.Erasing 128 Kiby[  540.927416] MTD_ioctl
te @ ea0000 -- 97 % complete.Erasing 128 Kiby[  541.455414] MTD_ioctl
te @ ec0000 -- 98 % complete.Erasing 128 Kiby[  541.975420] MTD_ioctl
te @ ee0000 -- 99 % complete.Erasing 128 Kiby[  542.492047] MTD_close
te @ f00000 -- 100 % complete.
[root@freescale /]# mount -t jffs2 mtd0 /mnt/flash
[  636.371343] MTDSB: dev_name "mtd0"
[  636.374726] MTDSB: mtd%d, mtdnr 0
[  636.378013] MTDSB: New superblock for device 0 ("filesystem")
[root@freescale /]# cd /mnt/flash
[root@freescale flash]# touch 1
[root@freescale flash]# touch 12
[root@freescale flash]# touch 123
[root@freescale flash]# touch 1234
[root@freescale flash]# touch 12345
[root@freescale flash]# touch 123456
[root@freescale flash]# touch 1234567
[root@freescale flash]# touch 12345678
[root@freescale flash]# touch 123456789
[root@freescale flash]# touch 1234567890
[root@freescale flash]# ls -l
-rw-r--r--    1 root     root             0 Jan  1 00:10 1
-rw-r--r--    1 root     root             0 Jan  1 00:10 12
-rw-r--r--    1 root     root             0 Jan  1 00:10 123
-rw-r--r--    1 root     root             0 Jan  1 00:10 1234
-rw-r--r--    1 root     root             0 Jan  1 00:10 12345
-rw-r--r--    1 root     root             0 Jan  1 00:10 123456
-rw-r--r--    1 root     root             0 Jan  1 00:10 1234567
-rw-r--r--    1 root     root             0 Jan  1 00:10 12345678
-rw-r--r--    1 root     root             0 Jan  1 00:10 123456789
-rw-r--r--    1 root     root             0 Jan  1 00:11 1234567890
[root@freescale flash]# cd /
[root@freescale /]# umount /mnt/flash
[root@freescale /]# mount -t jffs2 mtd0 /mnt/flash
[  718.170535] MTDSB: dev_name "mtd0"
[  718.173934] MTDSB: mtd%d, mtdnr 0
[  718.177206] MTDSB: New superblock for device 0 ("filesystem")
[  718.189602] jffs2_scan_dirent_node(): Name CRC failed on node at
0x00e4036c: Read 0xffc205c6, calculated 0x88d63443
[  718.200658] jffs2_scan_dirent_node(): Name CRC failed on node at
0x00e403e0: Read 0x2dfd2d88, calculated 0xb0584e16
[  718.211700] jffs2_scan_dirent_node(): Name CRC failed on node at
0x00e40458: Read 0xc597c693, calculated 0xd2bdddb3
[root@freescale /]# ls -l /mnt/flash
-rw-r--r--    1 root     root             0 Jan  1 00:10 1
-rw-r--r--    1 root     root             0 Jan  1 00:10 12
-rw-r--r--    1 root     root             0 Jan  1 00:10 123
-rw-r--r--    1 root     root             0 Jan  1 00:10 1234
-rw-r--r--    1 root     root             0 Jan  1 00:10 12345
-rw-r--r--    1 root     root             0 Jan  1 00:10 123456
-rw-r--r--    1 root     root             0 Jan  1 00:10 1234567
[root@freescale /]#=20
