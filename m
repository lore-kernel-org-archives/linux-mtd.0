Received: from [208.177.141.226] (helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZXLD-0002JZ-6W
	for <linux-mtd@lists.infradead.org>; Mon, 07 Jul 2003 15:51:43 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Joshua Wise <joshua@joshuawise.com>
In-Reply-To: <200307042232.43815.joshua@joshuawise.com>
References: <200307042232.43815.joshua@joshuawise.com>
Message-Id: <1057589479.1251.8569.camel@tubarao.lnxi.com>
Mime-Version: 1.0
Date: 07 Jul 2003 08:51:19 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-4+g7xkbklQxWmGOpBe3m"
cc: linux-mtd@lists.infradead.org
Subject: Re: jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-4+g7xkbklQxWmGOpBe3m
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-07-04 at 20:32, Joshua Wise wrote:

> I've added a new flash chip to the jedec_probe.c definitions, and it seem=
s=20
> that it's throwing back errors that the unlock codes don't match.

Smells like the unlock seeds at the start of jedec_probe_chip() are
incorrect.  I've expected this to turn up a problem eventually.

> I've=20
> tracked this down to jedec_probe_chip's cfi->addr_unlock* garbage - it do=
es=20
> look like that function will need to be rewritten. Has anyone already sta=
rted=20
> this, or should I just go ahead?

I have yet to start.  I know it needs to be reworked (per the FIXME
comment).  I don't expect to get back to working on MTD code until
middle to the end of this week.  I have this and a pile of other fixes
that need to go in plus some patches that Carolyn at Tektronixs sent me.

If you are motivated then send some patches with some fixes.  The unique
unlock addresses are all enumerated in unlock_addrs[].  This could be
used as the list to iterate through.  The current seeds try to take
insight into the type of device (8, 16, etc.) being probed to select the
set of addresses to probe.  While this approach is interesting, I'm not
sure if it is good policy unless there is an obvious, bullet-proof
association that can be drawn between device types and modes and probe
addresses.

PS.  Yeah, I see that there's a long thread strung out here.  I'm going
to respond to each email rather than try to sum everything up in a
single reply.  Replying to each email makes it easier to reply to each
point in the topic and gives a better continuity to the archive.

--=20
Thayne Harbaugh
Linux Networx

--=-4+g7xkbklQxWmGOpBe3m
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA/CYjnfsBPTKE6HMkRAtr5AJ9eh8QQE5hN9PA75v8+pZu3ysC2TQCeMUTm
QaWHEa1R87Xrsb80E9LSmZc=
=J6ER
-----END PGP SIGNATURE-----

--=-4+g7xkbklQxWmGOpBe3m--
