Received: from mail-gx0-f219.google.com ([209.85.217.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MR2gw-0001IC-0c
	for linux-mtd@lists.infradead.org; Wed, 15 Jul 2009 11:30:36 +0000
Received: by gxk19 with SMTP id 19so6144854gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 15 Jul 2009 04:30:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200907151211.31062.florian@openwrt.org>
References: <200907151211.31062.florian@openwrt.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 15 Jul 2009 07:23:28 -0400
Message-ID: <8bd0f97a0907150423y3dabf661qbb94d0e2efb31946@mail.gmail.com>
Subject: Re: [PATCH] physmap: probe for partitions parsers that we enable
To: Florian Fainelli <florian@openwrt.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 15, 2009 at 06:11, Florian Fainelli wrote:
> This patch makes the physmap driver probe for partitions
> parsers that we configured in the kernel configuration
> instead of a hard-coded partition parser list (cmdlinepart,
> RedBoot).

i believe there was a thread on this list some time ago about how
forcing all maps to declare support partition types sucks.  be nice if
there was a mtd function to probe all available maps so we wouldnt
have to copy & paste this #ifdef mess everywhere.

> --- a/drivers/mtd/maps/physmap.c
> +++ b/drivers/mtd/maps/physmap.c
> @@ -80,7 +80,17 @@ static const char *rom_probe_types[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"map_rom"=
,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL };
> =C2=A0#ifdef CONFIG_MTD_PARTITIONS
> -static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", NU=
LL };
> +static const char *part_probe_types[] =3D {
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "cmdlinepart",
> +#endif
> +#ifdef CONFIG_MTD_REDBOOT_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "RedBoot",
> +#endif
> +#ifdef CONFIG_MTD_AR7_PARTS
> + =C2=A0 =C2=A0 =C2=A0 "ar7part",
> +#endif
> + =C2=A0 =C2=A0 =C2=A0 NULL };
> =C2=A0#endif

me thinks you just broke support when redboot is a module.
cmdlinepart isnt allowed to be a module via Kconfig, but ar7 can be.
-mike
