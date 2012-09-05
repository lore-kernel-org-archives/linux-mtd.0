Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9LCf-0003PV-Fs
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 19:23:59 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
Date: Wed, 5 Sep 2012 21:23:54 +0200
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
 <201209052055.19123.marex@denx.de>
 <CAOMZO5DD+6keJ6jkQL-AHzhdobG84=3H_r2HPOFR7apFgKYtYA@mail.gmail.com>
In-Reply-To: <CAOMZO5DD+6keJ6jkQL-AHzhdobG84=3H_r2HPOFR7apFgKYtYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201209052123.54695.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, b32955@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> Hi Marek,
> 
> On Wed, Sep 5, 2012 at 3:55 PM, Marek Vasut <marex@denx.de> wrote:
> > Dear Fabio Estevam,
> > 
> >> From: Fabio Estevam <fabio.estevam@freescale.com>
> >> 
> >> Using module_platform_driver() makes the code smaller and cleaner.
> > 
> > You did not document the dev_info() etc. addition, dunno if it's
> > important or not.
> 
> It is not an addition. I just moved  "pr_info("driver registered.\n")"
>  from gpmi_nand_init, (which is removed by this patch) to the probe
> function.

Ah, just noticed. I'd say drop it completely then, there's now value in this 
print (or make it pr_debug() ). Besides, the init call was called only once if 
compiled in / every time if built as a module. The probe call is done per GPMI 
nand driver instance.

> Regards,
> 
> Fabio Estevam

Best regards,
Marek Vasut
