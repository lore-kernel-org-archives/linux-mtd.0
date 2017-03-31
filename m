Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cttCD-0001Wb-70
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 09:50:18 +0000
Date: Fri, 31 Mar 2017 11:49:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, =?UTF-8?B?UmFm?=
 =?UTF-8?B?YcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: use dev_of_node helper in mtd_get_of_node
Message-ID: <20170331114950.726c9cb7@bbrezillon>
In-Reply-To: <20170331091148.19816-1-zajec5@gmail.com>
References: <20170331091148.19816-1-zajec5@gmail.com>
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

On Fri, 31 Mar 2017 11:11:48 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This allows better compile-time optimizations with CONFIG_OF disabled.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Not sure we care about such micro-optimizations, but it shouldn't hurst
so,

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  include/linux/mtd/mtd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index eebdc63cf6af..f8db5b2e4028 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -393,7 +393,7 @@ static inline void mtd_set_of_node(struct mtd_info *m=
td,
> =20
>  static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
>  {
> -	return mtd->dev.of_node;
> +	return dev_of_node(&mtd->dev);
>  }
> =20
>  static inline int mtd_oobavail(struct mtd_info *mtd, struct mtd_oob_ops =
*ops)
