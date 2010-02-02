Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]
	helo=master.linux-sh.org)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NcA06-00005E-3i
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 04:04:35 +0000
Date: Tue, 2 Feb 2010 13:04:20 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>
Subject: Re: [PATCH] mtd: trivial sh_flctl changes
Message-ID: <20100202040420.GF13428@linux-sh.org>
References: <20100127091721.21320.90312.sendpatchset@rxone.opensource.se>
	<4B66B44C.3060305@renesas.com>
	<20100127091120.21312.77488.sendpatchset@rxone.opensource.se>
	<4B66B41C.4020904@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4B66B44C.3060305@renesas.com> <4B66B41C.4020904@renesas.com>
Cc: linux-mtd@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>,
	dwmw2@infradead.org, linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 01, 2010 at 07:59:40PM +0900, Yoshihiro Shimoda wrote:
> Magnus Damm wrote:
> > This patch contains a few changes for the sh_flctl driver:
> >  - not sh7723-only driver - get rid of kconfig dependency
> >  - use dev_err() instead of printk()
> >  - use __devinit and __devexit for probe()/remove()
> >  - fix probe() return values
> 
> Thank you for your patch.
> 
> Acked-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>

On Mon, Feb 01, 2010 at 08:00:28PM +0900, Yoshihiro Shimoda wrote:
> Magnus Damm wrote:
> > This patch extends the sh_flctl driver with support
> > for 16-bit bus configuration using SEL_16BIT and
> > support for multiplexed pins using SHBUSSEL.
> 
> Thank you very much for your patch again!
> 
> Acked-by: Yoshihiro Shimoda <shimoda.yoshihiro@renesas.com>

I've applied both of these, thanks.
