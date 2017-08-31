Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dnVm3-0004KU-6w
 for linux-mtd@lists.infradead.org; Thu, 31 Aug 2017 20:09:12 +0000
Date: Thu, 31 Aug 2017 22:08:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 kernel@pengutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdchar: handle a block that should be marked bad
 that already is
Message-ID: <20170831220846.35014f87@bbrezillon>
In-Reply-To: <20170831193543.27543-1-u.kleine-koenig@pengutronix.de>
References: <20170831193543.27543-1-u.kleine-koenig@pengutronix.de>
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

On Thu, 31 Aug 2017 21:35:43 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> Otherwise at least /sys/class/mtd/mtdX/bad_blocks is increased each time
> the same block is remarked as bad.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/mtdchar.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index 3568294d4854..049496a1d7a5 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -916,6 +916,11 @@ static int mtdchar_ioctl(struct file *file, u_int cm=
d, u_long arg)
> =20
>  		if (copy_from_user(&offs, argp, sizeof(loff_t)))
>  			return -EFAULT;
> +
> +		if (mtd_block_isbad(mtd, offs))
> +			/* already done */
> +			return 0;
> +

Just a matter of taste but I prefer to have comments before the
conditional branch and not inside it, especially when the code chunk is
not enclosed into brackets.

>  		return mtd_block_markbad(mtd, offs);
>  		break;

This break statement is redundant. Care to send another patch to fix
that?

>  	}
