Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TbY3o-0005oh-Vh
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 14:47:25 +0000
Message-ID: <1353595689.2701.62.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Nov 2012 16:48:09 +0200
In-Reply-To: <20121122123300.GM6186@mwanda>
References: <20121117151126.GA16900@elgon.mountain>
 <1353580297.2701.29.camel@sauron.fi.intel.com>
 <20121122111411.GJ6186@mwanda>
 <1353583450.2701.44.camel@sauron.fi.intel.com>
 <20121122123300.GM6186@mwanda>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-32rAYfHk6l/Bpilk8PCp"
Mime-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-32rAYfHk6l/Bpilk8PCp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-22 at 15:33 +0300, Dan Carpenter wrote:
> It's actually dn->size that we care about here.  That's not checked
> in ubifs_check_node().  :(  It may be checked somewhere else, I'm
> still looking.

Wow, despite us trying to be very careful about validating what we read
from flash, it seems we indeed never validate 'size'... Let me invent a
fix for this, which should also be sent to -stable.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-32rAYfHk6l/Bpilk8PCp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrjspAAoJECmIfjd9wqK0xjoQAK8hU5TWFBYHQvau+UIibtMA
fIx0z6SzjBJNpo5GqA8qWpZv4qTWikFZsLEvKvDaf8P8+YJHZSNP8Hf5ArAkKGbE
/Ng8kplbzEwSICmc9ZGJtxXLWJxZw47T5vR2nP6GN3NtI3niyW0HpK1hES0ThWpP
lAH6xg/eomnw13izwAgfkotTknLzzwzmoYnnWHyMIqeg+5i2WqpK8JL/Nq6ecjDw
oAGSeuasqHWFDpPSbCQ3sErt2y9mTzIEXvbr1bEXftv/WCIZQm0Zteg89NPk6w87
luQWpyUAVHlYn85zIggghRllX3lpuqMaw5DUe2sPMdPfwsugsqawUJkRBIRWIz/9
QtU4rUv1l6ek+E5CL4RtOarZ7vXhr/k7y4EjJ/63zaAGZh9CZiZRP1e/OMJB0I60
JDExeJrWv7BWlkCXqaj8HnvaaP87ALl3tWJ+AdGhJ0eyZokGL27hR5JwACjkScT+
4lq8Pw4+mVrx9671j2+OGljNdjXX+H6Nh4URd1BT5WuBVzqWpjpIxMcO9AZ0mVqr
AcHVVxolFPc7PORZbI2MbK7aK0ewmMfu8mDzjM8KFdHnFfSs07JqZ0l1h2CZ5D7n
gvpxeEphJSwNaaZsOnw9L+jrqRYaOKC+JTXzQbSEEc/zaIsPfOIPjT4mEbELkCPM
1VqZUvdrh8chpNRhxXMv
=2NVo
-----END PGP SIGNATURE-----

--=-32rAYfHk6l/Bpilk8PCp--
