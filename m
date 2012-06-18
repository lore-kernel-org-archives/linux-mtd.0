Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgZNj-0004Et-EP
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 10:40:28 +0000
Message-ID: <1340016236.2420.23.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBIFS: add key state map data structure and accessors
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 18 Jun 2012 13:43:56 +0300
In-Reply-To: <alpine.DEB.2.00.1206090016010.14953@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1206090016010.14953@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x4CdtE6Eqxscv7PAAFbP"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-x4CdtE6Eqxscv7PAAFbP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-06-09 at 00:16 +0200, Joel Reardon wrote:
> #define KEYMAP_STATES_PER_BYTE_SHIFT 2
> +
> +/**
> + * Defines the three possible states of a key:
> + * @KEYMAP_STATE_UNUSED: the key has never been assigned or used
> + * @KEYMAP_STATE_USED: the key has been assigned and is used for live da=
ta
> + * @KEYMAP_STATE_DELETED: the key has been assigned and is used for
> + *			  deleted data.
> + */
> +enum {
> +	KEYMAP_STATE_UNUSED  =3D 0,
> +	KEYMAP_STATE_USED    =3D 1,
> +	KEYMAP_STATE_DELETED =3D 2,

I'd suggest to remove the values, they are the same as the  default
ones, and add
          KEYMAP_STATE_CNT,

to have the count of states for ubifs_assert() below.

> +};
> +
>  /**
>   * struct ubifs_keymap - UBIFS key map.
>   * @key_size: size of a key in bytes
>   * @keys_per_leb: number of keys per KSA LEB
> - * @ksa_size: number of LEBS in the KSA
> + * @ksa_lebs: number of LEBS in the KSA
>   * @ksa_first: the first LEB belonging to the KSA

Yo do not have "ksa_first".

> + * @state: a double-array [ksa_lebs]x[keys_per_leb] that stores the
> + *	   state of the key at that position. The state consumes two bits so
> + *	   each byte contains four states. The first index is from 0 to the
> + *	   number of KSA LEBs - 1, and the second is from 0 to the number of
> + *	   keys per (KSA LEB - 1) >> 2

I do not understand this "number of  keys per (KSA LEB - 1) >> 2" - it
should be "number of keys per KSA LEB", no?

> +static void set_state(struct ubifs_keymap *km, int ksa_leb,
> +		      int ksa_offset, int value)
> +{
> +	static const int minor_mask =3D (1 << KEYMAP_STATES_PER_BYTE_SHIFT) - 1=
;
> +	int major, shift, mask, old;
> +

ubifs_assert(ksa_leb is sane);
ubifs_assert(value > 0 && value < KEYMAP_STATE_CNT);
ubifs_assert(ksa_offset > 0 && ksa_offset <=3D c->leb_size - UBIFS_CRYPTO_K=
EYSIZE);

unless this is fast-path where we'd want to avoid wasting time for checks,
but it does not look so.

> +	major =3D ksa_offset >> KEYMAP_STATES_PER_BYTE_SHIFT;
> +	shift =3D (ksa_offset & minor_mask) << 1;
> +	mask  =3D minor_mask << shift;
> +	old =3D km->state[ksa_leb][major];
> +	km->state[ksa_leb][major] =3D old - (old & mask) + (value << shift);
> +}

All you need to do is to set the stat in the array of bits, right?
Wouldn't something straightforward like this be simpler?

uint8_t *byte =3D km->start[ksa_leb][ksa_offset / UBIFS_CRYPTO_KEYSIZE];
pair =3D ksa_offset % 4;
*byte &=3D value << pair * 2;

Frankly, I cannot parse your implementation, but I did not try too hard.

Btw, do not try too hare do use shifts instead of multiplications,
modern compilers and processors are smart enough to do it themselves.

> +
> +/**
> + * get_state - get the key state
> + * @km: the keymap
> + * @ksa_leb: the KSA eraseblock number
> + * @ksa_offset: the key's offset in the KSA eraseblock
> + *
> + * This function returns key position's state.
> + */
> +static int get_state(struct ubifs_keymap *km, int ksa_leb, int ksa_offse=
t)
> +{
> +	static const int minor_mask =3D (1 << KEYMAP_STATES_PER_BYTE_SHIFT) - 1=
;
> +	int major, shift;
> +
> +	major =3D ksa_offset >> KEYMAP_STATES_PER_BYTE_SHIFT;
> +	shift =3D (ksa_offset & minor_mask) << 1;
> +	return (km->state[ksa_leb][major] >> shift) & minor_mask;
> +}

Similarly, add assertion to check that you never return 0x3. Check input
parameters. Would this be simpler to understand?

byte =3D km->start[ksa_leb][ksa_offset / UBIFS_CRYPTO_KEYSIZE];
pair =3D ksa_offset % 4;
ret =3D byte >> pair * 2;

--=20
Best Regards,
Artem Bityutskiy

--=-x4CdtE6Eqxscv7PAAFbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3wZsAAoJECmIfjd9wqK0Ab4QAJV5ChhmExH3PLRVi1HHFnaf
wAyYKtkHbQ9UQftaGIgc9AlKsIU0u5wX4PidU1kHtmBV6YW3YwsiePvJyMcUuIHK
P23i+ST50eO4WCcWl4FvTAApj6ySUPmVQsaVuVwRwhWtT1aYJyncITMmVBQHAkHn
zJYZMghpyDsv6XWpodG4y5/RK81czdc06aKJIdp0+F/pMFtzqdbkRrg+dz0caru7
/gslJkeDxE5ZHuerK2psD/nugYVsp6BqH+LyCHXLDC0xb/9+0r3140zsm3GVo/Wd
3vb3E0DtNFi2/JgBZWMc8CJQ0LeVNupEKzL21D3i4+CPY0zdae5lmRdr1CjpWyl+
Ncmi3e2/w2F63KHwj4KFT3aAPwOPu+5fQmeGd/UO5pXmb8cHwd8Qq3x1eMFZTxPh
WKlf4U50pXjlleIswI4RWH2+xpjURgtzCi0o5rH3TqdWLp+mEe61ALKveIjYH3ul
vMDZoWdNIPYnoYVJyHNtthvGGKVDO/nDUm+6u9bqX23Q9mKvFxjudh9OIFFt+4yh
8H50sOC0sgHhjLj3Rw2YadzmWkFNdT5Ew7S595z77V6rgNLlKmyo5/xJRRXB7QZ5
KLBBzDx7W+VC84yc2Hb//0c+20SNybzYYxroqhLjf+79fw51qpvWm27q+lqoTGzr
BOUVDPoAs22DNRur0D6Z
=3kEr
-----END PGP SIGNATURE-----

--=-x4CdtE6Eqxscv7PAAFbP--
