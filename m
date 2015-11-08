Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvXRR-00025R-1O
 for linux-mtd@lists.infradead.org; Sun, 08 Nov 2015 21:24:02 +0000
Received: by ykek133 with SMTP id k133so237175441yke.2
 for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2015 13:23:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1446972440-3795-1-git-send-email-saurabh.truth@gmail.com>
References: <1446972440-3795-1-git-send-email-saurabh.truth@gmail.com>
Date: Sun, 8 Nov 2015 23:23:38 +0200
Message-ID: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
Subject: Re: [PATCH] mtd: phram: error handling
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: joern@lazybastard.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Sun, Nov 8, 2015 at 10:47 AM, Saurabh Sengar <saurabh.truth@gmail.com> w=
rote:
> registering the device with NULL pointer can lead to crash,
> hence fixing it.

Hmm=E2=80=A6 Why not just checking it before an register attempt? I think u=
ser
is in right to know as many problems as they have at one shot, with
your patch if there are two problems the user has to try twice.

>
> Signed-off-by: Saurabh Sengar <saurabh.truth@gmail.com>
> ---
> in case of 'illegal start address' or 'illegal device length', name point=
er is getting freed.
> we shouldn't register the device with NULL pointer.
>
>  drivers/mtd/devices/phram.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 8b66e52..9a7aed3 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -249,12 +249,14 @@ static int phram_setup(const char *val)
>         if (ret) {
>                 kfree(name);
>                 parse_err("illegal start address\n");
> +               goto err;
>         }
>
>         ret =3D parse_num64(&len, token[2]);
>         if (ret) {
>                 kfree(name);
>                 parse_err("illegal device length\n");
> +               goto err;
>         }
>
>         ret =3D register_device(name, start, len);
> @@ -262,7 +264,7 @@ static int phram_setup(const char *val)
>                 pr_info("%s device: %#llx at %#llx\n", name, len, start);
>         else
>                 kfree(name);
> -
> +err:
>         return ret;
>  }
>
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



--=20
With Best Regards,
Andy Shevchenko
