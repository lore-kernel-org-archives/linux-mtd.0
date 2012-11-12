Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXw6e-0001II-L6
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:39:25 +0000
Message-ID: <1352734799.2262.11.camel@sauron.fi.intel.com>
Subject: Re: [question]MTD:unstable bit issues?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Date: Mon, 12 Nov 2012 17:39:59 +0200
In-Reply-To: <5087B304.8010903@linux.vnet.ibm.com>
References: <50877953.9040602@linux.vnet.ibm.com>
 <OFCD7F9EAE.28A631AD-ONC1257AA1.002B4604-C1257AA1.002D248C@rohde-schwarz.com>
 <5087AC58.1000402@linux.vnet.ibm.com>
 <OF4005835E.007816E8-ONC1257AA1.0030E2F0-C1257AA1.003189CF@rohde-schwarz.com>
 <5087B304.8010903@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-DXKsEEvih+6xM5viHwoC"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-DXKsEEvih+6xM5viHwoC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-24 at 17:21 +0800, hejianet wrote:
> Hi Thomas
> till now, we have no evidence that it is a jffs2.

> we only observed a ubi error msg(not 100% sure it caused this hole):
>=20
> Oct 15 20:09:10 (none) kernel: UBI error: ubi_io_write error -5 while wri=
ting 2048 bytes to PEB 1663:20480, written 0 bytes
>=20
> Besides, it only appeared in power-cut stress cut, so I suspect it is rel=
evant
> to "unstable bits issue". from google information, this issue appears in =
both
> nand and nor flash, but more frequently in nand.

Unstable bits issue does not give you tons of zeroes. I really think
that this is either a JFFS2 bug - fsync does not work, or your test
scripts have a bug - you power-cut before fsync or you do fsync, then
write more to this file, then power-cut.

--=20
Best Regards,
Artem Bityutskiy

--=-DXKsEEvih+6xM5viHwoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRhPAAoJECmIfjd9wqK0DkwQAImNxFLvAczYwDSiumuTzXA1
g2565NbfESZazv74iNB3rVdl+CT+vJ70MDayNGWoB0Lb9Ul0RoZj8GhC79IjD4sA
fnrMN0FHeroZxNEmBHdYPVj2EPw8Qb4DUPlVhEQ/cCkpPYwy0QREfh+20Fi/aw11
lgDM59aHtclkx5BUMtILcM7uERZmeo1WoQM90iSHjoXyzUOlJn7qaB95x4WDLbFe
7iJ1t45CZJAlAsYpvGTaCItTPvHJoY8qyQ2STmr4fu4G8IM2lI18jCTZUm4jb3oy
QilzbljCq0RMd7tgYJmVikzruq60w/jcf+aAP+X8ylEXsVAJG2IQHb4tyPekIZxy
Ve6INWvbbw5GM0G1bzQNtrDp7wMw8GrY0bl2JMlHs6CKNuTaa23AAGzUPgWadzXY
/bwt45P3QFU88fZsCFtU/Jio1C0OlAP6txlXiKGfngVGHgsUsjbJ5rfRiq6CgM3u
q92Nf2htX2u6qwwsRR8w4u9VF7GxRYSv1YQgG950e1lPXnmCMkM3I8mQFGYnKcP7
3eEegtiXghg3h7TnPf/xQjI8P5cidjczv1WPYAe41jLOepilw5nUdIzOx4QDGctS
S1DQUDCF3F2cX3yExYynT8MPc+UTbZUFS3kUcEWuVzSkUh8wQnOkxxCfwDmscKoA
uJ1a8NUfektjIDNNlra1
=ubtN
-----END PGP SIGNATURE-----

--=-DXKsEEvih+6xM5viHwoC--
