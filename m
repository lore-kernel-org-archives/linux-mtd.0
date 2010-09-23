Received: from mail.kernelconcepts.de ([212.60.202.196])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oygyv-0001lP-6T
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 08:16:42 +0000
Received: from [192.168.2.28] by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <nils.faerber@kernelconcepts.de>) id 1Oyh9I-0007al-0l
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 10:27:24 +0200
Message-ID: <4C9B0CE3.6040703@kernelconcepts.de>
Date: Thu, 23 Sep 2010 10:16:35 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NAND on MV78100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!
I am currently working on board support for a Marvell MV78100 based
board. The MV78100 uses the same Orion SOC components as e.g. the
Kirkwood which is quite well supported from OpenRD and SheevaPlug.

After some struggling I got the Orion NAND driver working, it detects
the NAND chip properly (512MB) and assigns a partition. Everything seems
OK so far.

But when I read from the device, e.g. just by "cat /dev/mtdblock1 | wc
-c" it starts to fail with "uncorrectable error" after exactly 1MB
(1024*1024).

This seems pretty strange to me and I have no real idea where to look
for the problem. I have the Orion NAND driver working cleanly with the
very same kernel version on a Kirkwood based board without problems.

Any hint on where to look would be *very* much appreciated ;)

Thanks!

Cheers
  nils

-- 
kernel concepts GbR        Tel: +49-271-771091-12
Sieghuetter Hauptweg 48
D-57072 Siegen             Mob: +49-176-21024535
http://www.kernelconcepts.de
