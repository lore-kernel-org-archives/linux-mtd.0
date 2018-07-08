Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHeZ-00074c-Sr
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:55:37 +0000
Date: Sun, 8 Jul 2018 23:55:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 00/27] mtd: rawnand: Improve compile-test coverage
Message-ID: <20180708235523.30faa860@xps13>
In-Reply-To: <20180705094522.12138-1-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu,  5 Jul 2018
11:44:55 +0200:

> Hello,
>=20
> This is an attempt at adding "depends || COMPILE_TEST" to all NAND
> drivers that have no compile-time dependencies on arch
> features/headers.
>=20
> This will hopefully help us (NAND/MTD maintainers) in detecting build
> issues earlier. Unfortunately we still have a few drivers that can't
> easily be modified to be arch independent.
>=20
> I tried to put all patches that only touch the NAND subsystem first,
> so that they can be applied even if other patches are being discussed.
>=20
> Don't hesitate to point any missing dependencies when compiled with
> COMPILE_TEST. I didn't have any problem when compiling, but that might
> be because the dependencies were already selected.
>=20
> I have Question for Geert. I know you worked on HAS_DMA removal when
> combined with COMPILE_TEST, do you plan to do something similar with
> HAS_IOMEM?
>=20
> Regards,
>=20
> Boris
>=20

Thanks for the cleanup.

Applied patches 1-4, 6-9, 12-16, 18 and 21 to nand/next.

Waiting a v2 for patches 5 (s3c), 10-11 (orion), 17 (fsmc), and acks
for the others 19-20, 22-27.

Thanks,
Miqu=C3=A8l
