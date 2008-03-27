Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JeoB4-0004de-BP
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 09:13:43 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: OF compatible MTD platform RAM driver ?
Date: Thu, 27 Mar 2008 10:13:32 +0100
References: <200803101606.39184.laurentp@cse-semaphore.com>
	<200803251914.24021.laurentp@cse-semaphore.com>
	<47EA4741.2050402@ru.mvista.com>
In-Reply-To: <47EA4741.2050402@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200803271013.32612.laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org,
	Rune Torgersen <runet@innovsys.com>, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 26 March 2008 13:53, Sergei Shtylyov wrote:
> Laurent Pinchart wrote:
>=20
> >>>Regarding non-volatility nothing prevents a user from using a=20
> >>>volatile RAM as an MTD device, but there's little point in doing so.
> >>>Would it be acceptable for the "linear-nvram" specification
> >>>not to include > volatile RAM ? ROM chips would be excluded too. Is
>=20
> >>that an issue ?
>=20
> >>We actually use a volatile ram (SRAM) as an MTD device. We use it to
> >>store info from bootloader and system specific values between resets.
>=20
> > So we're left with two main options.
>=20
> > - Reusing the nvram device type from the Device Support Extensions.=20
Volatile=20
> > devices wouldn't be supported, and we'd need a separate device=20
specification=20
> > for linear-mapped volatile RAMs. I'm not very happy with that.
>=20
> > - Using another device node with a compatible value set to "linear-ram"=
=20
(or=20
> > something similar). This would support both volatile and non-volatile=20
> > devices, and a property could be added to specify if the device is=20
volatile=20
> > or not.
>=20
> > I'd go for the second option, and I'd specify a "linear-rom" compatible=
=20
value=20
> > as well while we're at it.
>=20
> > Both volatile and non-volatile RAMs can be handled by the physmap_of MT=
D=20
> > driver. They both use the same map probe type ("map_ram"). Volatility=20
isn't=20
> > handled there.
>=20
> > ROMs should be handled by the same driver and should use the "mtd_rom" =
map=20
> > probe type.
>=20
>     OK, let's go with it.
>=20
> > As all those devices use the physmap_of MTD driver, what about=20
> > using "physmap-ram" and "physmap-rom" as compatibility names ?
>=20
>     Heh, we've gone thru "physmap" before -- it was labelled Linux-specif=
ic=20
> name (well, I'd agree with that).

physmap stands for physically mapped. That doesn't sound Linux-specific to =
me,=20
the fact that the MTD driver has the same name is a pure coincidence.=20
linmap-rom and linmap-rom sound even more Linux-specific :-)

Could we agree on a name ? I'd like to submit a new patch.

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
