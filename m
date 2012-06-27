Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjt4e-0006u6-H9
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 14:18:28 +0000
Message-ID: <1340806951.3070.33.camel@sauron.fi.intel.com>
Subject: Re: Help needed with corruption detection/ubifs_wbuf_sync_nolock
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Wed, 27 Jun 2012 17:22:31 +0300
In-Reply-To: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
References: <1340632690.58836.YahooMailNeo@web114616.mail.gq1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-bQpPVEJJxnjRsa1ckFfG"
Mime-Version: 1.0
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-bQpPVEJJxnjRsa1ckFfG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2012-06-25 at 06:58 -0700, Reginald Perrin wrote:
> I'm tracking down a corruption issue, and trying to trace back where
> LEB's are getting randomly corrupted in our system (a very rare event,
> but it can happen).  I'm focusing on ubifs/io.c, and trying to
> validate data before we send to ubi_leb_write().

You are not using MLC NAND, right? Did you validate your flash using MTD
tests?

> Can somebody please clarify something for me
> on ubifs_wbuf_sync_nolock()?  I'm trying to validate that the data
> we're writing hasn't been corrupted.  I thought I could just check
> that the node-type was valid, such as:
>=20
>     if ( ((struct ubifs_ch *)wbuf->buf)->node_type > UBIFS_ORPH_NODE )
> {
>=20
>         // ABORT WRITE
>     }
>=20
>     err =3D ubi_leb_write(c->ubi, wbuf->lnum, wbuf->buf, wbuf->offs,
>=20
The above code assumes the contents of the write-buffer always starts
with an UBIFS node, which is not true. 'wbuf->buf[0]' may be the middle
or the end of a node. If you want to add a check, you need to write a
helper function which _scans_ the write-buffer and searches for
UBIFS_NODE_MAGIC, and _then_ may be the start of a node. Then you go
check the common header CRC. And the write-buffer may contain more than
one node, so you need to iterate. And you need to take into account the
case when this is the end of the write-buffer and the common header does
not fit.
>=20
> Can anybody help me understand how to check to see if the LEB is
> corrupted before we write?  I'm trying to get close enough to the
> corruption to get a backtrace.

Corrupted how - the CRC is corrupted? You can try to scan the LEB in the
previoius LEB using 'ubifs_scan()' in before switching to the new one in
the 'ubifs_wbuf_seek_nolock()' function, I guess.

--=20
Best Regards,
Artem Bityutskiy

--=-bQpPVEJJxnjRsa1ckFfG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6xcnAAoJECmIfjd9wqK0vPQP/AtYBr90b/O5aRepH3VGG9F2
0XroBVSx2DQXdxXuka6A9pGUvr+8dJ4MHtSRqYF5Jq3ITddxaI+x2XAl0To1CyRY
dBamVipSkVRu78fFG3wJjzNuTsEO8EesgQfraI3xL9SyvV7wSpm6LP7s1pnzYCcF
rvOyDb9T5zpHpPvdjRSVzG4FHkbvG7UbqV7WeX+qtBjx1G5fkuWUAGlQ7uMr2ItC
Gm8ksqw4QARg4fymBjBqrPdlI2IaKC3eJkrQnnFTxgghZwPTBSr850HKN61tmVXF
+5wl5A6xxl3ojzQvRErMB4eI4H4tp5OAi6bYLdJQ2Xr3ljiTkj8S5mzwl7RRxqi/
3zZ/iB2VMS1W73opitJ4//zdXrb0MFzsUvivcHP0VEgQyJAPYy9gOHGxpnYqb6rk
YfnYS7Fr9BYJljqn0j9MKmMmimR4AYQzSEUDknzD8Z5LxWIJFWT57QYTS/xqimbU
Me9WOAWwnjnB0xgsqb1IL+M1SYDnPY2/ptg6QblC+LAWRFS1o/Qq78RdhS1St7ew
zyvYB+8SAOSM+7fIWiem69gzYx5znzD0Z1EKOqNkRK6vJHSgG0BcE0Rt6iNJd2nQ
Ff6SmkdUZuSkSNfmSkcqQQcnGgjmtXO8Ht9e9If30/q/9GzW+Cwz09lI4I12RmbP
QlWrcU7SlwhRI7n9yCGF
=P6BW
-----END PGP SIGNATURE-----

--=-bQpPVEJJxnjRsa1ckFfG--
