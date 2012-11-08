Received: from mtxmxout6.matrox.com ([138.11.2.96])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWTrQ-0003H7-UJ
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 15:17:45 +0000
Date: Thu, 8 Nov 2012 10:21:25 -0500
From: Christopher Harvey <charvey@matrox.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108152125.GR2389@harvey-pc.matrox.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509B9143.4020506@keymile.com>
Cc: stefan.bigler@keymile.com, Ivan Djelic <ivan.djelic@parrot.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 12:02:27PM +0100, Gerlando Falauto wrote:
> Hi Chris,
> 
> good to hear we're not alone in this thinking... :-)
> We're now facing the exact same issue as some Micron NAND chips (most 
> likely the same one you're dealing with) can no longer live with the 
> default, simple 1-bit ECC implementation used by default 
> (NAND_ECC_SOFT), I guess because chances of having multiple bitflips 
> within the same page are no longer negligible. So some 4-bit ECC 
> mechanism must be used at the very least.

We had BCH8 code running, but it wasn't enough. The main reason we
switched away from host side ECC was because we were getting bitflips
within the ECC codeword data itself. Yes, it would have been possible
to add a 1 byte hamming code to protect the main ECC data, but it was
just easier to say, "hey, Micron knows their hardware, so we'll trust
their algorithms", and enable the Micron ECC hardware. Although it
didn't require too much work to enable it's all a total hack. I took
the code that runs the "ECC disabled mode", and sprinkled in some
extra init code and error checking code. Would be nice to add an
"external ecc mode" to support these chips explicitly.

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

I haven't looked into current software ECC algorithms in the
kernel. Do the protect against corrupted ECC data? As in, corruptions
in the out of bounds area?

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

I got that working, if you're running in "eec disabled mode", try something like this:

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a796dd7..68af8b0 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1069,7 +1069,16 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
                              uint8_t *buf, int page)
 {
        chip->read_buf(mtd, buf, mtd->writesize);
-       chip->read_buf(mtd, chip->oob_poi, mtd->oobsize);
+       chip->read_buf(mtd, chip->oob_poi, mtd->oobsize); /* (this data used in sw ecc) */
+
+       /* TODO: only do this CMD_STATUS if we have Micron NAND */
+       chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);
+       if (chip->read_byte(mtd) & NAND_STATUS_REWRITE_RECOMMENDED) {
+               /* Micron NAND is telling us that this block may be going bad,
+                  tell Linux to move it */
+               mtd->ecc_stats.corrected++; /* (we don't actually know if it's just one correction, could be up to 4) */
+       }
+
        return 0;
 }


Ran a trace on some manually inserted bitflips, and the block was moved.

Hope that helps.

> I'd love to hear some feedback, if anyone has had experience with this.
> I know it's not been a long time since your post, but perhaps you've 
> heard something in the meantime?
> 
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
> 
> Thank you so much!
> Gerlando
> 
> On 10/29/2012 09:42 PM, Christopher Harvey wrote:
> > I know of at least one Micron NAND chip that has the ability to handle
> > ECC completely on the NAND chip itself. All the host has to do is send
> > data and the OOB section is updated automatically. The automatic ECC
> > hardware can be enabled and disabled with the "Set Feature" command,
> > (0xEF) and bit flips are reported via get status after page reads. I
> > don't see support for this in 2.6.37, and a quick check in the logs
> > doesn't show anything new for these chips in the latest version of the
> > kernel. Any idea floating around on this list? Are these chips going
> > to be the future for NAND and does Linux care about them?
> >
> > thanks,
> > Chris
> >
