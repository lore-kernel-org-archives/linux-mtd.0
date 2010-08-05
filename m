Received: from phoenix3.szarvasnet.hu ([87.101.127.16])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh1ts-0003uQ-U5
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 14:58:29 +0000
Message-ID: <4C5AD18E.8030002@openwrt.org>
Date: Thu, 05 Aug 2010 16:58:22 +0200
From: Gabor Juhos <juhosg@openwrt.org>
MIME-Version: 1.0
To: Luigi Zambrano <luzambran@gmail.com>
Subject: Re: [PATCH 2/3] mtd: m25p80: add support for the Intel/Numonyx {16,
	32, 64}0S33B SPI flash chips
References: <AANLkTimkwt3R5CJ7-R8F=14YOwvA89bpj0jbTED4Gbmp@mail.gmail.com>
In-Reply-To: <AANLkTimkwt3R5CJ7-R8F=14YOwvA89bpj0jbTED4Gbmp@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010.08.05. 15:19 keltez=E9ssel, Luigi Zambrano =EDrta:

> Actually I=92m not sure about this patch. From the datasheet, the 16Mbi=
t
> device has 32 sectors (32*64KB =3D 16Mbit), the 32Mbit device has 64 se=
ctors
> (64*64KB =3D 32Mbit) and the 64Mbit device has 128 sectors (128*64KB =3D
> 64Mbit). So, I think the patch has to be modified in the following way
>=20
>=20
>=20
>  +       { "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
>=20
>  +       { "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
>=20
>  +       { "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
>=20

Oops, you are right. We are using this patch in OpenWrt since a year or s=
o, but
nobody noticed this so far. Good catch, thanks!

I will send a fixed version.

Regards,
Gabor
