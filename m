Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U2GE8-0003h1-O6
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 07:12:29 +0000
Message-ID: <1359962053.13791.9.camel@sauron.fi.intel.com>
Subject: Re: questions about parallelism in MTD
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sunghan Suh <sunghan.suh@samsung.com>
Date: Mon, 04 Feb 2013 09:14:13 +0200
In-Reply-To: <2CEE1A97B58A432486659DE985FE2F7E@sunghansuh>
References: <2CEE1A97B58A432486659DE985FE2F7E@sunghansuh>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-R3pMCSlpXlDESYjXCVZf"
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


--=-R3pMCSlpXlDESYjXCVZf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-21 at 14:38 +0900, Sunghan Suh wrote:
> Hi,
>=20
> I'm a software engineer who is trying to develop a new flash file system.
>=20
> I have some questions about MTD.
>=20
> 1. Isn't there any approach to make read/write operations to be non-block=
ing?
>   For example, a file system writes data to MTD and it doesn't want to wa=
it on I/O completion.
>   While writing, it tries to do other things in order to increase perform=
ance.
>   How can I use MTD such a case?

This would be cool to have such an interface. It should be modelled
after the Block I/O interface. But it would anyway have a lot more
restrictions than block I/O and would have many specifics.

At the moment, nothing like this exist. I guess it is just too hard to
implement, so no one dared.

> 2. How can I utilize multiple plane & die architectures in MTD?
>   As MLC & TLC used, write latency is getting much larger.=20
>   Instead, flash memory supports multiple plane & die to increase paralle=
lism.
>   Is there a MTD driver fully supporting these features?

I guess the only current way to do this is to make the driver expose
logical eraseblocks/pages which are multiple of physical
eraseblocks/pages, then upper layers will do I/O in larger chunks, and
you will make the physical I/O parallel on the driver level.=20

--=20
Best Regards,
Artem Bityutskiy

--=-R3pMCSlpXlDESYjXCVZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD1/FAAoJECmIfjd9wqK0ggAP/0oVjurCLsyYjmNWeTNFye6N
+LTPSQ3hyX72XnPvAtc6FPg6XjKNpPbKP84XSyUzYG9D0dqqQ6zAIgtNd45mJu25
WZUin88dj58STMjIs9clP6nKr+pVv4E3nAG7t673kK25uP3IJlZI5qSUNDquNgoh
bC1fYpiROpK2ag+ZbRIry7LQnOziwb0QT9gfELrfDVil22Z9Mw23zrZFzc2A36TE
/HT35ICYJKj7NgAora2B4z+5PUQycJl2SVDKo+EL3crFRMZuNr4TxYrO4go6JaVr
mmCS2xWQDeu/onH2jSWv7v3hVNBl2VhFfbteh5RuRs5LHclh+XMhCxyBpjV9UfIa
xYvXuNCIwG1gvMpvqiqadUHlpNN7AK9NdIsIzN3PpbRj9EhzXEvAdyfoXxF3+Sb8
Phcp0WauifjAzUiNLs9P45NxgM0h5a9nmQbvLxRPCyO5RE/ejHIOZZJiLMKCPr/c
ohkqOl79xJaD4j6rFbwW3wZNXRFhUWRd1ONdvinc0xljyGHT7w6VBaoo1bUi0R0e
KEWcZFaY1DIuWC2oMOwtuRkWbhsf7dpy8M06fBoSDxVUmMWvuoLtWxMNzaNAQubM
4mqJ52tFFng8OvfBJFd9SCWz7vcZP0oU5g0baX4a2gbRNPzlHmc+IH3Zvyp3mDW8
TEU8FhRgnGOpVFxc4aa7
=ZXb5
-----END PGP SIGNATURE-----

--=-R3pMCSlpXlDESYjXCVZf--
