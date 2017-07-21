Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dYdsE-0005r1-Q7
 for linux-mtd@lists.infradead.org; Fri, 21 Jul 2017 19:46:17 +0000
Received: by mail-wm0-x243.google.com with SMTP id m75so1692820wmb.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2017 12:45:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1496418222-23483-2-git-send-email-pali.rohar@gmail.com>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-2-git-send-email-pali.rohar@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 21 Jul 2017 21:45:43 +0200
Message-ID: <CAFLxGvy4aMJTJHQq8WmN9F0yF9yH=ExrzR13bSXqAP6fnuOdpQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] mtd: block2mtd: Check for valid user supplied erase
 size
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 2, 2017 at 5:43 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> Erase size is limited to 32bit unsigned integer, but value parsed from us=
er
> is limited up to size_t C type.
>
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/mtd/devices/block2mtd.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2=
mtd.c
> index 7c887f1..ee47cdd 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
> @@ -419,7 +419,7 @@ static int block2mtd_setup2(const char *val)
>
>         if (token[1]) {
>                 ret =3D parse_num(&erase_size, token[1]);
> -               if (ret) {
> +               if (ret || erase_size > U32_MAX) {
>                         pr_err("illegal erase size\n");
>                         return 0;
>                 }

Reviewed-by: Richard Weinberger <richard@nod.at>

--=20
Thanks,
//richard
