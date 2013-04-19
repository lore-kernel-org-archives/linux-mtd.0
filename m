Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:214:c2ff:fe64:b2d3]
 helo=smtp.gentoo.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UTAmu-0005DF-5N
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2013 12:51:36 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: dedekind1@gmail.com
Subject: Re: [RFC/PATCH v2] ubi: Add ubiblock read-write driver
Date: Fri, 19 Apr 2013 08:53:50 -0400
References: <1355314912-9321-1-git-send-email-elezegarcia@gmail.com>
 <201304190757.13688.vapier@gentoo.org>
 <1366374673.29520.125.camel@sauron.fi.intel.com>
In-Reply-To: <1366374673.29520.125.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3518644.8JrIyZN0I1";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <201304190853.54402.vapier@gentoo.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tim Bird <tim.bird@am.sony.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3518644.8JrIyZN0I1
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday 19 April 2013 08:31:13 Artem Bityutskiy wrote:
> On Fri, 2013-04-19 at 07:57 -0400, Mike Frysinger wrote:
> > the reason we're talking about not allowing write support at the
> > *block* layer
> > is because it's questionable how many people actually want this, the
> > performance isn't good (compared to native flash filesystems), and
> > because the
> > write/wear characteristics are unknown.
>=20
> My opinion that unless people demonstrate that they need this, e.g. in a
> product, etc, we should not merge this stuff.
>=20
> We recently merged fastmap, which is a big chunk of code, and it looks
> like no one really needs it. There was a problem report, and Richard
> promised to look, but did not. I do not blame him, he is a busy guy. But
> this shoes that this feature is not really needed, while adds
> maintenance burden.
>=20
> To put it differently, I do recommend to merge more UBI-related code
> without a solid user-base.

also to be clear, i plan on using UBI block in read-only mode, so i'd like =
to=20
see an ubiblock driver merged
=2Dmike

--nextPart3518644.8JrIyZN0I1
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iQIcBAABAgAGBQJRcT5iAAoJEEFjO5/oN/WB26wP/i6aTsFbJGoqchQwT17UbwNV
c6csiC8XC72r/8XXfnG5tJU9ULPEk6rQJtqVOxkYPDFR3SeUdX0nc8YrhAJTJUOh
RWvaQ1QqCqiFvAAVFiyUL6A8KQLWmt8T4B0+91gEbulf0G0Q6z27F9hy6YXl+08q
efdV6XL5smBLltyS6ogew+RB3ZhzJvMXIRSJH1I71TqUTECgVH4oHs9IcRaMH52O
IriJzQCzUPzi+aevFi5hyIQFNYiQlYaTLH8nhDlDt8Y34Yqu6q6L6Q17U6DCxhBN
c4ve5WkPI/sb0y7gNXEivPr5yZwOYnAQxuoRBi6PhbDob90Sjiy8phIhSSSxkwhA
FVJTAmqF187YdCuhySF+0iMZRbYrYsz73xq6eaDhhPfuYF5aPuKz83CadaBPE7t5
BKoUTyvzCkbmHQsS7i+TQCO5ZUshTTMoHSFq4++J4y8iKllwzRDA5KleqYXpFTRe
1HX/0oTIUGyDF/4VgxEXapRG8m03GPmjB56M93OuLMHcP6iDdVJimt53i3qw5IKJ
58PQa8j3TUyqZVkYiJvMx+EDomZwJF6RLpgtzOC181CkumpEW999KSkbJtlHd+xY
QbFpdzSMTfa8qzgwP6kDC1jGljBCwcvBd/o/azVCsv/lGcNGCuaiuaPC/Ljp2hKw
BzW4oTXd9Nu0JRo0wlVZ
=Zn/0
-----END PGP SIGNATURE-----

--nextPart3518644.8JrIyZN0I1--
