Received: from [222.33.36.197] (helo=sict.ac.cn)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcOJn-0008BA-78
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 08:26:54 -0500
Received: from [10.32.4.45] ([10.32.4.45])
	by sict.ac.cn (Merak 7.2.0) with ASMTP id 42U08685
	for <linux-mtd@lists.infradead.org>; Thu, 09 Dec 2004 21:26:39 +0800
From: zhang jingxin <zhangjingxin@sict.ac.cn>
To: list <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Message-Id: <1102598792.2805.6.camel@z21921>
Mime-Version: 1.0
Date: Thu, 09 Dec 2004 21:26:32 +0800
Content-Transfer-Encoding: 7bit
Subject: doc2000 problem(ls -a /dev/mtd*)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
this is the output.
I cann't reply the mail.So I wite this mail.

[root@localhost /root]# ls -l /dev/mtd*
crw-r--r--    1 root     root      90,   0 Sep 29 09:32 /dev/mtd0
crw-r--r--    1 root     root      90,   2 Sep 29 09:32 /dev/mtd1
crw-r--r--    1 root     root      90,  20 Sep 29 09:32 /dev/mtd10
crw-r--r--    1 root     root      90,  22 Sep 29 09:32 /dev/mtd11
crw-r--r--    1 root     root      90,  24 Sep 29 09:32 /dev/mtd12
crw-r--r--    1 root     root      90,  26 Sep 29 09:32 /dev/mtd13
crw-r--r--    1 root     root      90,  28 Sep 29 09:32 /dev/mtd14
crw-r--r--    1 root     root      90,  30 Sep 29 09:32 /dev/mtd15
crw-r--r--    1 root     root      90,  32 Sep 29 09:32 /dev/mtd16
crw-r--r--    1 root     root      90,   4 Sep 29 09:32 /dev/mtd2
crw-r--r--    1 root     root      90,   6 Sep 29 09:32 /dev/mtd3
crw-r--r--    1 root     root      90,   8 Sep 29 09:32 /dev/mtd4
crw-r--r--    1 root     root      90,  10 Sep 29 09:32 /dev/mtd5
crw-r--r--    1 root     root      90,  12 Sep 29 09:32 /dev/mtd6
crw-r--r--    1 root     root      90,  14 Sep 29 09:32 /dev/mtd7
crw-r--r--    1 root     root      90,  16 Sep 29 09:32 /dev/mtd8
crw-r--r--    1 root     root      90,  18 Sep 29 09:32 /dev/mtd9
brw-r--r--    1 root     root      31,   0 Sep 29 09:32 /dev/mtdblock0
brw-r--r--    1 root     root      31,   1 Sep 29 09:32 /dev/mtdblock1
brw-r--r--    1 root     root      31,  10 Sep 29 09:32 /dev/mtdblock10
brw-r--r--    1 root     root      31,  11 Sep 29 09:32 /dev/mtdblock11
brw-r--r--    1 root     root      31,  12 Sep 29 09:32 /dev/mtdblock12
brw-r--r--    1 root     root      31,  13 Sep 29 09:32 /dev/mtdblock13
brw-r--r--    1 root     root      31,  14 Sep 29 09:32 /dev/mtdblock14
brw-r--r--    1 root     root      31,  15 Sep 29 09:32 /dev/mtdblock15
brw-r--r--    1 root     root      31,  16 Sep 29 09:32 /dev/mtdblock16
brw-r--r--    1 root     root      31,   2 Sep 29 09:32 /dev/mtdblock2
brw-r--r--    1 root     root      31,   3 Sep 29 09:32 /dev/mtdblock3
brw-r--r--    1 root     root      31,   4 Sep 29 09:32 /dev/mtdblock4
brw-r--r--    1 root     root      31,   5 Sep 29 09:32 /dev/mtdblock5
brw-r--r--    1 root     root      31,   6 Sep 29 09:32 /dev/mtdblock6
brw-r--r--    1 root     root      31,   7 Sep 29 09:32 /dev/mtdblock7
brw-r--r--    1 root     root      31,   8 Sep 29 09:32 /dev/mtdblock8
brw-r--r--    1 root     root      31,   9 Sep 29 09:32 /dev/mtdblock9
crw-r--r--    1 root     root      90,   1 Sep 29 09:32 /dev/mtdr0
crw-r--r--    1 root     root      90,   3 Sep 29 09:32 /dev/mtdr1
crw-r--r--    1 root     root      90,  21 Sep 29 09:32 /dev/mtdr10
crw-r--r--    1 root     root      90,  23 Sep 29 09:32 /dev/mtdr11
crw-r--r--    1 root     root      90,  25 Sep 29 09:32 /dev/mtdr12
crw-r--r--    1 root     root      90,  27 Sep 29 09:32 /dev/mtdr13
crw-r--r--    1 root     root      90,  29 Sep 29 09:32 /dev/mtdr14
crw-r--r--    1 root     root      90,  31 Sep 29 09:32 /dev/mtdr15
crw-r--r--    1 root     root      90,  33 Sep 29 09:32 /dev/mtdr16
crw-r--r--    1 root     root      90,   5 Sep 29 09:32 /dev/mtdr2
crw-r--r--    1 root     root      90,   7 Sep 29 09:32 /dev/mtdr3
crw-r--r--    1 root     root      90,   9 Sep 29 09:32 /dev/mtdr4
crw-r--r--    1 root     root      90,  11 Sep 29 09:32 /dev/mtdr5
crw-r--r--    1 root     root      90,  13 Sep 29 09:32 /dev/mtdr6
crw-r--r--    1 root     root      90,  15 Sep 29 09:32 /dev/mtdr7
crw-r--r--    1 root     root      90,  17 Sep 29 09:32 /dev/mtdr8
crw-r--r--    1 root     root      90,  19 Sep 29 09:32 /dev/mtdr9

thanks
