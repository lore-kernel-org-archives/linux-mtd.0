Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCTaM-0004AX-4I
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 06:39:14 +0000
Subject: Re: [PATCH 4/4] UBI WL-Subsys: Improvement in prot tree
From: Artem Bityutskiy <dedekind@infradead.org>
To: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
In-Reply-To: <1229395691.2691.18.camel@localhost.localdomain>
References: <1228823163.2753.18.camel@localhost.localdomain>
	<1228827803.13686.189.camel@sauron>
	<1228884752.3225.80.camel@localhost.localdomain>
	<1228898668.13686.223.camel@sauron>
	<1228913251.3655.10.camel@localhost.localdomain>
	<1228931859.13686.350.camel@sauron>
	<1228981865.2702.9.camel@localhost.localdomain>
	<1229022841.13686.384.camel@sauron>
	<1229332169.5306.1.camel@localhost.localdomain>
	<1229332781.13686.447.camel@sauron>
	<1229343610.2687.52.camel@localhost.localdomain>
	<1229343746.4911.2.camel@sauron>
	<1229347894.2687.56.camel@localhost.localdomain>
	<1229356809.4911.57.camel@sauron>
	<1229395691.2691.18.camel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Date: Tue, 16 Dec 2008 08:36:31 +0200
Message-Id: <1229409391.4911.75.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-16 at 10:48 +0800, xiaochuan-xu wrote:
> >From e43d4e5cbaf1adb3af680a6dec53c142c68014ed Mon Sep 17 00:00:00 2001
> From: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>
> Date: Tue, 16 Dec 2008 10:44:07 +0800
> Subject: [PATCH] delete idle varialbe abs_ec
>=20
> @wl->abs_ec is useless any more in the Simplify Protection
> PEB Queue implementation.
>=20
> Signed-off-by: Xiaochuan-Xu <xiaochuan-xu@cqu.edu.cn>

Applied, committed using git-commit -a --amend (changed your
original patch in-place).

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
