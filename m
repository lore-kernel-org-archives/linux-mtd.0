Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GUm7l-0006ut-QC
	for linux-mtd@lists.infradead.org; Tue, 03 Oct 2006 16:24:02 +0100
Subject: UBI fixes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Frank Haverkamp <f.haverkamp@web.de>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Oct 2006 18:20:50 +0300
Message-Id: <1159888850.13696.13.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Frank,

I've fixed the stuff which was recently committed. Well, I basically
re-wrote gluebi and made it part of UBI. There is a corresponding
configure option (see Kconfig) for this. Now we don't need this
unpleasant notifiers stuff.

I also made some minor fixes, and supposedly fixed the debugging log
problems you had.

There are many patches, so I don't attach them.

You can find my quilt "patches" directory at
http://www.infradead.org/~dedekind/fix_and_rewrite_gluebi_and_co/

You can also find them in my git tree at
git://git.infradead.org/~dedekind/public_git/dedekind-ubi-2.6.git

or take a look in git-web at
http://git.infradead.org/?p=3Dusers/dedekind/dedekind-ubi-2.6.git;a=3Dsumma=
ry

Artem.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
