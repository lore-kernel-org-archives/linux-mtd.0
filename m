Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TXw9N-0001Vv-1e
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 15:42:13 +0000
Message-ID: <1352734966.2262.13.camel@sauron.fi.intel.com>
Subject: Re: jffs2 copy too long after mounting
From: Artem Bityutskiy <dedekind1@gmail.com>
To: hejianet <hejianet@linux.vnet.ibm.com>
Date: Mon, 12 Nov 2012 17:42:46 +0200
In-Reply-To: <5089EB4B.5020800@linux.vnet.ibm.com>
References: <50881109.3010107@linux.vnet.ibm.com>
 <508898B6.8060504@linux.vnet.ibm.com> <5089EB4B.5020800@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-sy3NM02//IEQIbhnGhuv"
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


--=-sy3NM02//IEQIbhnGhuv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-26 at 09:45 +0800, hejianet wrote:
> Sorry,maybe my question is long and bothering:(
> I try to make it more easily and clearly
> in jffs2_garbage_collect_deletion_dirent(),
> what does it mean, why in nand, we can't actually mark nodes obsolete
> pernamently
>     /* On a medium where we can't actually mark nodes obsolete
>        pernamently, such as NAND flash, ..... */

Because in NAND you cannot change the contents of a NAND page which has
already been written, because you have ECC for the data in the OOB. So
you cannot just mark a node as obsolete "in-place". In NOR you can do
this.

--=20
Best Regards,
Artem Bityutskiy

--=-sy3NM02//IEQIbhnGhuv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQoRj2AAoJECmIfjd9wqK0B0oQAL80CaqTMhrMxGWh1aWCdAj8
W0+gmdNH2JkCFDbwExpNNf56uiAQdGttFDTMwYiwQVmUJ95kWC/CLMypTtdcO+M8
ZD+1n9SnIT/X15M4FuZb1/CWy5eeSy9EBLWzDiMyAdVqcW/7Eh4b4GrsMwVo0ke2
0pyXsMo+drReHPUI5esHKzoEUELmLFBh4Z4cArioMlYcvoEsS7yRfa52dPrmKFUV
6Y9/fD5fDddEaHlVIi6m9WE7fls6ERa9SJuiyC9TcPxg6PWK3JsXOwncvnzI1Hr1
XEvjTqCbjb/MxCxpH4Zyd/Y9txX7cblKmDo2TI03olzbA2T+DTsiqGY0Leu7Lg4T
cK8COnPpWgbGlvUrdSKShv0bcj8ZT9F+geCMqWCV9duzhygopx2zbaDPRZEBT4UN
HmJILaPeDQ8H9wwjBEtoWSBMIcdCbOk/wbOGR7PsHde+A34B+NJt6k5fXWOmOzoP
LIM/EzPvjeMUDxlcFWXlUgNLJM+tfzDkbJXs1KqYFeVD7eXhj1ST+p6FtZj6hoLG
F4WZI5/ZodBj+R2lWjFzpeEbBttPZnjIzD4q/rDID5cjePyZ05f4sUz1oilQv6vN
+kvkf9FT2xIbGAM8eLifch9mGw3HrhaN2UTjRwnmzC3zAfc/jSXW7QuLzor9Ti8W
pNgHOzbzbY4fC1/S+20F
=i7b5
-----END PGP SIGNATURE-----

--=-sy3NM02//IEQIbhnGhuv--
