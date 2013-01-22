Received: from utopia.booyaka.com ([74.50.51.50])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TxTaT-0003Ep-NI
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2013 02:27:46 +0000
Date: Tue, 22 Jan 2013 02:27:44 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 1/3] mtd nand : onfi need to be probed in 8 bits mode
In-Reply-To: <alpine.DEB.2.00.1301161713380.32170@utopia.booyaka.com>
Message-ID: <alpine.DEB.2.00.1301220226530.25789@utopia.booyaka.com>
References: <1352199105-30215-1-git-send-email-matthieu.castet@parrot.com>
 <1354530053.30168.183.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1212240023100.17282@utopia.booyaka.com>
 <50E40336.2080008@parrot.com>
 <alpine.DEB.2.00.1301031704460.8721@utopia.booyaka.com>
 <50F6B904.5000600@parrot.com>
 <alpine.DEB.2.00.1301161713380.32170@utopia.booyaka.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
 BOUNDARY="843723315-1431612762-1358821664=:25789"
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--843723315-1431612762-1358821664=:25789
Content-Type: TEXT/PLAIN; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi Matthieu,

On Wed, 16 Jan 2013, Paul Walmsley wrote:

> On Wed, 16 Jan 2013, Matthieu CASTET wrote:
>=20
> > Paul Walmsley a =E9crit :
> > > On Wed, 2 Jan 2013, Matthieu CASTET wrote:
> >=20
> > > .... which did not get merged because Tony requested that it should b=
e=20
> > > based on top of his cleanup work (which takes priority over adding ne=
w=20
> > > features):
> > >=20
> > > http://thread.gmane.org/gmane.linux.ports.arm.omap/88550/focus=3D8854=
9
> > >=20
> > > Could you please update this "omap3 nand : use NAND_BUSWIDTH_AUTO" pa=
tch=20
> > > on v3.8-rc2 and repost?
> >=20
> > Do you know when this patchset will be submited to mtd ?
> > I think I will wait it is merged in mtd and redo my patch after that.
>=20
> As far as I know, it was merged during the v3.8 merge window.  So it's=20
> already in mainline. =20

Any progress on updating and resending your "omap3 nand : use=20
NAND_BUSWIDTH_AUTO" patch?  We're in danger of missing the 3.9 merge=20
window if it takes too much longer.


- Paul
--843723315-1431612762-1358821664=:25789--
