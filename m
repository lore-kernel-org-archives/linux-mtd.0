Date: Fri, 31 Jul 2015 16:47:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: dwmw2@infradead.org, sebastian@breakpoint.cc, robh+dt@kernel.org,
 pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 shawn.guo@linaro.org, kernel@pengutronix.de,
 boris.brezillon@free-electrons.com, marb@ixxat.de,
 aaron@tastycactus.com, bpringlemeir@gmail.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 albert.aribaud@3adev.fr, Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH v9 2/5] mtd: nand: vf610_nfc: add hardware BCH-ECC support
Message-ID: <20150731234718.GO10676@google.com>
References: <1438361581-2702-1-git-send-email-stefan@agner.ch>
 <1438361581-2702-3-git-send-email-stefan@agner.ch>
 <20150731230901.GK10676@google.com>
 <9dd7975072cf16dd6ea1947bd4ae830a@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dd7975072cf16dd6ea1947bd4ae830a@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 01, 2015 at 01:35:52AM +0200, Stefan Agner wrote:
> On 2015-08-01 01:09, Brian Norris wrote:

> >> +static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
> >> +				uint8_t *buf, int oob_required, int page)
> >> +{
> >> +	int eccsize = chip->ecc.size;
> >> +	int stat;
> >> +
> >> +	vf610_nfc_read_buf(mtd, buf, eccsize);
> >> +
> >> +	if (oob_required)
> >> +		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
> > 
> > To fix the bitflips issue above, you'll just want to unconditionally
> > read the OOB (it's fine to ignore 'oob_required') and...
> > 
> >> +
> >> +	stat = vf610_nfc_correct_data(mtd, buf);
> > 
> > ...pass in chip->oob_poi as a third argument.
> > 
> 
> Hm, this probably will have an effect on performance, since we usually
> omit the OOB if not requested.

You could test :) I don't really like performance claims without tests.
(I say this because I added the oob_required flag myself, but just for
functional purposes, not performance. Many drivers got by just fine by
always copying the OOB data.)

> I could fetch the OOB from the NAND
> controllers SRAM only if necessary (if HW ECC status is not ok...). Does
> this sound reasonable?

That does.

Brian
