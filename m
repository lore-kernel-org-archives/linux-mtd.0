Received: from web14809.mail.yahoo.com ([216.136.224.230])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18AbsD-0003ON-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Nov 2002 20:06:30 +0000
Message-ID: <20021109203650.72416.qmail@web14809.mail.yahoo.com>
Date: Sat, 9 Nov 2002 12:36:50 -0800 (PST)
From: Kevin Kaichuan He <hek_u5@yahoo.com>
Subject: Q on MTD support for NOR flash
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

We are considering to use NOR flash in a embedded linux
system. But it seems that NAND flash support was mentioned
a lot in MTD instead of NOR flash. I'm wondering if there
is intensive NOR flash support in MTD, specifically if
AMD's boot sector NOR flash
(AM29LV800B,http://www.amd.com/us-en/FlashMemory/ProductInformation/0,,37_1447_1623_1468%5E1532,00.html)
is supported.
Also can we partition the AM29LV800B into multiple partitions and
mount different filesystem on it (e.g. JFFS on RW partiton and Cramfs
on RO partition) ? How about the boot sector of NOR flash, is it supported
too ?

Thank you very much for your time!

Kevin


__________________________________________________
Do you Yahoo!?
U2 on LAUNCH - Exclusive greatest hits videos
http://launch.yahoo.com/u2
