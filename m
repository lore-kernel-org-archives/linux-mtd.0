Received: from pproxy.gmail.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWZbq-00054h-Di
	for linux-mtd@lists.infradead.org; Thu, 20 Apr 2006 09:54:20 -0400
Received: by pproxy.gmail.com with SMTP id i49so283950pyi
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Apr 2006 06:54:13 -0700 (PDT)
Message-ID: <f19298770604200647q467f1ae8w5512ae3d46dd744b@mail.gmail.com>
Date: Thu, 20 Apr 2006 17:47:35 +0400
From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060420133500.GD4047@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f19298770604191204he066f6ctd090a21c6aaeca83@mail.gmail.com>
	<20060420101101.GB4047@wohnheim.fh-wedel.de>
	<f19298770604200558r4b29a4d9ma4156539ca54838f@mail.gmail.com>
	<20060420133500.GD4047@wohnheim.fh-wedel.de>
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
> On Thu, 20 April 2006 16:58:39 +0400, Alexey Zaytsev wrote:
> > On 4/20/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
> > > > @@ -151,7 +151,9 @@
> > > >        struct resource *res;
> > > >  };
> > > >
> > > > -static const char *probes[] =3D { "RedBoot", "cmdlinepart", NULL }=
;
> > > > +#ifdef CONFIG_MTD_PARTITIONS
> > > > +static const char *probes[] __initdata =3D { "RedBoot", "cmdlinepa=
rt", NULL };
> > > > +#endif
> > >
> > > All this #ifdef mess doesn't make me happy.  In this case, it saves 3=
2
> > > bytes for people using this driver but not having
> > > CONFIG_MTD_PARTITIONS enabled.  That's not a very small gain for a
> > > very small group.  Just make it unconditional.
> >
> > The gain is not big, but the price is small too. The thing I'm not
> > sure about is __initdata.
> > Now I see that it may be needed after initialization too, not sure.
>
> The price of a single #ifdef may (and I stress may) be small.  But
> once the numbers go up, changes become virtually impossible.  The only
> chance to change #ifdef-happy code is by adding new code and new
> #ifdefs.  Result is a lot more bloat than just 32 bytes.
>
> Take a look at the U-Boot source if you don't believe me.
Ok-ok, agree here.
>
> End result: stong NACK from me.
>
> > >
> > > >   static int ixp4xx_flash_remove(struct platform_device *dev)
> > > >  {
> > > > @@ -164,7 +166,9 @@
> > > >                return 0;
> > > >
> > > >        if (info->mtd) {
> > > > +#ifdef CONFIG_MTD_PARTITIONS
> > > >                del_mtd_partitions(info->mtd);
> > > > +#endif
> > >
> > > In this case, del_mtd_partitions() should be defined to a noop if
> > > CONFIG_MTD_PARTITIONS is not defined.
> > >
> > > > +#ifdef CONFIG_MTD_PARTITIONS
> > > >        err =3D parse_mtd_partitions(info->mtd, probes, &info->parti=
tions, 0);
> > > >        if (err > 0) {
> > > >                err =3D add_mtd_partitions(info->mtd, info->partitio=
ns, err);
> > > > -               if(err)
> > > > -                       printk(KERN_ERR "Could not parse partitions=
\n");
> > > > +
> > > >        }
> > > > +       if (err < 0)
> > > > +               printk(KERN_ERR "Could not parse partitions\n");
> > > > +#endif
> > >
> > > Same here.  parse_mtd_partitions() should be a noop, the rest can jus=
t
> > > stay.  Gcc should be smart enough to optimize it away.
> > >
> > > The rest looks fine.
> >
> > Why do you think nooping functions is better than having #ifdefs? I
> > agree that lots of
> > #ifdefs make code hard to follow, but if you noop a function, defined
> > in some other place,
> > someone reading the code may not notice it, and refer to the un-nooped =
function.
>
> In the header where del_mtd_partitions() and parse_mtd_partitions()
> are declared, there should be a single #ifdef:
>
> #ifdef CONFIG_MTD_PARTITIONS
>
> void del_mtd_partitions(...);
> int parse_mtd_partitions(...);
>
> #else
>
> static inline void del_mtd_partitions(...) {}
> static inline int parse_mtd_partitions(...) { return 0; }
>
> #endif
>
> For the driver you touched alone, three #ifdefs could be removed after
> this one is added.  Then take a look at all the other drivers and do
> the math. ;)

Ok, I'll add them to include/linux/mtd/partitions.h, and clean the
other drivers.

> J=F6rn
>
> --
> /* Keep these two variables together */
> int bar;
>
