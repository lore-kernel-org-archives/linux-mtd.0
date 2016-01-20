Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLrow-0007DN-S8
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2016 12:25:08 +0000
Date: Wed, 20 Jan 2016 13:24:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Adam Somerville <adamsomerville@gmail.com>
Cc: "Bean Huo =?UTF-8?B?6ZyN5paM5paM?= (beanhuo)" <beanhuo@micron.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "zajec5@gmail.com" <zajec5@gmail.com>,
 "jteki@openedev.com" <jteki@openedev.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "furquan@google.com" <furquan@google.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] spi-nor: fix cross die reads on Micron multi-die devices
Message-ID: <20160120132433.3d201299@bbrezillon>
In-Reply-To: <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
References: <A765B125120D1346A63912DDE6D8B6310BF57A20@NTXXIAMBX02.xacn.micron.com>
 <CAJorgdvD9WCsHCoRt05tn-vh_1oqsCZiMehbVKQtynocxX_-wQ@mail.gmail.com>
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

Adam, Bean,

On Wed, 20 Jan 2016 12:01:06 +0000
Adam Somerville <adamsomerville@gmail.com> wrote:

> Hi,
>=20
> Thanks for looking at the this.
>=20
> I can rewrite so it only affects N25Q devices, I hoped a simpler
> implementation would outweigh the small overhead incurred on non
> affected devices.

I tend to think the same way: not sure the performance penalty is worth
the pain.

Best Regards,

Boris

>=20
> Do you know if there are any plans for MT25* based multi-die devices
> and if they would have the same issue?
>=20
> Thanks,
>=20
> Adam
>=20
> On Wed, Jan 20, 2016 at 2:45 AM, Bean Huo =E9=9C=8D=E6=96=8C=E6=96=8C (be=
anhuo)
> <beanhuo@micron.com> wrote:
> > Hi, Adam
> > This is true, but this only exist in Micron 65nm spi nor N25Q.
> > For our 45nm spi nor MT25Q , MT25TL and MT25Q, does exist this question.
> > So I think, can you differentiate between these in your patch?
> >
> >> From: Adam Somerville <adamsomerville@gmail.com>
> >>
> >> So as far as I can see there is a bug in the spi-nor driver when issui=
ng die
> >> boundary crossing reads on Micron multi-die devices.
> >> Micron N25Q512A, N25Q00AA and probably any other Micron multi-die
> >> devices do not support a single read request that crosses a die bounda=
ry.
> >>
> >> The current behaviour is that the address on the device wraps back to =
the
> >> start of the first die, with any data returned beyond the boundary bei=
ng from
> >> the start of the first die.
> >>



--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
