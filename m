Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgk07-0008S8-4h
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:24:32 -0500
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20041221130924.GB22636@wohnheim.fh-wedel.de>
References: <1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
	<41C318C8.4030702@us.ibm.com>
	<20041218160255.GA1083@wohnheim.fh-wedel.de>
	<1103560493.25853.31.camel@weaponx.rchland.ibm.com>
	<1103562748.10800.62.camel@squizzey.bult.co.uk>
	<20041221130924.GB22636@wohnheim.fh-wedel.de>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-uY4cZuaoWHxAejWj2Juw"
Date: Tue, 21 Dec 2004 13:24:35 +0000
Message-Id: <1103635475.10794.143.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-uY4cZuaoWHxAejWj2Juw
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 2004-12-21 at 14:09 +0100, J=F6rn Engel wrote:
> Imo jffs2-style wear leveling is very efficient.  So efficient, it
> doesn't really matter whether the hardware does the same or not.

:) I was of the same opinion but didn't really have any evidence to back
it up ..=20

> Difference between no wear leveling and what jffs2 does is - at most -
> 1% additional writes on the jffs2 side.  That's not much.  Agreed, it
> can actually cost latency, but from a life-time or overall performance
> point of view, it doesn't really matter.

Sure.

> On the other hand, it gives you absolute condidence that your El
> Cheapo hardware doesn't need to have anything it may or may not
> promise to have.  No nasty surprised when you really don't need them.

:)

> Noone will state that.  It's not exactly good marketing.  You might
> remember so interesting stories about what marketing promised and what
> actually got delivered, no?

Sure, although I have noticed that some people shout more loudly than
others with regards to the wear levelling technology in their devices ..

> The endorsed features sound quite nice, agreed.  But I have still to
> read a spec that convinces me.

Mmm .. anyone know a magazine editor who'd like to acquire a bunch of
keys and runs some tests for us .. ;-)

Gareth.

--=-uY4cZuaoWHxAejWj2Juw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBByCQTRX9MUnbSukkRAm6lAKCINGZK6EnF+KCmiLS/s1ZqAvUmngCdGZiD
AR0T2RixEYRHAmX7wP0MbAM=
=epgX
-----END PGP SIGNATURE-----

--=-uY4cZuaoWHxAejWj2Juw--
