Received: from mail-yw0-f177.google.com ([209.85.211.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyThX-0004ix-FW
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 17:01:26 +0000
Received: by ywh7 with SMTP id 7so1188655ywh.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Oct 2009 10:01:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200910151251.57306.toralf.foerster@gmx.de>
References: <200910151251.57306.toralf.foerster@gmx.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 15 Oct 2009 13:00:54 -0400
Message-ID: <8bd0f97a0910151000ta7db2cau46f2f8ad065e70a6@mail.gmail.com>
Subject: Re: build issue #29 for v2.6.32-rc4-149-ga3ccf63 :gpio.h:171: error:
	implicit declaration of function 'gpio_get_value'
To: =?UTF-8?Q?Toralf_F=C3=B6rster?= <toralf.foerster@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Bryan Wu <cooloney@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/10/15 Toralf F=C3=B6rster <toralf.foerster@gmx.de>:
> Hello,
>
> the build (.config attached) failed, make ends with :
> ...
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0drivers/mtd/maps/gpio-addr-flash.o
> In file included from /home/tfoerste/devel/linux-2.6/arch/x86/include/asm=
/gpio.h:19,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from drivers/mtd/=
maps/gpio-addr-flash.c:26:
> include/asm-generic/gpio.h: In function 'gpio_get_value_cansleep':
> include/asm-generic/gpio.h:171: error: implicit declaration of function '=
gpio_get_value'
> include/asm-generic/gpio.h: In function 'gpio_set_value_cansleep':
> include/asm-generic/gpio.h:177: error: implicit declaration of function '=
gpio_set_value'
> drivers/mtd/maps/gpio-addr-flash.c: In function 'gpio_flash_probe':
> drivers/mtd/maps/gpio-addr-flash.c:232: error: implicit declaration of fu=
nction 'gpio_request'
> drivers/mtd/maps/gpio-addr-flash.c:236: error: implicit declaration of fu=
nction 'gpio_free'
> drivers/mtd/maps/gpio-addr-flash.c:240: error: implicit declaration of fu=
nction 'gpio_direction_output'
> make[3]: *** [drivers/mtd/maps/gpio-addr-flash.o] Error 1
> make[2]: *** [drivers/mtd/maps] Error 2
> make[1]: *** [drivers/mtd] Error 2
> make: *** [drivers] Error 2
>
> The build was made with :
> $>make randconfig; make clean; make
>
> Here's the config:

patches for this have been posted already, but no one has merged them.
 search recent lkml please.
-mike
