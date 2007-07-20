Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBmsL-0007wT-If
	for linux-mtd@lists.infradead.org; Fri, 20 Jul 2007 03:26:10 -0400
Subject: Re: [PATCH] UBI: potential leak in ubi_scan_erase_peb
From: Artem Bityutskiy <dedekind@infradead.org>
To: Florin Malita <fmalita@gmail.com>
In-Reply-To: <469FBA01.80107@gmail.com>
References: <469FBA01.80107@gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 20 Jul 2007 10:25:57 +0300
Message-Id: <1184916357.25822.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-07-19 at 15:22 -0400, Florin Malita wrote:
> Coverity (1769) found the following problem: if the erase counter=20
> overflow check triggers, ec_hdr is leaked.
>=20
> Moving the allocation after the overflow check should take care of it.
>=20
> Signed-off-by: Florin Malita <fmalita@gmail.com>

Committed, thank you!

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
