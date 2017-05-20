Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dC8cr-0003ID-GU
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 17:57:15 +0000
Date: Sat, 20 May 2017 19:56:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH 2/3] mtd: nand: create a wrapper for mtd_device_register
 for NAND specific initialization.
Message-ID: <20170520195648.60992005@bbrezillon>
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

> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -38,6 +38,11 @@ int nand_scan_ident(struct mtd_info *mtd, int max_chip=
s,
>  			   struct nand_flash_dev *table);
>  int nand_scan_tail(struct mtd_info *mtd);
> =20
> +/* Register the MTD device and allocate resources for the NAND device */
> +int nand_device_register(struct mtd_info *mtd,

Please pass a nand_chip object here, not mtd_info.

> +			 const struct mtd_partition *defparts,
> +			 int defnr_parts);
> +
>  /* Unregister the MTD device and free resources held by the NAND device =
*/
>  void nand_release(struct mtd_info *mtd);
> =20
