Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrWms-00053r-3B
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 16:07:49 +0000
Received: by bkcji2 with SMTP id ji2so1535213bkc.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 09:07:38 -0700 (PDT)
Message-ID: <1342627325.9105.2.camel@brekeke>
Subject: Re: [PATCH v2 0/2] Regulator control of physmap-ed chip's VPP
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pawel Moll <pawel.moll@arm.com>
Date: Wed, 18 Jul 2012 19:02:05 +0300
In-Reply-To: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
References: <1342617721-14715-1-git-send-email-pawel.moll@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MyoCIQW+OUWxhptGSagB"
Mime-Version: 1.0
Cc: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MyoCIQW+OUWxhptGSagB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-18 at 14:21 +0100, Pawel Moll wrote:
> Hello again,
>=20
> After posting the previous, GPIO-based series (see
> http://thread.gmane.org/gmane.linux.drivers.mtd/42502) I had a go
> with the regulator version. It turned out to be much cleaner, so
> that's what I'd propose for merge...

Could you please re-send with the ARM mailing list in CC (because we do
not have many people who'd care much about relulators and DT here).

--=20
Best Regards,
Artem Bityutskiy

--=-MyoCIQW+OUWxhptGSagB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQBt39AAoJECmIfjd9wqK0CtIQAJNP0TeCegROHbqwbBGfX7aN
9wKEaQIu5qrYh8kJ5C/tZZdYAw7J8Wyp+CiQ+To8yFEGacNXi+Ex9cOzhDNx9kAa
OZLiVsFoj5nuKDUdS2Ve52cw5XZdgZlKXpKjEUWJJm/UZJbZFTmexSM+fVHJLLYx
xkc49iOKmytDeAJKO0VOx2Jo8od6gLcVepLFUju5C+xIXXqzqJgMp2TBf4CBtRBt
W84uFhVix5ewG59jRi+tP8HaH3w4+w7NzDUdesZfrfeWAPLmQKMqUIKI3ATx19B0
YsWrKKkD3+E7Hk4QWBhbshVOHbrMco3W4q3ZXulvG+O26vHhR93qmJ/yYliXiyUw
zItkNy2z0fIw6purIkHFZibRXo+V2UGgBhxD/1fTui+Ws055tWJLuD4VGtQAWlvM
N74c8yJbVYLRJxKwnaXfYijhWVzAICz6jv3gq1gar+p8BXbVGxMl0jfQGu9bhm5O
wZizV/o02QwGAARig0wKok/V5MtGk7J9mUJ0W7/rn7/LYt6S/b3MdsWsinXf960k
c/EJkzZOXTokqyGybASQL86YBms+h4b8SbtTHmcbiKD4jYRN7RQFRW1RDQnbYAqI
MQ7oBcZUG+fsHWHsFaWqcOlmhbRUAHRifBpED2DX6xGaTNFizSFsfGalfSi2W6Li
YV2DsJftyooX88rUZctc
=Iy3f
-----END PGP SIGNATURE-----

--=-MyoCIQW+OUWxhptGSagB--
