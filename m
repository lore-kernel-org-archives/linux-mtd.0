Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4LAj-0001dw-48
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 07:20:47 +0000
Date: Mon, 24 Sep 2018 09:20:31 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: Trouble with new marvell_nand driver on PXA3xx
Message-ID: <20180924092031.3d4af408@xps13>
In-Reply-To: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
References: <f3cf564d-7976-5b2e-ca07-ea872c165396@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Mon, 24 Sep 2018 08:45:44
+0200:

> Hi Miquel,
>=20
> I'm having issues using the new marvell_nand driver on a PXA3xx based pla=
tform. My test does a ubiformat on the chip, then creates a volume, mounts =
it and runs bonnie++ on the file system. After some time (usually less than=
 half a minute), the driver spits out a warning like the one below, and eve=
ntually the UBI layer bails out, which leads to a r/o remount and (possibly=
) file system corruptions.
>=20
> FWIW, this is the test script I'm using:
>=20
>  > #!/bin/sh
>  >
>  > UBIDEV=3D0
>  > UBIMTD=3D3
>  >
>  > umount /mnt
>  > ubidetach /dev/ubi_ctrl -d $UBIDEV
>  > ubiformat -y /dev/mtd$UBIMTD
>  > ubiattach /dev/ubi_ctrl -d $UBIDEV -m $UBIMTD
>  > ubimkvol /dev/ubi$UBIDEV -N test -m
>  > mount -t ubifs ubi0:test /mnt
>  > bonnie\+\+ -d /mnt -u 0:0 =20
>=20
>=20
> The legacy pxa3xx_nand driver didn't have this issue, but my system was a=
lso running a much older kernel with that. I'm currently still struggling t=
o resurrect the old code, but I'm running into "Wait time out!!!" condition=
s immediately right now. Not sure what's going on.
>=20
> Interestingly, I can't seem to reproduce the bug with any of the mtd kern=
el tests, I've tried all of them, several times, and all succeed. So a file=
 system test that includes the UBI/UBIFS layers seems to trigger different =
things in the driver than the the tests that operate on the mtd device dire=
ctly.
>=20
> I'v also tried this with and without the keep-config DT property, but tha=
t didn't change anything.
>=20
> Could you try my script on some other device that runs the new driver and=
 see if you can reproduce? If bonnie++ is unavailable, extracting a bigger =
tarball a couple of times will also trigger the bug at some point.
>=20
> Meanwhile, I can start poking around in the driver. I'd be grateful for a=
 hint on where to start.
>=20

Interesting, thanks for the feedback.

Right now I have no idea of what happens, but you might want to add a
dump_stack() at the "Timeout waiting for RB signal" error to see what
path in the driver failed.

You might also try with and without DMA?

I'll try to take the time this week to check if it is pxa-related by
testing this on an armada board.

Thanks,
Miqu=C3=A8l
