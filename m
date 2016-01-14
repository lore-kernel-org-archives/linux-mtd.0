Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJfLP-0008Ak-3d
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2016 10:41:32 +0000
Date: Thu, 14 Jan 2016 11:41:05 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Josh Wu
 <rainyfeeling@outlook.com>, Nicolas Ferre <nicolas.ferre@atmel.com>, Yang
 Wenyou <Wenyou.Yang@atmel.com>
Subject: Re: [PATCH v1 2/5] mtd: atmel_nand: Support variable RB_EDGE
 interrupts
Message-ID: <20160114114105.7f75ba1e@bbrezillon>
In-Reply-To: <CAGkQfmMQTBVzOoE3BTyvg73NKjtGD_0veV_zb_jLutk-6bcqGw@mail.gmail.com>
References: <1452702857-2240-1-git-send-email-romain.izard.pro@gmail.com>
 <1452702857-2240-3-git-send-email-romain.izard.pro@gmail.com>
 <20160113191409.5cd0dc82@bbrezillon>
 <CAGkQfmMQTBVzOoE3BTyvg73NKjtGD_0veV_zb_jLutk-6bcqGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 14 Jan 2016 11:16:19 +0100
Romain Izard <romain.izard.pro@gmail.com> wrote:

> Hi Boris,
> 
> 2016-01-13 19:14 GMT+01:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> >> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> >> index 9d71f9e6a8de..e5d7e7e63f49 100644
> >> --- a/drivers/mtd/nand/atmel_nand.c
> >> +++ b/drivers/mtd/nand/atmel_nand.c
> >> @@ -67,6 +67,10 @@ struct atmel_nand_caps {
> >>       bool pmecc_correct_erase_page;
> >>  };
> >>
> >> +struct atmel_nand_nfc_priv {
> >
> > Can you rename this struct into atmel_nfc_caps to be consistant with the
> > atmel_nand_caps?
> >
> >> +     uint32_t rb_edge;
> >
> > Actually, AFAIU, it's not encoding the type of edges, but the available
> > native R/B lines (by native I mean the R/B lines directly connected to
> > the NFC IP).
> > I suggest renaming this field avail_rb_lines, and making it a bitfield
> > (one bit per possible R/B line).
> >
> 
> It's already a bitfield in the end: it's the mask for the interrupt status
> register. It might have been better if it were called rb_edge_mask.

Actually the naming chosen by atmel is a bit misleading, cause the
R/B edge selection is done through the RB_RISE/FALL fields,
and what they call RB_EDGEX is just the R/B line selection, hence the
suggestion to name this field avail_rb_lines.

> 
> >> +};
> >> +
> >>  /* oob layout for large page size
> >>   * bad block info is on bytes 0 and 1
> >>   * the bytes have to be consecutives to avoid
> >> @@ -111,6 +115,7 @@ struct atmel_nfc {
> >>       /* Point to the sram bank which include readed data via NFC */
> >>       void                    *data_in_sram;
> >>       bool                    will_write_sram;
> >> +     uint32_t                rb_edge;
> >
> > Replace this by
> >         const struct atmel_nfc_caps *caps;
> >
> > so that next time you have a per-SoC particularity, you can just add it
> > to your struct atmel_nfc_caps without adding new fields to atmel_nfc.
> >
> 
> I'm reluctant about this, but I will do it. For me, we are exchanging
> a single probe-time copy to indirections in each interrupt handler for some
> unspecified future user. Let's hope the tradeoff is worth it.

You raised a good point, maybe it's worth keeping this rb_edge field
directly in the atmel_nfc struct. If you decide to do so, could you add
a comment explaining why you're doing it?

> 
> >>  };
> >>  static struct atmel_nfc      nand_nfc;
> >>
> >> @@ -1675,9 +1680,9 @@ static irqreturn_t hsmc_interrupt(int irq, void *dev_id)
> >>               nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_XFR_DONE);
> >>               ret = IRQ_HANDLED;
> >>       }
> >> -     if (pending & NFC_SR_RB_EDGE) {
> >> +     if (pending & host->nfc->rb_edge) {

In the other hand, I see that we're already having a lot of
indirections here, not sure adding one more will drastically impact the
system.
And if you really care about interrupt latencies in the system, you
should probably register this handler as a threaded irq.

> >>               complete(&host->nfc->comp_ready);
> >> -             nfc_writel(host->nfc->hsmc_regs, IDR, NFC_SR_RB_EDGE);
> >> +             nfc_writel(host->nfc->hsmc_regs, IDR, host->nfc->rb_edge);
> >
> > How about creating a macro that would generate the appropriate bitmask
> > for you?
> >
> > Something like
> >
> > #define NFC_SR_RB_EDGE_MASK(x)  ((x) << 24)
> >
> 
> It's already so verbose, it will make everything longer. Once the member name
> contains the 'mask' part, all the information will be there.

Makes sense, especially if you keep the pre-calculated nfc->rb_edge_mask
field.

> 
> 
> >> diff --git a/drivers/mtd/nand/atmel_nand_nfc.h b/drivers/mtd/nand/atmel_nand_nfc.h
> >> index 4d5d26221a7e..2cd9c57b1e53 100644
> >> --- a/drivers/mtd/nand/atmel_nand_nfc.h
> >> +++ b/drivers/mtd/nand/atmel_nand_nfc.h
> >> @@ -42,7 +42,10 @@
> >>  #define              NFC_SR_UNDEF            (1 << 21)
> >>  #define              NFC_SR_AWB              (1 << 22)
> >>  #define              NFC_SR_ASE              (1 << 23)
> >> -#define              NFC_SR_RB_EDGE          (1 << 24)
> >> +#define              NFC_SR_RB_EDGE0         (1 << 24)
> >> +#define              NFC_SR_RB_EDGE1         (1 << 25)
> >> +#define              NFC_SR_RB_EDGE2         (1 << 26)
> >> +#define              NFC_SR_RB_EDGE3         (1 << 27)
> >
> > Please replace those 4 definitions by:
> >
> > #define                 NFC_SR_RB_EDGE(x)       BIT(x + 24)
> >
> 
> The whole file could be rewritten in this form, but I see this as a
> zero-value proposition. I believe it is best to keep with local
> consistency. In fact, I will rather remove RB_EDGE1 & RB_EDGE2, as
> those are not mentioned in the datasheets.

Hm, I keep thinking using the NFC_SR_RB_EDGE(x) is more future proof,
but I'll let Atmel maintainers decide whether it's relevant or not to
do so.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
