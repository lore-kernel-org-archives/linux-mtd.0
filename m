Received: from [222.66.49.139] (helo=smailsh.E28.COM)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeNOL-0005ny-RN
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 20:56:21 -0500
From: kevinwu <kevinwu@e28.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 22 Nov 2005 09:50:24 +0800
Message-Id: <1132624224.3577.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: small erase block size with EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a NAND flash with a small erase block(16KiB)
When I use sumtool, I find that the summary image size is much larger
than the original one if I use option --eraseblock=0x4000.
But When I use option --eraseblock=0x20000, The summary image is a bit
larger than the original one.
EBS fits for large erase block as far as I know. 
That is to say, I can not use EBS if the NAND erase block is small. What
a pitty!
What about CS?
Is there any way to use EBS on a small erase block size NAND?
If there is not, I have to modify JFFS2 souce code in order to make a
128KiB erase block size image to work on a 16KiB erase block size NAND
flash.

-- 
Best Regards

Kevin Wu

System Software Engineer, E28.com


Office: 86-21-32224888-207
