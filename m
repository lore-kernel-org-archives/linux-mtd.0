Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSoYt-0002dY-93
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 12:03:13 +0000
Message-ID: <4FACFFED.40105@nod.at>
Date: Fri, 11 May 2012 14:02:53 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] [RFC] UBI: Add checkpoint on-chip layout
References: <1336585125-127220-1-git-send-email-richard@nod.at>
 <1336585125-127220-2-git-send-email-richard@nod.at>
 <1336735041.2625.35.camel@sauron.fi.intel.com>
In-Reply-To: <1336735041.2625.35.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigC351AD8CD3781F30F63A15FD"
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC351AD8CD3781F30F63A15FD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 11.05.2012 13:17, schrieb Artem Bityutskiy:
> I'd like to a git tree for this stuff at some point, when you feel you
> are ready, and then do all further changes incrementally on top of that=
=2E
> Then would also be able to participate - at least do minor things mysel=
f
> and send patches to you.
>=20
> On Wed, 2012-05-09 at 19:38 +0200, Richard Weinberger wrote:
>> +#ifdef CONFIG_MTD_UBI_CHECKPOINT
>> +#define UBI_CP_SB_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 1)
>> +#define UBI_CP_DATA_VOLUME_ID	(UBI_CP_SB_VOLUME_ID + 1)
>=20
> #define UBI_CP_DATA_VOLUME_ID	(UBI_LAYOUT_VOLUME_ID + 2)
>=20
> is more readable I think.

Okay.

>> +#define UBI_CP_MAX_BLOCKS	32
>=20
> This really needs a comment on top of it telling how big flash with say=
,
> 128KiB PEB size this would support.

This is a default value which was randomly chosen.
The last patch makes this value configurable via Kconfig.

It is one of these parameters where we have to find sane a default value.=


>> +
>> +/**
>> + * struct ubi_cp_sb - UBI checkpoint super block
>> + * @magic: checkpoint super block magic number (%UBI_CP_SB_MAGIC)
>> + * @version: format version of this checkpoint
>> + * @data_crc: CRC over the checkpoint data
>> + * @nblocks: number of PEBs used by this checkpoint
>> + * @block_loc: an array containing the location of all PEBs of the ch=
eckpoint
>> + * @block_ec: the erase counter of each used PEB
>> + * @sqnum: highest sequence number value at the time while taking the=
 checkpoint
>> + *
>> + * The checkpoint
>> + */
>> +struct ubi_cp_sb {
>> +	__be32 magic;
>> +	__u8 version;
>> +	__be32 data_crc;
>> +	__be32 nblocks;
>> +	__be32 block_loc[UBI_CP_MAX_BLOCKS];
>> +	__be32 block_ec[UBI_CP_MAX_BLOCKS];
>> +	__be64 sqnum;
>> +} __packed;
>=20
> Please, unless it is size-critical, always leave some unused space in
> on-flash data structure for possible future extensions, and initialize
> them to 0.

If the fastmap on-flash layout changes, I'll increment the "version" fiel=
d.
But I can leave some space.

> BTW, side-note, please, check that you follow the convention of UBI and=

> make all on-flash data structures 64-bit aligned (of course unless it i=
s
> size-critical).

Will check.

>> +/**
>> + * struct ubi_cp_long_pool - Checkpoint pool with long term used PEBs=

>> + * @magic: long pool magic numer (%UBI_CP_LPOOL_MAGIC)
>> + * @size: current pool size
>> + * @pebs: an array containing the location of all PEBs in this pool
>> + */
>> +struct ubi_cp_long_pool {
>> +	__be32 magic;
>> +	__be32 size;
>> +	__be32 pebs[UBI_CP_MAX_POOL_SIZE];
>> +} __packed;
>=20
> What's the perpose of having these pools - once you read all the
> information from the fastmap and the wl subsystem inserts it to the
> RB-trees - you already know this data. Why you need to store this on th=
e
> flash? This whole pool think look redundant and unneeded.

We need this pool to find all PEBs that have changed since we wrote the l=
ast
checkpoint (or fastmap).
BTW: That's why we named it "UBI Checkpointing".
If all PEBs in the pool are used (IOW no longer empty) we fill the pool w=
ith empty PEBs
and write a new checkpoint.
While reading the checkpoint we know that only PEBs within the pool my ha=
ve changed...

Without this pool we'd have to write the checkpoint every time the EBA ch=
anges
or we'd have to scan the whole list of free PEBs while attaching.

>> +/**
>> + * struct ubi_cp_ec - stores the erase counter of a PEB
>> + * @pnum: PEB number
>> + * @ec: ec of this PEB
>> + */
>> +struct ubi_cp_ec {
>> +	__be32 pnum;
>> +	__be32 ec;
>> +} __packed;
>=20
> It is weird that you do not have an array of ECs instead for _every_
> PEB. Why wasting the flash and time writing/reading this data?

By array of ECs you mean that all ec values are written to the flash
and pnum is the index?
Sounds sane.

>> +/**
>> + * struct ubi_cp_eba - denotes an association beween a PEB and LEB
>> + * @lnum: LEB number
>> + * @pnum: PEB number
>> + */
>> +struct ubi_cp_eba {
>> +	__be32 lnum;
>> +	__be32 pnum;
>> +} __packed;
>=20
> Same here - I'd expect a simple array for every PEB in the system.
>=20

Sounds sane too. :)

Thanks,
//richard


--------------enigC351AD8CD3781F30F63A15FD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJPrP/tAAoJEN9758yqZn9eGlgH/i9Uhui7cVhjCrBkllvck7+L
ulzN4fiDfJapVgkCCEIck4tisWD7gr/3iIGfV4Jdr6fux8IbDxotntGL1g9UXbD9
QoYjBYPqyCjhUiJ1fHOvXHzS4+dZXYmxz/5giP+XJlDrWOxFH4I7UaVB9lKwtL/K
JfUMFXRGpxusbG/stT623A7yPGBARmNe85MQ+S/6O7UWnMpsiwhXnmNVczQssunF
NVSZM9BuUYLr84OfDa9sLYiWk8El8ltr9iyIsegP8ZARH7rrunyWFpcHgEv3iRFr
S7zqIXW8svuU1tOuxIpYcuU65clHsAoOTPbNiZIqJPYd1C5tnmac3e8RTAJa3/s=
=fak7
-----END PGP SIGNATURE-----

--------------enigC351AD8CD3781F30F63A15FD--
