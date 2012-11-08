Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWWSc-00033r-7F
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 18:04:17 +0000
Date: Thu, 8 Nov 2012 19:04:08 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108180408.GB28118@parrot.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <509B9143.4020506@keymile.com>
Cc: "stefan.bigler@keymile.com" <stefan.bigler@keymile.com>,
 Christopher Harvey <charvey@matrox.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 11:02:27AM +0000, Gerlando Falauto wrote:
(...)
> 
> Support for software-based multiple-bit-resilient ECC mechanism (BCH) 
> was posted (http://lwn.net/Articles/426856/) by Ivan Djelic (which I 
> took liberty to Cc:) and merged in March last year.
> I haven't been able to track how the situation evolved, but apparently 
> you need to enable it (in addition to within the kernel configuration), 
> also within your flash controller setup.
> Micron gives an example of how to enable it on a sample NAND host 
> controller S3C6410 in this TN (rest of the code, mainly from the above 
> patch, would be already present in recent kernels):
> http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2971_software_bch_ecc_on_linux.pdf 

Hi Gerlando,
The Micron TN2971 is a good step-by-step explanation; it just lacks a mention
of the BCH_CONST_PARAMS option that provides much better results (2x) than what
their benchmarks are showing.

> As for hardware-based (or on-die) ECC support, one of the application 
> notes from Micron (TN-29-56 Enabling On-Die ECC for OMAP3 on 
> Linux/Android OS, 
> http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2956_ondie_ecc_omap3_linux.pdf) 
> shows how to enable that (rather, it shows how to disable software ECC 
> altogether after enabling it on the chip). However, I haven't been able 
> to find a code section where the information returned by the chip 
> ("Rewrite recommended") is actually used to solicit scrubbing... Neither 
> on the TN, nor on the upstream linux kernel... My next step would be to 
> give it a go and see what happens.
> 
> I'd love to hear some feedback, if anyone has had experience with this.
> I know it's not been a long time since your post, but perhaps you've 
> heard something in the meantime?

We have been using several Micron parts with on-die ECC support. We basically had to:
1. Disable SW ECC
2. Enable on-die ECC (SET FEATURE command)
3. Make sure the OOB layout does not conflict with the on-die ECC storage
4. Check Micron dedicated status bit (bit 0 in READ STATUS byte) to report ECC correction (and trigger scrubbing)

A tricky part is the initial ROM boot: since the on-die ECC is initially disabled, a SoC ROM
generally cannot take advantage of it (unless it is aware of SET FEATURES extensions).

Some manufacturers also provide "almost transparent NANDs", in which an internal on-die ECC is enabled at startup,
stores its ECC codes in (not accessible) spare area. The device basically behaves like a memory without bitflips,
except that a status bit may indicate necessary scrubbing.

Some work would indeed be required in MTD to support those parts with various on-die ECC strategies...

> I have one additional question though. Looking at the code I got the 
> impression that decisions upon ECC seem to be based on the flash 
> controller rather than on the flash chip itself.
> I mean, I would think of having a default 1-bit NAND_ECC_SOFT 
> implementation; only when it is detected that the flash part either 
> supports HW ECC or requires multiple-bit ECC, should the ECC mode get 
> switched to NAND_ECC_NONE or NAND_ECC_SOFT_BCH respectively.
> No matter what the flash controller, I would say.
> 
> Ivan, do you think that makes any sense?

Historically, not all NAND controllers had a HW Hamming engine; but
(almost) all NAND devices required 1-bit correction. So the decision was indeed dependent on controller capabilities.

Today, _some_ devices are able to reliably report their ECC requirements (e.g. through ONFI parameters).
For those devices, your idea could apply. But even so, you would need to map those requirements
on the hardware controller capabilities. For instance, some controllers can only do 8-bit error
correction on 1024-byte sectors. A NAND with an ECC requirement of 4-bit/512-byte would still be
supported, if the driver implemented the necessary heuristic.

Since a NAND flash is not a removable device, it does not necessarily require the kind of flexibility
you are describing for ECC mode selection. Most people are happy with some platform data informing the driver of
the required ECC mode for a given board.

BR,
-- 
Ivan
