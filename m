From: "Kyungmin Park" <kmpark@infradead.org>
To: <dedekind@infradead.org>
References: <000701c787a8$f968a9f0$e1ac580a@swcenter.sec.samsung.co.kr>
	<1177571998.18889.14.camel@sauron>
Subject: RE: [PATCH] OneNAND 2x program support
Date: Thu, 26 Apr 2007 16:39:17 +0900
Message-ID: <001001c787d6$0139ba20$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
In-reply-to: <1177571998.18889.14.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>=20
> Hi Kyungmin,
>=20
> On Thu, 2007-04-26 at 11:16 +0900, Kyungmin Park wrote:
> > Here's new feature of OneNAND, 2X program.
>=20
> Nice.
>=20
> Am I right that in this mode we end up with a 4KiB page size?

Since 2x program use the same page in block even, and block odd such as =
block 0, block 1

In the previous one, the page is end up with 2KB

Note: (block, page)

(0, 0) (0, 1) (0, 2) ... (0, 63)
--------
2KB

But 2x mode it will be changed, (0, 0) (1, 0) is a pair.

(0, 0) (0, 1) (0, 2)
    |       |        |
   V      V      V
(1, 0) (1, 1) (1, 2)
--------
4KB

>=20
> > Note: this features is supported with the recent OneNAND=20
> chips. please don't try
> > to use previous chips.
>=20
> It would be nice to note this in 'config=20
> MTD_ONENAND_2X_PROGRAM' and to
> specify OneNAND revision starting from which it is safe to use this
> mode.

OK, I will add the chip number.

Actually there's no method to find a which feature are supported on this =
chip.
Now I try to find the features from density and process. It's just =
guess.

Now only 2 chips support this one. 4Gb and 2Gb (no DDP).

+	switch (density) {
+	case ONENAND_DEVICE_DENSITY_4Gb:
+		this->options |=3D ONENAND_HAS_2PLANE;
+
+	case ONENAND_DEVICE_DENSITY_2Gb:
+		/* 2Gb DDP don't have 2 plane */
+		if (!ONENAND_IS_DDP(this))
+			this->options |=3D ONENAND_HAS_2PLANE;

I will try to find a more fancy method.

Thank you,
Kyungmin Park
