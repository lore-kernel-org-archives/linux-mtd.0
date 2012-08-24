Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sPz-0008W2-Ua
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:51:16 +0000
Message-ID: <1345809360.2848.296.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jeff Westfahl <jeff.westfahl@ni.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Fri, 24 Aug 2012 14:56:00 +0300
In-Reply-To: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
References: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-p0D+Jda0dB5dbraqpudA"
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


--=-p0D+Jda0dB5dbraqpudA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-13 at 16:35 -0500, Jeff Westfahl wrote:
> Added a NAND device flag for subpage read support. Previously this was
> hard coded based on large page and soft ECC.
> Updated base NAND driver to use the new subpage read flag if the NAND is
> large page and soft ECC.
>=20
> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>

Brian, would you have a chance to review this patch?

--=20
Best Regards,
Artem Bityutskiy

--=-p0D+Jda0dB5dbraqpudA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2vQAAoJECmIfjd9wqK0ZZkP/1f07qFvFxA9Nii6z2/PIYpV
/j2fDBOMNKAogeKq2q6xBKIHUera7vBH4p92dlV52m3JUMV7/YK4PHx77lgU+yiH
ASF8eKimYOd0fvzJuzwgu1SjC4eNehQ1kP8GQ29NPxz+mZq01OrHpb9EFpTNl597
j7aQ6nLsRfW+yxqqwpwBxL0y3Tla/DSTj6X8MTjteExdSm8ieDqNHmFAi9sbyJZx
a7TJDilLCN1yBZOw0TvB19FHd7gmy/Wq5W5OM5P1V6A6t7+78z9U/70aVlzhGbtM
QJDXLsDePNdH8DsaM2ctVdAjJ0g9xuxf3wFV38FeIBX7SCeytyBmxULvkNgG1lgn
7/ZMewv+c0gF2OgnoH1nzhT9iG0tyQxGheEE56JVXwK6O+yGevWOrD0ApfN/kMSp
sDpx+EK1Z3yxF+BFm5YAtge+tnDZD++b2G7AEuEeNnxBkPyAVIuGMKzDcdg8ON+T
shMCO5KvvC2wjOqESLucFNlVTcqiaAAXA4d2YrZF7eAQsA/2PiFha3GdOVqcj4mm
o4HvaDVxk/O0HyVhceY0rNb2kKtouTHJcS5W+AcC6UpfhSP5NUF04gMnKQ5/8tYn
VlFTewy93yL5PJubNCbgMcdeKZMZ4eyjv/Hy4uwjAisnSSjufbCZrnCZ2TrJQbYX
iwyZ0gCitrsTZmaG8U3v
=8v5B
-----END PGP SIGNATURE-----

--=-p0D+Jda0dB5dbraqpudA--
