Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC8Qu-00065m-6q
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 17:44:53 +0000
Date: Sat, 20 May 2017 19:44:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 2/3] mtd: nand: create a wrapper for mtd_device_register
 for NAND specific initialization.
Message-ID: <20170520194430.6d60dd7a@bbrezillon>
In-Reply-To: <20170520152428.9184-3-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
 <20170520152428.9184-3-mrugiero@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Sat, 20 May 2017 12:24:27 -0300,
"Mario J. Rugiero" <mrugiero@gmail.com> a =C3=A9crit :

> =20
>  /**
> + * nand_device_register - [NAND Interface] Register the MTD device and
> + *                        allocate resources for the NAND device
> + * @mtd: MTD device structure
> + * @defparts: default device partitions array, from C-based board files
> + * @defnr_parts: number of elements in defparts
> + *
> + * @return
> + */
> +int nand_device_register(struct mtd_info *mtd,
> +			 const struct mtd_partition *defparts,
> +			 int defnr_parts)
> +{
> +	int ret =3D nand_device_register(mtd, defparts, defnr_parts);

	return nand_device_register(mtd, defparts, defnr_parts);

> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(nand_device_register);
