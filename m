Received: from mail.atmel.fr ([81.80.104.162] helo=atmel-es2.atmel.fr)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2Tx8-0005Ct-G6
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 15:57:01 +0000
Message-ID: <47600394.6000207@atmel.com>
Date: Wed, 12 Dec 2007 16:51:48 +0100
From: Nicolas Ferre <nicolas.ferre@atmel.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org,
	ARM Linux Mailing List <linux-arm-kernel@lists.arm.linux.org.uk>
Subject: at91_nand: Chip Select management
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	Andrew Victor <linux@maxim.org.za>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Reviewing the at91_nand code, I was wondering why the chip select was 
using GPIO and moreover why this GPIO is never toggled during nand flash 
accesses.

Indeed, the Chip select is asserted during the probe routine and never 
released. Don't you think that it can lead to issues if we connect more 
than only one nand and a sdram chip on the EBI ?

If you can enlighten me...

Cheers,
-- 
Nicolas Ferre
