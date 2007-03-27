Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HWBXr-0007Dc-Sb
	for linux-mtd@lists.infradead.org; Tue, 27 Mar 2007 09:17:06 -0400
Subject: Re: JFFS2 SUMMARY nodes aren't working
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <460913B3.3060009@inf.u-szeged.hu>
References: <1174569321.26465.308.camel@gentoo-jocke.transmode.se>
	<460913B3.3060009@inf.u-szeged.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Mar 2007 15:16:56 +0200
Message-Id: <1175001416.26465.459.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-03-27 at 14:53 +0200, Ferenc Havasi wrote:
> Joakim Tjernlund =C3=ADrta:
> > On a fresh JFFS2 root FS image with summary nodes there is no
> > difference in mount time when enabling summary support in kernel(2.6.20=
,
> > powerpc).
> >  =20
> If you use NOR flash with relatively small erase block, summary will not=20
> really chance to speed up the mount process.
>=20
> Anyway you should check the summary is really working or not. Use the=20
> following way:
>=20
> Enable the JFFS33 debugging options (min. debug level 1) in your kernel=20
> configuration and recompile the kernel. You  see the following messages=20
> in your kernel log. When you load the jffs2 kernel module you can see=20
> the following message:
> "JFFS2 version 2.2. NAND SUMMARY" (in case of summary is enabled, maybe=20
> the NAND is skipped if you doesn't have writebuffer compiled in).
>=20
> If summary is enabled and something went wrong, maybe the image on flash=20
> has no summary info:
> "no summary found in jeb 0x%08x. Apply original scan." where %08x is=20
> replaced by the offset of the jeb.
>=20
> If you see debug information which begin with "jffs2_sum_" and there is=20
> no error in your log it means the summary works.
>=20
> Ferenc

Thanks, but it turned out that summary wasn't my problem. It was
excessive scanning of empty erase blocks that took time.

See my later posts and [PATCH] Speed up mount for cfi_cmdset_0001 users

  Jocke
