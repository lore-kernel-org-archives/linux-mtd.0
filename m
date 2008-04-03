Received: from mailrelay005.isp.belgacom.be ([195.238.6.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhMTl-00067K-Cf
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 10:15:33 +0000
From: Laurent Pinchart <laurentp@cse-semaphore.com>
To: "Grant Likely" <grant.likely@secretlab.ca>
Subject: Re: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF
	bindings
Date: Thu, 3 Apr 2008 12:15:29 +0200
References: <200803311839.10519.laurentp@cse-semaphore.com>
	<fa686aa40804010616v4d6a2c8at5d3be8c32f316494@mail.gmail.com>
In-Reply-To: <fa686aa40804010616v4d6a2c8at5d3be8c32f316494@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200804031215.30314.laurentp@cse-semaphore.com>
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 01 April 2008 15:16, Grant Likely wrote:
> On Mon, Mar 31, 2008 at 10:39 AM, Laurent Pinchart
> <laurentp@cse-semaphore.com> wrote:
> >
> >  Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
> >  ---
> >   Documentation/powerpc/booting-without-of.txt |   13 ++++++++++++-
> >   1 files changed, 12 insertions(+), 1 deletions(-)
> >
> >  diff --git a/Documentation/powerpc/booting-without-of.txt=20
> >  b/Documentation/powerpc/booting-without-of.txt=20
> >  index 7b4e8a7..3e1963b 100644
> >  --- a/Documentation/powerpc/booting-without-of.txt
> >  +++ b/Documentation/powerpc/booting-without-of.txt
> >  @@ -57,7 +57,8 @@ Table of Contents
> >        n) 4xx/Axon EMAC ethernet nodes
> >        o) Xilinx IP cores
> >        p) Freescale Synchronous Serial Interface
> >  -         q) USB EHCI controllers
> >  +      q) USB EHCI controllers
> >  +      r) Memory-mapped RAM & ROM
> >
> >    VII - Specifying interrupt information for devices
> >      1) interrupts property
> >  @@ -2816,6 +2817,16 @@ platforms are moved over to use the
> >  flattened-device-tree model.=20
> >                    big-endian;
> >            };
> >
> >  +   r) Memory-mapped RAM & ROM
> >  +
> >  +    Dedicated RAM and ROM chips are often used as storage for tempora=
ry
> >  or=20
> >  +    permanent data in embedded devices. Possible usage include
> >  non-volatile=20
> >  +    storage in battery-backed SRAM, semi-permanent storage in dedicat=
ed
> >  SRAM=20
> >  +    to preserve data accross reboots and firmware storage in dedicated
> >  ROM.=20
> >  +
> >  +     - name : should be either "ram" or "rom"
> >  +     - reg : Address range of the RAM/ROM chip
> >  +
>=20
> No compatible prop?  How does the OS know what the node is to be used for?

If I understood Sergei's arguments properly, the device tree should describ=
e=20
device properties and not their intended usage. With generic devices such a=
s=20
RAM chips, platform code is responsible for binding the device to the=20
appropriate driver (mtd-ram for instance).

Cheers,

=2D-=20
Laurent Pinchart
CSE Semaphore Belgium

Chauss=E9e de Bruxelles, 732A
B-1410 Waterloo
Belgium

T +32 (2) 387 42 59
=46 +32 (2) 387 42 75
