Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLI4f-0004F6-1E
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2018 01:28:34 +0000
Received: by mail-lf1-x142.google.com with SMTP id e26so847878lfc.2
 for <linux-mtd@lists.infradead.org>; Fri, 09 Nov 2018 17:28:17 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v2 13/22] mtd: rawnand: Pass the CS line to be selected in
 struct nand_operation
Date: Sat, 10 Nov 2018 02:30:04 +0100
Message-ID: <2312482.kRjraIG7a0@z50>
In-Reply-To: <20181106150810.9569-14-boris.brezillon@bootlin.com>
References: <20181106150810.9569-1-boris.brezillon@bootlin.com>
 <20181106150810.9569-14-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tuesday, November 6, 2018 4:08:01 PM CET Boris Brezillon wrote:
> In order to deprecate the ->select_chip hook we need to pass the CS
> line a NAND operations are targeting. This is done through the
> addition of a cs field to the nand_operation struct.
> 
> We also need to keep track of the currently selected target to
> properly initialize op->cs, hence the ->cur_cs field addition to the
> nand_chip struct.
> 
> Note that op->cs is not assigned in nand_exec_op() because we might
> rework the way we execute NAND operations in the future (adopt a
> queuing mechanism instead of the serialization we have right now).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Initialize ->cur_cs
> ---
>  drivers/mtd/nand/raw/internals.h  |  3 +++
>  drivers/mtd/nand/raw/nand_base.c  | 39 +++++++++++++++++--------------
>  drivers/mtd/nand/raw/nand_hynix.c |  4 ++--
>  include/linux/mtd/rawnand.h       | 11 ++++++++-
>  4 files changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 6e2f61fbc5f0..b62728d5884b 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -101,6 +101,9 @@ static inline int nand_exec_op(struct nand_chip *chip,
>  	if (!chip->exec_op)
>  		return -ENOTSUPP;
>  
> +	if (WARN_ON(op->cs >= chip->numchips))
> +		return -EINVAL;

This needs a fix to nand_scan_ident() like the following:

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5034,10 +5034,11 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 
 	/* Set the default functions */
 	nand_set_defaults(chip);
 
 	/* Read the flash type */
+	chip->numchips = 1;
 	ret = nand_detect(chip, table);
 	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
 		nand_deselect_target(chip);


Otherwise nand_detect() fails for me in nand_exec_op() called from the very 
first nand_reset_op():

    WARNING: CPU: 0 PID: 1 at drivers/mtd/nand/raw/internals.h:104 nand_reset_op+0x100/0x17c
    ...
    nand: No NAND device found

With that issue fixed one way or another, you can add my:

	Tested-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

to your whole series.

Thanks,
Janusz


PS.
I'm ready to submit a series which converts ams-delta-nand to use GPIO 
API for data I/O.  My only concerns is which branch should I rebase it on.
