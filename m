Received: from h002078c680df.ne.client2.attbi.com
	([24.34.94.87] helo=joshuawise.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATtr8-00076U-Kb
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 02:13:38 +0000
From: Joshua Wise <joshua@joshuawise.com>
To: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Date: Tue, 9 Dec 2003 21:12:07 -0500
References: <200312091440.22926.joshua@joshuawise.com>
	<20031210003150.631E116BB2@desire.actrix.co.nz>
In-Reply-To: <20031210003150.631E116BB2@desire.actrix.co.nz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: clearsigned data
Content-Disposition: inline
Message-Id: <200312092112.08502.joshua@joshuawise.com>
Subject: Re: nand: oob question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday 09 December 2003 7:38 pm, you wrote:
> NAND typically has pages with 512bytes data + 16 bytes oob.
Right, that would be consistant with my 16MiB Samsung flash on h1910.

> Why do you think jffs2 wants 32bytes of OOB?

fs/jffs2/wbuf.c:944 (or thereabouts, I've added debugging printks here and=
=20
there)
/*
                   *    We read oob data from page 0 and 1 of the block.
                   *    page 0 contains cleanmarker and badblock info
                   *    page 1 contains failure count of this block
                 */
                ret =3D c->mtd->read_oob (c->mtd, offset, oob_size << 1,=20
&retlen, buf);

This is interesting for a number of reasons.
=46irstly, nandwrite does not handle writing failure counts of a block. Thi=
s is=20
bad, or so I think.
Secondly, in nand_read_oob, we only send the NAND_READOOB command once at o=
ne=20
column. This would, per my flash's specs, only send one 16byte set of data.=
=20
This is again bad, or so I think. When I modify it to send the NAND_READOOB=
=20
stuff as we increment col, then it gets somewhere, but it still seems to be=
=20
giving garbage results (ie, the same 16 bytes.) The failure symptoms withou=
t=20
NAND_READOOB being resent are a slowly increasing failure count (1~128), wi=
th=20
some bumps of garbage (sometimes my NAND flash likes to insert 12 bytes of=
=20
garbage at the beginning of a read, which is an issue of its own. Jacking t=
he=20
cmd delay up way high seems to have done something about that though.)

I'm rather perplexed here. I thought I understood it fairly well, although =
it=20
is evident that I don't. Can someone enlighten me?

> -- Charles
/joshua

=2D --=20
Joshua Wise | www.joshuawise.com
GPG Key     | 0xEA80E0B3
Quote       | <lilo> I akilled *@* by mistake
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/1oD3Pn9tWOqA4LMRAjYTAJ0Q0zt7tFHTEjhAb1zHMsxaASG/nwCfQ32h
TzIUtUWazzQn8TxiOCwhIL0=3D
=3DIGlY
=2D----END PGP SIGNATURE-----
