Received: from smail2.alcatel.fr ([64.208.49.57])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTw08-00013Z-U2
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:07:21 +0000
From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 7 Jun 2011 15:00:18 +0200
Subject: RE: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
Message-ID: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A9CEE2C@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1306396908.2785.152.camel@localhost>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1307444807.11104.76.camel@localhost>
In-Reply-To: <1307444807.11104.76.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
> Sent: 07 June 2011 12:07
> To: THOMSON, Adam (Adam)
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: [PATCH v2] nand: nand_base: Always initialise=20
> oob_poi before writing OOB data
>=20
> On Thu, 2011-05-26 at 17:15 +0200, THOMSON, Adam (Adam) wrote:
> > Having looked briefly at the read side code in nand_base.c, it does=20
> > look like it should be enough to remove the second memset and leave=20
> > the read side code as is, but will examine it more=20
> thoroughly before I=20
> > post a patch.
>=20
> Any news? :-)

Apologies. Have been sidetracked with other work. Have put changes together=
 but want to check them over just so I'm happy, in particular verifying the=
m on some hardware to make sure all still works as expected. Hopefully shou=
ld have something in the next week for you. :o)

Thanks

Adam

>=20
> --
> Best Regards,
> Artem Bityutskiy (=E1=D2=D4=A3=CD =E2=C9=D4=C0=C3=CB=C9=CA)
>=20
> =
