Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHHRG-0006A5-Pm
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 20:45:43 +0000
Received: by mail-pa0-x233.google.com with SMTP id uo6so249012634pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 12:45:22 -0800 (PST)
Date: Thu, 7 Jan 2016 12:45:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: add FSL_SOC dependency to drivers using FSL_LBC
Message-ID: <20160107204520.GK109450@google.com>
References: <1452194501-115280-1-git-send-email-computersforpeace@gmail.com>
 <1452196053.19133.23.camel@freescale.com>
 <20160107203418.GJ109450@google.com>
 <1452199237.19133.26.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1452199237.19133.26.camel@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Scott,

On Thu, Jan 07, 2016 at 02:40:37PM -0600, Scott Wood wrote:
> On Thu, 2016-01-07 at 12:34 -0800, Brian Norris wrote:
> > On Thu, Jan 07, 2016 at 01:47:33PM -0600, Scott Wood wrote:
> > > On Thu, 2016-01-07 at 11:21 -0800, Brian Norris wrote:
> > > > I've managed to construct .config files (for ppc64) that come across
> > > > this Kconfig warning:
> > > > 
> > > >   warning: (MPC836x_RDK && MTD_NAND_FSL_ELBC && MTD_NAND_FSL_UPM)
> > > > selects
> > > > FSL_LBC which has unmet direct dependencies (FSL_SOC)
> > > > 
> > > > Let's add the FSL_SOC dependency to the NAND drivers. AFAICT, they are
> > > > only supported on PPC32 FSL SoCs anyway.
> > > 
> > > There are other problems, if you can enable an 83xx board on ppc64. 
> > >  PPC_83xx
> > > does select FSL_SOC so I don't know why it's unmet.
> > 
> > I don't have an 83xx board enabled. I just have MTD_NAND_FSL_ELBC
> > enabled; it only depends on PPC right now. Attaching the current test
> > .config, for clarity.
> 
> Where did MPC836x_RDK come from above?

I believe that Kconfig warning is misleading. Seems like it should be
saying '||' instead of '&&'. I did not have MPC836x_RDK or
MTD_NAND_FSL_UPM in my .config; only MTD_NAND_FSL_ELBC=y. (Check the
attachment from my previous mail to be sure.)

Regards,
Brian
