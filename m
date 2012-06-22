Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Si6mf-0008Qd-R6
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 16:32:35 +0000
Message-ID: <4FE49E19.4070005@nod.at>
Date: Fri, 22 Jun 2012 18:32:25 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Subject: Re: ubi_update_fastmap: could not find an early PEB
References: <201206222005.02308@blacky.localdomain>
In-Reply-To: <201206222005.02308@blacky.localdomain>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig451804EEBB3B245FB1988CD5"
Cc: Rob Taylor <rtaylor@mvista.com>, Alexander Kaliadin <akaliadin@mvista.com>,
 linux-mtd@lists.infradead.org, Pavan Jadhav <pjadhav@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig451804EEBB3B245FB1988CD5
Content-Type: multipart/mixed;
 boundary="------------060501020600000304080402"

This is a multi-part message in MIME format.
--------------060501020600000304080402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 22.06.2012 18:05, schrieb Nikita V. Youshchenko:
> As far as I understand, this happens because all PEBs at the beginning =
of=20
> device are occupied. But this will always be the case after creating im=
age=20
> with ubinize...

ubinize will also get fastmap support.
But first we have to finish the kernel level support.

> How to overcome this?

Can you please try the attached patch?
This patch allows the WL-worker to produce free anchor PEBS.

Thanks,
//richard

P.s: Please use the most current fastmap code!

--------------060501020600000304080402
Content-Type: text/x-patch;
 name="make_anchor_peb.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="make_anchor_peb.diff"

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 582f5ee..4793ba8 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1374,6 +1374,12 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		return 0;
 	}
