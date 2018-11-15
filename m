Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNDy6-0000aq-CU
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 09:29:47 +0000
Date: Thu, 15 Nov 2018 10:29:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Huijin Park <huijin.park@samsung.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, bbanghj.park@gmail.com
Subject: Re: [PATCH v2] mtd: change len type from signed to unsigned type
Message-ID: <20181115102921.5117af90@xps13>
In-Reply-To: <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
References: <CGME20181115050724eucas1p169b2046c03e108035199a4481a82a560@eucas1p1.samsung.com>
 <1542258430-19885-1-git-send-email-huijin.park@samsung.com>
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

Hi Huijin,

Huijin Park <huijin.park@samsung.com> wrote on Thu, 15 Nov 2018
00:07:10 -0500:

> From: "huijin.park" <huijin.park@samsung.com>
>=20
> This patch casts the "len" parameter to an unsigned int.
> The callers of erase_write() pass the "len" parameter as unsigned int.

Indeed. Perhaps it is worth backporting this patch to a stable releases?

>=20
> Signed-off-by: huijin.park <huijin.park@samsung.com>
> ---
>  drivers/mtd/mtdblock.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
> index a5b1933..b2d5ed1 100644
> --- a/drivers/mtd/mtdblock.c
> +++ b/drivers/mtd/mtdblock.c
> @@ -56,7 +56,7 @@ struct mtdblk_dev {
>   */
> =20
>  static int erase_write (struct mtd_info *mtd, unsigned long pos,
> -			int len, const char *buf)
> +			unsigned int len, const char *buf)
>  {
>  	struct erase_info erase;
>  	size_t retlen;

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
