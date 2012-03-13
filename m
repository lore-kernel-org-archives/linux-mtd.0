Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QlI-0000Yb-Vv
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:23:33 +0000
Message-ID: <1331641505.3595.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/4] MTD: add ecc_strength fields to mtd structs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 13 Mar 2012 14:25:05 +0200
In-Reply-To: <1331500873-9792-2-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-2-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-fE00Q5dDtqQjqELufqfD"
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


--=-fE00Q5dDtqQjqELufqfD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-03-11 at 14:21 -0700, Mike Dunn wrote:
> This adds 'ecc_strength' to struct mtd_info.  This stores the maximum num=
ber of
> bit errors that can be corrected in one writesize region.
>=20
> For consistency with the nand code, 'strength' is similiarly added to str=
uct
> nand_ecc_ctrl.  This stores the maximum number of bit errors that can be
> corrected in one ecc step.
>=20
> Signed-off-by: Mike Dunn <mikedunn@newsguy.com>

If you expose 'bitflips_threshold' to user-space, I think you also
should expose the strength - otherwise how would users select the
correct value in a general manner? Would you please expose it in a
separate patch?

Pushed this one to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-fE00Q5dDtqQjqELufqfD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXzyhAAoJECmIfjd9wqK01owP/i5VLxU7x74m+uDekuoNQO1Z
ezUXM/GAc7tVdpC56wutgSufKcm7iPrC5AoLvM65Z8gRuxpUixE9aLshko5ZZTDo
6UjkI7exSNDPdyE2IOOFSPxLcqYxwlMkhAAqbOU/j7lI1w5JwmOTjlclbl/P9XWr
SR57rJKSNc2AfIFcYRtb5kAqe7KoRQX10O8V2NOc1QZhs98Raq60bDqEQSg6UUH/
K1AUV2w/M+BVsVC2F33lm6Dq2J9+kOkFjHhyOgl1WdPjNhLqhIdLSaeF0Cv/S4Bp
LFz25bBknHJEwKAcofy5UtIGWk8yZpE/AzQ+8uabqFJir3P71l3+V3/dsH+3Hm56
f9uRCke8UCNIPd+yDb8AV052Tz18a8SrgX5+y2Mwdrh/xmtVhMUBBZ/APQM1txpP
w25Rz28NdkaOvjCCzu4UioMYRxVBz8EXovySyAtN97ObtJu75O4J+MNGpH1bjjwb
IQRZWaqVJzjDGh9oSUAiTed6Ud6h6VOF85durV/aEKDJAELyVf7GIGWnrvKiRzNE
IrIw6WA4S4yYrU0bkNJ6X51OpHwadM6OPiSM5awvbo1uW2b3Tmmz2FGxgT9OM0U1
DjEIfP7Joc1sx3bo0+ZAtIAveDPpaO2AHe/cFbyljAzQASaDWI1zJOPVhLYN6Ugm
w3dfX9fBkmYMu4eNw0/d
=/kob
-----END PGP SIGNATURE-----

--=-fE00Q5dDtqQjqELufqfD--
