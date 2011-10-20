Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGuzp-0006vH-9G
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 15:57:30 +0000
Received: by wyg8 with SMTP id 8so3718505wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 08:57:26 -0700 (PDT)
Subject: Re: ubi vol_size and lots of bad blocks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Drake <dsd@laptop.org>
Date: Thu, 20 Oct 2011 18:57:07 +0300
In-Reply-To: <CAMLZHHSSWkjy7LiFG-g5vZ==2H+yPFB_M-yUem1K5UJMKo2tmw@mail.gmail.com>
References: <CAMLZHHSW9daPS9RsMyBnhTfzUQLC0+e9_-=xqiWE4T6upbcaiQ@mail.gmail.com>
	<1318590949.12351.116.camel@sauron>
	<CAMLZHHSSWkjy7LiFG-g5vZ==2H+yPFB_M-yUem1K5UJMKo2tmw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-w7/NdzX7UD/ucn193WI+"
Message-ID: <1319126234.11028.28.camel@sauron>
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


--=-w7/NdzX7UD/ucn193WI+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 14:35 +0100, Daniel Drake wrote:
> Hi Artem,
>=20
> Thanks for the detailed response - I'll be sure to send another
> documentation patch once we've got to the bottom of everything.
>=20
> On Fri, Oct 14, 2011 at 12:15 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> >> I found a note in the UBI FAQ where it says vol_size can be excluded
> >> and it will be computed to be the size of the input image, and then
> >> the autoresize flag can be used to expand the partition later.
> >> Excluding vol_size in this way indeed solves the problem and the
> >> problematic laptop now boots.
> >
> > Well, you probably need some free space as well. Just come up with
> > some minimum number, say 300MiB and use this number for volume size in
> > ubinize, and use autoresize flag.
>=20
> Regarding free space, is it really necessary?

Well, I though that if OLPC requires some free space to boot, it could
be necessary.

>  My understanding is that
> the autoresize functionality will resize the volume *before* it gets
> mounted for the first time, so it should be fine to not leave any free
> space at image creation time. When it gets mounted for the first time,
> it will be freshly resized and have free space available.

Yes. I was just thinking about a situation when you have so many bad
blocks, that it will be resized and there will be too few space. In that
case the device won't boot with weird and unexpected symptoms. I thought
that if you reserve min. free space, then it won't boot with predictable
symptoms - UBI will print a message like "not enough eraseblocks" or
something like that.

> As for "some minimum number", I guess it goes without saying that
> whatever number is chosen, it must be bigger than the amount of data
> that is going to be written into the image.

Frankly, do not remember, depends on ubinize implemenation. Most
probably yes, if you put smaller number, ubinize will throw an error
back.

>  Our image building tool
> will be used by different customers who will apply simple
> customisations (e.g. with GNOME, with wikipedia) so the range of image
> sizes varies. We need to do it based on some kind of calculation that
> considers the size of the initial data to be written to the flash. If
> we can do it with no free space initially, we can let ubinize do that
> for us, with autoresize enabled (this was my trail of thought).

Yeah, you can forget about the free space stuff.

> > Autorisize will not occupy the PEBs reserved for bad block handling.
>=20
> OK, thanks for clarifying.
> One final question... What happens when the PEBs reserved for bad
> block handling run out?

Very good question. In this case you will get an error and UBI will
switch to R/O mode.

UBI guarantees that there is a PEB for each LEB. If you run out of good
PEBs, then a write to the LEB may fail.

To recover from this error you could re-flash the device. The run-time
recovery would require deleting or shrinking one of the UBI volumes.

So you need to carefully select the amount of PEBs reserver for bad
blocks handling. For Nokia phones like N900 1% was just fine. The have
Samsung OneNAND flash, 256MiB in size, 128KiB PEBs.

--=20
Best Regards,
Artem Bityutskiy

--=-w7/NdzX7UD/ucn193WI+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoETTAAoJEJtuLFy+q7fee6EH/1Avdz9mlCBjdnP+sZg5UWeg
2Nt/Bh3/+QusUDb2nvfUcZ8jlXF8v/8b91NMgqW+sUU3hE7J0yfJEYw/OuqExb5W
xpCiQrLNIbFQysBic5nP1zGUxvdkNb5Up2E44cXBOeEpgdrR96aBSsOB6XoZzR0J
YmYY7EoK6AsfZcreecTaaqwCzEDuqOTtvc+nGt6NKHFC8ljzULQGkEEnO6zHRvRZ
23IL/9F9ta4sTXZnxIubQk0IO++bSCT+ojE87vZe9vw60YkyEvg6sHgPiidHGl8L
Eeq2tmXnq6lzUy4f7inwKpNTeyTpjqvuQH3TLKqbqEvJcm98t5ihYzxqU24UFmQ=
=oZOr
-----END PGP SIGNATURE-----

--=-w7/NdzX7UD/ucn193WI+--
