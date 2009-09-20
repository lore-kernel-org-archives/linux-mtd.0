Received: from mail-yw0-f189.google.com ([209.85.211.189])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MpVDo-0004qC-IG
	for linux-mtd@lists.infradead.org; Sun, 20 Sep 2009 22:49:37 +0000
Received: by ywh27 with SMTP id 27so4998206ywh.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Sep 2009 15:49:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253484248.6317.217.camel@macbook.infradead.org>
References: <1243915650-29628-1-git-send-email-vapier@gentoo.org>
	<1244033509-31586-1-git-send-email-vapier@gentoo.org>
	<1253484248.6317.217.camel@macbook.infradead.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 20 Sep 2009 18:49:11 -0400
Message-ID: <8bd0f97a0909201549w2980c02em4c401f3f86b732a4@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/maps: gpio-addr-flash: new driver for GPIO
	assisted flash addressing
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: uclinux-dist-devel@blackfin.uclinux.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 20, 2009 at 18:04, David Woodhouse wrote:
> On Wed, 2009-06-03 at 08:51 -0400, Mike Frysinger wrote:
>> This driver lets people use GPIO's for additional address lines in case
>> their processor does not have enough address lines already.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> Signed-off-by: Bryan Wu <cooloney@kernel.org>
>
> In file included from /home/dwmw2/git/mtd-2.6/arch/x86/include/asm/gpio.h=
:20,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from drivers/mtd/=
maps/gpio-addr-flash.c:27:
> include/asm-generic/gpio.h: In function =E2=80=98gpio_get_value_cansleep=
=E2=80=99:
> include/asm-generic/gpio.h:168: error: implicit declaration of function =
=E2=80=98gpio_get_value=E2=80=99
> include/asm-generic/gpio.h: In function =E2=80=98gpio_set_value_cansleep=
=E2=80=99:
> include/asm-generic/gpio.h:174: error: implicit declaration of function =
=E2=80=98gpio_set_value=E2=80=99
> drivers/mtd/maps/gpio-addr-flash.c: In function =E2=80=98gpio_flash_probe=
=E2=80=99:
> drivers/mtd/maps/gpio-addr-flash.c:232: error: implicit declaration of fu=
nction =E2=80=98gpio_request=E2=80=99
> drivers/mtd/maps/gpio-addr-flash.c:236: error: implicit declaration of fu=
nction =E2=80=98gpio_free=E2=80=99
> drivers/mtd/maps/gpio-addr-flash.c:240: error: implicit declaration of fu=
nction =E2=80=98gpio_direction_output=E2=80=99
> make[2]: *** [drivers/mtd/maps/gpio-addr-flash.o] Error 1
> make[1]: *** [drivers/mtd/maps] Error 2
> make: *** [_module_drivers/mtd] Error 2
>
> Setting CONFIG_GPIOLIB seems to fix it -- but we can't make it depend on
> that, can we? Maybe it should be GPIOLIB || !GENERIC_GPIO?

it works fine on Blackfin systems w/out gpiolib, so yes, forcing a
depend on that would be awful.

i think you mean:
depend GPIOLIB || GENERIC_GPIO
-mike
