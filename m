Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SYHZE-0000xg-Sv
 for linux-mtd@lists.infradead.org; Sat, 26 May 2012 14:02:05 +0000
Message-ID: <4FC0E257.1030403@nod.at>
Date: Sat, 26 May 2012 16:01:59 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC v7] UBI: Fastmap support (aka checkpointing)
References: <1337771191-95358-1-git-send-email-richard@nod.at>
 <1338036094.2525.7.camel@koala>
In-Reply-To: <1338036094.2525.7.camel@koala>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigCA31536FD7E4D417086CA183"
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigCA31536FD7E4D417086CA183
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Artem!

Am 26.05.2012 14:41, schrieb Artem Bityutskiy:
> while my daughters are sleeping, I have a chance to quickly review the
> code. I just start from the attaching path and add TODOs.
>=20
> Can we change our workflow a bit. I will create a branch for fastmap in=

> the UBI tree taking v7 as the base. I'll add my TODOs there and commit,=

> and send them also as a patch to the mailing list. You then send
> incremental patches which fix TODOs or anything else.
>=20
> We can discuss my notes and if some of them make no sens - the patch
> would just kill the TODO.
>=20
> In any case, I feel a need to switch to incremental development and get=

> incremental patches instead of code drops. You can send entire fastmap
> work to the list from time to time, of course, for people to look.
>=20
> How does this sound?

Sounds sane to me.

> Also, I'd like you to document the tests you do. I'd like to start
> making sure that we never break anything.
>=20
> We can start with the UBI tests from the mtd-utils plust the integck
> test. And whatever goes to my branch should never break them. Do these
> tests pass now? If not, let's make them pass.
>=20

What is "integck" test?

UBI tests from mtd-utils pass now.
The io_paral triggered a race condition on my very fast qemu-kvm test sys=
tem.
On my test board with real NAND flash this race never happened.
Anyway, it's fixed now.

I'm mostly testing with custom scripts, shall I send a patch against UBI =
tests?
These tests test fastmap corner cases.
E.g. Recovery from fastmap with an empty or full pool, etc...

> At some later points we'll start to move pieces to the master branch.
>=20
> Shmulik, is it fine with you?
>=20
> I'll publush the 'fastmap' branch a bit later and send you the patch
> with my TODO comments, if this is fine.

Perfectly fine.
I really appreciate your help!

Thanks,
//richard


--------------enigCA31536FD7E4D417086CA183
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPwOJYAAoJEN9758yqZn9ejSUIAKjpSzlEverSnZahl0t9cqYX
bTBJJoJV2NdK0uV2dZzoiXgZPIRAf8HtW3VMY9DsziKT3jv8AbhnBKOHZ/ojiF0o
91srKwuaeog5tbr2H6VXd4yQLK1h7RFDBjii+CyI42I49kQ7cWvoLbKyjEJNb4Dq
ZfIoJvg8NlQraIXkpl0krgiHWXg3vONPWXfpBdLyXKYkZDmR772AL/ME0YcZgwP0
4KlhHyUsuJrvxU5ts+o8rU0M4fsrqPpXkXdQz8h0f2CCA/YDyV0/7f4QvPdLC2Mp
3PHL6JCVTA+CjZVFhbRysPPUQgF+T49flRuAbjarPSbjIpxXf+txr7GZ66nvrMY=
=YDBN
-----END PGP SIGNATURE-----

--------------enigCA31536FD7E4D417086CA183--
