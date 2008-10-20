Received: from smtp119.sbc.mail.sp1.yahoo.com ([69.147.64.92])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Krq0d-0003i7-Ct
	for linux-mtd@lists.infradead.org; Mon, 20 Oct 2008 08:21:03 +0000
From: David Brownell <david-b@pacbell.net>
To: "Chen Gong-B11801" <G.Chen@freescale.com>
Subject: Re: goofy mtd m25p80 patches in GIT ...
Date: Mon, 20 Oct 2008 01:21:00 -0700
References: <200810191535.05617.david-b@pacbell.net>
	<C3C4D3116BA1F84989E53FCF1F505187166DAE@zch01exm21.fsl.freescale.net>
In-Reply-To: <C3C4D3116BA1F84989E53FCF1F505187166DAE@zch01exm21.fsl.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810200121.00744.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 20 October 2008, Chen Gong-B11801 wrote:
> 
> > 
> > Second:
> > 
> >  
> > http://git.kernel.org/?p=linux/kernel/git/dwmw2/mtd-2.6.git;a=
> > commitdiff;h=75d0ee2202b5740e94e913d8a52f91c6557c4c81
> > 
> > That's just plain wrong ... the original code is correct, but the
> > patch changed it to be incorrect.  (DMA from the stack is never
> > legal.)
> > 
> > Just revert this one entirely.
>  
> I know spi_write_then_read is different from spi_write, but here n_rx & rxbuf are
> both NULL, which means no real read operation are executed. Would you please
> give me more explanation for potential hazard ?

Documentation/DMA-mapping.txt, in the "What memory is DMA'able?"
section (the first one after overview) lists several hazards.
I won't elaborate on that text, but it also states explicitly
that DMA from stacks is not allowed (para 4, sentence one).

Note that the spi_write_then_read() is documented as always
copying its (small) data buffers, while spi_write() just
passes it down to the spi_master driver ... which requires
DMA-safe memory, as described in "What memory is DMA'able?".

Have a look at the implementation of spi_write_then_read(),
in drivers/spi/spi.c ... one of the main reasons for that
routine is to make some of the common cases easier to work
with, by masking those DMA issues.

- Dave
