Received: from pproxy.gmail.com ([64.233.166.176])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWYpu-0004Cg-M4
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 09:04:45 -0400
Received: by pproxy.gmail.com with SMTP id i49so269040pyi
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Apr 2006 06:04:41 -0700 (PDT)
Message-ID: <f19298770604200558r4b29a4d9ma4156539ca54838f@mail.gmail.com>
Date: Thu, 20 Apr 2006 16:58:39 +0400
From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060420101101.GB4047@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
	<20060420101101.GB4047@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Random fixes for the ixp4xx mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/20/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > @@ -151,7 +151,9 @@
> >        struct resource *res;
> >  };
> >
> > -static const char *probes[] =3D { "RedBoot", "cmdlinepart", NULL };
> > +#ifdef CONFIG_MTD_PARTITIONS
> > +static const char *probes[] __initdata =3D { "RedBoot", "cmdlinepart",=
 NULL };
> > +#endif
>
> All this #ifdef mess doesn't make me happy.  In this case, it saves 32
> bytes for people using this driver but not having
> CONFIG_MTD_PARTITIONS enabled.  That's not a very small gain for a
> very small group.  Just make it unconditional.

The gain is not big, but the price is small too. The thing I'm not
sure about is __initdata.
Now I see that it may be needed after initialization too, not sure.

>
> >   static int ixp4xx_flash_remove(struct platform_device *dev)
> >  {
> > @@ -164,7 +166,9 @@
> >                return 0;
> >
> >        if (info->mtd) {
> > +#ifdef CONFIG_MTD_PARTITIONS
> >                del_mtd_partitions(info->mtd);
> > +#endif
>
> In this case, del_mtd_partitions() should be defined to a noop if
> CONFIG_MTD_PARTITIONS is not defined.
>
> > +#ifdef CONFIG_MTD_PARTITIONS
> >        err =3D parse_mtd_partitions(info->mtd, probes, &info->partition=
s, 0);
> >        if (err > 0) {
> >                err =3D add_mtd_partitions(info->mtd, info->partitions, =
err);
> > -               if(err)
> > -                       printk(KERN_ERR "Could not parse partitions\n")=
;
> > +
> >        }
> > +       if (err < 0)
> > +               printk(KERN_ERR "Could not parse partitions\n");
> > +#endif
>
> Same here.  parse_mtd_partitions() should be a noop, the rest can just
> stay.  Gcc should be smart enough to optimize it away.
>
> The rest looks fine.

Why do you think nooping functions is better than having #ifdefs? I
agree that lots of
#ifdefs make code hard to follow, but if you noop a function, defined
in some other place,
someone reading the code may not notice it, and refer to the un-nooped func=
tion.

> J=F6rn
>
> --
> Everything should be made as simple as possible, but not simpler.
> -- Albert Einstein
>
