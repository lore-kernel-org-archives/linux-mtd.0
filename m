Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SWkJw-0005oD-Pl
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 08:19:57 +0000
Message-ID: <1337675012.2483.134.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Tue, 22 May 2012 11:23:32 +0300
In-Reply-To: <4FBA4E52.8090807@nod.at>
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <1337173272.24809.52.camel@sauron.fi.intel.com> <4FBA4448.20509@nod.at>
 <1337608854.2483.71.camel@sauron.fi.intel.com> <4FBA4E52.8090807@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TdXLqYx0T3LghYwGMbZS"
Mime-Version: 1.0
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TdXLqYx0T3LghYwGMbZS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-05-21 at 16:16 +0200, Richard Weinberger wrote:
> > It still contains EC and VID headers. So you can use the existing code
> > for scanning it.
>=20
> I use already ubi_io_read_vid_hdr() and ubi_io_read_ec_hdr() what should=
=20
> I reuse?

As I wrote: 'process_eb()'. Now it is named 'scan_peb()' after the
renames.

It does all the work to scan PEB headers. Create a _separate_ 'struct
ubi_attach_info' run 'scan_peb()' for each PEB of the fastmap. Check for
errors, and sanity (all headers are there, no errors, etc, may be an
extra self-check function would be appropriate here). Then go through
the resulting fastmap volume attach info, read and process the fastmap
_contents_. Of course you need the second (real) attach info for the
data you read from the fastmep. This is what I call "reuse the existing"
code.

How does this sound to you?

> Also checking the image sequence would make sense.

Yes, you should check everything. If you reuse the code, you will get
this automatically, no?

--=20
Best Regards,
Artem Bityutskiy

--=-TdXLqYx0T3LghYwGMbZS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPu00EAAoJECmIfjd9wqK05zwP/R1/T6PVHezeQQ95GNpuCr2p
C/feBkPc12fHJuiPXUXKjAaGGVRdrZ481lPvoyDbrg4Hjg1tTXxWk25xg0FiAvUW
O/x42aJGT3x65FoyR63ztNvBTKC3CSYAM2WwS09rmtksCYe8FI/JPCqfV8Y9HbBz
Gx/eqcUyGuFG9eWdtmyMyhwJLQGzxS4x8z6TZzk9ibH1UiZVe6OGELZ+e7gw3DR0
LOicWx4W6wJXe1wRI7+W/QnwDdFV2gHvB3XO9zWVtvf6hQrgj0xZJHaoQeo7sopq
0tbCw/KaQjZL9uEmUCrThRxaLgd6ecCPiPQF6w11n7SjkUbW4R75gmI0lIxRAzAa
brp7bAG3SLfVGCKvo7LKAzBFg21zVwOrMYihD+e3EfQSG1rTmJ8hLUElrwPO2enf
z2AhyKPctAlbdJzYpnMCfk68vJL7X58nf0RTHksP0cykzxgJiTvomHasxH7DeHdQ
8jSBQjS+c3KB00+4yIAw6rITX8oqAldNEp5zTQ5BhwymT9rWRmJXxpHeH09daUZf
3s0lvhhW7s5l5zaieZjggugf73Qloi6HHI6g3IdZqpyUDypj0ErfZ7YJNGEFv4yV
O7Z88IP4dliuV2KaQ2tg69TWS7bOAJ1RRtj7tNiMTcmANSvCh2bxP6nolOOFLVC4
D9+7EOdMf7PCI5iWplHy
=+RF9
-----END PGP SIGNATURE-----

--=-TdXLqYx0T3LghYwGMbZS--
