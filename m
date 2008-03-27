Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jet8k-0000UF-54
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 14:31:38 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Thu, 27 Mar 2008 15:31:34 +0100
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803271013.32612.laurentp@cse-semaphore.com>
	<20080327100304.GC10397@localhost.localdomain>
In-Reply-To: <20080327100304.GC10397@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200803271531.35401.laurentp@cse-semaphore.com>
Cc: Sergei Shtylyov <sshtylyov@ru.mvista.com>, ben@simtec.co.uk,
	linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 27 March 2008 11:03, David Gibson wrote:
> On Thu, Mar 27, 2008 at 10:13:32AM +0100, Laurent Pinchart wrote:
> > On Wednesday 26 March 2008 13:53, Sergei Shtylyov wrote:
> > > Laurent Pinchart wrote:
> [snip]
> > >     Heh, we've gone thru "physmap" before -- it was labelled
> > >     Linux-specific name (well, I'd agree with that).
> >=20
> > physmap stands for physically mapped. That doesn't sound
> > Linux-specific to me, the fact that the MTD driver has the same name
> > is a pure coincidence.  linmap-rom and linmap-rom sound even more
> > Linux-specific :-)
>=20
> It may not be Linux specific per se, but it's a bad name, because the
> fact that the device is physically direct mapped isn't a useful
> distinguishing feature of the device.  Main memory is also direct
> physically mapped, after all, but that's not what you want to cover
> with this description.  In general how a device is wired is described
> by where it sits in the tree, not by its properties.
>=20
> It only seems like a usefully distinguishing name because it's the
> Linux "physmap_of" driver that uses it.  So in this sense it is a
> Linux specific name after all.  In fact, physmap_of is itself very
> badly named - right now it only handles direct mapped mtds, but that's
> not inherent; it could be trivially extended to also instantiate a
> non-direct-mapped device (as long as the underlying mtd layer
> supported it, of course).  It bears no relation at all to the
> "physmap" driver, except historical accident.
>=20
> > Could we agree on a name ? I'd like to submit a new patch.
>=20
> For ROMs I think just plain "rom" should be sufficient.  For RAMs we
> need something to indicate that it's memory but intended for secondary
> storage, not as main memory.  Unfortunately, I'm finding myself unable
> to think of something.

What about "storage-ram", "auxiliary-ram", "secondary-ram", "application-ra=
m",
"user-ram" or "ramdisk" ?

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
