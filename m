Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YArgo-0008R2-QA
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 02:58:43 +0000
Date: Tue, 13 Jan 2015 10:56:19 +0800
From: Huang Shijie <shijie.huang@intel.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75% of
 correction strength
Message-ID: <20150113025619.GA13886@hsj.sh.intel.com>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <20150113020154.GA12662@hsj.sh.intel.com>
 <CAN8TOE-qw4jnftbOB-vLOmDCN13vCsAQEs8_Q1i+1=i5RLp6Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE-qw4jnftbOB-vLOmDCN13vCsAQEs8_Q1i+1=i5RLp6Wg@mail.gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 12, 2015 at 06:38:49PM -0800, Brian Norris wrote:
> On Mon, Jan 12, 2015 at 6:01 PM, Huang Shijie <shijie.huang@intel.com> wrote:
> > On Mon, Jan 12, 2015 at 12:51:29PM -0800, Brian Norris wrote:
> >> --- a/drivers/mtd/nand/nand_base.c
> >> +++ b/drivers/mtd/nand/nand_base.c
> >> @@ -4171,7 +4171,7 @@ int nand_scan_tail(struct mtd_info *mtd)
> >>        * properly set.
> >>        */
> >>       if (!mtd->bitflip_threshold)
> >> -             mtd->bitflip_threshold = mtd->ecc_strength;
> >> +             mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
> > After this patch, we have to change the bitflip_threshold to
> > ecc_strength manually when we do the mtd_biterrors.ko test.
> 
> Why?
sorry, I misunderstood the mtd_biterrors code.
It is fine after this patch.

thanks
Huang Shijie
