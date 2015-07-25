Received: from mail-wi0-f175.google.com ([209.85.212.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ3Uk-0005N7-Sm
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 17:45:03 +0000
Received: by wibud3 with SMTP id ud3so67979362wib.0
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 10:44:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1437842963-8107-1-git-send-email-khoroshilov@ispras.ru>
References: <1437842963-8107-1-git-send-email-khoroshilov@ispras.ru>
Date: Sat, 25 Jul 2015 14:44:00 -0300
Message-ID: <CAAEAJfD9iwFNkcA5Vsz6jFgMDGqmKFxYrQJgMB1eywc80cZ0EQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpio-addr-flash: add missing iounmap in probe/remove
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mike Frysinger <vapier@gentoo.org>, ldv-project@linuxtesting.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Hi Alexey,

On 25 July 2015 at 13:49, Alexey Khoroshilov <khoroshilov@ispras.ru> wrote:
> There is no iounmap(state->map.virt) in gpio_flash_remove() and
> in gpio_flash_probe() error handling code.
>

Is there any reason why we can't just use managed variants? E.g.

diff --git a/drivers/mtd/maps/gpio-addr-flash.c
b/drivers/mtd/maps/gpio-addr-flash.c
index 2fb3460..bbaa92b 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -238,7 +238,8 @@ static int gpio_flash_probe(struct platform_device *pde=
v)
        state->map.copy_to    =3D gf_copy_to;
        state->map.bankwidth  =3D pdata->width;
        state->map.size       =3D state->win_size * (1 << state->gpio_count=
);
-       state->map.virt       =3D ioremap_nocache(memory->start, state->map=
.size);
+       state->map.virt       =3D devm_ioremap_nocache(&pdev->dev, memory->=
start,
+                                                    state->map.size);
        state->map.phys       =3D NO_XIP;
        state->map.map_priv_1 =3D (unsigned long)state;

Notice the error checks are still needed though, but managed stuff would ma=
ke
it simpler.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
