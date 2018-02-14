Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1elspQ-0002lh-O9
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 08:54:14 +0000
Date: Wed, 14 Feb 2018 09:53:51 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@free-electrons.com>
Subject: Re: [PATCH 4/6] mtd: nand: Stop using a static parameter page for
 all chips
Message-ID: <20180214095351.2298e732@bbrezillon>
In-Reply-To: <20180203095544.9855-5-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
 <20180203095544.9855-5-miquel.raynal@bootlin.com>
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

On Sat,  3 Feb 2018 10:55:42 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 3244f2594b6b..6d8667bb96f4 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -429,6 +429,20 @@ struct nand_jedec_params {
>  	__le16 crc;
>  } __packed;
>  
> +struct nand_parameters {
> +	/* Generic parameters */
> +	char model[20];
> +	/* ONFI parameters */
> +	bool support_setting_features;

It's not only about setting features, so maybe
'supports_set_get_features'.

> +	u16 t_prog;
> +	u16 t_bers;
> +	u16 t_r;
> +	u16 t_ccs;
> +	u16 async_timing_mode;
> +	u16 vendor_revision;
> +	u8 vendor[88];
> +} __packed;
> +




-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
