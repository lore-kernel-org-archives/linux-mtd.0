Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yalth-00074i-LF
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 14:03:14 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC] On-die ECC support
Date: Wed, 25 Mar 2015 15:02:28 +0100
Message-Id: <1427292151-3835-1-git-send-email-richard@nod.at>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some Micron NAND chips offer an on-die ECC (AKA internal ECC) feature,
in this mode all ECC is automatically performed by the NAND chips itself.
Most user are happy with software ECC or hardware ECC performed by the
NFC (NAND flash controller).
But there are situations where multi-bit hardware ECC is not available,
some AT91 based SoCs for example, and due to CPU limitations
software ECC is not feasible. In such situations on-die ECC can help.
People are using that feature in the wild for years.
As this feature is not supported in mainline these guys are using out-of-tree
patches of doubtful quality. That's why I did that patch series.

This series is based on patches by David Mosberger and in-house patches
by a customer.

Currently I'm not happy with patch 2/3.
To allow raw access (access without ECC) we have to disable/enable
on-die ECC mode in various NAND core functions.
I could also think of dropping support for raw access completely.

I'd like to thank Ammonit Measurement GmbH for making this contribution to the MTD community happen!

[PATCH 1/3] mtd: nand: Add on-die ECC support
[PATCH 2/3] mtd: nand: Add support for raw access when using on-die
[PATCH 3/3] mtd: nand: Wire up on-die ECC support

Thanks,
//richard
