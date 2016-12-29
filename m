Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMdnY-0006a9-9b
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 16:43:25 +0000
Date: Thu, 29 Dec 2016 17:43:02 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: John Crispin <john@phrozen.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: update my email address
Message-ID: <20161229174302.5fcc42c2@bbrezillon>
In-Reply-To: <1482260606-61784-1-git-send-email-john@phrozen.org>
References: <1482260606-61784-1-git-send-email-john@phrozen.org>
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

On Tue, 20 Dec 2016 20:03:26 +0100
John Crispin <john@phrozen.org> wrote:

> This patch updates my email address as I no longer have access to the old
> one.
>=20
> Signed-off-by: John Crispin <john@phrozen.org>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/maps/lantiq-flash.c |    4 ++--
>  drivers/mtd/nand/xway_nand.c    |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-fl=
ash.c
> index c8febb3..3e33ab6 100644
> --- a/drivers/mtd/maps/lantiq-flash.c
> +++ b/drivers/mtd/maps/lantiq-flash.c
> @@ -4,7 +4,7 @@
>   *  by the Free Software Foundation.
>   *
>   *  Copyright (C) 2004 Liu Peng Infineon IFAP DC COM CPE
> - *  Copyright (C) 2010 John Crispin <blogic@openwrt.org>
> + *  Copyright (C) 2010 John Crispin <john@phrozen.org>
>   */
> =20
>  #include <linux/err.h>
> @@ -209,5 +209,5 @@ struct ltq_mtd {
>  module_platform_driver(ltq_mtd_driver);
> =20
>  MODULE_LICENSE("GPL");
> -MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
> +MODULE_AUTHOR("John Crispin <john@phrozen.org>");
>  MODULE_DESCRIPTION("Lantiq SoC NOR");
> diff --git a/drivers/mtd/nand/xway_nand.c b/drivers/mtd/nand/xway_nand.c
> index 1f2948c..bef709c 100644
> --- a/drivers/mtd/nand/xway_nand.c
> +++ b/drivers/mtd/nand/xway_nand.c
> @@ -3,7 +3,7 @@
>   *  under the terms of the GNU General Public License version 2 as publi=
shed
>   *  by the Free Software Foundation.
>   *
> - *  Copyright =C2=A9 2012 John Crispin <blogic@openwrt.org>
> + *  Copyright =C2=A9 2012 John Crispin <john@phrozen.org>
>   *  Copyright =C2=A9 2016 Hauke Mehrtens <hauke@hauke-m.de>
>   */
> =20
