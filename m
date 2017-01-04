Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOoyL-0000G7-MB
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 17:03:34 +0000
Date: Wed, 4 Jan 2017 18:03:11 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Icenowy Zheng <icenowy@aosc.xyz>, Valdis.Kletnieks@vt.edu,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/15] mtd: nand: rename nand_get_flash_type() into
 nand_detect()
Message-ID: <20170104180311.6d48ef11@bbrezillon>
In-Reply-To: <018e0948-a867-ac4d-2414-38038e1cbb20@gmail.com>
References: <1483448495-31607-1-git-send-email-boris.brezillon@free-electrons.com>
 <1483448495-31607-5-git-send-email-boris.brezillon@free-electrons.com>
 <018e0948-a867-ac4d-2414-38038e1cbb20@gmail.com>
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

On Wed, 4 Jan 2017 16:01:42 +0100
Marek Vasut <marek.vasut@gmail.com> wrote:

> On 01/03/2017 02:01 PM, Boris Brezillon wrote:
> > The only caller of nand_get_flash_type() (nand_scan_ident()) actually
> > don't use the returned nand_flash_dev pointer except for converting it to
> > to an error code.
> > Rename this function nand_detect() and make it return an integer.  
> 
> Ummmm, it did return an integer before though ? The commit message is
> kinda cryptic, really.

Actually, that's because Masahiro changed the function prototype in one
of his patches I took for 4.10, and I forgot to adapt my commit message
when rebasing my series on Linus' tree.

I'll fix that.

Thanks,

Boris

> 
> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index 3a31b705af6f..efb3ade568d8 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -4010,8 +4010,7 @@ static bool find_full_id_nand(struct nand_chip *chip,
> >  /*
> >   * Get the flash and manufacturer id and lookup if the type is supported.
> >   */
> > -static int nand_get_flash_type(struct nand_chip *chip,
> > -			       struct nand_flash_dev *type)
> > +static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(chip);
> >  	int busw;
> > @@ -4368,7 +4367,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
> >  	nand_set_defaults(chip);
> >  
> >  	/* Read the flash type */
> > -	ret = nand_get_flash_type(chip, table);
> > +	ret = nand_detect(chip, table);
> >  	if (ret) {
> >  		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
> >  			pr_warn("No NAND device found\n");
> >   
> 
> 
