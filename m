Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScXCh-00026T-4f
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 07:32:23 +0000
Message-ID: <1339054570.6875.84.camel@sauron.fi.intel.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Thu, 07 Jun 2012 10:36:10 +0300
In-Reply-To: <20120606175507.GC17332@parrot.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Fu2gFwm3rYYfzhQ9C3B0"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Fu2gFwm3rYYfzhQ9C3B0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 19:55 +0200, Ivan Djelic wrote:
> 1. on legacy systems with 1-bit nand and strength =3D 1, default bitflip_=
threshold is 1
> 2. on legacy systems with 1-bit nand and strength > 1, default bitflip_th=
reshold is 'strength'
> 3. on new systems   with 2+ bit nand and strength > 1, default bitflip_th=
reshold is 'strength'

Ivan, Shmulik,

I've gave this another though, and I think it is OK to leave this as it
is now. Your replies were very helpful, thanks.

Shmulik, would you please send your BBT read fix as a nice patch?
Please, add a not to the commit message that this fixes an issue
introduced in 3.5-rc1 and should be merged before 3.5. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Fu2gFwm3rYYfzhQ9C3B0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0FnqAAoJECmIfjd9wqK0Vb0P+wVUrhY0HUqeh/KJ388KKz0E
Mnlr3k8v/qQCDcKKDc30b/i1owtkchYLduCxXUOZKszLdGISuYwu03fGBjEt3S6m
GIMnBYQl4PezKLyPdjGvysMGbc8Ng3Qu8vTsiks8GDaOBjhj/X1Exc21cZIgM7XG
kIhD04gWvizWNxgBA7ShkLywYzRYmQ5D1d1OFUDALPabr5GBr/i2dWimmEmtgUjv
hQT3I3qs/YxgABiAXfqJatR6oMxYxBaw2YY5BgKUMzeS1ioMSEWGVciPNb5JXwse
7p0BXSED8LAqN3fiyHWsxmgM//QaI35RB8X+i9I4YSgj7OEBpmkM47Z61W0P3Ybu
n3r/xbVPQwjnLzTJW/I8xMjITDGVrbp3fNVK9vtwk0zzXgT/PBJpmX4Cvvwqj1IN
E+Hq7ghKNqMhP5yFehSPQABIR0cFBy+Je43zO1I/c/11VKk38IJFbW1iAMKsNoJS
PJ6MEGx/vQOVZS1t+WnOKOQzbrzdQoV7/a57cPqpu22FTXvBJ5+QG/29swiP9mho
fdexKS3hAIu89RCoI7OHQ/S9F1uophuPObht/8G1NC5dbnTrIXamsnEO1oJsdsWf
jSwcY2rLWdpa5ESS6yDzeYELWu8diT55i9rP8db6cMAS1Z8i7nWdZwMCgrnTUA/u
49o5sn4Rn8k8MK03Hfej
=yHDs
-----END PGP SIGNATURE-----

--=-Fu2gFwm3rYYfzhQ9C3B0--
