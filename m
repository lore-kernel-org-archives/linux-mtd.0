Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWhk-0008Ol-OM
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:41:38 +0000
Received: by ggnl1 with SMTP id l1so4457063ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2012 06:41:35 -0800 (PST)
Message-ID: <1326897802.28477.41.camel@sauron.fi.intel.com>
Subject: Re: Corrupted UBIFS, bad CRC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Karsten Jeppesen <arm9263@yahoo.com>
Date: Wed, 18 Jan 2012 16:43:22 +0200
In-Reply-To: <1326803021.33329.YahooMailNeo@web121505.mail.ne1.yahoo.com>
References: <1326376049.44121.YahooMailNeo@web121502.mail.ne1.yahoo.com>
 <1326630286.2201.3.camel@koala>
 <1326701907.78896.YahooMailNeo@web121503.mail.ne1.yahoo.com>
 <1326709475.14299.34.camel@sauron.fi.intel.com>
 <1326717654.83444.YahooMailNeo@web121506.mail.ne1.yahoo.com>
 <1326718253.14299.82.camel@sauron.fi.intel.com>
 <1326803021.33329.YahooMailNeo@web121505.mail.ne1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-79kNYAx4bsWcBfE8E1Np"
Mime-Version: 1.0
Cc: ubifs <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-79kNYAx4bsWcBfE8E1Np
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-17 at 04:23 -0800, Karsten Jeppesen wrote:
> Artem: Would it help you in any=20
> way if I get a some of these units sent to you? They are like 15 x 15 cm
>  Single board. I would send it with all needed (battery included :-) )=
=20
> and never to be returned  (You can keep everything).

I would be happy to help, but I really have no time to do more than
suggesting and giving some advises - my employer and the baby take all
my time, sorry.

Besides, I am not a flash HW expert, and the issue you observe look like
it is very related to your HW and how it behaves when it loses power
when a write operation is ongoing. Or may be erase operation, but it
looks like that was a write operation. It does not look at all like
UBI/UBIFS issue.

> 1. Where are the patches for 3.2? git://git.infradead.org/~dedekind/ubifs=
-v3.2.git

Yes.

>  ?? To get the max_write output I changed the dbg_msg to ubi_msg.
>=20
> 2. UBI: max_write_size   64
> 3. Confirmed 64 from data sheets

OK.

> 4 Theory unfortunately bust.

Not necessarily. You need to dig deeper - what if your driver is doing
something you are not aware about or the controller? Better to ask the
vendor how the flash behaves on a power cut while writing.

> 5. See below
>=20
> Now for the weird part: Setting the write buffer INCORRECTLY to 256
> does mount the system - but is that healthy???: And what are the
> implications of setting it to a 4 times wrong value?

You need to really dig deeper into this. Let me elaborate the concept of
'max_write_size', and also you can find it from git log and by googling
- we discussed this in the mailing list.

So, UBI has a notion of min_io_size - this is minimum amount of bytes
you can write. For NAND this is often 2048. For NOR it is 1 byte.

NORs have optimization called "write-buffer", which means that NOR can
write many bytes at a time.

This "write buffer" size is called 'max_write_size' in UBIFS, to be
consistent with 'min_io_size', and also because UBIFS has its own
write-buffers, so this term has already been occupied when we added
'max_write_size'.

Note, we added 'max_write_size' to fix NOR issues after power cuts, I
think last year.

So what happens when you write data and have a power cut? On the driver
level, you write write-buffer after write-buffer - 'max_write_size'
bytes at a time.  The experiments with NOR showed that the after the
power cut the 'max_write_size' area which you have been writing to
during the power cut will contain garbage, or unstable bits, or zeroes,
or few zeroes, or any other anomaly.

When UBIFS recovers after a power cut, in has to scan the journal and
find the last node. The last node is the one which follows with all 0xFF
bytes.

In your case you have one good node from offset 0 to offset 112 (AFAIR),
then 32 bytes of 0xFFs, and then 32 bytes of zeroes, and then the rest
is all 0xFFs.

So my theory is that your write-buffer size is 256, or you have some
kind of striping, or something, so that when UBIFS submits a 112 bytes
write request, on the driver level a 256-byte write buffer is used, and
actually the area (0, 256) is being programmed, but area 113-226 is
programmed with all 0xFFs.

Or something like that, I do not know NOR well enough.

Anyway, what happens is that due to power cut you end up with random
corruption within that 256 bytes area, so you end up with those zeroes.

UBIFS is aware of this effect and it knows that it should only check for
all 0xFFs starting from the next 'max_write_size'-align offset after the
last node. But because in your case 'max_write_size' is 64, it hits
those zeroes and refuses mounting, because it is unexpected.

I do not think there is a big downside of having 'max_write_size' to be
256 from the performance POW at least. The downside is that in case of
power cut you may lose a bit more data, because UBIFS has its own
write-buffers, but this is really minor.

You can also experiment by forcing your flash to not use write-buffer at
all to verify if the corruptions are related.

--=20
Best Regards,
Artem Bityutskiy

--=-79kNYAx4bsWcBfE8E1Np
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPFtqKAAoJECmIfjd9wqK0raYP/21tGm0CQX0zWZdgX++Pjmll
ag4MLFv9AUh+lilS8s7S1SkzgC3+WdfsLhZ6qj/nFUk5R4A01jDMS/X3XoN1HmM8
G5tu/UuWbRUwjYspWCVl78OOEdTubSSLAt6qAdT511PX9Fmr11jbUgApUIynA2Gq
JHbAVr7u7NDeMe1zaG/OWdm0TC35o1SzaNoekMqgg3fMyeagqo1vq7hQnvm5V7Y+
StQ6YhjhCpDOgXauJJN48jKMOarhlP8XYsmzW9RJW8ZxnsA70XRVLTGl3jYMnOLF
KmhzGq8ZU2lwI7CfHFTT1QzkxgK5iAjwW/rAJGgGgs6UKCXJWQ8rfwlm0AFLQdd/
JEmH3PEmUwpYLO+eIX0gdwF9zYPVno79jNd6KkWHLms0PBGcTbGnBqf9hSlo+C/y
eeWZ1Ns5qiUhnq5KdcDMc9V4PAsAguW+iHcF49TQXv0z+djlE985FiTPicCFQL7N
L1cj+DFGgTndPiHdTdHlFlCLWuDJovrR1CgU0psr36ZS2T+SItYUVgk17stLsKo3
cJuLH8btrSYyRjTftantQmD5ViCTUCpDIn8haOIhUe38mBTOw+jIJ0MzCjpIW/xy
Ze4oOfxpIOak9ditLr/PuXHCbjUlQGJGuYqSaQiOtxPZwKW6qkIpZj3gYU318TVj
4bsS8qCBa92jpcRlZ73q
=YpG5
-----END PGP SIGNATURE-----

--=-79kNYAx4bsWcBfE8E1Np--
