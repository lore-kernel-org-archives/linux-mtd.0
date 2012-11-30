Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TeOYr-00037N-7t
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 11:15:13 +0000
Message-ID: <1354274146.30168.94.camel@sauron.fi.intel.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 30 Nov 2012 13:15:46 +0200
In-Reply-To: <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-dvSwhA+eRQh13N+RtDec"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dvSwhA+eRQh13N+RtDec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-11-21 at 06:28 +0100, Ricard Wanderlof wrote:
> On Tue, 20 Nov 2012, Ezequiel Garcia wrote:
>=20
> > I'm happy to announce we finally have a read/write ubiblock implementat=
ion!
> >
> > What follows are some historical notes and some implementation hints.
> > Feel free to comment on anything, ask questions or provide feedback.
> > You can even fire some flames if you like, my asbestos suite works just=
 fine ;-)
>=20
> I don't want to diminish your work in any way, but what is the point of=
=20
> the ubiblock feature? Mtd block devices are really only used in order to=
=20
> give the mount/umount commands a block device, and for ubifs the device i=
s=20
> specified in another way. So I suspect the intended usage for ubiblock is=
=20
> something else.

Well, it would give you a _usable_ block device. mtdblocks are unusable
because they ignore bad blocks, no wear-levelling, no power-cut
tolerance.

When/if we have ubiblock devices, we can kill mtdblock devices even, and
may be have some thin layer which would emulate mtdblock devices
optionally. They would be ubublock devices whti mtdblock name and
major:minor. Hmm? Makes sense?

P.S. Dunno why people were removed from CC. If this was done on purpose
- I do not think it was a good idea.

--=20
Best Regards,
Artem Bityutskiy

--=-dvSwhA+eRQh13N+RtDec
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIbBAABAgAGBQJQuJViAAoJECmIfjd9wqK051IP+Jbjoz5I52jH96nrWLoEqvy0
GJpLwNNRFg/kqsHARSAsQ1UudKXWgocVIHWbH/a3mpjrIxPGMHMMdD60YX+x6RNc
MFRVtIzdL/n3KTEiJoZSb+aROQs8uKmoqCb6HVxmPXq1gXhrvlHPnqsqwOgc9mq1
mxEp6rXZQfxjdYXqXV0RlW1X2xHAgwKhg5wxLO71a2FQqsVLWjaGWtzuF+j2upqM
U8f0r/0Ul4B7kshc2b4qXneoQNVrGAkbb5jk7ngeUTvIl7FUnmnP2NGSi7pUKQ4S
TubRTXeB8zq/pSw5y9x+Iln0oUbYz9HgLMuwda1f0fWYt3oWCFXfHjk+9s8HO2Wp
CB1wIR8OLdz4wTYP1YlGtijNSdX0j/uqGTeq3GYVY90GifA4LzRGX/d4U2zTJH9j
hae0krZDK7bpMHSkVmx47dmqObRqq9T2uPy/UQaczVS3u4gNesnmYkcS98Gx+6cB
Wtl44L6Vdm7IX5sAAQjXXbacAri/37Om7BhzKT03xSl24We0HmV9EI5MYfldnkM1
+Db/rA6uhDfR+LlJ3ul380v7nHPXT06S0wKRjq/CbEM6kH8F6sstqpw5n80lN/jG
62ZOk74IRqep2oUpeINJQALJ8aK0mykkLfZCiuEvAM8tYa3vzbta17Y9yDJ0RVvY
9gr4fmL5IetJqc01jsw=
=Lz38
-----END PGP SIGNATURE-----

--=-dvSwhA+eRQh13N+RtDec--
