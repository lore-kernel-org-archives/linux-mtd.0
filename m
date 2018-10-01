Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g74u4-0005y8-DV
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 20:34:54 +0000
Date: Mon, 1 Oct 2018 22:34:38 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Daniel Mack <daniel@zonque.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20181001223438.08a9d8c0@bbrezillon>
In-Reply-To: <59f9c342cf8140979329aa269aa0c2eb@svr-chch-ex1.atlnz.lc>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13>
 <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
 <20180928102454.325644f3@xps13>
 <692a1133-59d1-ae45-fa06-2a684e94c350@zonque.org>
 <3d7b337f701c45caa35aef94f8d93731@svr-chch-ex1.atlnz.lc>
 <227028c0-e1e0-46b3-3c7d-2b242b31bb3f@zonque.org>
 <59f9c342cf8140979329aa269aa0c2eb@svr-chch-ex1.atlnz.lc>
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

On Mon, 1 Oct 2018 19:59:11 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 01/10/18 18:31, Daniel Mack wrote:
> > On 30/9/2018 11:10 PM, Chris Packham wrote:  
> >>>> With this in mind, I don't see why this
> >>>>
> >>>> +	st = readl_relaxed(nfc->regs + NDSR);
> >>>> +	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
> >>>> +		complete(&nfc->complete);  
> >>> Yeah, me neither. Chris, are you absolutely sure this is the reason? I'm
> >>> asking because it took me several tries sometimes to trigger the bug, so
> >>> is there a chance that you see an error at all times, regardless of
> >>> whether my patch is applied?  
> >> It seems pretty consistent. Without this patch there seems to be no
> >> problem. With this patch it triggers pretty much straight away. I can't
> >> discount that there might be something wrong with my dts (the R/B
> >> configuration was missing initially).
> >>
> >> I've also been able to run this on the DB-88F6820-AMC board with the
> >> same result (the dts for this is in the for-next branch of
> >> git://git.infradead.org/linux-mvebu.git).
> >>
> >> The really odd thing is the following seems to avoid the problem
> >>
> >> +        st = readl_relaxed(nfc->regs + NDSR);
> >> +        udelay(1000);
> >> +        if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
> >> +                complete(&nfc->complete);
> >>
> >> Which is weird because the st value has already been read so the udelay
> >> should have no effect.  
> > 
> > Erm, yes. That's totally weird. Which gcc are you using for this?  
> 
> arm-softfloat-linux-gnueabi-gcc (crosstool-NG crosstool-ng-1.22.0) 4.9.3
> 
> > Could you please try and use readl() here instead of readl_relaxed()?
> > That will place a memory barrier after the read to enforce ordering.  
> 
> I'd previously tried readl() based on the same hunch. No change.
> 
> I think my snippet above might be misleading. While a delay between 
> readl_relaxed() and the if should not change the outcome, this is also a 
> delay between marvell_nfc_enable_int() and marvell_nfc_disable_int() 
> which is probably more significant. Sure enough if I move the delay to 
> just before the marvell_nfc_disable_int() the error is not seen.

AFAICT, your timeout always happens when waiting for RDREQ, not RDYM.
So maybe disabling MRDY too early has a side-effect on the RDREQ event.
