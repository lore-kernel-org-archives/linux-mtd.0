Received: from mail-out.m-online.net ([212.18.0.10])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpjQ4-0003xT-QU
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:12:45 +0000
From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver
Date: Fri, 13 Jul 2012 19:12:42 +0200
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207131912.42495.marex@denx.de>
Cc: Scott Wood <scottwood@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
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
> NAND_* options, this mask is not necessary at all; it was only here to
> prevent certain options from accidentally being set by the driver. But the
> original thought turns out to be a bad idea occasionally. Thus, kill it.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <shijie8@gmail.com>
> Cc: Marek Vasut <marex@denx.de>
[...]

Maybe we should simply split it into two sets of flags to make it clear -- chip 
ones and controller ones ?

Best regards,
Marek Vasut
