Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1894aX-000088-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 14:21:53 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Date: Tue, 5 Nov 2002 14:52:02 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: "=?ISO-8859-1?Q?J=F6rn=20Engel?=" <joern@wohnheim.fh-wedel.de>
Cc: "linux-mtd list" <linux-mtd@lists.infradead.org>
Subject: Re: MTD CVS: missing JFFS2?
Message-Id: <20021105145202.38E812FD6D@server4.fastmail.fm>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I see - thanks a lot!

I suppose patchin.sh might still be useful? Even if it doesnt patch in
the latest jffs2 code, it certainly does the cvs mtd code..

-jf

On Tue, 5 Nov 2002 14:31:42 +0100, "J=F6rn Engel"
<joern@wohnheim.fh-wedel.de> said:
> On Tue, 5 November 2002 08:13:30 +0000, Jeffrey Lim wrote:
> > Hi guys, i follow the instructions found at
> > sources.redhat.com/jffs2 and download the latest MTD source from CVS.
> >=20
> > under the patches subdir, there is a patchin.sh, which i run.
> >=20
> > However, after taking a look at patchin.sh, i realize that the jffs2 co=
de
> > doesnt seem to get patched at all!, only jffs. Am i therefore to assume
> > that the MTD CVS does not contain any jffs2 code at all, and that i
> > should just use the jffs2 code from the stock kernel?
>=20
> CVS definitely contains jffs2 code, but I never used patchin.sh. By
> hand, you would switch fs/jffs2 and include/linux/jffs2*.
>=20
> Hope that helps.
>=20
> J=F6rn
>
=20
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
=20
=20
