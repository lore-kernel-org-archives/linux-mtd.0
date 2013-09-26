Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPAF6-0004o2-AB
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2013 12:00:24 +0000
Date: Thu, 26 Sep 2013 12:59:48 +0100
From: Mark Brown <broonie@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20130926115948.GO19304@sirena.org.uk>
References: <1380191565-28640-1-git-send-email-sourav.poddar@ti.com>
 <1380193243.28494.51.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="1bhFRg6vL9BT9osV"
Content-Disposition: inline
In-Reply-To: <1380193243.28494.51.camel@i7.infradead.org>
Subject: Re: [PATCHv2] drivers: mtd: devices: Add quad read support.
Cc: artem.bityutskiy@linux.intel.com, balbi@ti.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, Sourav Poddar <sourav.poddar@ti.com>,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--1bhFRg6vL9BT9osV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 26, 2013 at 12:00:43PM +0100, David Woodhouse wrote:

> This seems sane enough to me if Mark agrees that it's correct from the
> SPI point of view.

I didn't really look at the patch but since it doesn't involve changes
to the SPI API providing it does the right thing it should be fine.

> I've seen a bunch of "*this* is how you indicate dummy cycles", and
> "*this* is how you request a quad-read transfer" type responses; have we
> got all the way there yet?

Nobody added an API for dummy cycles yet but it's fairly obvious how to
add them if someone wants to do that.  The quad read stuff is in
mainline already.

--1bhFRg6vL9BT9osV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iQIcBAEBAgAGBQJSRCGxAAoJELSic+t+oim9AXAP/Rz924OCl1lzWSA/X7Tvu0Fk
BcUiFeJemqSD1+u/WOxiWO96gRNKUNieZHpEu0lxCtIXo0BDZVB76p43VUics0V2
zzGCxfQedjHlct8tmp4cHfGHCMrvdkk+80Yl9dmQm7SdhTde0q2qmhsyBFO7wXNx
kF6eZ1Cz80FtdKcaWWDouZeESEKUi9/31FQnzcVdfUyUTv/Gi+fzOUwt7UZ5/Tle
Gn4vN+IhkIxU1oWyfTPCBcBBDqwcxAcrBnIY3r25y8bKqMpNUow1v0PbLWSyWSfx
t879U70rXDBwp3fPZPym8L4Ctky5wyjV3EObbi5VLPsmDpzDYZF2GGHdSjaY9qBw
zCpgmQ/mSXrLKmZ0rOn8KgDHY8k8bSbpxXPh8jr2rnVeuypELVAHVFWo7uhY20if
y2Y6KQnSR/VR8aEeAau1Qp4nDIp9CFPTaaELuXI3/ccHMjI+UtDeSHjpxf3xZYU8
Uxs0pm88nkIQ0W7Jnp4VKA79FEwVWgjo9u8LEqf4yA1NAD3i8AuHZ6WW6IeF7yEH
eqlAWPo6zFDBe72/FsOectVALtNG+xaiE6Cw2ucFXDYDYIV2fUqM5fCNj2wG6UGY
w4dMQxDfnUt4D1JGaYwNq41zQ6+6gJta7Rk4Oxxyi2wE31TfrZdM6CzO/GZXRtqV
9un/IhXTejwKOko8i7xY
=Z1h+
-----END PGP SIGNATURE-----

--1bhFRg6vL9BT9osV--
