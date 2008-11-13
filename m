Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0bKP-0004Kg-IN
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 12:29:41 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx06.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mADCTIq8009318
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2008 14:29:38 +0200
Subject: Re: [PATCH] [MTD] [NAND] nandsim: suppress unnecessary warning
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <491AE2F0.7040200@nokia.com>
References: <491AE2F0.7040200@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Nov 2008 14:27:38 +0200
Message-Id: <1226579258.16925.42.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-11-12 at 16:06 +0200, Adrian Hunter wrote:
> nand_base sometimes reads only 2 bytes of a 4 byte id.
> It is OK.  Do not print a warning in that case.
>=20
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
