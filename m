Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUcBf-0002PW-Ms
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 11:14:36 +0000
Message-ID: <1337167083.24809.49.camel@sauron.fi.intel.com>
Subject: Re: [RFC v4] UBI: Fastmap support (aka checkpointing)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Wed, 16 May 2012 14:18:03 +0300
In-Reply-To: <1337166556.24809.42.camel@sauron.fi.intel.com>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337161096.24809.36.camel@sauron.fi.intel.com> <4FB38683.7030306@nod.at>
 <1337166556.24809.42.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-so6oLBU5GUuWpVSbH6JA"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-so6oLBU5GUuWpVSbH6JA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 14:09 +0300, Artem Bityutskiy wrote:
> > The maximum size of a fastmap is limited to UBI_FM_MAX_BLOCKS.
> > As I said, in worst case we'd have to scan 192 PEBs, which is a constan=
t.
>=20
> In this case you cannot use O notation at all because it is just used
> when talking about asymptotic things.

OK, we are talking about different things. It is fine that you need to
scan 192 eraseblocks, this is kind of your journal. And this part may be
O(1). But there is another part as well.

But as I already explained, you have a _table_ on the flash, and this
table stores Erase Counter and LEB number for (roughly) each PEB. The
more PEBs, the large is the table, linerarly.

As I explained, you have to _read_ and _interpret_ each record in this
table when attaching. And the more of these records you have, the longer
it takes to attach. And this is where you have your O(N).

So basically fastmap makes UBI's linerar dependency multiplier a lot
smaller, so it is still a great improvement.

--=20
Best Regards,
Artem Bityutskiy

--=-so6oLBU5GUuWpVSbH6JA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs4zrAAoJECmIfjd9wqK0qx4QALLl/Wl5DnVxMoSwzhrfYSco
2XVQfbu1ziMui3lq1+5iNYmed8YUosS+CcGYDx+VCl/CfF3LR7zB4zO6ThfI5eKI
N4Zy6uTHlkGFEENt3uagpOOOG7SL1c6S7W24QCGqAkXuX5gA8T8ZRLezt+DnAmUp
WRu0rXSOo1DZKgotxdHDD4edgzg0g0zrStTwC5+HwxuSHc7pdN1tUTWci9NXEPds
H1azJPgoIK+r1tan3VVkFuXBmCKcbHRAQAHGvtpPbvxdppRp/wrL9MCuFB/D0Jtw
ek8Wp/MTtNehBR70CGrv627stiO1ok39eur1qZpT+d53AK2m7aKu6nfrOE9DJV89
ZXR0iuJlnqQ1h9EMWZTy4kATgZf5rowbDauulV6S7mCpc9pMC9tJVdCAPnvQc/w3
JL30exoaWqQIDVf2jGC3zlv9teTQmE1jJzj4ytj322vy/JBP8uT85AviaChj2srx
nmdd9/MyHHp8RIUDS+NzNTtOf3T/KImL//qMkbKwRPruCwETKdi+F8BqFcabjnuM
7MMGnoYNaSbO8R9YpY9WzdIAA2JsqWL1+GhiHrPdzebi+QTvMrRWgfC9dFPZY7TC
edeKwYNZa0M6us7PyDPrz1+C9QM9rrb7Pzh4MpQgY5shlGFCKQfVmWeF891Q19Fs
1Cj0nBZPbXUpqb6+LTz4
=GePC
-----END PGP SIGNATURE-----

--=-so6oLBU5GUuWpVSbH6JA--
