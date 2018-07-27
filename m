Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fixmB-0002fl-7d
 for linux-mtd@lists.infradead.org; Fri, 27 Jul 2018 08:07:04 +0000
Date: Fri, 27 Jul 2018 10:06:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@microchip.com>,
 Josh Wu <rainyfeeling@outlook.com>, Lucas Stach <dev@lynxeye.de>
Subject: Re: [PATCH v5 12/17] mtd: rawnand: tegra: convert driver to
 nand_scan()
Message-ID: <20180727100640.715d6cce@xps13>
In-Reply-To: <81b38ddf26e981adf6a0564708d2954e@agner.ch>
References: <20180725133152.30898-1-miquel.raynal@bootlin.com>
 <20180725133152.30898-13-miquel.raynal@bootlin.com>
 <b7eded62209b18d8d0143fefbfa95905@agner.ch>
 <20180726200120.0dd4bcb7@bbrezillon>
 <81b38ddf26e981adf6a0564708d2954e@agner.ch>
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

Hi Stefan,

Stefan Agner <stefan@agner.ch> wrote on Fri, 27 Jul 2018 09:13:09 +0200:

> On 26.07.2018 20:01, Boris Brezillon wrote:
> > On Thu, 26 Jul 2018 18:29:36 +0200
> > Stefan Agner <stefan@agner.ch> wrote:
> >  =20
> >> On 25.07.2018 15:31, Miquel Raynal wrote: =20
> >> > Two helpers have been added to the core to do all kind of controller
> >> > side configuration/initialization between the detection phase and the
> >> > final NAND scan. Implement these hooks so that we can convert the dr=
iver
> >> > to just use nand_scan() instead of the nand_scan_ident() +
> >> > nand_scan_tail() pair.
> >> > =20
> >>
> >> While the patch looks technically correct, I wonder whether the driver
> >> now does what we expect it from attach logically...
> >>
> >> E.g. shouldn't we get the wp_gpio in attach? =20
> >=20
> > Well, this series does things mechanically to avoid breaking drivers (we
> > just move all the code between ident and tail into the attach hook),
> > but any resource that is not needed for the identification phase and is
> > tied to the NAND chip could/should be requested in the attach hook (the
> > WP pin is such a resource). =20
>=20
> Ok, that makes completely sense and I agree with that approach! However,
> it is not obvious when looking at the series.
>=20
> Can we mention that fact in the commit log, e.g. something like:
>=20
> "To avoid breaking this patch converts the driver mechanically by just
> moving all the code between ...ident and ..tail into the attach hook.
> Ideally driver should request all resources tied to the NAND chip in the
> attach hook."

As Boris said, the whole change was somehow mechanic, I already had a
hard time understanding what each driver wanted to achieve between
those two functions, I did not dig any further as it was already very
time consuming. A cleanup of many drivers would be appreciated though.

As this would apply to the 30 patches of the series and because I
already merged all of them, I think I'll pass for this one, even if I
completely agree with the request.

Thanks,
Miqu=C3=A8l
