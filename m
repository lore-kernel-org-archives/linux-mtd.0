Date: Mon, 18 Apr 2016 16:47:20 +0200
From: Stefan Christ <s.christ@phytec.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Markus Pargmann <mpa@pengutronix.de>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Huang Shijie <shijie.huang@intel.com>,
 Han Xu <han.xu@nxp.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Message-ID: <20160418144720.GA2674@lws-christ>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <7168760.YSQBa3GsdA@adelgunde> <20160415103508.5f6bc8c8@bbrezillon>
 <33206452.D8BR53ndXi@adelgunde>
 <20160415113906.7f971cec@bbrezillon>
MIME-Version: 1.0
In-Reply-To: <20160415113906.7f971cec@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

On Fri, Apr 15, 2016 at 11:39:06AM +0200, Boris Brezillon wrote:
> Hi Markus,
>=20
> On Fri, 15 Apr 2016 11:35:07 +0200
> Markus Pargmann <mpa@pengutronix.de> wrote:
>=20
> > Hi Boris,
> >=20
> > On Friday 15 April 2016 10:35:08 Boris Brezillon wrote:
> > > Hi Markus,
> > >=20
> > > On Fri, 15 Apr 2016 09:55:45 +0200
> > > Markus Pargmann <mpa@pengutronix.de> wrote:
> > >=20
> > > > On Wednesday 13 April 2016 00:51:55 Boris Brezillon wrote:
> > > > > On Tue, 12 Apr 2016 22:39:08 +0000
> > > > > Han Xu <han.xu@nxp.com> wrote:
> > > > >=20
> > > > > > > Thanks for the feedback. Talking with a coworker about this w=
e may have found a
> > > > > > > better approach to this that is less complicated to implement=
. The hardware
> > > > > > > unit allows us to set a bitflip threshold for erased pages. T=
he ECC unit
> > > > > > > creates an ECC error only if the number of bitflips exceeds t=
his threshold, but
> > > > > > > it does not correct these. So the idea is to change the patch=
 so that we set
> > > > > > > pages, that are signaled by the ECC as erased, to 0xff comple=
tely without
> > > > > > > checking. So the ECC will do all the work and we completely t=
rust in its
> > > > > > > abilities to do it correctly.
> > > > > >=20
> > > > > > Sounds good.
> > > > > >=20
> > > > > > some new platforms with new gpmi controller could check the cou=
nt of 0 bits in page,
> > > > > > refer to my patch https://patchwork.ozlabs.org/patch/587124/
> > > > > >=20
> > > > > > But for all legacy platforms, IMO, considering bitflip is rare =
case, set threshold to 0 and
> > > > > > only check the uncorrectable branch and then correct data sound=
s better. Setting threshold
> > > > > > and correcting all erased page may highly impact the performanc=
e.
> > > > >=20
> > > > > Indeed, bitflips in erased pages is not so common, and penalizing=
 the
> > > > > likely case (erased pages without any bitflips) doesn't look like=
 a good
> > > > > idea in the end.
> > > >=20
> > > > Are erased pages really read that often?
> > >=20
> > > Yes, it's not unusual to have those "empty pages?" checks (added Artem
> > > and Richard to get a confirmation). AFAIR, UBIFS check for empty pages
> > > in its journal heads after an unclean unmount (which happens quite
> > > often) to make sure there's no corruption.
> > >=20
> > > > I am not sure how UBI handles
> > > > this, does it read every page before writing?
> > >=20
> > > Nope, or maybe it does when you activate some extra checks.
> > >=20
> > > >=20
> > > > >=20
> > > > > You can still implement this check in software. You can have a lo=
ok at
> > > > > nand=5Fcheck=5Ferased=5Fecc=5Fchunk() [1] if you need an example,=
 but you'll
> > > > > have to adapt it because your controller does not guarantees that=
 ECC
> > > > > bits for a given chunk are byte aligned :-/
> > > >=20
> > > > Yes I used this function in the patch. The issue is that I am not q=
uite
> > > > sure yet where to find the raw ECC data (without rereading the page=
).
> > > > The reference manual is not extremely clear about that, ecc data ma=
y be
> > > > in the 'auxilliary data' but I am not sure that it really is availa=
ble
> > > > somewhere.
> > >=20
> > > AFAIR (and I'm not sure since it was a long time ago), you don't have
> > > direct access to ECC bytes with the GPMI engine. If that's the case,
> > > you'll have to read the ECC bytes manually (moving the page pointer
> > > using ->cmdfunc(NAND=5FCMD=5FRNDOUT, column, -1)), which is a pain wi=
th
> > > this engine, because ECC bytes are not guaranteed to be byte aligned
> > > (see gpmi ->read=5Fpage=5Fraw() implementation).
> > > Once you've retrieved ECC bytes (or bits in this case), for each ECC
> > > chunk, you can use the nand=5Fcheck=5Ferased=5Fecc=5Fchunk() function=
 (just make
> > > sure you're padding the last ECC byte of each chunk with ones so that
> > > bitflips cannot be reported on this section).
> >=20
> > Thanks for the information. So I understand that this approach is the
> > preferred one to avoid any performance issues for normal operation.
> >=20
> > I actually won't be able to fix this patch accordingly for some time. If
> > anyone else needs this earlier, feel free to implement it.
>=20
> I just did [1] (it applies on top of your patch), but maybe you
> can test it (I don't have any imx platforms right now) ;).
>=20
> If these changes work, feel free to squash them into your previous
> patch.

I've tested your diff onto Markus Pargmann's patch. It looks promising.

However I've noticed that the calculation of the ECC parity bits position is
wrong.  It doesn't consider the extra metadata bytes at the beginning of the
raw page and that the ECC parity bits are at the end of the ECC chunk. My t=
est
platform is the i.MX6 with two NAND flashes

    nand: Samsung NAND 1GiB 3,3V 8-bit
    nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
    (-> 104 Bits ECC )

and
=20
    nand: AMD/Spansion S34ML08G2
    nand: 1024 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
    (-> 234 Bits ECC )

I've also tested the bit alignment code. It works correctly for the Spansion
NAND, as the 234 Bits of ECC are 29.25 Bytes on the NAND flash. So there the
parity bits are not byte aligned.

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
        Stefan Christ

The corrected ECC parity bit code is:

---->8----
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi=
-nand/gpmi-nand.c
index 2f16d7f..ccae6e6 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1054,7 +1054,9 @@ static int gpmi=5Fecc=5Fread=5Fpage(struct mtd=5Finfo=
 *mtd, struct nand=5Fchip *chip,
 			int flips;
=20
 			/* Read ECC bytes into our internal raw=5Fbuffer */
-			offset =3D ((8 * nfc=5Fgeo->ecc=5Fchunk=5Fsize) + eccbits) * i;
+			offset =3D nfc=5Fgeo->metadata=5Fsize * 8;
+			offset +=3D ((8 * nfc=5Fgeo->ecc=5Fchunk=5Fsize) + eccbits) * (i + 1);
+			offset -=3D eccbits;
 			bitoffset =3D offset % 8;
 			eccbytes =3D DIV=5FROUND=5FUP(offset + eccbits, 8);
 			offset /=3D 8;
