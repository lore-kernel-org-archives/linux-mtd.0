Received: from mail.kernelconcepts.de ([212.60.202.196])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IR1jA-0004lJ-7i
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 04:19:47 -0400
Received: from [192.168.2.28] by mail.kernelconcepts.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1IR1ti-0007aw-Fi
	for linux-mtd@lists.infradead.org; Fri, 31 Aug 2007 10:30:34 +0200
Message-ID: <46D7CF14.1010009@kernelconcepts.de>
Date: Fri, 31 Aug 2007 10:19:32 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 support fro AT45* dataflash...
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!
Just a quick question of verification ;)
We are planning a new hardware and have to choose our storage device.
Ideally we would like to use one of the AT45* serial data flashes
(currently in plan is AT45DB642D with uclinux 2.6.xx).
Looking through the kernel sources I found several "hints" that those
dataflashes should be supported by MTD and JFFS2.
Now I just read in tha datasheet that dataflashes require a sector
rewrite every 10,000 write cycles in any of the pages of a single sector.
This seems complex to me and I was not able to conclusively figure out
for sure if MTD/JFFS2 supports this. JFFS2 is critical for our application.

So if someone could just briefly acknowledge that this sector-rewrite is
also implemented I would be extremely happy (and continue to go for data
flashes ;)

Many thanks!

Cheers
  nils faerber

-- 
kernel concepts GbR        Tel: +49-271-771091-12
Sieghuetter Hauptweg 48    Fax: +49-271-771091-19
D-57072 Siegen             Mob: +49-176-21024535
--
