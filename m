Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4M2B-0002vW-Ea
	for linux-mtd@lists.infradead.org; Wed, 13 May 2009 21:30:49 +0000
Received: from smtp4-g21.free.fr (localhost [127.0.0.1])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 60A8B4C80DC
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 23:30:33 +0200 (CEST)
Received: from [192.168.0.10] (bdy93-1-82-67-223-79.fbx.proxad.net
	[82.67.223.79])
	by smtp4-g21.free.fr (Postfix) with ESMTP id 2BF314C80D7
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 May 2009 23:30:31 +0200 (CEST)
Message-ID: <4A0B3BF6.90602@gcasse.net>
Date: Wed, 13 May 2009 23:30:30 +0200
From: Gilles Casse <list@gcasse.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Erroneous read from flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

A reproductible oops appears, here, in jffs2 (file.c, line 251),  with 
such a message :
Node CRC 2e362e33 != calculated CRC 36bb7f4c for node at 000342dc

The traces show that the CRC error is due to an erroneous read of a page 
in an Atmel dataflash.

Have you advices please for helping to better track such an issue?

More details:
- linux 2.6.28-9
- ARM 920T
- Atmel AT45DB642D dataflash

The issue happens relatively rarely if the gc thread has been stopped, and
the SPI bus is at 10Mhz (occurs e.g. after 4000 writes).

The issue happens more frequently if gcd is present, and using a SPI
bus at 6Mhz (occurs at the very first tries).

Best regards,
Gilles
