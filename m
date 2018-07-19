Date: Thu, 19 Jul 2018 10:39:53 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-kernel@vger.kernel.org>, Marek Vasut
 <marek.vasut@gmail.com>, Jian Hu <jian.hu@amlogic.com>, Liang Yang
 <liang.yang@amlogic.com>, <linux-mtd@lists.infradead.org>, Kevin Hilman
 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 <linux-amlogic@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet
 <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: meson: add support for Amlogic NAND
 flash controller
Message-ID: <20180719103953.26164eb6@bbrezillon>
In-Reply-To: <45c1a96c-0d14-dece-37cf-ac428bb98621@amlogic.com>
References: <20180613161314.14894-1-yixun.lan@amlogic.com>
 <20180613161314.14894-3-yixun.lan@amlogic.com>
 <20180624213844.2207ca6f@bbrezillon>
 <76d428ff-376a-dce3-cb51-d238564b7c3e@amlogic.com>
 <20180718210849.493f0087@bbrezillon>
 <45c1a96c-0d14-dece-37cf-ac428bb98621@amlogic.com>
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

Hi Yixun,

On Thu, 19 Jul 2018 16:13:47 +0800
Yixun Lan <yixun.lan@amlogic.com> wrote:

> >>> You're doing DMA on those buffers, and devm_kzalloc() is not
> >>> DMA-friendly (returned buffers are not aligned on a cache line). Also,
> >>> you don't have to allocate your own buffers because the core already
> >>> allocate them (chip->data_buf, chip->oob_poi). All you need to do is
> >>> set the NAND_USE_BOUNCE_BUFFER flag in chip->options to make sure
> >>> you're always passed a DMA-able buffer.
> >>>     
> >>
> >> thanks for the suggestion, we've migrated to use the
> >> dmam_alloc_coherent() API  
> > 
> > kzalloc() should be just fine, no need to alloc a DMA coherent region. 
> >   
> 
> we're a little bit confused here, isn't devm_kzalloc (previously we are
> using) a variant of kzalloc? and since the NAND controller is doing DMA
> here, using DMA coherent API is more proper way?

Well, making buffers DMA coherent might be expensive, especially if you
access them a lot (unless you have a coherency unit and the cache is
kept enabled).

Regarding the "why is devm_kzalloc() is not DMA-safe?" question, I'd
recommend that you read this discussion [1].

> >>>> +	mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
> >>>> +				   "%s:nand", dev_name(dev));
> >>>> +	if (!mtd->name) {
> >>>> +		dev_err(nfc->dev, "Failed to allocate mtd->name\n");
> >>>> +		return -ENOMEM;
> >>>> +	}    
> >>>
> >>> You set the name after nand_scan_ident() and make it conditional (only
> >>> if ->name == NULL) so that the label property defined in the DT takes
> >>> precedence over the default name.    
> >>  
> for setting mtd->name conditional, do you mean doing something like this?
> 
> if (!mtd->name)
> 	mtd->name = devm_kasprintf(..)

Yes, that's what I meant.

> 
> but we found mtd->name = "ffe07800.nfc" after function
> nand_scan_ident(), which is same value as dev_name(dev)..
> and there is no cs information encoded there.

Hm, that shouldn't be the case. Maybe you can add traces to find out
who is setting mtd->name to this value.

> 
> >>  
> >>> Also, I recommend suffixing this name
> >>> with the CS id, just in case you ever need to support connecting several
> >>> chips to the same controller. 
> >>>     
> >>
> >> we actually didn't get the point here, cs is about chip selection with
> >> multiple nand chip? and how to get this information?  
> > 
> > Well, you currently seem to only support one chip per controller, but I
> > guess the IP can handle several CS lines. So my recommendation is about
> > choosing a name so that you can later easily add support for multiple
> > chips without breaking setups where mtdparts is used.
> > 
> > To sum-up, assuming your NAND chip is always connected to CS0 (on the
> > controller side), I'd suggest doing:
> >   
> yes, this is exactly how the hardware connected.
> > 	mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
> > 				   "%s:nand.%d", dev_name(dev), cs_id);
> > 
> > where cs_id is the value you extracted from the reg property of the
> > NAND node.
> >   
> Ok, you right.
> current, the NAND chip is only use one CS (which CE0) for now, what's in
> the DT is
> 
> nand@0 {
>  reg = < 0 >;
>  ..
> };
> 
> so for the multiple chips it would something like this in DT?
> 
> nand@0 {
>   reg = < 0 >;
> };
> 
> nand@1 {
>   reg = < 1 >;
> };

Yep, that's for 2 single-die chips.

> 
> or even
> nand@0 {
>   reg = < 0 2 >;
> };
> 
> nand@1 {

nand@3 {

>   reg = < 3 4 >;
> };

And this is describing 2 dual-die chips.

> 
> do we need to encode all the cs information here? not sure if we
> understand this correctly, but could send out the patch for review..

Yes, reg should contain an array of controller-side CS lines used to
select the chip (or a specific die in a chip, the index in the reg
table being the id of the die).

Regards,

Boris

[1]http://linux-arm-kernel.infradead.narkive.com/vyJqy0RQ/question-devm-kmalloc-for-dma
