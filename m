Received: from [195.223.129.35] (helo=martina.custom.it)
	by pentafluge.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cytci-0004LZ-MM
	for linux-mtd@lists.infradead.org; Wed, 09 Feb 2005 15:19:30 +0000
Received: from martina (192.168.2.9)
	by martina.custom.it with MERCUR Mailserver (v4.03.03
	MTA3LTI0MzYtNjY2Nw==)
	for <linux-mtd@lists.infradead.org>; Wed, 9 Feb 2005 16:12:38 +0100
Message-Id: <5.0.2.1.2.20050209161004.00b425b8@192.168.2.9>
Date: Wed, 09 Feb 2005 16:16:03 +0100
To: linux-mtd@lists.infradead.org
From: Fabrizio Grasso <f.grasso@custom.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: Creating RAM partition??
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I'm using ARM9 S3C2410A from Samsung and Linux 2.4.18 from Mizi.

I'd like to know if it's possible ( and how :) ) to create a RAM filesystem 
which I can mount in R/W mode... at a specified RAM area.
I think I must create something under /dev path which represent the 
specified memory area and then mount it at runtime with something like:
"mount -t ramfs /dev/... /mnt/ramfs".

But... how to create the /dev/... object??

At this moment I have /dev/rd/0 which I can mount with:
"mount -t ramfs /dev/rd/0 /mnt/ramfs"
I can read/write to /mnt/ramfs but I don't know at which memory address it 
write!

PS: Probably I'm wrong in all my reasoning... if it so... please 
redirection me to the correct way!!

Thanks!
