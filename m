Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0c0J-0007oj-2o
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 13:12:59 +0000
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	mADDCtMv021316
	for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2008 15:12:56 +0200
Subject: Re: [PATCH] [MTD] [NAND] nandsim: add option to use a file to
	cache pages
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <491AE2CF.3010901@nokia.com>
References: <491AE2CF.3010901@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Nov 2008 15:09:12 +0200
Message-Id: <1226581752.16925.48.camel@sauron>
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
> Add a new module parameter 'cache_file' which causes nandsim
> to use that file instead of memory to cache nand data.
> Using a file allows the simulation of NAND that is bigger
> than the available memory.
>=20
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Acked-by: Artem Bityutskiy <dedekind@infradead.org>

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
