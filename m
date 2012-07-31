Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sw3tW-0007An-2T
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2012 04:17:18 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
Date: Tue, 31 Jul 2012 06:17:06 +0200
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207310617.06974.marex@denx.de>
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian Norris,

> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
> silently masks off at least one flag that might be set by the driver
> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
> others.
> 
> Really, as long as driver writers exercise a small amount of care with
> NAND_* options, this mask is not necessary at all. Thus, kill it.
> 
> From Huang Shijie:
> 
> "I tested this patch on imx6q-arm2 board with Micron MT29F32G08QAA.
> it works fine, thanks."
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Tested-by: Huang Shijie <shijie8@gmail.com>

Tested-by: Marek Vasut <marex@denx.de>

Sorry for the slow reply. Tested it on denx m28evk board.

> Cc: Marek Vasut <marex@denx.de>
> ---
> Hello Artem/David,
> 
> GPMI NAND has needed this patch for some time, and I think it was agreed
> on by a few. I'm resending to get acknowledgment from a maintainer.

[...]

Best regards,
Marek Vasut
