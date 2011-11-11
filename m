Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROzmC-0004Pq-Dg
 for linux-mtd@lists.infradead.org; Fri, 11 Nov 2011 22:40:49 +0000
Received: by pzk34 with SMTP id 34so6149574pzk.2
 for <linux-mtd@lists.infradead.org>; Fri, 11 Nov 2011 14:40:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321031180-6153-2-git-send-email-jic23@kernel.org>
References: <1321031180-6153-1-git-send-email-jic23@kernel.org>
 <1321031180-6153-2-git-send-email-jic23@kernel.org>
Date: Sat, 12 Nov 2011 02:40:45 +0400
Message-ID: <CALT56yMQHDtpPeX86NNSWgCdFJw7okyYFr9TVieJcMpKzUH9Rw@mail.gmail.com>
Subject: Re: [PATCH] mtd: pxa2xx-flash.c: It used to fall back to provided
 table.
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, Jonathan Cameron <jic23@cam.ac.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 11, 2011 at 9:06 PM, Jonathan Cameron <jic23@kernel.org> wrote:
> From: Jonathan Cameron <jic23@cam.ac.uk>
>
> Make this work again.

My fault.
Acked-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

>
> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>
> ---
> =A0drivers/mtd/maps/pxa2xx-flash.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-fl=
ash.c
> index 411a17d..2a25b67 100644
> --- a/drivers/mtd/maps/pxa2xx-flash.c
> +++ b/drivers/mtd/maps/pxa2xx-flash.c
> @@ -98,7 +98,7 @@ static int __devinit pxa2xx_flash_probe(struct platform=
_device *pdev)
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0info->mtd->owner =3D THIS_MODULE;
>
> - =A0 =A0 =A0 mtd_device_parse_register(info->mtd, probes, 0, NULL, 0);
> + =A0 =A0 =A0 mtd_device_parse_register(info->mtd, probes, 0, flash->part=
s, flash->nr_parts);
>
> =A0 =A0 =A0 =A0platform_set_drvdata(pdev, info);
> =A0 =A0 =A0 =A0return 0;
> --
> 1.7.7.2
>
>



--=20
With best wishes
Dmitry
