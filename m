Received: from albatross.mail.pas.earthlink.net ([207.217.120.120] helo=albatross.prod.itd.earthlink.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLzL-0000a1-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 16:21:36 +0000
Received: from user-119bbl2.biz.mindspring.com ([66.149.174.162] helo=zorak)
	by albatross.prod.itd.earthlink.net with esmtp (Exim 3.33 #1)
	id 18GMSq-0003Lu-00
	for linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 08:52:05 -0800
Reply-To: <anidea@earthlink.net>
From: "Gabriel Goldstein" <anidea@earthlink.net>
To: <linux-mtd@lists.infradead.org>
Subject: Nand flash and blob
Date: Mon, 25 Nov 2002 11:49:04 -0500
Message-ID: <017c01c294a2$907fe9b0$6401000a@zorak>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

Hello,

I'm working on a arm based design where I have a 16MB Sandisk/Samsung
nand flash device.  I think I have the Linux side settled buy using the
standard MTD driver. 

I'm using BLOB and I'd like to know what people are doing to get the
system loaded.  I have zImage, params, and ramdisk that I want to use my
NAND device to store these blocks.

Thanks,

Gabriel


Gabriel Goldstein
Anidea Engineering, Inc.
Fort Lauderdale, FL
anidea@earthlink.net
Phone:  954-254-9898
Fax:  240-368-8982
