Received: from [202.108.255.198] (helo=bjapp6.163.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 163ywF-0006L6-00
	for <linux-mtd@lists.infradead.org>; Wed, 14 Nov 2001 12:14:44 +0000
MIME-Version: 1.0
Message-Id: <3BF26262.15239@bjapp6.163.net>
Date: Wed, 14 Nov 2001 20:24:02 +0800 (CST)
From: "SHIKUILIANG" <klshi_163@163.net>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org;, gareth@microm-electronics.com
Subject: =?gb2312?B?RG9DIGJlZ2luZXIg?=
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

hi,
I have a problem with my doc2000 device.
my target is x86 PC.and I get a linux kernel of v2.4.6.
then I compiled MTD modules with this kernel:

   CONFIG_MTD=m

   CONFIG_NFTL=m

   CONFIG_MTD_DOC2000=m

   CONFIG_MTD_DOCPROBE=m

   CONFIG_MTD_DOCPROBE_ADDRESS=0

and used the new kernel image to reboot my box,
when rebooting up, I do modprobe:

#modprobe doc2000 --> OK
#modprobe nftl    --> OK

then I can find 4 modules inserted into kernel :
nftl ,doc2000, mtdcore and docecc

then I run fdisk:

#fdisk /dev/nftla
.
.
.
DiskOnChip 2000 found at address 0xDC000
Sorry, we don't support UnitSizeFactor of != 1 yet
Sorry, we don't support UnitSizeFactor of != 1 yet
Could not find valid boot record
Could not mount NFTL device

Unable to open /dev/nftla
.
.
.

before do these I already run "dformat" command in dos system.
A:>dformat /win:dc00 /s:doc50.exb /y

where did wrong I do ? and what means of
"UnitSizeFactor " ?

I heard some mtd tools,like nftl_format,
where r i can get it?

any hints will be very appreciated!

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
