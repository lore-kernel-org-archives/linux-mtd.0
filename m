Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TfnKd-0006AL-8F
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2012 07:54:20 +0000
Message-ID: <1354607715.11583.49.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] ubi: Dont call ubi_self_check_all_ff() in
 __wl_get_peb()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 04 Dec 2012 09:55:15 +0200
In-Reply-To: <1354564667-9549-3-git-send-email-richard@nod.at>
References: <1354548780.11583.21.camel@sauron.fi.intel.com>
 <1354564667-9549-1-git-send-email-richard@nod.at>
 <1354564667-9549-3-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bHzcqK3yYhV2FGodF2DQ"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, zsadecki@itwatchdogs.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bHzcqK3yYhV2FGodF2DQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 20:57 +0100, Richard Weinberger wrote:
> +	err =3D ubi_self_check_all_ff(ubi, peb, ubi->vid_hdr_aloffset,
> +				    ubi->peb_size - ubi->vid_hdr_aloffset);
> +	if (err) {
> +		ubi_err("new PEB %d does not contain all 0xFF bytes", peb);
> +		return err;
> +	}
> +

The original idea was to verify that all PEBs from the free list (tree
actually) are really filled with 0xFFs.

What I see is that with fastmap this is not done.

I think the code should be re-thought and re-structured to make the
verification happen with fastmap enabled as well.

--=20
Best Regards,
Artem Bityutskiy

--=-bHzcqK3yYhV2FGodF2DQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQvaxjAAoJECmIfjd9wqK0b84P/2pYDffoVW26BWBcyOAFY7xT
4PmmXC6fOh1SOhALGmcNaNQVRJ1JREV4Nkaow2g96b1UBBfoR8/h+5sLb7rG1TBD
wkSex3iVyGaV6fpn5ZYyFBiYsuF3Dz4BaHtmTdkaFYJEIdwoDtUq7n8nnWPWCI2P
Add7mMFMgrTilxuVe/Z1oxvAd76weDwCljJ8mj3o/IlzUFynxKHmRMyFdlrVb0o7
y8NLL+Yc43JnuE4fIDEarG0FfRy8gBAh8Oo/oVA/9H0K9P+EKBvF9mmjB2thN3Tq
iZwDEKGqAebfR5DYiVk2ynQCUyi/u6i5u2Ao9LrjKYIckbBiZ+FdJcVgJOTRzdy1
udxh02C04+IXYJJaNU8Zz3E/PZqHRg42iUbv4V1s4EJhVUeVinBbVIaV9zwN5lqi
T6mTLkVNGW2RW38fnrn0binsaX1ng4aL1woQ92s1um6yOuINBxNmlcCGNq4fuVck
O0jY6THOSChLhnzISob3rYV4YYh2jMji/Zsk+hCFISyENrB9Ee7dYdZnIeuCGnuM
LaAZ4xWCC4cGQvRuyahMrqqu1uart1mqchdNFdQvmKT00CL5Xmk3OVtNED3JrEUC
wCd21Iz2jl+VWJK2v9jVgEGS2fdiMw+gs+h1hPS8oo64fOLfr73SMfxW6SUDKUeY
ea4sa7JfhU7r0OF1TP8T
=VHNP
-----END PGP SIGNATURE-----

--=-bHzcqK3yYhV2FGodF2DQ--
