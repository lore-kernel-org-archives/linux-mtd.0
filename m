Received: from mail.savoirfairelinux.com ([209.172.62.77])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8sms-0008Do-G2
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 14:07:59 +0000
Date: Mon, 12 Aug 2013 10:06:51 -0400 (EDT)
From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <1639305882.172123.1376316411000.JavaMail.root@mail>
In-Reply-To: <CAN8TOE8Gc=ftDxZFXD8g+tJDOP+hi74NX2NMNLtnzEdUuAut-A@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte
 addressing
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, kernel@savoirfairelinux.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

----- Mail original -----
> De: "Brian Norris" <computersforpeace@gmail.com>
> =C3=80: "Marek Vasut" <marex@denx.de>
> Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org, "Vivien Didelo=
t" <vivien.didelot@savoirfairelinux.com>
> Envoy=C3=A9: Dimanche 11 Ao=C3=BBt 2013 22:44:31
> Objet: Re: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte add=
ressing
>=20
> On Fri, Aug 9, 2013 at 11:46 AM, Marek Vasut <marex@denx.de> wrote:
> > Dear Brian Norris,
> >
> >> For SPI NOR flash that are larger than 128Mbit (16MiB), we need 4
> >> bytes
> >> of address space to reach the entire flash; however, the original
> >> SPI
> >> flash protocol used only 3 bytes for the address. So far, the
> >> practice
> >> for handling this has been either to use new command opcodes that
> >> are
> >> defined to use 4 bytes for their address, or to use special
> >> mode-switching command to configure all
> >> traditionally-3-byte-address
> >> commands to take 4 bytes instead.
>=20
> [snip long description of a mess]
>=20
> > The situation with the 4b addressing is a horrible mess :(
>=20
> Agreed. It took me a while to figure out that this was the root of my
> problems last week.
>=20
> > Acked-by: Marek Vasut <marex@denx.de>
>=20
> Thanks.
>=20
> Brian
>=20

I'm just adding kernel@savoirfairelinux.com in the loop.

Thanks,
Vivien.
