Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jgc9i-0002St-KS
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 08:47:47 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Subject: Re: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF
	bindings
Date: Tue, 1 Apr 2008 10:47:42 +0200
References: <200803311839.10519.laurentp@cse-semaphore.com>
	<47F11A19.4050305@ru.mvista.com>
In-Reply-To: <47F11A19.4050305@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804011047.42971.laurentp@cse-semaphore.com>
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

On Monday 31 March 2008 19:06, Sergei Shtylyov wrote:
> Hello.
>=20
> Laurent Pinchart wrote:
>=20
> > Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
> > ---
> >  Documentation/powerpc/booting-without-of.txt |   13 ++++++++++++-
> >  1 files changed, 12 insertions(+), 1 deletions(-)
> >=20
> > diff --git a/Documentation/powerpc/booting-without-of.txt=20
b/Documentation/powerpc/booting-without-of.txt
> > index 7b4e8a7..3e1963b 100644
> > --- a/Documentation/powerpc/booting-without-of.txt
> > +++ b/Documentation/powerpc/booting-without-of.txt
> > @@ -57,7 +57,8 @@ Table of Contents
> >        n) 4xx/Axon EMAC ethernet nodes
> >        o) Xilinx IP cores
> >        p) Freescale Synchronous Serial Interface
> > -	  q) USB EHCI controllers
> > +      q) USB EHCI controllers
> > +      r) Memory-mapped RAM & ROM
>=20
>     Memory-mapped RA/RO Memory again? Should better drop this. :-)

You're quite picky, aren't you ? :-)

I suppose "Memory-mapped RA & RO" won't be accepted, so what about "Auxilia=
ry=20
RAM & ROM" ?

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
