Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEguR-000492-Kw
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 08:12:35 +0000
Subject: Re: why ubimkvol can't recognize /dev/ubi0?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <4781D985.6020504@nokia.com>
References: <399646872.11492@ustc.edu.cn>  <4781D985.6020504@nokia.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 15 Jan 2008 10:08:30 +0200
Message-Id: <1200384510.3956.27.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?Q?=E6=97=B6=E6=AD=A3?= <shizheng@mail.ustc.edu.cn>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-01-07 at 09:49 +0200, Adrian Hunter wrote:
> From b96f4481662bd7ac247d4d5a25b27f7d8afffb92 Mon Sep 17 00:00:00 2001
> From: Adrian Hunter <ext-adrian.hunter@nokia.com>
> Date: Mon, 7 Jan 2008 09:47:17 +0200
> Subject: ubi-utils: fix bug using readdir
>=20
> Library functions never reset errno to zero, so if you want
> to use its value to check for errors then you must set it to zero
> before calling the library function (in this case readdir).
>=20
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>

Thanks, committed.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
