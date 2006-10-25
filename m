Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gck8Z-0007ic-09
	for linux-mtd@lists.infradead.org; Wed, 25 Oct 2006 10:53:58 -0400
Subject: Re: [PATCH] fix map probe name for cstm_mips_ixx
From: Artem Bityutskiy <dedekind@infradead.org>
To: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
In-Reply-To: <20061025232917.466b18ee.yoichi_yuasa@tripeaks.co.jp>
References: <20061025232917.466b18ee.yoichi_yuasa@tripeaks.co.jp>
Content-Type: text/plain; charset=utf-8
Date: Wed, 25 Oct 2006 17:38:03 +0300
Message-Id: <1161787083.3260.204.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
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

On Wed, 2006-10-25 at 23:29 +0900, Yoichi Yuasa wrote:
> -			mymtd =3D (struct mtd_info *)do_map_probe("jedec", &cstm_mips_ixx_map=
[i]);
> +			mymtd =3D (struct mtd_info *)do_map_probe("jedec_probe", &cstm_mips_i=
xx_map[i]);

Looks OK.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
