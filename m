Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d2YBa-0004b2-3G
 for linux-mtd@lists.infradead.org; Mon, 24 Apr 2017 07:13:28 +0000
Date: Mon, 24 Apr 2017 09:12:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: richard@nod.at, mark.marshall@omicronenergy.com,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, Dipen.Dudhat@freescale.com,
 cyrille.pitchen@atmel.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, prabhakar@freescale.com, b44839@freescale.com
Subject: Re: tango_nand: is logic right in error cases? (was Re:
 fsl_ifc_nand: are blank pages protected by ECC?)
Message-ID: <20170424091259.3f091129@bbrezillon>
In-Reply-To: <20170423095845.GA8692@amd>
References: <20170419121332.GA26979@amd> <20170419231804.5a04ed69@bbrezillon>
 <20170421100813.GA4332@amd> <20170421133721.GA15332@amd>
 <20170421154903.2782cd06@bbrezillon> <20170423095845.GA8692@amd>
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

On Sun, 23 Apr 2017 11:58:45 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > > Maybe I figured it out. Unfortunately, it is only compile tested. Does
> > > it look approximately right?  
> > 
> > Yep that's definitely better. Just one thing missing (see below),
> > otherwise it looks good.  
> 
> I'm copying from tango_nand, therefore I had to check tango_nand, too.
> 
> static int check_erased_page(struct nand_chip *chip, u8 *buf)
> {
> ...
>                 res = nand_check_erased_ecc_chunk(buf, pkt_size, ecc, ecc_size,
>                                                   meta, meta_len,
>                                                   chip->ecc.strength);
>                 if (res < 0)
>                         mtd->ecc_stats.failed++;
>                 else
>                         mtd->ecc_stats.corrected += res;
> 
>                 bitflips = max(res, bitflips);
> ...
>         return bitflips;
> }
> 
> static int tango_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>                            u8 *buf, int oob_required, int page)
> {
> ...
>         res = decode_error_report(nfc);
>         if (res < 0) {
>                 chip->ecc.read_oob_raw(mtd, chip, page);
>                 res = check_erased_page(chip, buf);
>         }
> 
>         return res;
> }
> 
> 
> So nand_check_erased_ecc_chunk() returns < 0 (failed ECC), but then we
> perform max() with bitflips (lets say 1, correctable ECC) and return
> 1? tango_read_page then returns 1 (correctable ECC) forgetting about
> failed ECC...?

Yep, that's expected, see what's done in the core to detect
uncorrectable errors and return EBADMSG when appropriate [1].

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L2033
