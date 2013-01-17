Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TvnBH-0005cb-HN
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 10:58:48 +0000
Date: Thu, 17 Jan 2013 18:59:20 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
Message-ID: <20130117105918.GN26179@S2101-09.ap.freescale.net>
References: <1358265384-23138-1-git-send-email-schneider@at.festo.com>
 <1358420143.2731.223.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1358420143.2731.223.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org, Roman Schneider <schneider@at.festo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 17, 2013 at 12:55:43PM +0200, Artem Bityutskiy wrote:
> On Tue, 2013-01-15 at 16:56 +0100, Roman Schneider wrote:
> > ---
> >  Also compress the id in case of a v3 NAND flash controller (i.mx51, i.mx53)
> >  and 16Bit buswidth.
> 
> Unfortunately I cannot compile-test it with the configuration I have.
> This is not your fault, just a breakage in upstream. I'll wait when this

It's my fault.  Please see if patch [1] fixes the problem with your
configuration.

Shawn

[1] http://article.gmane.org/gmane.linux.ports.arm.kernel/209206

> is fixed upstream, and then take a look at your patch. The breakage is:
> 
> arch/arm/mach-imx/built-in.o: In function `imx6q_restart':
> platform-spi_imx.c:(.text+0x2220): undefined reference to `imx_src_prepare_restart'
> arch/arm/mach-imx/built-in.o: In function `imx6q_pm_enter':
> platform-spi_imx.c:(.text+0x22e4): undefined reference to `imx_set_cpu_jump'
> arch/arm/mach-imx/built-in.o: In function `imx6q_init_irq':
> platform-spi_imx.c:(.init.text+0x7280): undefined reference to `imx_src_init'
> make[1]: *** [vmlinux] Error 1
> 
> -- 
> Best Regards,
> Artem Bityutskiy
