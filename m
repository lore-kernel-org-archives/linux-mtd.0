From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/9] add EDO feature for gpmi-nand driver
Date: Thu, 4 Oct 2012 22:56:06 +0200
References: <1347519480-31106-1-git-send-email-b32955@freescale.com>
 <201210042224.30095.marex@denx.de>
In-Reply-To: <201210042224.30095.marex@denx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201210042256.06286.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dedekind1@gmail.com,
 vikram186@gmail.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> > The ONFI nand supports the EDO (extended data out) feature in
> > asynchronous mode when the host controller(such as gpmi-nand)
> > uses a tRC of less then 30ns.
> > 
> > The gpmi can supports this EDO feature.
> > This patch set adds the EDO support the gpmi-nand driver.
> > 
> > patch 1 ~ patch 2:
> > 	 These two patches provide the infrastructure for the EDO feature.
> > 	 
> >          They add necessary MTD helpers for the ONFI nand set/get
> >          features,
> > 	 
> > 	 and the help to get the supportted timing mode.
> > 	 These two patches are new version. The init version has been
> > 	 reviewed by Vikram & Florian.
> > 
> > patch 3 ~ patch 7:
> >          These patches are clean-ups for the gpmi-nand's timing code.
> > 	 
> > 	 Also they make the some preparations for the EDO patch.
> > 
> > patch 8: add the EDO feature to the gpmi-nand.
> > 
> > 
> > patch 9: a small optimization for the timing.
> > 
> >          only set the timing registers one time.
> > 
> > I tested this patch set on the IMX6Q-arm2 board with several Micron's
> > ONFI nand chips. Some chips only can supports to mode 4, some chips
> > can supports to mode 5.
> > 
> > The performance is much improved. Take Micron MT29F32G08MAA for example
> 
> > (in mode 5, 100MHz):
> [...]
> 
> Was this ever tested on something else than mx6q? I suspect these broke
> gpmi nand on mx28. Can you please verify?

Hm, this series isnt the problematic one ... poking further ... I recall next 
20120921 worked fine.

Best regards,
Marek Vasut
