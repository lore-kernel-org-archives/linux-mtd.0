Received: from [202.108.255.197] (helo=bjapp3.163.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 164Lny-0007yM-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2001 12:39:42 +0000
MIME-Version: 1.0
Message-Id: <3BF3B9C1.21848@bjapp3>
Date: Thu, 15 Nov 2001 20:49:05 +0800 (CST)
From: "SHIKUILIANG" <klshi_163@163.net>
To: shamalin@linpus.com.tw
Cc: linux-mtd@lists.infradead.org;
Subject: =?gb2312?B?RXJhc2Ugc2l6ZSBwcm9ibGVt?=
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

I have a doc2000 device and a v2.4.14 kernel.
after configured and compiled mtd device in kernel I  can insert some mtd
modules :like mtdcore doc2000 docecc docprobe mtdchar and nftl.

when I insert docprobe.o kernel report that:

DiskOnChip 2000 found at address 0xd8000
Could not find valid boot record
Could not mout NFFL device

then i try to format /mnt/mtd0 by nftl_format.
but it's complain :

Erase size not 8k, I'am confused!

when i use the last mtd patch from cvs accroding to someone advices.this problem
already exists.

It always say some symbols can not be find when I compile a pathed kernel which
use a mtd patch on 2001-8-14  or  a patch on 2001-8-30.

any hints will be appreciated.

stars













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
