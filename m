Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SJ1pW-0003O0-OZ
 for linux-mtd@lists.infradead.org; Sat, 14 Apr 2012 12:11:51 +0000
Date: Sat, 14 Apr 2012 14:11:05 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
Message-ID: <20120414121105.GB6207@parrot.com>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
 <loom.20120329T173823-262@post.gmane.org>
 <1334330445.2544.83.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1334330445.2544.83.camel@sauron.fi.intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matteo Mattei <matteo.mattei@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 13, 2012 at 04:20:45PM +0100, Artem Bityutskiy wrote:
> > > On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
> > > > Hi guys,
> > > >=20
> > > > I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
> > > >=20
> > > > I already posted some requests to TI forum but I have no answers up=
 to now:
> > > > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875

Hello Matteo,

I have been using a very similar setup (2.6.32 + OMAP3630), and I added BCH=
 support
(8-bit correction) to the mtd omap2 driver, using the BCH library (not TI i=
mplementation).
My patch corrects bitflips on empty space (erased pages), so that UBIFS doe=
s not choke on corrupted empty space.

I posted a patch a while ago, albeit for a more recent kernel version:
http://lists.infradead.org/pipermail/linux-mtd/2011-October/038207.html
bit I did not get much feedback from TI maintainers.

If you have some trouble backporting this patch to your kernel, let me know=
, I may
have an old 2.6.32 version of the patch somewhere on my hdd :).

BR,
--
Ivan

> >=20
> > Hi Aartem,
> > I have some updates (also a BCH fix) as reported here:
> > http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx
> >=20
> > Anyway the read-only mounting persists.
> > I have errors also at run time (without power cuts) simply performing v=
ery=20
> > frequent and stressful reading/writing operations (using dd and md5sum =
with 8=20
> > parallel processes).
>=20
> Does BCH in your tree protects the free space? CCing Ivan, just in case.
> Preserving more than usual of the context for him.
>=20
> >=20
> > At this point I am wondering:
> > 1- Is possibile that the "unstable bits" issue happens also during run-=
time=20
> > simply reading and writing?
>=20
> Not as far as I know.
>=20
> > 2- How can I do to tolerate bit-flips in the empty space?
