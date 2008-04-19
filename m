Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnGRX-0004EG-0e
	for linux-mtd@lists.infradead.org; Sat, 19 Apr 2008 17:01:39 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: =?iso-8859-1?Q?'Anders_Grafstr=F6m'?= <grfstrm@users.sourceforge.net>,
	"'Jared Hulbert'" <jaredeh@gmail.com>,
	"'Alexey Korolev'" <akorolev@infradead.org>,
	"'Linux-MTD Mailing List'" <linux-mtd@lists.infradead.org>
References: <4807B552.7090501@users.sourceforge.net>	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>	<20080418163536.GD31520@shareable.org>	<6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>	<48091C7A.1070709@users.sourceforge.net>
	<012501c8a1fe$4a5308e0$def91aa0$@Tjernlund@transmode.se>
	<4809F7EC.9010808@users.sourceforge.net>
In-Reply-To: <4809F7EC.9010808@users.sourceforge.net>
Subject: RE: cfi_cmdset_0001.c: Excessive erase suspends
Date: Sat, 19 Apr 2008 19:01:20 +0200
Message-ID: <017701c8a23e$fdd70b60$f9852220$@Tjernlund@transmode.se>
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
> From: Anders Grafstr=F6m [mailto:grfstrm@users.sourceforge.net]
> Sent: den 19 april 2008 15:47
> To: Joakim Tjernlund; 'Jared Hulbert'; 'Alexey Korolev'; 'Linux-MTD =
Mailing List'
> Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
>=20
> Joakim Tjernlund wrote:
> > Don't you need to check that the chip is suspended before you do any
> > new operation?
>=20
> You're right.
>=20
> Here's the improved version;
>=20
> static void erase_suspend(unsigned int loops)
> {
> 	volatile unsigned int *flash =3D (unsigned int *)0x41040000;
> 	unsigned int i;
> 	unsigned int suspends =3D 0;
> 	unsigned int words =3D 2;
> 	unsigned int timeout;
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
> 		flash[0] =3D 0x00700070;
> 		timeout =3D 100000;
> 		while ((flash[0] & 0x00800080) !=3D 0x00800080 && --timeout);
> 		if (!timeout)
> 			printf("suspend timeout\n");
> 		suspends++;
>=20
> 		/* Short delay */
> 		for (i =3D 0; i < 1000; i++);
>=20
> 		/* Resume */
> 		flash[0] =3D 0x00d000d0;
> 		flash[0] =3D 0x00700070;
>=20
> 		/* Erase done ? */
> 		if ((flash[0] & 0x00800080) =3D=3D 0x00800080) {
> 			printf("\nstatus %08x\n", flash[0]);
> 			break;
> 		}
>=20
> 		/* Short delay */
> 		for (i =3D 0; i < loops; i++);
> 	}
>=20
> 	/* Read array */
> 	flash[0] =3D 0x00ff00ff;
>=20
> 	/* Show the first 2 failed words */
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
>=20
> void test_flash_erase_suspend(void)
> {
> 	unsigned int loops;
>=20
> 	for (loops =3D 6000; loops > 2000; loops -=3D 500) {
> 		printf("\n%d loops", loops);
> 		erase_suspend(loops);
> 	}
> }
>=20
>=20
> It produced this output at one occasion:
>=20
> 6000 loops
> status 00800080
> ffff0000
> ffff0000
> 4783 suspends
>=20
> 5500 loops
> status 00800080
> 5508 suspends
>=20
> 5000 loops
> status 008000a0
> 6394 suspends
>=20
> 4500 loops
> status 00a000a0
> fffffeff
> fffffffe
> 5169 suspends
>=20
> 4000 loops
> status 00a000a0
> fffffeff
> fffffeff
> 5378 suspends
>=20
> 3500 loops
> status 00a000a0
> aaaaaaaa
> aaaaaaaa
> 5715 suspends
>=20
> 3000 loops
> status 00a000a0
> 55555555
> 55555555
> 6142 suspends
>=20
> 2500 loops
> status 00a000a0
> 00000000
> 00000000
> 6929 suspends
>=20
> It locks up when I drop it down to 2000 or less iterations in the loop =
between resume and suspend.
> I think I need to do more testing with properly timed delays.
>=20
> Is there anything else that I have missed?

Perhaps, you should make "i" a volatile. That said I know that Intel
had erase suspend bugs in their early strata flash, that=92s why there =
is
a define in cmdset_0001 that disables them.

Maybe you got buggy chips?
oh, just remembered, strata chips needs to have a stable address bus =
before
CS is pulled. We had add a small delay on CS in the memory controller, =
otherwise
they would fail, especially when cold.=20

>=20
> /Anders
>=20
