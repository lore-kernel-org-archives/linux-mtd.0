Received: from py-out-1112.google.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IPFkz-0005vF-Jm
	for linux-mtd@lists.infradead.org; Sun, 26 Aug 2007 06:54:16 -0400
Received: by py-out-1112.google.com with SMTP id a25so296536pyi
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Aug 2007 03:54:11 -0700 (PDT)
Message-ID: <8bd0f97a0708260354xb4c8546od0cc19a590820f32@mail.gmail.com>
Date: Sun, 26 Aug 2007 06:54:10 -0400
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH] Prefix each line of multiline printk(KERN_<level>
	"foo\nbar") with KERN_<level>
In-Reply-To: <Pine.LNX.4.64.0708261028120.31149@anakin>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1187999098.32738.179.camel@localhost>
	<Pine.LNX.4.64.0708261028120.31149@anakin>
Cc: linux-ide@vger.kernel.org, discuss@x86-64.org, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, uclinux-dist-devel@blackfin.uclinux.org,
	cluster-devel@redhat.com, blinux-list@redhat.com,
	tpmdd-devel@lists.sourceforge.net, linux-mips@linux-mips.org,
	jffs-dev@axis.com, mpt_linux_developer@lsi.com,
	Joe Perches <joe@perches.com>, linux-mtd@lists.infradead.org,
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

On 8/26/07, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 24 Aug 2007, Joe Perches wrote:
> > Corrected printk calls with multiple output lines which
> > did not correctly preface each line with KERN_<level>
> >
> > Fixed uses of some single lines with too many KERN_<level>
>
> > --- a/arch/arm/kernel/ecard.c
> > +++ b/arch/arm/kernel/ecard.c
> > @@ -547,7 +547,8 @@ static void ecard_check_lockup(struct irq_desc *desc)
> >       if (last == jiffies) {
> >               lockup += 1;
> >               if (lockup > 1000000) {
> > -                     printk(KERN_ERR "\nInterrupt lockup detected - "
> > +                     printk(KERN_ERR "\n"
> > +                            KERN_ERR "Interrupt lockup detected - "
> >                              "disabling all expansion card interrupts\n");
> >
> >                       desc->chip->mask(IRQ_EXPANSIONCARD);
>
> What's the purpose of having lines printed with e.g. `KERN_ERR "\n"' only?
> Shouldn't these just be removed?
>
> Usually lines starting with `\n' are continuations, but given some other
> module may call printk() in between, there's no guarantee continuations
> appear on the same line.

erm, i thought the prink lock was grabbed per-buffer, not per-line ...
so yes, if the function calls were like printk(KERN_ERR "\n");
printk(KERN_ERR "..."); things could be broken up, but this is on
function call, so it shouldnt ...
-mike
