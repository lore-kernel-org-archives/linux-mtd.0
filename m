Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eQrG1-0003YU-23
 for linux-mtd@lists.infradead.org; Mon, 18 Dec 2017 08:58:47 +0000
Date: Mon, 18 Dec 2017 09:57:57 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sean =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Cc: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 <ezequiel.garcia@free-electrons.com>, <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>
Subject: Re: [SPAM] Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171218095758.245cb170@bbrezillon>
In-Reply-To: <4e25e578-f0a6-89a0-b6f8-98bda37d12de@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
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
 <20171215201955.2431195c@xps13>
 <7892957c-273b-ea58-1d50-b35e70c69e02@prevas.dk>
 <20171217141916.04e377ab@bbrezillon>
 <461b45a8-de1f-0b54-567f-001ea30ee927@prevas.dk>
 <20171217230032.30853780@bbrezillon>
 <D17E776C-669D-4C40-B673-CBE7CE5D08F6@prevas.dk>
 <20171217231952.74637510@xps13>
 <4e25e578-f0a6-89a0-b6f8-98bda37d12de@prevas.dk>
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

On Mon, 18 Dec 2017 07:23:04 +0100
Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> wrote:

> Hi Boris and Miquel
>=20
>=20
> >>>>>>>         =20
> >>>>>>>> I also tried booting with ECC enabled and with that enabled
> >>>>>>>> the driver is unable to read the bbt and marked all blocks
> >>>>>>>> bad. =20
> >>>>>>> And if I understand correctly, if you remove nand-ecc-mode =3D =20
> >>> "none" (or =20
> >>>>>>> set it to "hw"), the kernel fails to find the BBT, that is
> >>>>>>> right? =20
> >>>     =20
> >>>>>> Yes. =20
> >>>>>>> As I was not expecting such a quick answer, I did push
> >>>>>>> another =20
> >>> patch =20
> >>>>>>> after sending my email that fixes an issue in mtdcore.c,
> >>>>>>> please =20
> >>> check =20
> >>>>>>> you have it (there are a few "fixup!" patches, and on top of
> >>>>>>> them =20
> >>> you =20
> >>>>>>> must find one which is a well-formatted patch about
> >>>>>>> mtd_check_oob_ops()). =20
> >>>>>> I have rebased on top of 9aee88a618f8 mtd: Fix
> >>>>>> mtd_check_oob_ops() =20
> >>>     =20
> >>>>>>> I learned that today: to get a prompt while all blocks are
> >>>>>>> bad, =20
> >>> you can =20
> >>>>>>> add:
> >>>>>>>
> >>>>>>>        chip->options |=3D NAND_SKIP_BBTSCAN;
> >>>>>>>
> >>>>>>> Before nand_scan_tail().
> >>>>>>>
> >>>>>>> If you can reach a prompt with the failing configuration and
> >>>>>>> when =20
> >>> you =20
> >>>>>>> will have the time, I will welcome a dump of the same area as =20
> >>> before =20
> >>>>>>> so we will try to understand what is wrong now ! :) =20
> >>>>>> Nice one, a lot easier to read whats happens
> >>>>>>
> >>>>>> nanddump of BBT without ECC enabled:
> >>>>>> https://gist.github.com/anonymous/627e5be058ed93c106d61641f6aa5da0
> >>>>>>
> >>>>>> nanddump of BBT with ECC enabled:
> >>>>>> https://gist.github.com/anonymous/76b3240f156c6547cf76d59f2aae49fe
> >>>>>> bootsnippet with ECC and NAND_SKIP_BBTSCAN enabled.
> >>>>>> https://gist.github.com/anonymous/0d9be95cd9c36ff006f7aa03e7c2cc85
> >>>>>>
> >>>>>> Please let me know what traces you need to fix the ECC :-) =20
> >>>>> The dumps look good (at least, the BBT pattern is correct, we
> >>>>> have =20
> >>> the =20
> >>>>> number of ECC bytes we expect and they are where we expect them).
> >>>>>
> >>>>> My gut feeling is that something is wrong with ECC (or
> >>>>> something =20
> >>> related =20
> >>>>> to ECC) in u-boot.
> >>>>>
> >>>>> Can you try to let Linux create the BBT on its own and dump the =20
> >>> last =20
> >>>>> block as you did previously?
> >>>>>
> >>>>> So, to sum-up
> >>>>>
> >>>>> 1/ put the following in your DT
> >>>>>
> >>>>> 	nand-ecc-mode =3D "hw";
> >>>>> 	nand-on-flash-bbt;
> >>>>>
> >>>>> 2/ scrub the NAND from u-boot and make sure you don't reboot
> >>>>> after =20
> >>> that, =20
> >>>>>      so that u-boot can't recreate its own BBT.
> >>>>>
> >>>>> 3/ Let Linux boot and dump the pages (in raw mode) where BBTs =20
> >>> created by =20
> >>>>> Linux are supposed to be (should be the same addresses as
> >>>>> before) =20
> >>>> Trace with nand scrub in uboot and ecc enabled:
> >>>> https://gist.github.com/anonymous/3ce389b9276fddbd46f59c89b99ee4ff
> >>>>
> >>>> Same as above with "chip->options |=3D NAND_SKIP_BBTSCAN;" in the =20
> >>> marvell =20
> >>>> nand driver
> >>>> https://gist.github.com/anonymous/3aed159b5a5ee22f27403fe79ba97400
> >>>>
> >>>> If I dump 0xFEC0000/0xFFC0000 or 0xFEE0000/0xFFE0000 (the bbt
> >>>> pages) they contain
> >>>> only 0xFF's as the kernel does not write to the blocks.
> >>>>
> >>>> To me it seem a little bit difficult to say why the new marvell
> >>>> nand =20
> >>> driver =20
> >>>> (with ecc enabled) thinks all the freshly scrubbed blocks are
> >>>> bad. =20
> >>> Ok, now I really need the dump without the -n option. It seems that
> >>> dumping in non-raw mode does not return the expected value.
> >>>    =20
> >> How can I get the driver to write a bbt when it have marked all the
> >> blocks bad? =20
> > I think the easier way is to let U-Boot do it. So I guess you'll have
> > to reboot the board after scrubbing.
> > =20
> >> So I do a trace, without the -n option, with ecc enabled and
> >> NAND_SKIP_BBTSCAN set? Is that what you need? =20
> > It will be helpful, yes!
> > =20
> https://gist.github.com/anonymous/08049fbb46bf6df2d24a07aab8783833

Can you try to do the same, but this time without the -o option:

# nanddump -p -l 0x800 --bb=3Ddumpbad -s 0xFEC0000 /dev/mtd1

Thanks,

Boris
