Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZLlj-0005kJ-6c
 for linux-mtd@lists.infradead.org; Fri, 26 Feb 2016 17:01:32 +0000
Date: Fri, 26 Feb 2016 17:55:06 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring
 <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Message-ID: <20160226175506.75d6c7b0@bbrezillon>
In-Reply-To: <CACna6ryVuqSLv8WdzzGUQzpA-F35JxXoHoa2jcLzZeHaXtoexA@mail.gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <20160224144652.14068468@bbrezillon>
 <CACna6rxemvBOu9fy9KP0327TsqonO7dFY5EsQjf1k9Ln6hX8cw@mail.gmail.com>
 <20160225210946.6c842f4b@bbrezillon>
 <CACna6ryVuqSLv8WdzzGUQzpA-F35JxXoHoa2jcLzZeHaXtoexA@mail.gmail.com>
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

On Fri, 26 Feb 2016 17:30:47 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> On 25 February 2016 at 21:09, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Thu, 25 Feb 2016 20:56:36 +0100
> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> >
> >> On 24 February 2016 at 14:46, Boris Brezillon
> >> <boris.brezillon@free-electrons.com> wrote:
> >> > On Fri, 12 Feb 2016 19:11:23 +0100
> >> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> >> >
> >> >> This allows specifying algorithm used for NAND ECC. There are two
> >> >> available values: "bch" and "hamming". It's important as having just
> >> >> ECC parameters (step, strength) isn't enough to determine algorithm,
> >> >> e.g. you can't distinct BCH-1 and Hamming.
> >> >>
> >> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/mtd/nand.txt |  3 +++
> >> >>  drivers/of/of_mtd.c                            | 33 ++++++++++++++=
++++++++++++
> >> >>  include/linux/mtd/nand.h                       |  5 ++++
> >> >>  include/linux/of_mtd.h                         |  6 +++++
> >> >>  4 files changed, 47 insertions(+)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Docum=
entation/devicetree/bindings/mtd/nand.txt
> >> >> index b53f92e..a2c2df5 100644
> >> >> --- a/Documentation/devicetree/bindings/mtd/nand.txt
> >> >> +++ b/Documentation/devicetree/bindings/mtd/nand.txt
> >> >> @@ -3,6 +3,9 @@
> >> >>  - nand-ecc-mode : String, operation mode of the NAND ecc mode.
> >> >>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_o=
ob_first",
> >> >>    "soft_bch".
> >> >> +- nand-ecc-algo : string, algorithm of NAND ecc.
> >> >> +               Supported values are: "bch", "hamming". The default=
 one is
> >> >> +               "bch".
> >> >
> >> > I like the idea of specifying which ECC algorithm should be used, and
> >> > this is IMO clearer than putting the information directly in
> >> > nand-ecc-mode (as is already done for the "soft" and "soft_bch" mode=
s,
> >> > which are respectively encoding software hamming and software bch
> >> > implementations).
> >> >
> >> > But shouldn't we take this even further and add new DT properties
> >> > to encode the ECC layout (syndrome, oob_first), and another one to
> >> > specify the implementation type (software or hardware)?
> >> >
> >> > nand-ecc-layout =3D "nornal", "syndrome" or "oob_first"
> >> > nand-ecc-engine =3D "none", "soft" or "hw" ("on-die" ?)
> >> >
> >> > Note that it's not something I ask you to do right now, I just want =
to
> >> > bring the topic on the table.
> >>
> >> So far I was fine with whatever drvier/NAND core picked, didn't have
> >> any issue with it. If at some point we'll see a real need of
> >> specifying it manually as well, I guess we should do as you suggested.
> >>
> >
> > My point is that it's kind of weird to have the same information
> > duplicated in two different properties with possibly some conflicting
> > configurations, like:
> >
> >         nand-ecc-mode =3D "soft_bch"; /* software BCH implementation...=
 */
> >         nand-ecc-algo =3D "hamming"; /* ... and here you choose Hamming=
 */
> >
> > Of course this won't be a real problem until NAND core starts using
> > this property to decide which soft implementation should be used, but
> > providing a consistent binding is important IMO.
>=20
> Sorry, I didn't pay enough attention to NAND properties and missed
> your point. I was a bit surprised to see NAND_ECC_SOFT_BCH value and
> "soft_bch" as mapping. This is indeed a bit confusing.
>=20
> So I'm trying to find a proper way to split nand-ecc-mode. What you
> suggested isn't exactly clear to me. AFAIR both enums: SYNDROME and
> OOB_FIRST specify they way ECC info has to be accessed. For example
> when using NAND_ECC_HW_OOB_FIRST you have to read OOB and after that
> read data. I don't see how it's really related to the ECC layout (you
> suggested "oob_first" as possible value of nand-ecc-layout).

Because it's encoding where the ECC bytes are stored in a NAND page.
Maybe ecc-layout is not the correct name (how about nand-page-layout),
but neither ecc-mode is ;-).

>=20
> What about:
> 1) Adding new nand-ecc-algo as this patch does
> 2) Deprecating "soft_bch" value from nand-ecc-mode property
>=20

Sounds good to me.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
