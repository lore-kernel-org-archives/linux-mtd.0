Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ra8o6-0003uZ-BU
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 16:32:50 +0000
Received: by iaby26 with SMTP id y26so10830853iab.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 08:32:49 -0800 (PST)
Message-ID: <1323707647.27436.8.camel@sauron.fi.intel.com>
Subject: Re: UBIFS Corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Reginald Perrin <reggyperrin@yahoo.com>
Date: Mon, 12 Dec 2011 18:34:07 +0200
In-Reply-To: <1323700170.52922.YahooMailNeo@web114608.mail.gq1.yahoo.com>
References: <1310130765.68852.YahooMailRC@web114617.mail.gq1.yahoo.com>
 <1310988807.20738.44.camel@sauron>
 <1311707851.83484.YahooMailRC@web114602.mail.gq1.yahoo.com>
 <1313411391.2583.22.camel@sauron>
 <1322510657.7380.YahooMailNeo@web114602.mail.gq1.yahoo.com>
 <1323278383.39855.YahooMailNeo@web114617.mail.gq1.yahoo.com>
 <1323380555.2074.3.camel@koala>
 <1323700170.52922.YahooMailNeo@web114608.mail.gq1.yahoo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Q1glDADjVxmhXCooi8di"
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


--=-Q1glDADjVxmhXCooi8di
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-12-12 at 06:29 -0800, Reginald Perrin wrote:
> Jan  1 19:33:33 kernel: [    5.976000] UBIFS DBG (pid 359): ubifs_bg_thre=
ad: background thread "ubifs_bgt1_0" started, PID 359
> Jan  1 19:33:33 kernel: [    6.048000] UBIFS: recovery needed
> Jan  1 19:33:33 kernel: [    6.616000] UBIFS error (pid 357): ubifs_recov=
er_leb: garbage
> Jan  1 19:33:33 kernel: [    6.620000] UBIFS error (pid 357): ubifs_scann=
ed_corruption: corruption at LEB 498:81920
> Jan  1 19:33:33 kernel: [    6.624000] UBIFS error (pid 357): ubifs_scann=
ed_corruption: first 8192 bytes from LEB 498:81920

OK, would you please enable mount and scanning debugging messages and
send the results again (or provide a pastebin link). Please, do not
enable other debugging message - they will only introduce noise.

But even better would be - first add only mount messages, capture the
output, then enable both mount and scan and capture the output. Then
provide both logs. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Q1glDADjVxmhXCooi8di
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJO5iz/AAoJECmIfjd9wqK0B18QAMUyFhg1O8ymjpu0WpoVKaHF
FEAU3NdFq48b7U3MPVWH4TjD0638CiaVLQIJUInF80wgnDUPcfFBokBkYQLybQxA
EynuVASdChyzxpvQB+cHw3qE1gnOeJYXXEbD68wyNCC2aQRVJjVoHpBG7z65DEHX
jt/E3dZErlBo1ixuLxg1WOnV0KdCJwLnZ8a+Vob9Xjley3Tsk9v4c9qoELcv6ILv
/3C3MqrQDUglCuEDlVqPGhyG9c+fR0VsybuunkP7g/T+vNUyANDPhijr3uoddALH
ajwB0/EcZlxuhNjjCk/XfryTFGGjSFBHEmRTM75UDAS9EcSC92ihApEOoYdUFDuu
am0oKO93WfM2LrNW8IAFS7UmiqT/Lx7cJM7GL2oJaHaWjG9esyl9rv6bG2zP08gt
dXBJeGtFB+3wS+hwflwc2KZz+O2eYGixDJmjsAJDsy1g74/evBvdAVbfVqoa7qr0
bxScZNs1YkDCEr5rOgifZsn6v4jM+GhLbCmrTptr/n6J67Ted2qRb7gvR2aNJoUO
wBcB30IFNi0P/bpcPbiTfAxQ9Mks70a05uM3F7CsaedODPgMmcgn9uA9dhMAy7dE
PaFzKTQkxjWEj7d52rQ6N+odeRBwyGD4qYmYhjCOUeppLiJ9t5H+RH+9nbnQ+ZB/
Pk/OSmB7ck+j+gCuXKr7
=fBM/
-----END PGP SIGNATURE-----

--=-Q1glDADjVxmhXCooi8di--
