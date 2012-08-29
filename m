Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6dMh-0002iq-HT
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:11:07 +0000
Message-ID: <1346228165.2848.432.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong partitions number
 when truncating occurs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Wed, 29 Aug 2012 11:16:05 +0300
In-Reply-To: <20120826090603.6b833e54@pixies.home.jungo.com>
References: <1345904767-23011-1-git-send-email-shijie8@gmail.com>
 <20120825120231.73577d6a@halley>
 <CAMiH66HyfNEzEHGyZUcLJ_01PNVHqA44fjAqXsyM2c-HHms8hQ@mail.gmail.com>
 <20120826090603.6b833e54@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-A+mtwrkXg2WY6IeKxnqB"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-A+mtwrkXg2WY6IeKxnqB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-08-26 at 09:06 +0300, Shmulik Ladkani wrote:
> root	100m@0
> kernel	100m@100m
> rootfs	800m@200m (truncated)
> user	0@1g (truncated)
> rest	0@1g

Who would benefit from having those 2 0-sized partitions and how? How
many users/scripts would be confused by this (these 2 ghost partitions
would be visible in /proc/mtd and sysfs)? How much RAM would we spend
for creating sysfs files and directories for these ghost partitions
(note, one sysfs file costs a couple KiB I thing, because 'sizeof
(struct inode)').

While you suggestion is clever, do we really benefit from this?

--=20
Best Regards,
Artem Bityutskiy

--=-A+mtwrkXg2WY6IeKxnqB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPc/FAAoJECmIfjd9wqK0UkMP+wR/EK+hRTJxdG69PRgTae0U
MD6Ga5bZUbNKsow03roWaikWQMwuStuPvjcJuY7Rjvwgo7ESEnneUCOvm3GUEvEK
tFgNwpbkc6fNoeXMn05A0R3LSaRnJ/XJLQgbrxhDh+lHKLpIhp8GyCcMpIQonMaL
tCYJ357bo+85gfWw3b5nfqWjMIfwbARdoGKDIgwKBuFmnnIce7L/hW7Nsf4zjQnz
z512JD+Jv4vevgUu56I+DIbiDskTBSTMmltYd2A44DYXq5NeRhx3bfVH9ZEwUQNX
BaMy7/liGwsY8yvD6RMFYKNbTLwFAfidIOOK3KM5pezh05x2GSDeeUKk9DCnWFbN
jfm4SYv9DyvwBG4/Bejz4nP0INu0lHE1cSEVVfd6jEIKs73DHiiDQNEGon2sgmOM
D8KJAMNs3Wb8wxoNr+WPl76883Fpl+rvNXvB0KHgNfCZ3DJG1qZlkqbsBerSVeCX
Y0JNY6Tv5NSFKC2kQ1dSVWFgA/WjQ0wbpJqRgasB8NRndCADXNgMjmdEH3ZYHnDY
dlHUCcAZoCbZy826RUgAiSxiMvFrjIk4rg7e1snOXYlclGL19WZuTpEvJGCuoy8y
1h3I6RFnEDqUmt2NEj9UpN7BvJXl6J5E1fqudt2puwgLJzdJ0tZ53iPc5qwE8l0p
kpQ9yEkOOc069OosnNDo
=bl+6
-----END PGP SIGNATURE-----

--=-A+mtwrkXg2WY6IeKxnqB--
