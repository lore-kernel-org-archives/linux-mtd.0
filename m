Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dmaiA-0006Lx-P3
 for linux-mtd@lists.infradead.org; Tue, 29 Aug 2017 07:13:24 +0000
Date: Tue, 29 Aug 2017 09:12:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sanjay Tandel
 <sanjay.tandel@rockwellcollins.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
Message-ID: <20170829091258.131cfc82@bbrezillon>
In-Reply-To: <CANQCQpbG=uBDUdKvq41x7HDJ9ft=rA4DE7eAeVnZoHrLSHDOog@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
 <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
 <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
 <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
 <20170812193947.046dafd1@bbrezillon>
 <CAK8P3a2pOtoug30CUe7sgB4CnQmRJSJMWmpniMyOHvV1w0nd9A@mail.gmail.com>
 <CANQCQpbG=uBDUdKvq41x7HDJ9ft=rA4DE7eAeVnZoHrLSHDOog@mail.gmail.com>
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

Hi Matt,

On Mon, 28 Aug 2017 21:23:41 -0500
Matthew Weber <matthew.weber@rockwellcollins.com> wrote:

> All,
>=20
> On Mon, Aug 14, 2017 at 3:08 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sat, Aug 12, 2017 at 7:39 PM, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote: =20
> >> Le Fri, 11 Aug 2017 18:42:44 -0500,
> >> Sanjay Tandel <sanjay.tandel@rockwellcollins.com> a =C3=A9crit : =20
> >>> On Fri, Aug 11, 2017 at 4:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:=
 =20
> >>> > On Fri, Aug 11, 2017 at 11:03 PM, Sanjay Tandel
> >>> > <sanjay.tandel@rockwellcollins.com> wrote: =20
> > =20
> >>> Before, it used to corrupt every 2nd byte(2nd,4rth,6th ... upto N) in=
 memory,
> >>> with memcpy_toio() using 8-bit accesses for our 16-bit chip.
> >>>
> >>> Now, with backporting 7ddfe625cbc1/1bd46782d08b, it corrupts (N + 1)t=
h byte
> >>> in memory, when I tried to write N number of bytes (where N is not al=
igned to
> >>> 4-byte boundary).That means, it still tries 8-bit access for last odd=
 byte and
> >>> ends up corrupting next byte. =20
> >>
> >> Yes, that's expected as the size is not 16bit aligned.
> >>
> >> Anyway, I read the whole thread again and AFAIU memcpy_to/fromio() is
> >> only appropriate if the bus controller the device is connected to is
> >> smart enough to hide all alignment problems to its users.
> >>
> >> Don't know what controller is causing trouble here, but you should
> >> probably have a dedicated driver (if that's not already the case) that
> >> overloads the ->copy_from()/->copy_to() methods to do the right thing
> >> for your memory controller. =20
> >
> > Right, I think that is a good conclusion. My understanding from the dis=
cussion
> > so far is that the existing code in the core mtd layer works efficientl=
y and
> > correctly on most bus interfaces, so we should keep that but have
> > workarounds in the controller driver for any bus interface where this is
> > not the case.
> >
> > I think it would be different if this was a regression and the core MTD=
 support
> > worked correctly in the past, but from what I read, it always behaved l=
ike
> > this.
> > =20
>=20
> Related to a dedicated driver, we've reworked the proposed patches
> with the following description and file list.
>=20
> This patch adds map driver for parallel flash chips interfaced over a
> NXP Integrated
> Flash Controller (IFC). This driver allows either 8-bit or 16-bit accesse=
s,
> depending on bank-width, to parallel flash chips(like Everspin MR0A16A),
> which are physically mapped to CPU's memory space. For unaligned accesses,
> it performs read-modify-write operations to keep access size same as
> bank-width.
>=20
>  Documentation/devicetree/bindings/mtd/ifc-mram.txt |  34 ++
>  drivers/mtd/maps/Kconfig                           |  13 +
>  drivers/mtd/maps/Makefile                          |   1 +
>  drivers/mtd/maps/ifc_mram.c                        | 343 +++++++++++++++=
++++++
>=20
>=20
> Thanks for taking a look before we submit,

The code is missing (we only the diffstat) :-)

> we'd like to prevent another version.

What's the problem with sending a new version the proper way?

Regards,

Boris
