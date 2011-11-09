Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RO3la-0005sP-O4
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 08:44:19 +0000
Received: by wwe3 with SMTP id 3so1338100wwe.18
 for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2011 00:44:16 -0800 (PST)
Subject: Re: ubi on MLC nand flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Wed, 09 Nov 2011 10:44:25 +0200
In-Reply-To: <4EB9EDB7.7000600@newsguy.com>
References: <4EB6A6A8.7010703@newsguy.com>
 <20111106173528.GA25467@parrot.com> <4EB6EDDE.7020603@newsguy.com>
 <1320788720.17770.43.camel@koala> <4EB9EDB7.7000600@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-W08XGCk1KvyY6xw4Krkx"
Message-ID: <1320828272.24797.26.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-W08XGCk1KvyY6xw4Krkx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-08 at 19:04 -0800, Mike Dunn wrote:
> Oofa.  What have I gotten myself into?  I don't have all those devices on=
 which
> to test the changes, and I'd hate to break a driver.

Well, you do not have to test on all devices. If you do small
incremental reviewable changes, CC the right people, and test on nandsim
and mtdram plus your device, this should be good enough. Those who are
interested will review/test. Those who do not care - will fix their
drivers after the breakage. Of course the goal is to not break anything,
but my point is that myriads of divers which is impossible to test
should not prevent the progress :-)

> Some userspace mtd-utils for nand currently use it, though.

Well, not sure if the usage makes much sense with modern flashes.
Anyway, if you do not need to change this - don't touch it :-)

> I'm able to at least look into making these changes if you want to go ahe=
ad.  My
> motivation is to get a robust ubifs on my diskonchip G4.

Sounds good, send nice incremental patches :-)

--=20
Best Regards,
Artem Bityutskiy

--=-W08XGCk1KvyY6xw4Krkx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOuj1pAAoJECmIfjd9wqK0e5sP/3FZD6NzNEGX4JGEOKKWcaDh
zog+/Ro/n7ylgjlqfvX1CwkQdmeKE9gHLNjZc4Gh29hTMZKlkqEi0M9Pqo5IM8MX
VZMkz3vwZSQMHdgCInSgUypEQrRNYL0ly8kgDM7PSEmeEwKX552J1uX1xHB4l0XR
4efBBvt6CFcleiSctB82MOO9lpCQk0IoLwVs3OhTIPbEtkaWX+GDCB565Taoz4F3
DhDhXxrqUYtHL9FjNFe2I5NK42ZvyKDe6VUKbhxWMSpBCiNe3RKkVcg2ISF23kHE
l1JB/6iPJ6Uz7rl31DNv97CZOg3VfBKyVA1RZ+nkTeMQnsyQng/prHsFiQtDloAK
f38fturaKJfLRaqcu3FpItAwV7S7w5QtS8y8AoxRY38nUpbjFJ2eXVDAq68JnRGH
fUicW/7z0Jy89Je0OtlRr4iHkHlAXStX+hzWQVHM9zKDjyPJdoUnK6yUhfQw/cpr
QaqJKFTez7oQG3W1BaKEWJoOqfqS/ms4qJA4f2/2Z5PXcbaEXRbWArQZJSkyYQe6
aHQcU4WdzcIuMch4UKXiTFB9mu7BTKan2Fobx7n0RNlDHpDCsKGlA1IYmKfOAS4V
/CzzBBX7+gY8pr7zHmpav7XZx28KWKj0uohtVcDLATRhSVEsLOJtlhgFXzehpNQQ
cgT/P9JAy3nWdvAxpEKJ
=YEch
-----END PGP SIGNATURE-----

--=-W08XGCk1KvyY6xw4Krkx--
