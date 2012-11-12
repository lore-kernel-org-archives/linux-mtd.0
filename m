Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXw1t-0008At-4d
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:34:29 +0000
Message-ID: <1352734503.2262.6.camel@sauron.fi.intel.com>
Subject: Re: jffs2 copy too long after mounting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Date: Mon, 12 Nov 2012 17:35:03 +0200
In-Reply-To: <508643A5.1020901@linux.vnet.ibm.com>
References: <5019EE49.7000208@linux.vnet.ibm.com>
 <1345794797.2848.264.camel@sauron.fi.intel.com>
 <508643A5.1020901@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-utM8SymrhKThQACJTvDQ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-utM8SymrhKThQACJTvDQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-23 at 15:13 +0800, hejianet wrote:
> Hi Artem, thanks for your reply
> Now I can reproduce it after 2-3 days stress tests:

You should use perf or oprofile and find out where the kernel actually
spends time. Logs is not the best source of information in this case.

--=20
Best Regards,
Artem Bityutskiy

--=-utM8SymrhKThQACJTvDQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRcnAAoJECmIfjd9wqK03lYQAK5fuL19hglyC4qCR9nP9WQP
A14nyj7SjmEYx8exXYVZAdA45JmICz1fLbmzSotY6KjYkPAoaoMtfs9fvrDy6j9h
8QI3PSvh27RTg4kdjn4niiCzy1cgaQlPxEiEX6vpa3VGfXFS8g0+PrbzV512+2HE
rmbMlscBMxonjjUsfHHwqQzcE3cwEK8+3MQHlwTUkArlDM9Vg3qucv+nAStKaa85
T4AOu1OPqsEkhdA6qZpKWMrzInGhkfIdOQRS31LCBJGxQ9eo4r+8Mv3ieBECdp2Q
giKIWYGeFsn21YQRJNPfVpS6hCiz0GCLdG46/jJnKOCT8GZxuBVaUgOW5ypzd2ch
psDXHmgcGG7MYXKVbLmR/4XjsXLatwtj1Azulx88tmkMGCluC5VUY3S7u1KtBQ2p
pZ0q1YEldl1BwlhuBUEiw26Pvgc/EKU7mhghP6EOzioBnpT7lc/oTkVd7XNwyxIQ
ODuWll3EbS/woEO3MwDf1dPAwnAf9C8H2l4gFJy+16pZg7kuIdo+3QhsHrMZmYCd
CoQZwcc56vWsgpbB6VCahifL5lg7i0BaVJXlP8zEmhc0WpBm26saMqCICbM8fqlX
W/r3CAFMQrtC6deFIcKUPPYbaFH6H/rWKhgIkCapBcxoo6zXmhXXyj1i5+CreRUQ
obqAqO+zgR6bRtd0UquI
=qhvo
-----END PGP SIGNATURE-----

--=-utM8SymrhKThQACJTvDQ--
