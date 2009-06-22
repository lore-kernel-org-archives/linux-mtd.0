Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MIj4I-0006Mv-CA
	for linux-mtd@lists.infradead.org; Mon, 22 Jun 2009 12:56:32 +0000
Received: by ewy7 with SMTP id 7so8250947ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Jun 2009 05:56:12 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] MTD: enable partition parser in the default list when
	selected
Date: Mon, 22 Jun 2009 14:56:07 +0200
References: <200906221127.06461.florian@openwrt.org>
	<8bd0f97a0906220533u70305e49ob73238ee59cc6d5f@mail.gmail.com>
In-Reply-To: <8bd0f97a0906220533u70305e49ob73238ee59cc6d5f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200906221456.08737.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Monday 22 June 2009 14:33:22 Mike Frysinger, vous avez =C3=A9crit=C2=A0:
> On Mon, Jun 22, 2009 at 05:27, Florian Fainelli wrote:
> > =C2=A0#ifdef CONFIG_MTD_PARTITIONS
> > -static const char *part_probe_types[] =3D { "cmdlinepart", "RedBoot", =
NULL
> > }; +static const char *part_probe_types[] =3D {
> > +#ifdef CONFIG_MTD_CMDLINE_PARTS
> > + =C2=A0 =C2=A0 =C2=A0 "cmdlinepart",
> > +#elif defined CONFIG_MTD_REDBOOT_PARTS
> > + =C2=A0 =C2=A0 =C2=A0 "RedBoot",
> > +#elif defined CONFIG_MTD_AR7_PARTS
> > + =C2=A0 =C2=A0 =C2=A0 "ar7part",
> > +#endif
> > + =C2=A0 =C2=A0 =C2=A0 NULL
> > +};
> > =C2=A0#endif
>
> you just broke systems that have both cmdline and redboot enabled
> -mike

Right, let me respin that one.
=2D-=20
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
=2D------------------------------
