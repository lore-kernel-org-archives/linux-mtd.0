Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDyxm-0006Ep-M9
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:12:37 -0500
Subject: RE: [PATCH] [JFFS2] use MTD_OOB_AUTO
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <003b01c748f5$55ae1d50$c7a3580a@swcenter.sec.samsung.co.kr>
References: <20070202164729.11475.8623.sendpatchset@localhost.localdomain>
	<003b01c748f5$55ae1d50$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:12:16 +0200
Message-Id: <1170663136.3628.45.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-02-05 at 16:14 +0900, Kyungmin Park wrote:
> const static =3D> static const

You keep me busy :-)

const is "type qualifier", static is "storage class specifier" (C99,
6.7). The order may be arbitrary.

:-)

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
