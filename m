Received: from [202.108.255.197] (helo=bjapp6.163.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164Ncx-00087s-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2001 14:36:27 +0000
MIME-Version: 1.0
Message-Id: <3BF3D520.04135@bjapp6.163.net>
Date: Thu, 15 Nov 2001 22:45:52 +0800 (CST)
From: "SHIKUILIANG" <klshi_163@163.net>
To: linux-mtd@lists.infradead.org
Cc: mtd@imladris.demon.co.uk;, David.Woodhouse@mvhi.com;
Subject: =?gb2312?B?bmZsdF9mb3JtYXQgYW5kIGZkaXNrID8/Pw==?=
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

Useing a doc2000 device (32Mb) and a kernel v2.4.14.

After insert some MTD modules :
mtdcore docecc doc2000 mtdchar mtdblock and nftl;
I run nflt_format to format my doc2000 chip;
but it complain :Erasesize not 8Kb - I'm confused!

For someone's advice I skip the erasesize check in nftl_format.c.
so nftl_format works well.
but when I run fdisk on /dev/nftla.
it's say :
You will not be able to write partition table.
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF
disklabel Building a new DOS disklabel.Changes will remain in memory only,until
you decide to write them.After that, of course,the previous content won't be
recoverable.

Command (m for help):

Even if I created a partition and enter "w",the partition also can not be writed
into /dev/nftla.

run nftldump on /dev/mtd0:
NFTL Media Header found at offset 0x00000000:
NumEraseUnits: 2048
FirstPhysicalEUN:0
Formatted Size:33488896
UnitSizeFactor: 0xff
Second NFTL Media Header found at offset 0x00004000
Unit 0 is free
Unit 1 is free
...
...










加薪，升职密笈
http://www.englishtown.com/master/home/courseoverview.asp?etag=TOCN&ctr=cn



===============================================
 
手机号码是电邮，从此交费不用愁，一号在手“随身邮”
 
—— 163“随身邮”手机邮箱 ——
◎ 手机号码就是电子邮箱地址，方便记忆
◎ 不用上网，透过手机短信，随时掌握邮件的接收情况
◎ 决不错过任何商业良机
◎ 方便的按月收费方式，最低每月只需5元
 
详情请浏览
http://vip.163.net/mobile/mobile.htm
 
===============================================
