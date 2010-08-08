Date: Sun, 8 Aug 2010 11:32:44 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 6/8] mxc_nand: fix correct_data function
Message-ID: <20100808083244.GC21128@jasper.tkos.co.il>
References: <1281102791-8089-1-git-send-email-s.hauer@pengutronix.de>
	<1281102791-8089-7-git-send-email-s.hauer@pengutronix.de>
	<20100808081955.GB8687@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100808081955.GB8687@n2100.arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org, John Ogness <john.ogness@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Russell,

On Sun, Aug 08, 2010 at 09:19:56AM +0100, Russell King - ARM Linux wrote:
> On Fri, Aug 06, 2010 at 03:53:09PM +0200, Sascha Hauer wrote:
> > +		err = ecc_stat & ecc_bit_mask;
> > +		if (err > err_limit) {
> > +			printk(KERN_WARNING "UnCorrectable RS-ECC Error\n");
> > +			return -1;
> 
> Someone's being lazy.

The code at nand_read_subpage() (drivers/mtd/nand/nand_base.c) expects the 
.correct callback to return -1 on an uncorrectable error:

                stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
                if (stat == -1)
                        mtd->ecc_stats.failed++;
                else
                        mtd->ecc_stats.corrected += stat;

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
