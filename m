Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IgyfA-0001rz-N0
	for linux-mtd@lists.infradead.org; Sun, 14 Oct 2007 09:17:31 +0100
Subject: RE: [PATCH] MTD: OneNAND: Return only negative error codes
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <003801c80cb2$8d594910$e1ac580a@swcenter.sec.samsung.co.kr>
References: <470F200A.9090404@nokia.com>
	<003801c80cb2$8d594910$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Sun, 14 Oct 2007 11:14:08 +0300
Message-Id: <1192349648.3455.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	'Adrian Hunter' <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-10-12 at 18:30 +0900, Kyungmin Park wrote:
> > The OneNAND driver was confusing JFFS2 by returning positive error
> > codes.
>=20
> It's only possible the write case error and it returns the positive 'ctrl=
' error.
> Other case, "2-bit ecc error' is handled with 'mtd->ecc_stat' correctly.
>=20
> Well, no problem to change to the negative value.
>=20
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

Yeah, it's rare but we caught this in practice, and JFFS2 just calls
BUG() if OneNAND returns positive number while JFFS2 is scanning the
flash medium.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
