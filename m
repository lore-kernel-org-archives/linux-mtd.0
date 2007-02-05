Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HDzFe-0006tE-H8
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 03:31:07 -0500
Subject: RE: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C6DB35.3040106@nokia.com>
	<003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Mon, 05 Feb 2007 10:30:39 +0200
Message-Id: <1170664239.3628.64.camel@sauron>
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

On Mon, 2007-02-05 at 16:44 +0900, Kyungmin Park wrote:
> I mean that in the view point of software OnenNAND is NAND, but the one o=
f
> hardware it is NOR.
> So we don't need to work it as NAND. I think we don't need to restrict th=
e
> OneNAND

OneNAND stuff which we have now is _part of MTD_. MTD has its interface,
its model of the device. As long as we are part of this infrastructure,
we have to obey MTD's interface, rules and restrictions.

The whole idea of MTD is to make upper layers to access flashes in a
uniform layer. MTD achieves this at certain extent. There are flaws, but
anyway. So basically OneNAND implements more then NAND in this OOB
handling stuff. And it is bad. It encourages other people to write
OneNAND-only software, incompatible with NAND, which is totally
unreasonable in this case.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
