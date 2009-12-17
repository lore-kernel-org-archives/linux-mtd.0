Received: from mexforward.lss.emc.com ([128.222.32.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NLMgl-0003js-GG
	for linux-mtd@lists.infradead.org; Thu, 17 Dec 2009 20:11:11 +0000
Received: from hop04-l1d11-si03.isus.emc.com (HOP04-L1D11-SI03.isus.emc.com
	[10.254.111.23])
	by mexforward.lss.emc.com (Switch-3.3.2/Switch-3.1.7) with ESMTP id
	nBHKB66w013543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2009 15:11:06 -0500
Received: from mailhub.lss.emc.com (nagas.lss.emc.com [10.254.144.15]) by
	hop04-l1d11-si03.isus.emc.com (RSA Interceptor) for
	<linux-mtd@lists.infradead.org>; Thu, 17 Dec 2009 15:10:55 -0500
Received: from mailhub2.iomegacorp.com (mailhub.iomegacorp.com [147.178.68.20])
	by mailhub.lss.emc.com (Switch-3.4.2/Switch-3.3.2mp) with ESMTP id
	nBHKAs2Z015297
	for <linux-mtd@lists.infradead.org>; Thu, 17 Dec 2009 15:10:55 -0500
Received: from EXCAS01.iomegacorp.com (excas01.iomegacorp.com [147.178.90.117])
	by mailhub2.iomegacorp.com (Postfix) with ESMTP id AB5B3200E1
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Dec 2009 20:10:54 +0000 (UTC)
Message-ID: <4B2A920A.5080808@iomega.com>
Date: Thu, 17 Dec 2009 13:18:18 -0700
From: Dennis Millard <millard@iomega.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: 4bit NAND ECC
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anyone who has worked with NAND ECC support, I have a question-

    I have a platform running the 2.6.30 kernel based on the Marvell 
88F6281.  It has 512 MB NAND flash, and is very similar to the Marvell 
Sheevaplug reference design.  My Uboot is using 4bit NAND ECC to write 
the kernel and ramdisk to flash.  However, I recently discovered that 
the 2.6.30 kernel does not support 4bit ECC mode.  When I try to access 
the Uboot environment variables from the running kernel, I can only use 
1bit ECC.  When I switch Uboot to use 1bit ECC, I get lots of errors 
while accessing the Uboot vars in flash.  I've been told that I really 
should be using 4bit ECC in Uboot.

    I noticed that the 2.6.32 kernel supports 4bit ECC, but it appears 
to be only for the TI DaVinci CPU.  Can someone confirm this?  Does this 
mean that 4bit ECC is not available for general use in the 2.6.32 
kernel?  Does anyone know of a patch that would make it available for 
the Marvell 88F6281?

Thanks-
  Dennis Millard
