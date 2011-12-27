Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RfTRR-0003mS-Ae
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 09:35:29 +0000
Received: by iadk27 with SMTP id k27so22253141iad.36
 for <linux-mtd@lists.infradead.org>; Tue, 27 Dec 2011 01:35:27 -0800 (PST)
Message-ID: <1324978636.1165.66.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 03/28] mtd: introduce mtd_erase interface
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 27 Dec 2011 11:37:16 +0200
In-Reply-To: <CAMjpGUeh+V0Oe8RgDjKM+WyukWJcRn4X0kh3=CPVohGAycb+qA@mail.gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
 <1324663880-22477-4-git-send-email-dedekind1@gmail.com>
 <CAMjpGUeh+V0Oe8RgDjKM+WyukWJcRn4X0kh3=CPVohGAycb+qA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-rLzR4y1Q8o0tbg0a08cA"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-rLzR4y1Q8o0tbg0a08cA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-12-27 at 04:22 -0500, Mike Frysinger wrote:
> On Fri, Dec 23, 2011 at 13:10, Artem Bityutskiy wrote:
> >  static inline struct mtd_info *dev_to_mtd(struct device *dev)
> >  {
> >        return dev ? dev_get_drvdata(dev) : NULL;
>=20
> on an unrelated note, this NULL check is unnecessary.  the core func
> already takes care of checking the pointer.

Sure, I can cook a separate patch for this, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-rLzR4y1Q8o0tbg0a08cA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO+ZHMAAoJECmIfjd9wqK0jKIQAKaauq2YyncL8taRv2uaxlxj
J0Nh4EJCrqxukCHPD1aMECdSxkHxy38NqErRKU1jK3V8bFUQaQAJtFHZHEFIiplJ
HBLH6iWJciM51E87yDTn1exoBYsL/Zr+FDL1ZKTyxgtexfsNNZJCHIdb4GSsGIiR
o71ZJZ2BEkBR5mhVHMt2PnOcI9Xl9jsV+zEiebZpciAFg7fLaVcwLWlhSYSkDpbi
tBz+WRDfmYiJxUWoZVK9HKsKb+miwxIvLimILQI9I0+MI1jPFJzIEc5N0hOGWUdj
U9GvjZL/L9nQV/mQQTgRCxKSXjXmgZJnvuZGkiLD+kotRnNTGkIZD62ddGPrR7aM
wVf0MDd3clBsZzL7+q/ctpiQGWIGRicrlyU4QuCC5HWm39xUrs8IcDODM5zW18gM
0qS5LY/ttR80oCgivtkf7Vl/PMgxI2WpBVGh7Fh4igu+harNdb8g1/rC0X4M1vTL
5XjEfXCLkzfNPXI4cn8rzMKFFHZFicMWvdtMIkYEgP7A+UGCOwM29U4Vu/UuUFhG
Vpxyo6ZZm5N52phyhoM5sRHLlPPe4ljX6jlYU/NDZj5oIZDWTbBUn7c6xWW5mewW
75bPP1gqfZsnD5s57iUT4YpIk9NpYeUJcu5DpHt4WXGVEgqB92BMSVgsJQbGrZ13
wR9IpAmvpWkJi4Ddpvx9
=Qblg
-----END PGP SIGNATURE-----

--=-rLzR4y1Q8o0tbg0a08cA--
