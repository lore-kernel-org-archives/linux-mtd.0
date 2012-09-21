Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TF2jt-0004SY-JM
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2012 12:53:53 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi-nand: Convert to platform driver
Date: Fri, 21 Sep 2012 14:53:42 +0200
References: <1346855725-31726-1-git-send-email-festevam@gmail.com>
 <CAOMZO5DC8xuQ_0949ivyRDubWMv3=buEO+tm2yzdBApB7uT=Xg@mail.gmail.com>
In-Reply-To: <CAOMZO5DC8xuQ_0949ivyRDubWMv3=buEO+tm2yzdBApB7uT=Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201209211453.42528.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Shawn Guo <shawn.guo@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> Hi Artem.
> 
> On Wed, Sep 5, 2012 at 11:35 AM, Fabio Estevam <festevam@gmail.com> wrote:
> > From: Fabio Estevam <fabio.estevam@freescale.com>
> > 
> > Using module_platform_driver() makes the code smaller and cleaner.
> > 
> > Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> > ---
> > This patch depends on: "mtd: gpmi-nand: Improve logging style"
> 
> Any comments, please?

WFM

Reviewed-by: Marek Vasut <marex@denx.de>

> Regards,
> 
> Fabio Estevam

Best regards,
Marek Vasut
