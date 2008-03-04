Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JWQhi-0002ku-AC
	for linux-mtd@lists.infradead.org; Tue, 04 Mar 2008 06:32:46 +0000
Subject: Re: [2.6 patch] mtd/ubi/vtbl.c: fix memory leak
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Bunk <bunk@kernel.org>
In-Reply-To: <20080303180752.GK26072@cs181133002.pp.htv.fi>
References: <20080303180752.GK26072@cs181133002.pp.htv.fi>
Content-Type: text/plain; charset=utf-8
Date: Tue, 04 Mar 2008 08:27:33 +0200
Message-Id: <1204612053.23706.13.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-03-03 at 20:07 +0200, Adrian Bunk wrote:
> This patch fixes a memory leak introduced by commit=20
> 4ccf8cffa963c7b5bdc6d455ea9417084ee49aa8 and spotted by the Coverity=20
> checker.
>=20
> Signed-off-by: Adrian Bunk <bunk@kernel.org>

Good catch, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
