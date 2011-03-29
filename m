Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4ZOG-0005UX-BJ
	for linux-mtd@lists.infradead.org; Tue, 29 Mar 2011 13:55:25 +0000
Date: Tue, 29 Mar 2011 15:55:19 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH/RFC v4 1/3] Shared BCH ECC library
In-Reply-To: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
Message-ID: <Pine.LNX.4.64.1103291534110.25520@lnxricardw.se.axis.com>
References: <1fb708d8d49cdd83e62424fb77912418f5c92d69.1299836869.git.ivan.djelic@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 11 Mar 2011, Ivan Djelic wrote:

> The first patch of this series contains a new generic BCH ECC library.
>
> This library can be used to provide software BCH correction on NAND=20
> devices (see 2nd and 3rd patch), as well as error correction for hybrid=
=20
> hardware BCH engines.
> ...

I've been trying to apply this patch series in order to evaluate how fast=
=20
BCH is compared to the existing 1-bit ECC algorithm in order to get some=20
idea of the performance hit incurred in practice once higher-order ECC=20
correction becomes necessary.

I've therefore applied the patch series on a Mips system running Linux=20
2.6.35 (we don't have the latest kernel ported to our platform yet).. Yes,=
=20
I realize that's not the latest kernel version, on the other hand, i can't=
=20
see anything in the patch that seems to depend on anything recent in mtd.=
=20
You basically have a BCH library, and a small nand driver implementing ECC=
=20
functionality using the library, plus corresponding modifications to some=
=20
mtd nand files to incorporate the library. The patch didn't apply cleanly,=
=20
but it was fairly obvious where all the bits should go.

The problem I have is I can't get the correction to work properly. I've=20
set up our nand flash driver to use the default setting of eccsize =3D 512=
=20
bytes and eccbytes =3D 7 to get 4-bit error correction capability per 512=
=20
bytes.

When writing to the flash, I get 28 bytes per 2048 byte page, at the end=20
of each OOB as expected.

When reading, if there are no bit errors in the read data, everything=20
works fine.

However, if I introduce a single bit error in the page, bch_decode() fails=
=20
with -EBADMSG, and some further debugging reveals that=20
bch.c:compute_error_locator_polynomial() returns 4 in this particular=20
case, whereas bch.c:find_poly_roots() returns 0, the two don't match, and=
=20
the function exits with an error. I'm no wizard with the algorithms used=20
so i have no idea what is reasonable. I would assume both would return 1,=
=20
as there is one bit error that I've introduced.

I made a test, removing the return 0 in the if clause in the middle of=20
bch_decode() to see what would happen if I don't just return early when=20
all is ok. In this case the aforementioned routines seem to return 0 as=20
expected.

I've dumped the read and calculated ECC and it looks like they are being=20
generated as expected; indeed, if there was a fault there reading ok pages=
=20
would also fail.

I'm a bit bewildered, as the algorithm appearently has been tested on a=20
Mips (albeit under QEMU). Of course it's very likely that I've made a=20
mistake somewhere, in that case it must be in the set-up, as the two files=
=20
which actually implement the algorithm are new and not patches to existing=
=20
files. I was thinking it was perhaps an endianess problem (our MIPS is=20
little-endian), but I see it's been tested on x86 too so it shouldn't be=20
that.

Any ideas?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
