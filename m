Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSnnJ-00027O-9G
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 11:14:13 +0000
Message-ID: <1336735041.2625.35.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] [RFC] UBI: Add checkpoint on-chip layout
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 11 May 2012 14:17:21 +0300
In-Reply-To: <1336585125-127220-2-git-send-email-richard@nod.at>
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336585125-127220-2-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PKaHel37MzVOY7Ncvu5+"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
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


--=-PKaHel37MzVOY7Ncvu5+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'd like to a git tree for this stuff at some point, when you feel you
are ready, and then do all further changes incrementally on top of that.
Then would also be able to participate - at least do minor things myself
and send patches to you.

On Wed, 2012-05-09 at 19:38 +0200, Richard Weinberger wrote:
> +#ifdef CONFIG_MTD_UBI_CHECKPOINT
> +#define UBI_CP_SB_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 1)
> +#define UBI_CP_DATA_VOLUME_ID	(UBI_CP_SB_VOLUME_ID + 1)

#define UBI_CP_DATA_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 2)

is more readable I think.

> +#define UBI_CP_MAX_BLOCKS	32

This really needs a comment on top of it telling how big flash with say,
128KiB PEB size this would support.

> +
> +/**
> + * struct ubi_cp_sb - UBI checkpoint super block
> + * @magic: checkpoint super block magic number (%UBI_CP_SB_MAGIC)
> + * @version: format version of this checkpoint
> + * @data_crc: CRC over the checkpoint data
> + * @nblocks: number of PEBs used by this checkpoint
> + * @block_loc: an array containing the location of all PEBs of the check=
point
> + * @block_ec: the erase counter of each used PEB
> + * @sqnum: highest sequence number value at the time while taking the ch=
eckpoint
> + *
> + * The checkpoint
> + */
> +struct ubi_cp_sb {
> +	__be32 magic;
> +	__u8 version;
> +	__be32 data_crc;
> +	__be32 nblocks;
> +	__be32 block_loc[UBI_CP_MAX_BLOCKS];
> +	__be32 block_ec[UBI_CP_MAX_BLOCKS];
> +	__be64 sqnum;
> +} __packed;

Please, unless it is size-critical, always leave some unused space in
on-flash data structure for possible future extensions, and initialize
them to 0.

BTW, side-note, please, check that you follow the convention of UBI and
make all on-flash data structures 64-bit aligned (of course unless it is
size-critical).

> +/**
> + * struct ubi_cp_long_pool - Checkpoint pool with long term used PEBs
> + * @magic: long pool magic numer (%UBI_CP_LPOOL_MAGIC)
> + * @size: current pool size
> + * @pebs: an array containing the location of all PEBs in this pool
> + */
> +struct ubi_cp_long_pool {
> +	__be32 magic;
> +	__be32 size;
> +	__be32 pebs[UBI_CP_MAX_POOL_SIZE];
> +} __packed;

What's the perpose of having these pools - once you read all the
information from the fastmap and the wl subsystem inserts it to the
RB-trees - you already know this data. Why you need to store this on the
flash? This whole pool think look redundant and unneeded.

> +/**
> + * struct ubi_cp_ec - stores the erase counter of a PEB
> + * @pnum: PEB number
> + * @ec: ec of this PEB
> + */
> +struct ubi_cp_ec {
> +	__be32 pnum;
> +	__be32 ec;
> +} __packed;

It is weird that you do not have an array of ECs instead for _every_
PEB. Why wasting the flash and time writing/reading this data?

> +/**
> + * struct ubi_cp_eba - denotes an association beween a PEB and LEB
> + * @lnum: LEB number
> + * @pnum: PEB number
> + */
> +struct ubi_cp_eba {
> +	__be32 lnum;
> +	__be32 pnum;
> +} __packed;

Same here - I'd expect a simple array for every PEB in the system.

--=20
Best Regards,
Artem Bityutskiy

--=-PKaHel37MzVOY7Ncvu5+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrPVBAAoJECmIfjd9wqK0IR4P/RsWA/kMgNJwsCzTQzoOHuZl
DY3itbcEwjhzUqIO5W+eiaZrC9actTWZubcH8CN1J8C/7oDPYbd2ehKoy/V+lbzf
DFp05xfr06yXFWXfyFDDRNfspcyBrHn22i7ZNbke/kxY1fDlrQ6saBqQotRNc7JI
VFb2N15HG8UgLKxqNK79uOsazqhXu04ehiSdGex3BZ5QfICPPcbJzq6MdCQCZD12
c/4faGhK24pTgDNF74JAH0K36MNU3IMR2fylYSkasTKh0zVY9RyDB9fHshQ9+Zue
uO79gfDt9SQUBfVwDMeSWYikLadFqi5B2vQKI5G5gCqZC9rdRR/d9qrAURy5lFxG
GKx7oBdfaQFux9C3p4oPoPDNT4dZ8Ygl55v/X24JjsypbNqsyeGEJdQiQ37KqWuP
US3fDGDZuHSnVNwXjhaFIOKzITqdYKBEoSIuTfVGyAmLOFVkIjazEDk5zRqrdnRS
XZZz+2WQMXxVZ7IxlybYLHcS1VOr6NV6OI79AT73ZK6uhY5GOXX7k1b20Ct3Mhd+
0lMTFcdKdNypekJ24K4wbFOTYDBstRHEPqN/+P6wvnD5jS1X722Hn53Z2yV6JBnG
1dBEEcCJ8aODOu8zDIJee41kBsCBjg53w/rjvFkHTDSdaidwDgq9FBWcz1ed3QJQ
Dck5mZ5GnundnJnZtLit
=M9HW
-----END PGP SIGNATURE-----

--=-PKaHel37MzVOY7Ncvu5+--
