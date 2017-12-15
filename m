Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ePvWy-0008WL-1y
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 19:20:34 +0000
Date: Fri, 15 Dec 2017 20:19:55 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: ezequiel.garcia@free-electrons.com, linux-mtd@lists.infradead.org,
 "Kasper Revsbech (KREV)" <krev@triax.com>, Boris Brezillon
 <Boris.Brezillon@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171215201955.2431195c@xps13>
In-Reply-To: <45D7D798-BA86-41CD-AB56-156C1BD7FCC4@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <a2502de6-b4c7-befb-6a08-de976be85d17@prevas.dk>
 <f70d94b8-5fc7-d091-9a5c-77597d2b7aa4@prevas.dk>
 <20171211150200.51c7f3b4@xps13> <20171211150929.722a361a@xps13>
 <a5fc7dea-a043-370c-b18a-eeb8f1f067f4@prevas.dk>
 <20171212095119.475de032@xps13>
 <727489cf-d1f6-8777-c6f4-981127657c9d@prevas.dk>
 <20171212111227.4946cc15@xps13>
 <e9e6bf70-918f-b750-5893-55744dc34882@prevas.dk>
 <20171212120806.7c31463f@xps13>
 <a0267c71-4333-7dd4-dcf4-14aced37f8f9@prevas.dk>
 <20171212123523.48185f21@xps13>
 <75bd6b87-12ed-4003-262a-b1bd03a62cbd@prevas.dk>
 <20171212134706.49f3c57e@xps13>
 <2f16ce90-6e00-c95f-7a81-5603d9acf574@prevas.dk>
 <20171212143512.3b62d3f5@xps13>
 <48EEEC1C-954B-42E5-92BE-A00AD97A5789@prevas.dk>
 <20171212192327.57b1fa80@xps13>
 <9f578b28-ef3b-8e84-0a8c-b70c494efff0@prevas.dk>
 <20171213094105.73646658@xps13> <20171215182512.2449af9e@xps13>
 <45D7D798-BA86-41CD-AB56-156C1BD7FCC4@prevas.dk>
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

Hi Sean,

On Fri, 15 Dec 2017 19:56:27 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Miquel
>=20
> >I am very sorry for the delay but it took me some time to figure a
> >way to reproduce your situation until I started doing the exact
> >sequence I asked you to follow. It turns out there was a nasty error
> >in the parser so you could not observe the last blocks of your chip
> >because I messed up with high addresses. =20
>=20
> Fantastic always nice to be able to reproduce the issue. Glad to be
> able to help :-)
>=20
> >
> >I updated the Github branch [1], can you rebase on top of it? I think
> >this time we should get something :) =20
>=20
> I just did a quick boot with the new commits, and the kernel is able
> to find the bbt table :-)

Good ! :-)

So with nand-ecc-mode =3D "none" + on-flash-bbt, there is no more issue,
right?

>=20
> I also tried booting with ECC enabled and with that enabled the
> driver is unable to read the bbt and marked all blocks bad.

And if I understand correctly, if you remove nand-ecc-mode =3D "none" (or
set it to "hw"), the kernel fails to find the BBT, that is right?

As I was not expecting such a quick answer, I did push another patch
after sending my email that fixes an issue in mtdcore.c, please check
you have it (there are a few "fixup!" patches, and on top of them you
must find one which is a well-formatted patch about
mtd_check_oob_ops()).

I learned that today: to get a prompt while all blocks are bad, you can
add:

    chip->options |=3D NAND_SKIP_BBTSCAN;

Before nand_scan_tail().

If you can reach a prompt with the failing configuration and when you
will have the time, I will welcome a dump of the same area as before
so we will try to understand what is wrong now ! :)

Thank you,
Miqu=C3=A8l
