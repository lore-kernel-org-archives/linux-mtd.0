Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGpYN-0002R4-6e
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 11:13:20 +0000
Message-ID: <1348658003.24309.70.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 26 Sep 2012 14:13:23 +0300
In-Reply-To: <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ey9QRO2LfPecVRMPTztk"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ey9QRO2LfPecVRMPTztk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=46rom df2a498002498e52025acf51e0b43064d766aa0a Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 26 Sep 2012 14:12:28 +0300
Subject: [PATCH] UBI: allow for delayed rename

Just an experimental patch.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/vmt.c |   19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 9169e58..6d7bcd9 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -597,25 +597,6 @@ int ubi_rename_volumes(struct ubi_device *ubi, struct =
list_head *rename_list)
 	struct ubi_rename_entry *re;
=20
 	err =3D ubi_vtbl_rename_volumes(ubi, rename_list);
-	if (err)
-		return err;
-
-	list_for_each_entry(re, rename_list, list) {
-		if (re->remove) {
-			err =3D ubi_remove_volume(re->desc, 1);
-			if (err)
-				break;
-		} else {
-			struct ubi_volume *vol =3D re->desc->vol;
-
-			spin_lock(&ubi->volumes_lock);
-			vol->name_len =3D re->new_name_len;
-			memcpy(vol->name, re->new_name, re->new_name_len + 1);
-			spin_unlock(&ubi->volumes_lock);
-			ubi_volume_notify(ubi, vol, UBI_VOLUME_RENAMED);
-		}
-	}
-
 	if (!err)
 		self_check_volumes(ubi);
 	return err;
--=20
1.7.10.4



--=-ey9QRO2LfPecVRMPTztk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYuNTAAoJECmIfjd9wqK09QIQAJ/dZF6cxLagptjCnYC9B1Yn
bWh/9KCL7YrCbtdVWtqRr4To66kejQkL6H8A/CXCQHV9EUG52DiokM78Tj3riRH9
zQwNgYLDXJnsAN3FEsGpCDgTBhEgHVG1yXC0O1QRHkUdt5zsUiIKS/gbUxu3Ita+
CGzdy99pphTZelXTTTUiwF884Im8r3jyT99qoxaOQ5CXvm2KxEv1l67osknGcf1B
1X23K/h//zDf0UQrqQBwUfwOjJbe5SqkJOks4VLQNBcj6JFLVyJTddANnHgMmBUc
z7lDscSJJ3UddujIfdH4ABWkLm0wWroEVgzV/vYAHWNFHRYzFk41KQSbQv+nrg95
zb2zQ6vWK9dDCgeAUTZ4WCl7e5UCWbUdgvaeuvwpAxeUpVG3YIXop8QyzGaOnYOT
8XH6beI5DAGsC+Q4OGIQa4ahmkUbB+/hn6XqSBe1+SgOiKi4HaP9I13D2eJzWya3
b4XEm/zWzSIk7ndEGAtbXHg8VOb/q1JTrhGsySFG805byS/yTm98VVG5QYLjOlQx
kQNGRDSg1aKQoTVMIRros8uHMbjtkZT5FUBY8T6nTmkch2/XUEQwzG894Uw8gOIm
/i8UkZj3woG2o9paKRRJPw7IM73UjOqYJbPkooZ3FqvuPlyQablCYbRcRC9NHopy
ylNZZmHch6XQD5iKVVA7
=0rU7
-----END PGP SIGNATURE-----

--=-ey9QRO2LfPecVRMPTztk--
