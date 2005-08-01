From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Mon, 1 Aug 2005 10:38:52 +0200
Message-ID: <000901c59674$72cdf480$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42EC6AE7.6070507@yandex.ru>
Cc: "'Artem B. Bityuckiy'" <dedekind@yandex.ru>
Subject: Re: Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> JFFS2 issued the erase command then found that the block=20
> contains some=20
> trash. That's not JFFS2's fault. Dig your flash driver/hardware.
>=20

Artem,

	where is the flash driver? Under
uClinux-dist/linux-2.4.x/drivers/mtd/chips?

Is this the low-level driver : cfi_cmdset_0002?

Under /include/linux/mtd/cfi.h I saw that "cfi_write" calls =
"map->write16()"
: where is write16 defined ?=20

...Or do I have to check blkmem.c : flash_amd16_erase, =
flash_amd16_write,
flash_amd16_writeall?

I'm sorry for these questions but I don't have the possibility to debug =
the
kernel.

Thanks for your help!

	Massimo.
