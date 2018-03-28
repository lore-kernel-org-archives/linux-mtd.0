Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f16VN-00057y-W5
 for linux-mtd@lists.infradead.org; Wed, 28 Mar 2018 08:32:27 +0000
Date: Wed, 28 Mar 2018 10:32:04 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: Olivier Schonken <olivier.schonken@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: Atmel Nand PMECC UBI ECC issue
Message-ID: <20180328103204.5272349a@bbrezillon>
In-Reply-To: <3546894.3QeRhpBW0o@blindfold>
References: <CALdGskLaHrZGa7u4_jmJjq1VPRv6AYgRpSsYcNy+-EtgWR0H=Q@mail.gmail.com>
 <1849050.lXIvJB3S2I@blindfold>
 <CALdGsk++QA-mHmQx+L6qumt7xaXicfdqC=iBhmda7vYB+-bNpg@mail.gmail.com>
 <3546894.3QeRhpBW0o@blindfold>
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

On Tue, 27 Mar 2018 16:08:46 +0200
Richard Weinberger <richard@nod.at> wrote:

> Oliver,
>=20
> Am Dienstag, 27. M=C3=A4rz 2018, 10:28:52 CEST schrieb Olivier Schonken:
> > Hi Richard
> >=20
> > The bytes in question is at offset 36c90. =20
>=20
> Okay. At this offset we have a UBIFS data node of length 1477.
> One bit of the UBIFS magic changed. 0x30 instead of 0x31
> Fun fact, the UBIFS CRC32 is correct. UBIFS magic and the CRC32 are not=20
> covered by the CRC.
> So, really just one bit changed, in the magic.

Looks like this problem was caused by a bug in the atmel NFC driver.
Fix is available here [1].

Regards,

Boris

[1]http://patchwork.ozlabs.org/patch/891725/
--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
