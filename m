Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GV3ol-0002aJ-5d
	for linux-mtd@lists.infradead.org; Wed, 04 Oct 2006 11:17:35 +0100
Subject: Re: UBI fixes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Frank Haverkamp <f.haverkamp@web.de>
In-Reply-To: <1159888850.13696.13.camel@sauron>
References: <1159888850.13696.13.camel@sauron>
Content-Type: text/plain; charset=utf-8
Date: Wed, 04 Oct 2006 13:14:23 +0300
Message-Id: <1159956864.13696.25.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-10-03 at 18:20 +0300, Artem Bityutskiy wrote:
> There are many patches, so I don't attach them.
>=20
> You can find my quilt "patches" directory at
> http://www.infradead.org/~dedekind/fix_and_rewrite_gluebi_and_co/
>=20
> You can also find them in my git tree at
> git://git.infradead.org/~dedekind/public_git/dedekind-ubi-2.6.git
>=20
> or take a look in git-web at
> http://git.infradead.org/?p=3Dusers/dedekind/dedekind-ubi-2.6.git;a=3Dsum=
mary
>=20

I've also solved your problem when UBI attach functions are called
*before* UBI is initialized.

The solution is trivial: dispense with the nasty idea to call UBI attach
functions from MTD drivers. Of course MTD drivers are initialized
*before* UBI, and then they call the ubi_attach_mtd_dev() function,
while UBI have *not* been initialized yet, and this causes problems.

Instead, use kernel boot arguments. Add a=20

ubi.mtd_devs=3D<list of MTD devices to attach>

argument and enjoy. Everything just works.

You can specify UBI device names and numbers there. For example:

ubi.mtd_devs=3D0,"storage","NOR_flash",6

means attach mtd0, mtd6, and MTD devices with names "storage" and
"NOR_flash".

The patches may be found at the same place. Please, try them on your
system.


--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
