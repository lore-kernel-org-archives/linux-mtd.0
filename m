Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1evT0e-0002vJ-3p
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 19:21:26 +0000
Date: Mon, 12 Mar 2018 20:20:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, jocelyncarroue@macronix.com,
 juliensu@mxic.com.tw, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v3 10/14] mtd: rawnand: prepare the removal of the ONFI
 parameter page
Message-ID: <20180312202049.287a96df@bbrezillon>
In-Reply-To: <20180302142422.2543-11-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
 <20180302142422.2543-11-miquel.raynal@bootlin.com>
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

On Fri,  2 Mar 2018 15:24:18 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 1af0bff58ff4..81236b3fbc6f 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -429,9 +429,23 @@ struct nand_jedec_params {
>  	__le16 crc;
>  } __packed;
>  
> +struct onfi_params {
> +	u16 t_prog;
> +	u16 t_bers;
> +	u16 t_r;
> +	u16 t_ccs;
> +	u16 async_timing_mode;
> +	u16 vendor_revision;
> +	u8 vendor[88];
> +};

Kernel-doc missing here.

> +
>  struct nand_parameters {
> +	/* Generic parameters */
>  	char model[100];
>  	bool supports_set_get_features;
> +
> +	/* ONFI parameters */
> +	struct onfi_params onfi_params;

Why not name the field onfi instead of onfi_params?

>  };


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
