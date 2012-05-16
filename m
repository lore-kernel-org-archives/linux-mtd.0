Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUf97-0002KE-RH
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 14:24:10 +0000
Message-ID: <1337178457.24809.56.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 16 May 2012 17:27:37 +0300
In-Reply-To: <20120516170324.337f2932@pixies.home.jungo.com>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <20120516170324.337f2932@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-cpCsPEd076ImV11WKFPT"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-cpCsPEd076ImV11WKFPT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 17:03 +0300, Shmulik Ladkani wrote:
> Comment above the function should have been changed too.
> (look for the "next_sqnum - get next sequence number" comment)

I do not think we should make these non-static. We should re-use the
entire scan_peb() function instead to scan the fastmap internal volume.

--=20
Best Regards,
Artem Bityutskiy

--=-cpCsPEd076ImV11WKFPT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs7lZAAoJECmIfjd9wqK0CioQAKVRS8T0iOWdoJQdncs2gxYa
qUWXP3vxZnTC8CKkE39URlIvUFKdcWiV97SiSfvNRl+pjKaQ0wmAkR8blJq/i8lm
uQFY+9S/59h8KSJUatPAUjxGZqbyCkzKIustOa3u26ToDKKN2FIaduNecf3jgJWg
fy7nKWp+Zs/RMr93aXrPsPNKKg/2Et/MeK4J35JC939vGpdcPs6AYRRVo4kWZ9yJ
zZIPbD0nezkCHqDZt9hWE6oNg1NSzuPATaIb3pH4Y0g01G1+nmiJkM1s8Nv41V06
+zNIo7y4YOOgFBfyO8RrkdosY2DztWfPCKjXPbUDWJU+XFE04hqg9jEgmcmPiVw8
EO/dj9gbNwc1igbGapACnB65Wvw2v86girqXWBHe2WFN9E4dm0AlUO1aDzt1h0m7
/p80nmayp0b7HSESf57VhAkdgRH9Uorv8/YYy8uxQczcaCBEc8MocXFuSikcI1ip
rEMVQBHuakpfsffnFK9WFa3how/iBzVSviwWvEunxzRDzvJ+WxIAfCViaxI7xRkF
3hfsPbJ5v7nqpX2b4AWkhFnzSnJIbKoJCG3URxQyWanFZ/MvjmN91ThBzKeOfbXP
/OQxSdir9B/tqGNJ88iBtpRwXfZIyMDJw5aW0HrQjFcPKXHLFoUA0JDh4y8ah9oA
xTjkJOOyPZGFi6YrdMx/
=7qFI
-----END PGP SIGNATURE-----

--=-cpCsPEd076ImV11WKFPT--
