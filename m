Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCw72-0005Ql-GV
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 13:06:52 +0000
Subject: Re: ubifs: Inconsistency detected by ld.so: rtld.c: 1213: dl_main:
	Assertion `_rtld_local._dl_rtld_map.l_libname' failed!
From: Artem Bityutskiy <dedekind@infradead.org>
To: Cal Page <pagcal@runbox.com>
In-Reply-To: <4948F6C2.4070006@runbox.com>
References: <4948F6C2.4070006@runbox.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 17 Dec 2008 15:04:10 +0200
Message-Id: <1229519050.17960.28.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-17 at 07:55 -0500, Cal Page wrote:
> I can move data on and off the ubifs ok, but when I try to execute someth=
ing,
> I get the following error.
>=20
> What's wrong?
>=20
> Inconsistency detected by ld.so: rtld.c: 1213: dl_main: Assertion `_rtld_=
local._dl_rtld_map.l_libname' failed!

Can your flash survive mtd tests? :
git://git.infradead.org/users/dedekind/mtd-tests-2.6.git

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
