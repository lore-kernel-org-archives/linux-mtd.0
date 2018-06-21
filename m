Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVtoI-0008Qx-J1
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 07:15:16 +0000
Date: Thu, 21 Jun 2018 09:14:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Cc: Richard Weinberger <richard@nod.at>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: micron: add fixup for ONFI revision
Message-ID: <20180621091451.1a0226de@bbrezillon>
In-Reply-To: <5e3b8f2f896f44aaab97086dceb2a69b@svr-chch-ex1.atlnz.lc>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
 <20180620050544.31549-4-chris.packham@alliedtelesis.co.nz>
 <20180620095410.664091d8@bbrezillon>
 <5e3b8f2f896f44aaab97086dceb2a69b@svr-chch-ex1.atlnz.lc>
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

On Wed, 20 Jun 2018 21:12:02 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> On 20/06/18 19:54, Boris Brezillon wrote:
> > On Wed, 20 Jun 2018 17:05:43 +1200
> > Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> >   
> >> Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the
> >> revision number field of the ONFI parameter page. Rather than rejecting
> >> these outright assume ONFI version 1.0 if the revision number is 00 00.
> >>
> >> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >> This is now qualified on vendor == MICRON. I haven't qualified this
> >> based on specific chips the ABAFA (id=d1) and ABBFA (id=a1) variants are
> >> documented to have this behaviour.
> >>
> >> Changes in v2:
> >> - use fixup_onfi_param_page
> >> Changes in v3:
> >> - add code comment next to workaround
> >>
> >>   drivers/mtd/nand/raw/nand_micron.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> >> index 5ec4c90a637d..5cec79372181 100644
> >> --- a/drivers/mtd/nand/raw/nand_micron.c
> >> +++ b/drivers/mtd/nand/raw/nand_micron.c
> >> @@ -289,6 +289,19 @@ static int micron_nand_init(struct nand_chip *chip)
> >>   	return 0;
> >>   }
> >>   
> >> +static void micron_fixup_onfi_param_page(struct nand_chip *chip,
> >> +					 struct nand_onfi_params *p)
> >> +{
> >> +	/*
> >> +	 * MT29F1G08ABAFAWP-ITE:F and possibly others report 00 00 for the
> >> +	 * revision number field of the ONFI parameter page. Assume ONFI
> >> +	 * version 1.0 if the revision number is 00 00.
> >> +	 */
> >> +	if (le16_to_cpu(p->revision) == 0)
> >> +		p->revision = cpu_to_le16(1 << 1);  
> > 
> > Would be better to have macros defining all version numbers in rawnand.h
> > 
> > #define ONFI_VERSION_1_0		BIT(1)
> > #define ONFI_VERSION_2_0		BIT(2)
> > #define ONFI_VERSION_2_1		BIT(3)
> > #define ONFI_VERSION_2_2		BIT(4)
> > #define ONFI_VERSION_2_3		BIT(5)
> > #define ONFI_VERSION_3_0		BIT(6)
> > #define ONFI_VERSION_3_1		BIT(7)
> > #define ONFI_VERSION_3_2		BIT(8)
> > #define ONFI_VERSION_4_0		BIT(9)
> >   
> 
> Make sense. Do you want me to do so in a v4 or send a new patch and 
> clean up the other uses?

It can be part of your v4, but yes, the idea is to first introduce the
macros and patch existing users, and then use it in this patch.
