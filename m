Received: from ananke.telenet-ops.be ([195.130.137.78])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IPDWD-0001uJ-46
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 04:30:57 -0400
Date: Sun, 26 Aug 2007 10:30:41 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Sender: geert@linux-m68k.org
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] Prefix each line of multiline printk(KERN_<level>
	"foo\nbar") with KERN_<level>
In-Reply-To: <1187999098.32738.179.camel@localhost>
Message-ID: <Pine.LNX.4.64.0708261028120.31149@anakin>
References: <1187999098.32738.179.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: discuss@x86-64.org, linux-scsi@vger.kernel.org, linux-ide@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	uclinux-dist-devel@blackfin.uclinux.org,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	tpmdd-devel@lists.sourceforge.net, linux-mips@linux-mips.org,
	jffs-dev@axis.com, mpt_linux_developer@lsi.com,
	blinux-list@redhat.com, linux-mtd@lists.infradead.org,
	osst-users@lists.sourceforge.net, linux-mm@kvack.org,
	parisc-linux@parisc-linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 24 Aug 2007, Joe Perches wrote:
> Corrected printk calls with multiple output lines which
> did not correctly preface each line with KERN_<level>
> 
> Fixed uses of some single lines with too many KERN_<level>

> --- a/arch/arm/kernel/ecard.c
> +++ b/arch/arm/kernel/ecard.c
> @@ -547,7 +547,8 @@ static void ecard_check_lockup(struct irq_desc *desc)
>  	if (last == jiffies) {
>  		lockup += 1;
>  		if (lockup > 1000000) {
> -			printk(KERN_ERR "\nInterrupt lockup detected - "
> +			printk(KERN_ERR "\n"
> +			       KERN_ERR "Interrupt lockup detected - "
>  			       "disabling all expansion card interrupts\n");
>  
>  			desc->chip->mask(IRQ_EXPANSIONCARD);

What's the purpose of having lines printed with e.g. `KERN_ERR "\n"' only?
Shouldn't these just be removed?

Usually lines starting with `\n' are continuations, but given some other
module may call printk() in between, there's no guarantee continuations
appear on the same line.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
