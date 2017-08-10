Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dfjoV-0005KW-Vp
 for linux-mtd@lists.infradead.org; Thu, 10 Aug 2017 09:31:37 +0000
Date: Thu, 10 Aug 2017 11:31:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mathias Thore <mathias.thore@infinera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: PPB locking support for larger
 capacity devices
Message-ID: <20170810113108.5ad33278@bbrezillon>
In-Reply-To: <20170405115743.27441-1-mathias.thore@infinera.com>
References: <20170405115743.27441-1-mathias.thore@infinera.com>
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

Hi Matthias,

Le Wed,  5 Apr 2017 13:57:43 +0200,
Mathias Thore <mathias.thore@infinera.com> a =C3=A9crit :

> Currently cfi_cmdset_0002.c supports advanced sector protection scheme
> for devices with 512 or fewer sectors. This patch increases the limit
> to enable advanced sector protection on devices with larger capacity.

Can't we fix the implementation to determine at runtime how many
sectors the flash has instead of changing MAX_SECTORS value every time
a new flash comes in?
This would also have the benefit of keeping the ppb_lock array
(allocated in cfi_ppb_unlock()) small on setup that have a flash with a
limited number of sectors.

Regards,

Boris

>=20
> Signed-off-by: Mathias Thore <mathias.thore@infinera.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 9dca881..4966f12 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -2532,7 +2532,7 @@ struct ppb_lock {
>  	int locked;
>  };
> =20
> -#define MAX_SECTORS			512
> +#define MAX_SECTORS			1024
> =20
>  #define DO_XXLOCK_ONEBLOCK_LOCK		((void *)1)
>  #define DO_XXLOCK_ONEBLOCK_UNLOCK	((void *)2)
