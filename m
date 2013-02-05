Received: from co9ehsobe003.messaging.microsoft.com ([207.46.163.26]
 helo=co9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2XuO-0006Gr-Hr
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2013 02:05:17 +0000
Message-ID: <511068DA.4070508@freescale.com>
Date: Tue, 5 Feb 2013 10:05:14 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Al Cooper <alcooperx@gmail.com>
Subject: Re: [PATCH] mtd: mtd_torturetest can cause stack overflows
References: <y> <1360013390-30179-1-git-send-email-alcooperx@gmail.com>
In-Reply-To: <1360013390-30179-1-git-send-email-alcooperx@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B402=E6=9C=8805=E6=97=A5 05:29, Al Cooper =E5=86=99=E9=
=81=93:
> diff --git a/drivers/mtd/tests/mtd_torturetest.c b/drivers/mtd/tests/mt=
d_torturetest.c
> index c4cde1e..a777cc8 100644
> --- a/drivers/mtd/tests/mtd_torturetest.c
> +++ b/drivers/mtd/tests/mtd_torturetest.c
> @@ -208,7 +208,7 @@ static inline int write_pattern(int ebnum, void *bu=
f)
>   static int __init tort_init(void)
>   {
>   	int err =3D 0, i, infinite =3D !cycles_count;
> -	int bad_ebs[ebcnt];
> +	int *bad_ebs;
>
>   	printk(KERN_INFO "\n");
>   	printk(KERN_INFO "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D\n");
> @@ -273,6 +273,12 @@ static int __init tort_init(void)
>   		goto out_patt_FF;
>   	}
>
> +	bad_ebs =3D kmalloc(sizeof(*bad_ebs) * ebcnt, GFP_KERNEL);
I think it's better to use the kcalloc() here.

thanks
Huang Shijie
