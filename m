Received: from imx12.toshiba.co.jp ([61.202.160.132])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1UAATa-0001c4-5U
 for linux-mtd@lists.infradead.org; Tue, 26 Feb 2013 02:41:08 +0000
From: <katsuki.uwatoko@toshiba.co.jp>
To: <pekon@ti.com>
Subject: RE: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
Date: Tue, 26 Feb 2013 02:41:18 +0000
Message-ID: <F3B6523425E7914AA6214ED358D820AF26751047@TGXML341.toshiba.local>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
 <512B2DC6.8090104@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-ID: <09B5F00E6A7D9D4D98E2C0D75C4F7D71@toshiba.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org, matthieu.castet@parrot.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > > Just inquisitive, can anyone please share any throughput comparison
> > between 'BENAND' & 'normal NAND' devices having same capacity and
> > working on same clock-freq ?

I think that the following would be helpful.

http://www.toshiba-components.com/memory/benand.html
http://www.toshiba-components.com/memory/data/BENAND%20QA_V1.0_121031.pdf
http://www.toshiba-components.com/memory/data/Whitepaper_BENAND_11_2012.pdf

> But assuming there is no file-system OOB metadata | cleanmarker to be sto=
red (like in UBIFS)
> Do we still need to transfer OOB data from Host processor to NAND device =
?

No, we don't.

> how do we ensure that layout of metadata does not overlap with ECC syndro=
me in BENAND ?
> Is the BENAND capable of re-adjusting its ECC layout ?=20

The area which we can use is defined as nand_ecclayout in nand_benand.c.
And the area is covered by the built-in ECC.

+static struct nand_ecclayout benand_oob_128 =3D {
+	.oobfree =3D {
+		{.offset =3D 2, .length =3D 3},
+		{.offset =3D 18, .length =3D 3},
+		{.offset =3D 34, .length =3D 3},
+		{.offset =3D 50, .length =3D 3},
+		{.offset =3D 66, .length =3D 3},
+		{.offset =3D 82, .length =3D 3},
+		{.offset =3D 98, .length =3D 3},
+		{.offset =3D 114, .length =3D 3},
+	}
+};

In the case of 24nm products, which are NOT 128bytes OOB type,=20
the whole area of OOB can be available and is covered by the built-in ECC.=
=20
--=20
UWATOKO Katsuki=
