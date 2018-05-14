Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fI7z9-00010l-48
 for linux-mtd@lists.infradead.org; Mon, 14 May 2018 07:33:32 +0000
Date: Mon, 14 May 2018 09:33:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Ungerer <gerg@kernel.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, gerg@linux-m68k.org
Subject: Re: linux-4.17-rc4 marvell-nand.c driver problems
Message-ID: <20180514093307.48f1d26b@xps13>
In-Reply-To: <e1311707-61aa-81f0-1a37-003061560acd@kernel.org>
References: <579454cc-ad92-8fdc-a1ac-f7c57eb56606@kernel.org>
 <20180511100227.6e016b48@bbrezillon>
 <e1311707-61aa-81f0-1a37-003061560acd@kernel.org>
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

Hi Greg,

On Mon, 14 May 2018 09:53:26 +1000, Greg Ungerer <gerg@kernel.org>
wrote:

> Hi Boris,
>=20
> On 11/05/18 18:02, Boris Brezillon wrote:
> > On Fri, 11 May 2018 17:11:28 +1000
> > Greg Ungerer <gerg@kernel.org> wrote: =20
> >> I have a hardware platform built around the Armada 370 using NAND flas=
h.
> >> Its old hardware, and has run pretty much every kernel version from
> >> 3.10 up to 4.16 with no problems. The flash is 128Mbyte SLC from vario=
us
> >> vendors (Spansion, Micron, etc).
> >>
> >> It has always been using the pxa3xx_nand.c driver up to now. With that
> >> gone in 4.17 I am trying out the marvell_nand.c driver. I am getting
> >> a dump just after startup:
> > > Can you try to cherry-pick this commit [1] (it should appear in =20
> > 4.17-rc5). =20
>=20
> That fixes the problem. Thanks for the quick response.
>=20


Sorry for the delay, good to know it fixed your setup, sorry for the
inconvenience.

Thanks,
Miqu=C3=A8l

--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
