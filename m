Received: from host-82-135-62-35.customer.m-online.net ([82.135.62.35]
 helo=mail.embedded-brains.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SrqJc-0006kj-Tv
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 12:58:50 +0000
Received: from [192.168.96.64] (eb0024.eb.z [192.168.96.64])
 by mail.embedded-brains.de (Postfix) with ESMTP id EC622652A42
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jul 2012 14:49:24 +0200 (CEST)
Message-ID: <50080254.4020001@embedded-brains.de>
Date: Thu, 19 Jul 2012 14:49:24 +0200
From: Sebastian Huber <sebastian.huber@embedded-brains.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ARM: LPC32XX MLC NAND Bad Block Handling
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

it seems that the LPC32XX MLC NAND driver uses nand_default_block_markbad() to 
mark a block as bad.  This function will use nand_do_write_oob() with 
MTD_OPS_PLACE_OOB to write the bad block marker in the bad block itself.  This 
function will use chip->ecc.write_oob() to write the OOB which is

static int lpc32xx_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
			      int page)
{
	/* None, write_oob conflicts with the automatic LPC MLC ECC decoder! */
	return 0;
}

Does this mean that the bad block mark is only present in the bad block table?

I think the driver should set NAND_BBT_NO_OOB_BBM to make this clear.

-- 
Sebastian Huber, embedded brains GmbH

Address : Obere Lagerstr. 30, D-82178 Puchheim, Germany
Phone   : +49 89 18 90 80 79-6
Fax     : +49 89 18 90 80 79-9
E-Mail  : sebastian.huber@embedded-brains.de
PGP     : Public key available on request.

Diese Nachricht ist keine geschäftliche Mitteilung im Sinne des EHUG.
