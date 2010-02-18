MIME-Version: 1.0
Date: Thu, 18 Feb 2010 13:06:23 +0100
Message-ID: <62fd715d1002180406y1181bbe9y83ba3cd0277989c4@mail.gmail.com>
Subject: NDCBx registers in PXA3XX MTD driver
From: Romain Bornet <bornet.romain@gmail.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

I'm rather new in the ARM / Linux world and currently working on a
PXA168-based board.

I'm trying to understand the implementation of the pxa3xx_nand.c
driver and came across 3 lines of code I cannot understand.

The 3 lines in question are the one where the NDCB0/1/2 registers are
written in write_cmd()
---
nand_writel(info, NDCB0, info->ndcb0);
nand_writel(info, NDCB0, info->ndcb1);
nand_writel(info, NDCB0, info->ndcb2);
---

see here for context...
http://lxr.linux.no/#linux+v2.6.32/drivers/mtd/nand/pxa3xx_nand.c#L459

Why are all 3 values (ndcb0, ndcb1, ndcb2) written to the same
register NDCB0 whereas the PXA3xx and PXA168 have different offsets
(0x48, 0x4C and 0x50) for these 3 registers as documented in
PXA3xx_DM_Vol_II in chapter "3.8.10 NAND Controller Command Buffers
(NDCBx)" (available from Marvell @
http://www.marvell.com/products/processors/applications/pxa_3xx/PXA3xx_Developers_Manual.zip
)

I first thought about a possible hardware Errata but couldn't find any
hint in this direction.

I would have expected

nand_writel(info, NDCB0, info->ndcb0);
nand_writel(info, NDCB1, info->ndcb1);
nand_writel(info, NDCB2, info->ndcb2);


Any clue on this?

Thanks for your help !
    Romain
