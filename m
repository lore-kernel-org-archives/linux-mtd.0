MIME-Version: 1.0
In-Reply-To: <577FAEEB8540FB4F9C91B6BB262576755905DC@XVS-DCFR-22.europe.corp.altran.com>
References: <AcrQ47RPeBz4nhRMR9ORyzmB2isxaQ==>
	<577FAEEB8540FB4F9C91B6BB262576755905DC@XVS-DCFR-22.europe.corp.altran.com>
Date: Thu, 1 Apr 2010 01:34:24 +0200
Message-ID: <x2y63386a3d1003311634l71486234n95f60e506b776948@mail.gmail.com>
Subject: Re: [PATCH] Arm nomadik : Vendor tool compatibility
From: Linus Walleij <linus.ml.walleij@gmail.com>
To: Lemetayer Jean Marie <jeanmarie.lemetayer@altran.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-arm-kernel@lists.infradead.org, dwmw2@infradead.org,
	linux@arm.linux.org.uk, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/3/31 Lemetayer Jean Marie <jeanmarie.lemetayer@altran.com>:

> +#ifdef CONFIG_VENDOR_TOOL_COMPATIBILITY
> +static struct nand_ecclayout nomadik_ecc_layout =3D {
> +=A0=A0=A0=A0=A0=A0 .eccbytes =3D 3 * 4,
> +=A0=A0=A0=A0=A0=A0 .eccpos =3D {
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 0x28, 0x29, 0x2A,
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 0x2B, 0x2C, 0x2D,
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 0x2E, 0x2F, 0x30,
> +=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0 0x31, 0x32, 0x33},
> +=A0=A0=A0=A0=A0=A0 .oobfree =3D {{0x02, 0x26}, {0x34, 0x0C} },
> +};
> +#else
> =A0static struct nand_ecclayout nomadik_ecc_layout =3D {
> =A0=A0=A0=A0=A0=A0=A0 .eccbytes =3D 3 * 4,
> =A0=A0=A0=A0=A0=A0=A0 .eccpos =3D { /* each subpage has 16 bytes: pos 2,3=
,4 hosts ECC */
> @@ -54,6 +65,7 @@ static struct nand_ecclayout nomadik_ecc_layout =3D {
> =A0=A0=A0=A0=A0=A0=A0 /* let's keep bytes 5,6,7 for us, just in case we c=
hange ECC algo */
> =A0=A0=A0=A0=A0=A0=A0 .oobfree =3D { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0=
x08}, {0x38, 0x08}
> },
> =A0};
> +#endif

Acked-by: Linus Walleij <linus.walleij@stericsson.com>

I don't think any of this layout belongs in the driver itself frankly speak=
ing,
I am facing the need to use this in U300 and we use yet *another*
ECC layout with the FSMC, so we have to add yet another #ifdef.
However I can fix that up with a patch on top of this one after it's
queued.

Yours,
Linus Walleij
