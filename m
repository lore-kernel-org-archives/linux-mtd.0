Received: from [203.194.144.59] (helo=ns3.dns-hk.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17f0bB-0000QZ-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Aug 2002 17:02:18 +0100
Received: from cm218-252-48-14.hkcable.com.hk ([218.252.48.14] helo=paulhome)
	by ns3.dns-hk.net with asmtp (Exim 3.35 #1)
	id 17f0b4-0004lG-00
	for linux-mtd@lists.infradead.org; Thu, 15 Aug 2002 00:02:11 +0800
Message-ID: <003c01c243ab$fb65b310$b200a8c0@paulhome>
Reply-To: <paul@maypaul.com>
From: <paul@maypaul.com>
To: <linux-mtd@lists.infradead.org>
Subject: NAND + JFFS2, run in Kernel 2.4.17
Date: Thu, 15 Aug 2002 00:02:19 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi! all,
    I have some questions about the MTD -> nand flash + jffs2 using Kernel
2.4.17

1. when I configure  CONFIG_JFFS2_FS=y and then make bzImage, there have
error message to show, that mean about the zlib_inflate and zlib_deflate
missing. Otherwise, set CONFIG_JFFS2_FS=m, it is successful to compile . Is
it the problem about the jffs2 compile in kernel ????

2. I want to bootup from jffs2 for file system. the speed will reduce ??????
Or copy the compressed file system in NAND flash  and then extract in
ramdisk when boot up. which is the better one and stable?

thanks a lot.

Paul
