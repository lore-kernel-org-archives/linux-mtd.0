Received: from [210.176.198.195] (helo=mail.octopus.com.hk)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBBo8-0007Ht-0T
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 13:05:28 +0100
Message-ID: <B6FABB86BDB8D511A46C00902785F34D038D70F0@CS-MAIL-1>
From: Yomie Chan <yomiechan@octopuscards.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 7 Apr 2004 20:14:28 +0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: ext2 and jffs2 partitions on arm linux
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I have a 8MB atmel dataflash AT45DB2562 running on at91rm9200. I am running
out of space at program flash. Can i partiting the dataflash in a way 

| --------------------------------------------
|   Ext2  to put the mtd/jffs2 libraries
| --------------------------------------------
|  Jffs2 data  partion section 1
| --------------------------------------------
|  Jffs2 data  partion section 2
| --------------------------------------------


So that after i boot up the linux kernel from uImage and ramdisk, I can run
the mtd/jffs2 libraries in the first sector of of the dataflash and then
mount the others jffs2  sector?

how to do it? or should i put the ext2 near the end of the dataflash?
How/where can i set the address boundary? Or is there any better way to do
it?
Many thanks

Best Regards,
Yomie
