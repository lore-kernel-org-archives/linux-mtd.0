Received: from tozal.unizar.es ([155.210.3.20] helo=relay.unizar.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173EfJ-0003TT-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 12:22:29 +0100
Received: from eupla.unizar.es (eupla.unizar.es [155.210.224.20])
	by relay.unizar.es (8.11.1/8.11.1) with ESMTP id g42BMIp05257
	for <linux-mtd@lists.infradead.org>; Thu, 2 May 2002 13:22:18 +0200 (MET DST)
Message-Id: <200205021122.g42BMIp05257@relay.unizar.es>
To: linux-mtd@lists.infradead.org
From: victor.martin@eupla.unizar.es
Subject: IDE flash disk
Date: Thu, 2 May 2002 06:12:28 EST
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

I have an IDE disk with flash tecnology.

I think ide emulation doesnt work ok and i should to use JFFS2 Filesystem but 
i can't do it.

I think i should to use MTD block device emulation and i'm trying to make it 
with a floppy disk to know the mtdblock behaivour 

when i do it, in /proc/mtd i can read it

root@localhost proc]# cat mtd
dev:    size   erasesize  name
mtd0: 00168000 00020000 "blkmtd: /dev/fd0"

The problem is that i can't mount it and i don't know what i have to do now.

Can anybody solve me it?

thanks in advance


---------------------------------------------
This message was sent using Endymion MailMan.
http://www.endymion.com/products/mailman/
