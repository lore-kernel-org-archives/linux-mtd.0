Received: from mail2.mainnameserver.com ([82.110.105.34]
	helo=mail2.extendcp.co.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GzcxO-0000Vc-9h
	for linux-mtd@lists.infradead.org; Wed, 27 Dec 2006 12:52:55 -0500
Received: from dyn-62-56-49-17.dslaccess.co.uk ([62.56.49.17]
	helo=[192.168.1.12]) by mail2.extendcp.com with esmtpa (Exim 4.42)
	id 1GzcxJ-0003AI-CI
	for linux-mtd@lists.infradead.org; Wed, 27 Dec 2006 17:52:45 +0000
Subject: DiskonChip
From: mike <wtf62@rovoreed.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Wed, 27 Dec 2006 17:52:44 +0000
Message-Id: <1167241964.10282.23.camel@glynys>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have upgraded my kernel from 2.4 to 2.6.19 and I'm struggling to
get access to my DiskonChip which is in FAT12/MSDOS format

Under 2.4 I used to simply

modprobe -a ntfl
insmod nand_ids
mount /dev/nftla1

This would load up the following modules - mtdcore, ntfl, nand_ids,
docprobe, docecc, doc2000, and then I could read/write to the DOC

That no longer works. How exactly am I supposed to access my DiskonChip with
the new drivers (or the old deprecated doc2000 driver).

I used to also have devices called ntfla1 etc, but udev removes these
when it starts running.

Thanks (and Happy New Year)