=20
+	ret =3D ubi_ensure_anchor_pebs(ubi);
+	if (ret) {
+		mutex_unlock(&ubi->fm_mutex);
+		return ret;
+	}
+
 	new_fm =3D kzalloc(sizeof(*new_fm), GFP_KERNEL);
 	if (!new_fm) {
 		mutex_unlock(&ubi->fm_mutex);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 534e851..56b1c5c 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -663,6 +663,7 @@ struct ubi_attach_info {
  * @func: worker function
  * @e: physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
+ * @anchor: produce a anchor PEB to by used by fastmap
  *
  * The @func pointer points to the worker function. If the @cancel argum=
ent is
  * not zero, the worker has to free the resources and exit immediately. =
The
@@ -675,6 +676,7 @@ struct ubi_work {
 	/* The below fields are only relevant to erasure works */
 	struct ubi_wl_entry *e;
 	int torture;
+	int anchor;
 };
=20
 #include "debug.h"
@@ -759,6 +761,7 @@ struct ubi_wl_entry *ubi_wl_get_fm_peb(struct ubi_dev=
ice *ubi, int max_pnum);
 int ubi_wl_put_fm_peb(struct ubi_device *ubi, struct ubi_wl_entry *used_=
e, int torture);
 int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
+int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
=20
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int o=
ffset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 6771f30..b4d4358 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -419,6 +419,18 @@ static struct ubi_wl_entry *find_anchor_wl_entry(str=
uct rb_root *root,
 	return victim;
 }
=20
+static int anchor_pebs_avalible(struct rb_root *root, int max_pnum)
+{
+	struct rb_node *p;
+	struct ubi_wl_entry *e;
+
+	ubi_rb_for_each_entry(p, e, root, u.rb)
+		if (e->pnum < max_pnum)
+			return 1;
+
+	return 0;
+}
+
 /**
  * ubi_wl_get_fm_peb - find a physical erase block with a given maximal =
number.
  * @ubi: UBI device description object
@@ -901,10 +913,11 @@ static int wear_leveling_worker(struct ubi_device *=
ubi, struct ubi_work *wrk,
 				int cancel)
 {
 	int err, scrubbing =3D 0, torture =3D 0, protect =3D 0, erroneous =3D 0=
;
-	int vol_id =3D -1, uninitialized_var(lnum);
+	int anchor, vol_id =3D -1, uninitialized_var(lnum);
 	struct ubi_wl_entry *e1, *e2;
 	struct ubi_vid_hdr *vid_hdr;
=20
+	anchor =3D wrk->anchor;
 	kfree(wrk);
 	if (cancel)
 		return 0;
@@ -935,7 +948,23 @@ static int wear_leveling_worker(struct ubi_device *u=
bi, struct ubi_work *wrk,
 		goto out_cancel;
 	}
=20
-	if (!ubi->scrub.rb_node) {
+	/* Check whether we need to produce an anchor PEB */
+	if (!anchor)
+		anchor =3D !anchor_pebs_avalible(&ubi->free, UBI_FM_MAX_START);
+
+	if (anchor) {
+		e1 =3D find_anchor_wl_entry(&ubi->used, UBI_FM_MAX_START);
+		if (!e1)
+			goto out_cancel;
+		e2 =3D get_peb_for_wl(ubi);
+		if (!e2)
+			goto out_cancel;
+
+		self_check_in_wl_tree(ubi, e1, &ubi->used);
+		rb_erase(&e1->u.rb, &ubi->used);
+		dbg_wl("anchor-move PEB %d to PEB %d", e1->pnum, e2->pnum);
+	}
+	else if (!ubi->scrub.rb_node) {
 		/*
 		 * Now pick the least worn-out used physical eraseblock and a
 		 * highly worn-out free physical eraseblock. If the erase
@@ -1229,6 +1258,7 @@ static int ensure_wear_leveling(struct ubi_device *=
ubi, int nested)
 		goto out_cancel;
 	}
=20
+	wrk->anchor =3D 0;
 	wrk->func =3D &wear_leveling_worker;
 	if (nested)
 		__schedule_ubi_work(ubi, wrk);
@@ -1244,6 +1274,32 @@ out_unlock:
 	return err;
 }
=20
+int ubi_ensure_anchor_pebs(struct ubi_device *ubi)
+{
+	struct ubi_work *wrk;
+
+	spin_lock(&ubi->wl_lock);
+	if (ubi->wl_scheduled) {
+		spin_unlock(&ubi->wl_lock);
+		return 0;
+	}
+	ubi->wl_scheduled =3D 1;
+	spin_unlock(&ubi->wl_lock);
+
+	wrk =3D kmalloc(sizeof(struct ubi_work), GFP_NOFS);
+	if (!wrk) {
+		spin_lock(&ubi->wl_lock);
+		ubi->wl_scheduled =3D 0;
+		spin_unlock(&ubi->wl_lock);
+		return -ENOMEM;
+	}
+
+	wrk->anchor =3D 1;
+	wrk->func =3D &wear_leveling_worker;
+	schedule_ubi_work(ubi, wrk);
+	return 0;
+}
+
 /**
  * erase_worker - physical eraseblock erase worker function.
  * @ubi: UBI device description object

--------------060501020600000304080402--

--------------enig451804EEBB3B245FB1988CD5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJP5J4dAAoJEN9758yqZn9etp8H/ArkdQMmEisUmRmEViNaHG0j
Mw5LSaOdae3u2qZnmQYe/9111DKURjK3x/WBZFL3Tw6LnP1S+EnnMOgnJQjsAohE
73VVZMz13SB89sOBZiyadW3ji99QToIO/cy6eWGekYHjE+R5kSdplzpy1l1FhAkT
NT1CcR4BRhVbujs2FkkMspQ/fMPt3DDyY59Njbu516soQo3DMG5fvhIJnURg8Gyx
VDA95C86YgfJQj5/5rH6bED1J4cIRWc09fU+6hg9c98lme+QG5zwfe0ShlA8jo4O
GYrXEbaCpmJL+bNzRPGZ+m3H6nGiSgY1tydRmts4pySrLCxsnIqQOa0C4W6M/Q0=
=csYf
-----END PGP SIGNATURE-----

--------------enig451804EEBB3B245FB1988CD5--
