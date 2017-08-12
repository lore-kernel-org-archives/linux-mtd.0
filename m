Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dgaOe-0006hO-Mg
 for linux-mtd@lists.infradead.org; Sat, 12 Aug 2017 17:40:27 +0000
Date: Sat, 12 Aug 2017 19:39:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sanjay Tandel <sanjay.tandel@rockwellcollins.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Weber
 <matthew.weber@rockwellcollins.com>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] map-ram chip driver: 16-bit block transfer
Message-ID: <20170812193947.046dafd1@bbrezillon>
In-Reply-To: <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
References: <1501851740-14125-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170809201047.57fd6976@bbrezillon>
 <CAB0kKmyHPXhv4ovmj00JgB9gow0Qi3OHm2Gh4STJFNV4S3o_Ag@mail.gmail.com>
 <CAK8P3a3W2Dw_CHDbBXPaX9=mNA1kPXdFDR1F4HLbtuLUVHjUKw@mail.gmail.com>
 <CAB0kKmyBEVWXvNBiFsFXSxz21mEFu8WVW69DWoes9oKsYEM0Vw@mail.gmail.com>
 <CAK8P3a1ooJja=P1e+m-fd0_wR_QdmWgwRWDwOWJfXpDR5ZcSjg@mail.gmail.com>
 <CAB0kKmxXvm5=ryR2nAJ76=ecmOWXLQXNYfRs8zrwinfMOMDzRQ@mail.gmail.com>
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

Le Fri, 11 Aug 2017 18:42:44 -0500,
Sanjay Tandel <sanjay.tandel@rockwellcollins.com> a =C3=A9crit :

> On Fri, Aug 11, 2017 at 4:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Fri, Aug 11, 2017 at 11:03 PM, Sanjay Tandel
> > <sanjay.tandel@rockwellcollins.com> wrote: =20
> >> On Fri, Aug 11, 2017 at 2:41 PM, Arnd Bergmann <arnd@arndb.de> wrote: =
=20
> >>> On Fri, Aug 11, 2017 at 6:50 PM, Sanjay Tandel
> >>> On almost all ARM platforms, it would use 32-bit accesses these days.=
 On what
> >>> kernel version, ARM platform and endianess do you see memcpy_toio() u=
se 8-bit
> >>> access?
> >>> =20
> >>
> >> We use version 4.1.8 with Freescale LS1021A( cortex-a7 core, little-en=
dian).
> >> With the newer versions of kernel also, I can see same 8-bit
> >> implementation for 32-bit ARM arch. =20
> >
> > I see. Commit 7ddfe625cbc1 ("ARM: optimize
> > memset_io()/memcpy_fromio()/memcpy_toio()")
> > was merged in linux-4.2 and changed this to use mostly 32-bit accesses =
and a
> > bug in it fixed in commit 1bd46782d08b ("ARM: avoid unwanted GCC
> > memset()/memcpy() optimisations for IO variants").
> >
> > =20
> >> BTW, for other arch also memcpy_toio()  uses combination of  32-bit(or
> >> 64-bit) and 8-bit accesses,
> >> which may not work here.Because we need all accesses to be of same
> >> size(bank-width). =20
> >
> > Could you try with a newer kernel or with the 7ddfe625cbc1/1bd46782d08b
> > commits backported to see if that works for you though? At the very lea=
st that
> > should impact the description of the patch we end up applying, since yo=
ur
> > current text no longer matches what the kernel does.
> > =20
>=20
> I tested back-porting commits 7ddfe625cbc1/1bd46782d08b,
> but that didn't work for me.
>=20
> Before, it used to corrupt every 2nd byte(2nd,4rth,6th ... upto N) in mem=
ory,
> with memcpy_toio() using 8-bit accesses for our 16-bit chip.
>=20
> Now, with backporting 7ddfe625cbc1/1bd46782d08b, it corrupts (N + 1)th by=
te
> in memory, when I tried to write N number of bytes (where N is not aligne=
d to
> 4-byte boundary).That means, it still tries 8-bit access for last odd byt=
e and
> ends up corrupting next byte.

Yes, that's expected as the size is not 16bit aligned.

Anyway, I read the whole thread again and AFAIU memcpy_to/fromio() is
only appropriate if the bus controller the device is connected to is
smart enough to hide all alignment problems to its users.

Don't know what controller is causing trouble here, but you should
probably have a dedicated driver (if that's not already the case) that
overloads the ->copy_from()/->copy_to() methods to do the right thing
for your memory controller.
