Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lc8zz-0005kk-2e
	for linux-mtd@lists.infradead.org; Wed, 25 Feb 2009 01:55:49 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1075115yxi.72
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Feb 2009 17:55:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <200902241509.54649.david-b@pacbell.net>
References: <200902241509.54649.david-b@pacbell.net>
Date: Tue, 24 Feb 2009 22:55:45 -0300
Message-ID: <82ecf08e0902241755y5a7be725gb84116433b7d3be2@mail.gmail.com>
Subject: Re: [patch/RESEND 2.6.29-rc3-git] NAND: davinci_nand driver
From: Thiago Galesi <thiagogalesi@gmail.com>
To: dbrownell@users.sourceforge.net
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: DaVinci <davinci-linux-open-source@linux.davincidsp.com>,
	Linux MTD <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK a couple of things
 +
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> +static inline int mtd_has_partitions(void) { return 1; }
> +#else
> +static inline int mtd_has_partitions(void) { return 0; }
> +#endif
> +
> +#ifdef CONFIG_MTD_CMDLINE_PARTS
> +static inline int mtd_has_cmdlinepart(void) { return 1; }
> +#else
> +static inline int mtd_has_cmdlinepart(void) { return 0; }
> +#endif

I'm not sure stylewise this is the best way. Even though #ifdefs stays
outside of functions, this is a case where maybe it's better to put it
inside or rething the need / usage for these functions.

> +static int nand_davinci_calculate_1bit(struct mtd_info *mtd,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 const u_char *dat, u_char *ecc_code)

(and others)

My beef here is the use of u_char. This is really not a standart C
type or a standart Linux type (u8/u32 etc), so we should aim for those
(yes, I hate typing unsigned blah blah blah) but you can use u8 for
that.

> +static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, in=
t len)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> +
> + =A0 =A0 =A0 if ((0x03 & ((unsigned)buf)) =3D=3D 0 && (0x03 & len) =3D=
=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioread32_rep(chip->IO_ADDR_R, buf, len >> 2=
);
> + =A0 =A0 =A0 else if ((0x01 & ((unsigned)buf)) =3D=3D 0 && (0x01 & len) =
=3D=3D 0)

What are those 0x03 and 0x01 (and other places as well), you'll have
to spell out those, preferably using defines.

--=20
-
Thiago Galesi
