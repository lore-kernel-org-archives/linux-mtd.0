From: "Manjunathappa, Prakash" <prakash.pm@ti.com>
To: "Manjunathappa, Prakash" <prakash.pm@ti.com>, Samuel Ortiz
 <sameo@linux.intel.com>
Subject: RE: [PATCH v5 2/3] arm:davinci: move emif driver to mfd framework
Date: Wed, 29 Feb 2012 07:01:52 +0000
Message-ID: <A73F36158E33644199EB82C5EC81C7BC3176D90F@DBDE01.ent.ti.com>
References: <y> <1330005504-25321-3-git-send-email-prakash.pm@ti.com>
 <20120227142638.GN27687@sortiz-mobl>
 <A73F36158E33644199EB82C5EC81C7BC3176D103@DBDE01.ent.ti.com>
In-Reply-To: <A73F36158E33644199EB82C5EC81C7BC3176D103@DBDE01.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "davinci-linux-open-source@linux.davincidsp.com"
 <davinci-linux-open-source@linux.davincidsp.com>,
 "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Samuel,

On Tue, Feb 28, 2012 at 11:14:39, Manjunathappa, Prakash wrote:
> Hi Samuel,
>=20
> On Mon, Feb 27, 2012 at 19:56:38, Samuel Ortiz wrote:
> [snip]
> > So it seems you're passing a platform devices array through your mfd ae=
mif
> > platform data pointer. And from what I can see, it's mostly a 1 entry a=
rray
> > (for the NAND case) or a 2 entries array (for the NAND and NOR case).
> > In that case, adding an MFD driver in the middle brings basically nothi=
ng but
> > confusion and overhead (and 200+ lines of code).
> > So unless someone explains to me how this is doing any good to the kern=
el in
> > general, I'm not going to take this patchset.
> >=20
> > Cheers,
> > Samuel.
> >
>=20
> In this way we trying to isolate future modification of aemif driver not =
to depict
> as platform code change, the need for this is based on discussion in belo=
w thread
> http://davinci-linux-open-source.1494791.n2.nabble.com/PATCH-arm-davinci-=
configure-davinci-aemif-chipselects-through-OF-tt7059739.html#none
>=20
> Earlier also concern was expressed to move aemif driver out of arch/arm t=
o drivers folder.
> Here is the link for the same: http://lists.infradead.org/pipermail/linux=
-mtd/2011-August/037308.html
> Since aemif driver supports NAND/NOR devices, we feel MFD is the place ho=
lder.
>=20
> Thanks,
> Prakash

Some more information which I missed out earlier:
DaVinci AEMIF is an async memory interface, driver for which was implemente=
d in
arch/arm/mach-davinci/aemif.c. It can be interfaced to NAND, NOR and other
asynchronous memories. Currently it just provides an API for timing value
configuration. The API is invoked by the MTD NAND driver.=20

Specification here: http://www.ti.com/lit/ug/sprue20c/sprue20c.pdf

Reason for moving it to MFD frame work:
1) AEMIF is also present on devices belonging to arch-c6x and arch-omap2 ar=
chitectures.
   So having the driver in architecture neutral place seems to be the way t=
o go.
2) Other than NAND/NOR there are use cases where people are interfacing oth=
er devices,
   for eg: FPGAs through UIO framework. So MTD is not the place for AEMIF d=
river.

Taking above points into consideration Arnd Bergmann suggested to move AEMI=
F driver to
MFD framework. Here is the link:
http://lists.ozlabs.org/pipermail/devicetree-discuss/2011-December/010295.h=
tml

Thanks,
Prakash
