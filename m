Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T7PZQ-0000cL-5o
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 11:39:28 +0000
Message-ID: <1346413469.9709.44.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Recovery Issue: 'grab_empty_leb: could not find an empty
 LEB'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brent Taylor <motobud@gmail.com>
Date: Fri, 31 Aug 2012 14:44:29 +0300
In-Reply-To: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
References: <CAP+RiCC1afVbKAZESMcZGd1G3+7aKuLTQGggOEFGZxQM6o+QQA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LRwS7fPnwuwEL4oEyw8T"
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


--=-LRwS7fPnwuwEL4oEyw8T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-16 at 13:22 -0500, Brent Taylor wrote:
> I'm developing on custom hardware using an at91sam9g45 processor with
> 64 MB of RAM and 64 MB of NOR flash running Linux 3.0.13.
>=20
> I'm doing some power-cycle testing and after several hours, UBIFS
> failed to mount the root partition and printed the message
> "grab_empty_leb: could not find an empty LEB".  The system boots and
> starts a script that will power cycle the board anytime between 10 and
> 20 seconds after the script has started.  Just before a power cycle
> occurs, syslog and our main process are the only processes that could
> be writing to disk. =20
>=20
I was trying to do power cut emulation testing with mtdram, and I see
there are some issues which do not seem to exist on NAND. But they are
different to yours. I remember I saw these -ENOSPC issues in the past,
but they were very difficult to reproduce.

I will try to investigate why power-cut emulation testing fails on
mtdram, but I have limited amount of time and I do not know when I'll be
able to do this.

--=20
Best Regards,
Artem Bityutskiy

--=-LRwS7fPnwuwEL4oEyw8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQKOeAAoJECmIfjd9wqK0dYgP/3spMpt4rAzfqpb/CRuuuqgd
ibzb6KNN01052d3VFH7W4b1wrzLTpm1WK4sYwhlW6mrkGI166/AUbtBHSAQ2qppd
Mx0s1DzEOnfpCKm2+nJWjOQ79m42uR3WPo4STU8a0q3arfJsI/c5GZcZ4FctRRrU
F/+43427Ne2yc3swPil3R6OEtNqnt3NTqXNGOXd0dSqBj6ke+5a0PtZTIPzfZlpR
k56GtbWXUqaD1T9bQFclSLAOwCBH0qxrBGnNvG9YUZXIxAsNIN+r4mB/5RBhaBST
HH3racWmH3AfdifZseE/2THVtw+ZrnZayjkNCZYC+lNgwWdXO0bIo6mdScP5fi4s
DAb9fQM4WbHX14RUnz4tdLIkb6bm12zPNZLz1tUf2yo8i9/4ee8AT48STcMmCrJz
APW5rGaKdDtYAOpaw3V5MzdeUvMTDHHHYDTr/XmaOWV0xMlfN8rplJJlBLt9H9sG
Bm3zEEHvH8Apq2/MksOCGLS34kvclLSaF1y5kRAgV6ymtYcom1q2tM1syo30FAAp
mkRb5F3RrTRNCbqlO2RR/1m1ubf9vGzyCdLxJI7u+hybzokYdBw0WXOwJpnjXe2K
yiZg38SEraQZwI8mG2Zqsk87AbtgLXi6Uzru1MNWjL335zSX5Gf+sRIeVDtyH4ps
3PpLrvxT5H8HPah2CAw/
=odXG
-----END PGP SIGNATURE-----

--=-LRwS7fPnwuwEL4oEyw8T--
