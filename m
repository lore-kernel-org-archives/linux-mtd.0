Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J3VbY-0007oK-MV
	for linux-mtd@lists.infradead.org; Sat, 15 Dec 2007 11:55:00 +0000
Received: from mgw-mx09.nokia.com ([192.100.105.134])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	lBFBLoWh016995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Sat, 15 Dec 2007 13:21:54 +0200
Subject: Re: [PATCH] UBI: silence warning about possibly uninitialized use
	of variable in drivers/mtd/ubi/vmt.c ...
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jesper Juhl <jesper.juhl@gmail.com>
In-Reply-To: <4761b8f2.1c89420a.7f10.ffffe9db@mx.google.com>
References: <4761b8f2.1c89420a.7f10.ffffe9db@mx.google.com>
Content-Type: text/plain; charset=utf-8
Date: Sat, 15 Dec 2007 13:18:15 +0200
Message-Id: <1197717495.25999.33.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-12-13 at 23:53 +0100, Jesper Juhl wrote:
> From: Jesper Juhl <jesper.juhl@gmail.com>
>=20
> This patch silences the following warning :
>=20
>   drivers/mtd/ubi/vmt.c:73: warning: 'ret' may be used uninitialized in t=
his function
>=20
> gcc can't see that we always initialize ret in all situations where it is=
=20
> actually used. The one case where it's not initialized is when we BUG(),=20
> but gcc doesn't know that we won't then continue and use an uninitialized=
=20
> 'ret'.
>=20
> This patch results in code that does exactely the same as before, but it=20
> also makes gcc shut up, so we generate one less line of warning noise.
>=20
>=20
> Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>

Pushed to ubi-2.6.git, thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
