Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faFO7-0008Fw-Or
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 07:06:50 +0000
Date: Tue, 3 Jul 2018 09:05:57 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Boris Brezillon
 <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: marvell_nand driver fails to suspend
Message-ID: <20180703090557.0ec5cd20@xps13>
In-Reply-To: <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
References: <68ab4512-58f2-1ade-6754-616de8d8c8d5@zonque.org>
 <9de339a6-01f9-d3a9-0271-f33933ede35b@zonque.org>
 <20180702092014.0006fee0@xps13>
 <01ca9c4b-dc20-47fa-ae3c-983b3f47b28d@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Mon, 2 Jul 2018 09:48:01 +0200:

> Hi Miquel,
>=20
> On Monday, July 02, 2018 09:20 AM, Miquel Raynal wrote:
> > Daniel Mack <daniel@zonque.org> wrote on Sun, 1 Jul 2018 21:04:58 +0200=
: =20
> >> On Sunday, July 01, 2018 12:18 PM, Daniel Mack wrote: =20
> >>> I'm seeing the below error when trying to suspend and resume a PXA3xx
> >>> machine booted from devicetree with the new nand driver. This used to
> >>> work fine with the old driver, but admittedly, the only kernel I
> >>> currently have for reference testing is very old (3.0.4), and many ot=
her
> >>> things regarding nand/mtd have also changed since then. =20
> >>>> The suspend/resume implementation in the old driver used to call int=
o =20
> >>> the ->suspend() and ->resume() functions of its mtd_info children
> >>> directly, but looking at other drivers, it seems this is no longer
> >>> needed or wanted. It also cleared all interrupts during resume, but t=
hat
> >>> alone doesn't fix it in my tests. =20
> >>>> I haven't followed the development in that area, so I'd appreciate a=
ny =20
> >>> hint on how to fix this regression. I'm happy to test patches. =20
> >>
> >> I think I figured it out. Will send a patch.
> > > Good to see you figured it out. Indeed there are no more suspend/resu=
me =20
> > callbacks, waiting for your patches to fix this. =20
>=20
> Hmm, I got confused in my test setup last night, so no, I haven't figured=
 it out yet. I've pasted the current version of the callbacks below, but th=
at doesn't cut it.
>=20
> The issue is easy to reproduce:
>=20
> # echo mem >/sys/power/state
> [wake up the device]
> # sync
>=20
> I'll give it a spin in a couple of days again, but if anything comes to y=
our mind, please let me know.
>=20
> And FTR, the device node has keep-config set for this board.

Can you try without? It should work anyway, but it would allow us to
see if it's a timing issue.

Also, can you try with the mtd-utils directly (without UBI/UBIFS) with
nanddump flash_erase and nandwrite to see what are the errors raised by
the controller driver.

Thanks,
Miqu=C3=A8l
