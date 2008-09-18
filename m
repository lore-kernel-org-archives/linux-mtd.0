Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KgBxf-0006xT-HU
	for linux-mtd@lists.infradead.org; Thu, 18 Sep 2008 05:21:56 +0000
Subject: Re: [PATCH] ubifs: fix printk format warnings
From: Artem Bityutskiy <dedekind@infradead.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
In-Reply-To: <20080917180941.GB29966@orion>
References: <20080917180941.GB29966@orion>
Content-Type: text/plain; charset=utf-8
Date: Thu, 18 Sep 2008 08:21:13 +0300
Message-Id: <1221715273.6629.0.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, ext-adrian.hunter@nokia.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, 2008-09-17 at 22:09 +0400, Alexander Beregalov wrote:
> fs/ubifs/dir.c:428: warning: format '%llu' expects type 'long long
> unsigned int', but argument 5 has type 'long unsigned int'
>=20
> fs/ubifs/debug.c:541: warning: format '%llu' expects type 'long long
> unsigned int', but argument 2 has type 'long unsigned int'
>=20
>=20
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Pushed to ubifs-2.6.git, thank you.
=20
--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
