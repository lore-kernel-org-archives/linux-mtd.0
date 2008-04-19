Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jn9DL-0005fw-JV
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 09:18:32 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: =?iso-8859-1?Q?'Anders_Grafstr=F6m'?= <grfstrm@users.sourceforge.net>,
	"'Jared Hulbert'" <jaredeh@gmail.com>,
	"'Alexey Korolev'" <akorolev@infradead.org>,
	"'Linux-MTD Mailing List'" <linux-mtd@lists.infradead.org>
References: <4807B552.7090501@users.sourceforge.net>	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>	<20080418163536.GD31520@shareable.org>	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
	<48091C7A.1070709@users.sourceforge.net>
In-Reply-To: <48091C7A.1070709@users.sourceforge.net>
Subject: RE: cfi_cmdset_0001.c: Excessive erase suspends
Date: Sat, 19 Apr 2008 11:18:11 +0200
Message-ID: <012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: sv
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Anders Grafstr=F6m
> Sent: den 19 april 2008 00:11
> To: Jared Hulbert; Alexey Korolev; Linux-MTD Mailing List
> Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
>=20
> Jared Hulbert wrote:
> > 2) Did you check that the MTD is configured to treat this flash with
> > the correct bus width?  I've been burned trying to figure out why a
> > 16bit configuration was missing half the data, turned out I had it
> > configured for 32bit MTD accesses.
>=20
> I think I got it right.
>=20
> > 3) I'd like to see that you can't use flash_eraseall and hexdump
> > /dev/mtdX to see this behavior.  Or maybe you could try to create a
> > simple test that would suspend an erase 10K times and verify the =
erase
>=20
> See below.
>=20
> > A solution might be an small delay before a
> > write suspends the erase.
>=20
> udelay(100) right before the suspend command seems to work for me.
> It reduces the suspend count to about 1700 and no errors reported
> by JFFS2.
>=20
>=20
> I ran this routine in a standalone test program from u-boot:
>=20
> void test_flash_erase_suspend(void)
> {
> 	volatile unsigned int *flash =3D (unsigned int *)0x41040000;
> 	unsigned int i;
> 	unsigned int suspends =3D 0;
> 	unsigned int words =3D 10;
>=20
> 	/* Make sure there's something to erase */
> 	for (i =3D 0; i < 0x10000; i++) {
> 		if (flash[i] =3D=3D 0xffffffff) {
> 			flash[i] =3D 0x00400040;
> 			flash[i] =3D 0;
> 			while ((flash[i] & 0x00800080) !=3D 0x00800080);
> 		}
> 	}
>=20
> 	/* Clear status */
> 	flash[0] =3D 0x00500050;
>=20
> 	/* Erase */
> 	flash[0] =3D 0x00200020;
> 	flash[0] =3D 0x00d000d0;
>=20
> 	while (1) {
> 		/* Suspend */
> 		flash[0] =3D 0x00b000b0;
> 		suspends++;
>=20
> 		/* Short delay */
> 		for (i =3D 0; i < 1000; i++);
>=20

Don't you need to check that the chip is suspended before you do any
new operation?

> 		/* Resume */
> 		flash[0] =3D 0x00d000d0;
> 		flash[0] =3D 0x00700070;
>=20
> 		/* Erase done ? */
> 		if ((flash[i] & 0x00800080) =3D=3D 0x00800080) {
> 			printf("\nStatus %08x\n", flash[i]);
> 			break;
> 		}
>=20
> 		/* Short delay */
> 		for (i =3D 0; i < 3500; i++);
> 	}
>=20
> 	/* Read array */
> 	flash[0] =3D 0x00ff00ff;
>=20
> 	/* Show the first 10 failed words */
> 	for (i =3D 0; i < 0x10000; i++) {
> 		if (flash[i] !=3D 0xffffffff) {
> 			printf("%08x\n", flash[i]);
> 			if (--words =3D=3D 0)
> 				break;
> 		}
> 	}
>=20
> 	printf("%d suspends\n", suspends);
> }
