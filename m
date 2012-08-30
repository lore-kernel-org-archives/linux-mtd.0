Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6yim-00054A-71
 for linux-mtd@lists.infradead.org; Thu, 30 Aug 2012 06:59:20 +0000
Message-ID: <1346310134.2848.537.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Fix problem with unlocking timeout
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stefan Roese <sr@denx.de>
Date: Thu, 30 Aug 2012 10:02:14 +0300
In-Reply-To: <1346146453-30196-1-git-send-email-sr@denx.de>
References: <1346146453-30196-1-git-send-email-sr@denx.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-c8z2kuQ5L4Zr+klspCMx"
Mime-Version: 1.0
Cc: Andreas Friesen <andreas.friesen@hbm.com>, linux-mtd@lists.infradead.org,
 Stephan Gatzka <stephan.gatzka@hbm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-c8z2kuQ5L4Zr+klspCMx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-28 at 11:34 +0200, Stefan Roese wrote:
> Unlocking may take up to 1.4 seconds on some Intel flashes. So
> lets use a max. of 1.5 seconds (1500ms) as timeout.
>=20
> See "Clear Block Lock-Bits Time" on page 40 in
> "3 Volt Intel StrataFlash Memory" 28F128J3,28F640J3,28F320J3 manual
> from February 2003

Pushed to l2-mtd.git, thanks!

Artem.


--=-c8z2kuQ5L4Zr+klspCMx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPw/2AAoJECmIfjd9wqK0x7oQALYUi4H5QCZtNXF5/wIc1yp7
kgkzvnI5Nrrzw6ZYjmNUo0Pgmp+Hwb7WcpGjMurZs0Jlpe+dlrUFft7M/gJBJHtR
smkIRVy11NDGhNWWWdBrT9/MwWsyq6B3Nf2R06nofnWcf/3WKvCK5nxhf7nFyi8W
J540Hyo+a+9kwyUbtpkqsQcO8/Ca6kjoAa4x5j6XF+E2xj3b213nzycqy+fY6xAN
s/dI3uheagUc6lcnt5oco1YLtobf5VuCneCUI2sLwVDdfwLr1A+mw6Aiu6UcMD8W
03oAN+MGED7bY9luW0LmHzkpLkq79MUJcw4auoAJnf2Qcorfqw5klbbjJpV+LDG2
jxsZA0KrSX9YanCC7Xg2AvXeWP+CUSKzjTx36lKuzPtxQaoOt/34VJqQxrG4MjLG
x7funaSe2RMoRL4tKFKQWp9DMfp9lI5jfU1WCqAqAj0PGYjkIN+igbvSqAbwXbQk
gA9UZwjPze8/wy2wc9Wo0M4Ay8hVnji96Wse5iXPVtILUN99DfZkH5QjJQDSNFfO
8wPTLwQpgbRjSqLsqyN2wmYT9ms44KbIr1jO0V8MGMEIdXFysg4n/97m58eflGzC
CLbl37wg/5JI+voP1JPyXaP3WW1hSGQ1w2GJn5mNHLc4DRb4RQf+6CFONR+UeD9Q
vqc3lYyXYMZ+xLIkapLa
=9URx
-----END PGP SIGNATURE-----

--=-c8z2kuQ5L4Zr+klspCMx--
