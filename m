Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXTFV-0000qJ-B5
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 08:18:22 +0000
Message-ID: <1337847720.15137.85.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 24 May 2012 11:22:00 +0300
In-Reply-To: <4FBBC4EE.4040802@nod.at>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ANTLuREx6GKnyESMJys2"
Mime-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com, tglx@linutronix.de,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ANTLuREx6GKnyESMJys2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-05-22 at 18:55 +0200, Richard Weinberger wrote:
> >> +     * has never seen any PEB used by the original fastmap.
> >> +     */
> >> +    if (!e) {
> >> +            ubi_assert(ubi->old_fm);
> >> +            e =3D kmem_cache_alloc(ubi_wl_entry_slab, GFP_ATOMIC);
> >
> > Must it be GFP_ATOMIC?
>=20
> Yes. This function is called under a spinlock.

I did not look close, but this sounds bad.

You need to have a much better justification than "I allocate it under a
spinlock". You need to tell "... because there is no way or very
difficult to pre-allocate it while I do not have the spinlock held,
because ... (explanation)".

>=20
--=20
Best Regards,
Artem Bityutskiy

--=-ANTLuREx6GKnyESMJys2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPve+oAAoJECmIfjd9wqK0V9AP/33Gw2N7AeNDrQ1bl+FqgfoK
dnLNrKk6vwphWWs+Ke/xM0t3sIbcMBJhzEyD0mlqJFE0ZYm9rKwRu2HMXocZ3QX0
UNTRCD1E1peScgcUmZINu2vF5R9PNY0yQrD30UNHR8en198bsUWl+Vb+1zFjI9Yj
8+ilIb3OYPPgXuPCCxDEsquDWSSIYwIjcBEH0d3tRxLA1/qIZFejWBb92oGA0T/W
zrU19iV5sctfWMUhXZFK62dvD+8ZbjXbeKbXHE/FwJgsYejyKAstn69v2m/Pdean
A61YlI7rg9jwt6U8ML2E4LOFqhKpt13xzOIoho4lK6rAaT8twrAo/mI6BwqMcrWF
ujP1hK3lMgjhFBpTD3elQ/eNPMXuEeRlEWcskHPDKyWubfnNNtlO0Cqy8q3roxt8
L6xGyeWYalKmi98YABcuHN2YKSlngZ1Kh1NucTp+7s8j3RPmWgJ53PySc8ZdTny8
PJLdyAl6pM6pVzK6RaDgypWFJMQk4WGuOKr89bGCwnOXnCaRMN1mV42jaMwn/LQI
0WvUpTbwppFdDwmoMQRedtwtCngwu4ZLf8gzLhHtQJgpJyQ30QYX5JM5fnkk0f7O
ikK2WJBCHKoTuAbftC87OPA2CuADfKkxDSiKLWxFAIDnI0sCHze8LCUGELy5IXE4
d9nXe+8zg8ZyvYKN3SWe
=4H+H
-----END PGP SIGNATURE-----

--=-ANTLuREx6GKnyESMJys2--
