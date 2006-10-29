Received: from mail2.mainnameserver.com ([82.110.105.34]
	helo=mail2.extendcp.co.uk)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GeGZF-0007dR-G7
	for linux-mtd@lists.infradead.org; Sun, 29 Oct 2006 14:43:41 -0500
Received: from dyn-62-56-53-164.dslaccess.co.uk ([62.56.53.164]
	helo=[192.168.1.12]) by mail2.extendcp.com with esmtpa (Exim 4.42)
	id 1GeGZ2-0005cE-UX
	for linux-mtd@lists.infradead.org; Sun, 29 Oct 2006 19:43:25 +0000
Subject: How to access DOC MSDOS files ?
From: mike <wtf62@rovoreed.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sun, 29 Oct 2006 19:43:23 +0000
Message-Id: <1162151003.5253.3.camel@glynys>
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

I have just upgraded my kernel from 2.4 to 2.6.12 and I'm struggling to
get access to my DiskonChip which is in FAT12/MSDOS format

Under 2.4 I used to simply

modprobe -a ntfl
insmod nand_ids
mount /dev/nftla1

This would load up the following modules - mtdcore, ntfl, nand_ids,
docprobe, docecc, doc2000.

How exactly am I supposed to access my DOC with the new drivers.

Thanks
