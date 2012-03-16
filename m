Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8WSK-00071M-HF
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 12:40:29 +0000
Message-ID: <1331901784.3730.72.camel@sauron.fi.intel.com>
Subject: Re: [patch] Remove notion of key schemes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 16 Mar 2012 14:43:04 +0200
In-Reply-To: <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <1329152067.22240.214.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1202231558400.13720@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1203151545410.26775@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2uWgSi+Dric7/+wGK+Tb"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-2uWgSi+Dric7/+wGK+Tb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-15 at 15:48 +0100, Joel Reardon wrote:
> @@ -112,8 +109,7 @@ static inline void ino_key_init_flash(const struct ub=
ifs_info *c, void *k,
>  	union ubifs_key *key =3D k;
>=20
>  	key->j32[0] =3D cpu_to_le32(inum);
> -	key->j32[1] =3D cpu_to_le32(UBIFS_INO_KEY << UBIFS_S_KEY_BLOCK_BITS);
> -	memset(k + 8, 0, UBIFS_MAX_KEY_LEN - 8);
> +	key->j32[1] =3D cpu_to_le32(UBIFS_INO_KEY << UBIFS_KEY_BLOCK_BITS);
>  }

So current UBIFS driver will always zero out unused parts of the key.
Looks like a flaw in UBIFS, but it is too late to do anything about
this. Could you please also think about the situation when a
security-enabled image is mounted in an older kernel which will start
zeroing unused bytes. What will happen when it is mounted by newer UBIFS
with the security stuff? Would be great to make sure this is handled
nicely.

>  /**
> - * key_max_inode_size - get maximum file size allowed by current key for=
mat.
> + * key_max_inode_size - get maximum file size allowed.
>   * @c: UBIFS file-system description object
>   */
>  static inline unsigned long long key_max_inode_size(const struct ubifs_i=
nfo *c)
>  {
> -	switch (c->key_fmt) {
> -	case UBIFS_SIMPLE_KEY_FMT:
> -		return (1ULL << UBIFS_S_KEY_BLOCK_BITS) * UBIFS_BLOCK_SIZE;
> -	default:
> -		return 0;
> -	}
> +	return (1ULL << UBIFS_KEY_BLOCK_BITS) * UBIFS_BLOCK_SIZE;
>  }

I think this function should also be removed and turned into a macro.=20
>  struct ubifs_dent_node {
>  	struct ubifs_ch ch;
> -	__u8 key[UBIFS_MAX_KEY_LEN];
> +	__u8 key[UBIFS_KEY_LEN];
> +	__u8 padding0[8]; /* Watch 'zero_dent_node_unused()' if changing! */
>  	__le64 inum;
> -	__u8 padding1;
> +	__u8 padding1; /* Watch 'zero_dent_node_unused()' if changing! */
>  	__u8 type;
>  	__le16 nlen;
>  	__u8 padding2[4]; /* Watch 'zero_dent_node_unused()' if changing! */
> @@ -552,7 +547,8 @@ struct ubifs_dent_node {
>   */
>  struct ubifs_data_node {
>  	struct ubifs_ch ch;
> -	__u8 key[UBIFS_MAX_KEY_LEN];
> +	__u8 key[UBIFS_KEY_LEN];
> +	__le64 crypto_lookup;

Err, no, this patch should be _pure_ key schemes removal. All the crypto
stuff should be separate.

Otherwise looks good!

--=20
Best Regards,
Artem Bityutskiy

--=-2uWgSi+Dric7/+wGK+Tb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYzVYAAoJECmIfjd9wqK0lPIQALimbYgWSrh4G/zNEaywVCtH
vdN1GwCCDAkiyk9jv82Rgwrq9GynzF08bmHEbfMY5BNGfVQJC5ZE/RJWvDR7v2Jj
W/F9ZKM9O1RUw3fFcBF2SHhTHyAIhHgqXNfr0I8Ug9dzUItRM/eU0WkwSGmgMbsf
5lcHgrHkpzfwu0Mk1HacyE5VRK0Vcr2TLqqJfcXwpCs8Flddd+UN7DEF03zBRZtp
bOdQm+m4AHHYIqolibdhzI/EC5mQ7f6+ajEgMXUy0uconDK4y5yV1ml6Ef5IJAp9
6nZ3L8gbpCRza5ViErMCu5kakW/359P7v59+HPlfcTnjpue6H5RmYRDDTBCObql2
eOmnEn6oLZka1NFucGmBxQZY7M4pTmareUNsYVIrzhXC8FUwT4LyVe8CX2WGr4KB
qmRSFY+5pap4nTI76SMSAlJ2e9T/ZL2OShXUdxqxN9glbVVPzaI5fRziy0sS9KAz
b/NXTdGN0b/k4lepVSqHFlQeSll8XaNmgqRYgugE47TTZQmIqKkBez8tqdFK+7mL
qyYnW22CrRf4R5TWuXOiBmD2f7HiPyZs0FpMWWNUIpmzmmxnqftY/s3CZQiZ1+2h
Q439oyyNvnXOqKf4DVI1XxLx+ntRnzo4KgOEKUSM0s+o4G0EbmOXEDgV6dQWfiJD
bNwxqwyF7EuCJEuadiJp
=e6O4
-----END PGP SIGNATURE-----

--=-2uWgSi+Dric7/+wGK+Tb--
