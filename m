Received: from mail155.pune-168.pacific.net.in ([203.123.168.155]
	helo=kr.aftek.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cwbd2-0000Yy-K6
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 02:42:20 -0500
Received: from [10.0.0.155] ([10.0.0.155])
	by kr.aftek.com (8.11.6/8.11.6) with ESMTP id j137fuV15308
	for <linux-mtd@lists.infradead.org>; Thu, 3 Feb 2005 13:11:56 +0530
Message-ID: <42012D92.90007@aftek.com>
Date: Thu, 03 Feb 2005 01:14:18 +0530
From: Ashwin Chaugule <ashwinc@aftek.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: ST flashes
Reply-To: ashwinc@aftek.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
         Im using 2.4.19-rmk7-pxa1 ... i know its really old and all 
that ... but i have no options right now...
but anyway..
Here's my problem.
I have two pxa 255 boards , one with ST flash and one with AMD.
I configured them to use the lubbock flash driver , and made one 
partition for jffs2.
sorry i dont have the board with me, i shall post the dumps soon..

On both the boards,
it boots up properly , performs all file operations smooth ...mount , 
read write etc..
on the AMD , this performance is consistent even after powering the 
board down.
But on the ST , the moment you power down the board ! , the next time , 
it only mounts , but doesnt
let me perform any fops. I keep getting I/O errors..for only write 
operations... read works , coz i could ls in the partition.
It also doesnt let me format the partition.

So I upgraded , the mtd subsys , along with jffs2 , but still the same 
behaviour...
Also , after upgrading mtd , i found that , the lubbock driver uses 
ioremap_cached and DMA , which is not available
in 2.4.19 , so i disabled all of it , but then the cfi probe fails , and 
only rom_mapping works...
due to which im guessing , mtdblock0 gets write protected and mounts 
jffs2 as read-only.

So I used the physmap driver , created one partition just like the 
lubbock driver .. , but then again , it mounts it as ro !!
here again , only ROM mapping works , it doesnt detect the flash type 
anymore. I have enabled Intel/Sharp , ST and AMD flash driver options in 
the CFI submenu.

Before upgrading the mtd , these options used to work.

Can anyone , give me a lead here ?
Thanks,

-- 
-------------------------
Ashwin Chaugule
Embedded Systems Engineer
Aftek Infosys Ltd.
[Embedded Division] 
