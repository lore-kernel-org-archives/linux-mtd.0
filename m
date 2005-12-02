Received: from [202.108.3.160] (helo=vip3-160.sinamail.sina.com.cn)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei26L-00006T-3g
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2005 23:00:54 -0500
Message-ID: <20051202040024.23368.qmail@vip3-160.sinamail.sina.com.cn>
Date: Fri, 2 Dec 2005 12:00:24 +0800
MIME-Version: 1.0
From: superlidu@vip.sina.com
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 8bit
Subject: [question:] how to download JFFS2 image to NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Now I am building my ARM board, and use the Samsung\'s nand flash as the main 

storage(bootloader,os kernel, Ramdisk and QT embedded). The kernel is 2.6.14. I partition the 

nand flash two main part, one for bootloader, os kernel and Ramdisk, Another for the QT 

embedded(this part should be used as JFFS2 part),so I want

to download the above four images as follow:



  1, use my PC downloader tool download the bootloader ,os kernel and ramdisk image to the 

nand flash( I have a workable PC downloader tool and bootloader can download, the bootloader is 

my own without MTD and file system functions);

  2, make a JFFS2 image including QT on the host;

  3, after download the bootloader, os kernel. boot the kernel. After start the kernel, it should 

download the JFFS2 image to my JFFS2 part of my NAND flash.

  4, mount the ramdisk as the root fs, then mount the JFFS2 fs.

  Now I have a question in the step 3 and 4, how can I download the JFFS2 image to the nand 

flash? use the MTD write and read function? If like that, after I mount the JFFS2 part, if kernel

can know the QT files in the partition?

   when I use the MTD write function, Should I judge the bad block, if the block is bad, what 

should I do? just use next good block?

   Any advice is appreciated.



sword
