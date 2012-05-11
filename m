Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSs7Q-0005Hh-Q7
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 15:51:01 +0000
From: "Mohammed, Afzal" <afzal@ti.com>
To: Ivan Djelic <ivan.djelic@parrot.com>, Artem Bityutskiy
 <dedekind1@gmail.com>, Tony Lindgren <tony@atomide.com>
Subject: RE: [PATCH v3] ARM: OMAP3: gpmc: add BCH ecc api and modes
Date: Fri, 11 May 2012 15:50:51 +0000
Message-ID: <C8443D0743D26F4388EA172BF4E2A7A93E98B337@DBDE01.ent.ti.com>
References: <1335442669-13474-1-git-send-email-ivan.djelic@parrot.com>
 <20120509002927.GF5088@atomide.com> <20120509081047.GC17333@parrot.com>
 <20120509153141.GI5088@atomide.com>
 <1336655257.2625.8.camel@sauron.fi.intel.com>
 <20120510151725.GA11107@parrot.com> <1336665138.2243.1.camel@brekeke>
 <20120510174527.GA11275@parrot.com>
In-Reply-To: <20120510174527.GA11275@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

On Thu, May 10, 2012 at 23:15:27, Ivan Djelic wrote:
> > > So, when Afzal's patches are pushed, I'll submit a new, single MTD pa=
tch.
> >=20
> > But this is not going to happen this merge window as I understood, may
> > be not even the next one. We need to make UBIFS happy sooner than that,
> > I think. So may be we go forward with your original patch?
>=20
> I'm OK with this too, as the patches are ready and tested.
> The MTD patch is [2], it depends on [1] which has been pushed, then dropp=
ed by Tony.
> Do you need me to repost [2] ?
>=20
> Tony, sorry to backpedal on this: would you re-push patch [1], if indeed =
Afzal's patches
> are not going to be merged soon ? In the meantime, I can prepare a patch =
on top of Afzal's to
> have a smooth transition w.r.t BCH support. What do you think ?

A new series [A-D] has been sent for handling GPMC NAND registers by NAND d=
river
itself. This is being targeted for 3.5. Hopefully if every one is in agreem=
ent, we
can avoid patching for BCH support again when GPMC driver migration happens=
. And
the effect of GPMC driver migration on NAND driver can be reduced when it h=
appens.

Can you try a patch on top of this series & checks if it works for you, if =
more is
required from my side let me know.

Regards
Afzal

[A] http://marc.info/?l=3Dlinux-omap&m=3D133675113218509&w=3D2
[B] http://marc.info/?l=3Dlinux-omap&m=3D133675123118577&w=3D2
[C] http://marc.info/?l=3Dlinux-omap&m=3D133675123718579&w=3D2
[D] http://marc.info/?l=3Dlinux-omap&m=3D133675124818580&w=3D2
