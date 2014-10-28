Date: Tue, 28 Oct 2014 21:15:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: nand: add sunxi NAND flash controller support
Message-ID: <20141028211555.5b6bb2d6@bbrezillon>
In-Reply-To: <20141028181310.GA23619@ld-irv-0074>
References: <1413896922-11680-1-git-send-email-boris.brezillon@free-electrons.com>
 <1413896922-11680-2-git-send-email-boris.brezillon@free-electrons.com>
 <20141028181310.GA23619@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 linux-kernel@vger.kernel.org, Yassin Jaffer <yassinjaffer@gmail.com>,
 linux-sunxi@googlegroups.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Kumar Gala <galak@codeaurora.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Tue, 28 Oct 2014 11:13:11 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> Hi Boris,
> 
> On Tue, Oct 21, 2014 at 03:08:41PM +0200, Boris Brezillon wrote:
> > +static int sunxi_nand_hw_ecc_ctrl_init(struct mtd_info *mtd,
> > +				       struct nand_ecc_ctrl *ecc,
> > +				       struct device_node *np)
> > +{
> > +	struct nand_ecclayout *layout;
> > +	int i, j;
> > +	int ret;
> > +
> > +	ret = sunxi_nand_hw_common_ecc_ctrl_init(mtd, ecc, np);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ecc->read_page = sunxi_nfc_hw_ecc_read_page;
> > +	ecc->write_page = sunxi_nfc_hw_ecc_write_page;
> > +	layout = ecc->layout;
> > +
> > +	for (i = 0; i < ecc->steps; i++) {
> 
> Hmm, did you retest this since changing this to ecc->steps? I think this
> won't work, since ecc->steps is only initialized in nand_scan_tail(),
> which comes after this. I only recommended the change for the
> {read,write}_page() type of functions, not the initialization functions.

Oh, crap!
Indeed, I only checked that the NAND was properly detected, but didn't
test all the features.
Anyway, I'm glad you found this issue before applying the series.

> 
> [snip the rest]
> 
> So I'd suggest the following additional patch, and otherwise, the series
> is fine with me. If you give your ack, I can just squash this in and
> apply it to my tree:

I'll test it tomorrow (and this time I'll test everything ;-)).

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
