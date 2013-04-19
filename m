Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UT9u3-00043l-Ge
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 11:54:56 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Date: Fri, 19 Apr 2013 07:57:09 -0400
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304182128.19518.vapier@gentoo.org>
 <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9AEC45@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2177098.Kvr6f9Db13";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304190757.13688.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2177098.Kvr6f9Db13
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 19 April 2013 03:10:23 Gupta, Pekon wrote:
> > On Thursday 18 April 2013 20:13:00 Ezequiel Garcia wrote:
> > > On Thu, Apr 18, 2013 at 04:30:55PM -0400, Mike Frysinger wrote:
> > > > i wonder if the write support should be put behind a CONFIG option.
> > > > personally, the write support is kind of neat and semi-useful for
> > > > development, but i don't plan on shipping anything on that :).  i
> > > > just want read-only support to load an ext2 fs on top of UBI.
> > >=20
> > > Mmm... good input. Maybe putting write support behind a CONFIG
> > > and showing a big fat warning when the module loads will do?
> > > (something to prevent regular users from using this carelessly).
>=20
> [Pekon]: Permanent disabling of WRITE(s) may not be good approach.
> As it constrains you from updating on-field device remotely, especially
> when your boot-loaders are not in your control.

err, no it doesn't.  we're talking about write support at the UBI *block*=20
layer.  nothing is stopping you from writing to the UBI volume directly lik=
e=20
normal (e.g. ubiupdatevol/etc...).

the reason we're talking about not allowing write support at the *block* la=
yer=20
is because it's questionable how many people actually want this, the=20
performance isn't good (compared to native flash filesystems), and because =
the=20
write/wear characteristics are unknown.

> [Pekon]: Other options for S/W driven Write-access-control are:

hence, these are all unrelated issues.
=2Dmike

--nextPart2177098.Kvr6f9Db13
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRcTEZAAoJEEFjO5/oN/WBtygP/A6YX3DyDScb/X24k4YlboTZ
A1SS5+9+b8kErIFzNFQgBGTbpDODQOJeWaiRQODjwiYoazhETlxVQoJNPWTFLCN7
8ThwZh6qrrmtfSPsgEKO2bnRrgokOI5bmd/a16YJk1mEItQzZT/fD0y5StVh9q6u
zbxHlvqICUv+ucdXD4lAUieoLrqaSRq9BsjnLYVXtjPXTImwB1goJfZtX1QnRA7B
rt/LKFngPoxntb8bw68k9oFhIm0FKseqpdEEQahqKfQxNHkWHcRzc9rP3Gre9zx7
SRyRJhJIvnL/Xwd2o1WG35cFU//nhZS99JIX9u1SHLzpMhLzANiJgRBF7rHOkIUD
9H9a1BJeGK13Y5XlaQUK7jTpdxCZm5Jzk1P16aQcW1tN5Ra/lmTbb+hPmDUmvS67
SCBuxOkoByfuhby/b81mRMABCmp7l25tOUN1/NXipbtEXzgALhTAra6nugMoIPZZ
8asYJ4spPpyvua/1DOPx5uasEqVU6I25qyICRfiZ16f/Ttj50bFyV+e4f9e6rDNI
aJke94R3WAeAdRWwwiW7tXAASXnXWP3kjiGVBhCHez6XA9Gx4n4YMs9l9BxlXsKW
OeZXWLZ+H7mdDfSXM9YjUEYg8HKaX5q69p4BQi1DtA4rR/dcgIr1GCVLOx8n/pOw
tLtJExdiev0NOSgTdFJW
=5+Ka
-----END PGP SIGNATURE-----

--nextPart2177098.Kvr6f9Db13--
