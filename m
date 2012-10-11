Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMAIG-0005Lo-2S
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 04:22:44 +0000
Received: by mail-vc0-f177.google.com with SMTP id p16so1721778vcq.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 21:22:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 11 Oct 2012 00:21:59 -0400
Message-ID: <CAMjpGUcRni7ni-FtVAN-pqnuHDK-WeeO6U=480K=1sCDhb7qjQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the base
 address
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 8, 2012 at 11:25 AM, Uwe Kleine-K=C3=B6nig wrote:
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -23,12 +23,13 @@
>
>  /***********************************************************************=
*****/
>
> -struct map_info uclinux_ram_map =3D {
> -       .name =3D "RAM",
> -       .phys =3D (unsigned long)__bss_stop,
> +static struct map_info uclinux_ram_map =3D {
>         .size =3D 0,
>  };

this change will break Blackfin systems.  i mentioned last time
someone tried to make this and we talked about adding a comment to
prevent future breakage, but that seems to not have happened.

i don't think's necessary either for the larger change here.  use the logic=
:
    if (physaddr !=3D -1)
        mapp->phys =3D physaddr;
and keep the default initialization.
-mike
