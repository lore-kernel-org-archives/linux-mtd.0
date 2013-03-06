Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDAVO-0005rv-V4
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 09:19:23 +0000
Message-ID: <1362561599.21850.25.camel@sauron>
Subject: Re: [PATCH 03/11] arm: defconfigs: lpc32xx_defconfig: remove the
 museum NAND option
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 06 Mar 2013 11:19:59 +0200
In-Reply-To: <513706B3.5090909@antcom.de>
References: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
 <1362489444-27762-4-git-send-email-dedekind1@gmail.com>
 <1362559787.21850.19.camel@sauron> <513706B3.5090909@antcom.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-06 at 10:04 +0100, Roland Stigge wrote:
> >>  CONFIG_MTD_BLOCK=y
> >>  CONFIG_MTD_M25P80=y
> >>  CONFIG_MTD_NAND=y
> >> -CONFIG_MTD_NAND_MUSEUM_IDS=y
> >>  CONFIG_MTD_NAND_SLC_LPC32XX=y
> >>  CONFIG_MTD_NAND_MLC_LPC32XX=y
> >>  CONFIG_BLK_DEV_LOOP=y
> > 
> > Let me add Roland as this config file was added by him. Roland, FYI.
> > 
> 
> Acked-by: Roland Stigge <stigge@antcom.de>
> 
> I'll take this via a lpc32xx branch, for arm-soc, to prevent collisions
> with other defconfig commits there.

OK, then I am dropping it from l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
