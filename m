Received: from mail.arrisi.com ([216.234.147.109])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwYVh-0000b4-Vo
 for linux-mtd@lists.infradead.org; Tue, 09 Jul 2013 14:03:19 +0000
Received: from ATLOWA2.ARRS.ARRISI.com (webclient.arrisi.com [10.2.131.253])
 by mail1.arrisi.com (8.14.5/8.14.5) with ESMTP id r69E2puA008518
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 9 Jul 2013 10:02:51 -0400
From: "Sidorov, Andrei" <Andrei.Sidorov@arrisi.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBI: torture after scrub
Date: Tue, 9 Jul 2013 14:02:50 +0000
Message-ID: <C0F0BC787567C848B2C90989451123DA3D27CF9F@ATLEXMBX4.ARRS.ARRISI.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=0A=
=0A=
There is something a bit odd in UBI behaviour related to scrubbing.=0A=
Throughout power cut test logs I see lots of=0A=
=0A=
bitflips detected in PEB 30=0A=
PEB 30 gets scrubbed=0A=
PEB 30 gets erased and later reused=0A=
bitflips detected in PEB 30=0A=
....=0A=
=0A=
Shouldn't UBI do torture test of source EB after scrubbing? Otherwise=0A=
it looks meaningless to scrub this EB at all.=0A=
=0A=
Below change is based on linux 3.3, but it applies almost without changes=
=0A=
to 3.10 tree (however I'm not sure if sync erasure in wear_levelling_worker=
=0A=
adds up to write amplification).=0A=
=0A=
Does it look reasonable?=0A=
=0A=
=0A=
Index: linux/drivers/mtd/ubi/eba.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- linux.orig/drivers/mtd/ubi/eba.c=0A=
+++ linux/drivers/mtd/ubi/eba.c=0A=
@@ -986,6 +986,7 @@ int ubi_eba_copy_leb(struct ubi_device *=0A=
 		     struct ubi_vid_hdr *vid_hdr)=0A=
 {=0A=
 	int err, vol_id, lnum, data_size, aldata_size, idx;=0A=
+	int err_bitflips =3D 0;=0A=
 	struct ubi_volume *vol;=0A=
 	uint32_t crc;=0A=
 =0A=
@@ -1060,7 +1061,9 @@ int ubi_eba_copy_leb(struct ubi_device *=0A=
 	mutex_lock(&ubi->buf_mutex);=0A=
 	dbg_wl("read %d bytes of data", aldata_size);=0A=
 	err =3D ubi_io_read_data(ubi, ubi->peb_buf1, from, 0, aldata_size);=0A=
-	if (err && err !=3D UBI_IO_BITFLIPS) {=0A=
+	if (err =3D=3D UBI_IO_BITFLIPS)=0A=
+		err_bitflips =3D MOVE_SOURCE_BITFLIPS;=0A=
+	else if (err) {=0A=
 		ubi_warn("error %d while reading data from PEB %d",=0A=
 			 err, from);=0A=
 		err =3D MOVE_SOURCE_RD_ERR;=0A=
@@ -1164,7 +1167,7 @@ out_unlock_buf:=0A=
 	mutex_unlock(&ubi->buf_mutex);=0A=
 out_unlock_leb:=0A=
 	leb_write_unlock(ubi, vol_id, lnum);=0A=
-	return err;=0A=
+	return err ? err : err_bitflips;=0A=
 }=0A=
 =0A=
 /**=0A=
Index: linux/drivers/mtd/ubi/ubi.h=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- linux.orig/drivers/mtd/ubi/ubi.h=0A=
+++ linux/drivers/mtd/ubi/ubi.h=0A=
@@ -112,6 +112,7 @@ enum {=0A=
  *=0A=
  * MOVE_CANCEL_RACE: canceled because the volume is being deleted, the sou=
rce=0A=
  *                   PEB was put meanwhile, or there is I/O on the source =
PEB=0A=
+ * MOVE_SOURCE_BITFLIPS: PEB moved, but there were bitflips in the source =
PEB=0A=
  * MOVE_SOURCE_RD_ERR: canceled because there was a read error from the so=
urce=0A=
  *                     PEB=0A=
  * MOVE_TARGET_RD_ERR: canceled because there was a read error from the ta=
rget=0A=
@@ -124,6 +125,7 @@ enum {=0A=
  */=0A=
 enum {=0A=
 	MOVE_CANCEL_RACE =3D 1,=0A=
+	MOVE_SOURCE_BITFLIPS,=0A=
 	MOVE_SOURCE_RD_ERR,=0A=
 	MOVE_TARGET_RD_ERR,=0A=
 	MOVE_TARGET_WR_ERR,=0A=
Index: linux/drivers/mtd/ubi/wl.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
--- linux.orig/drivers/mtd/ubi/wl.c=0A=
+++ linux/drivers/mtd/ubi/wl.c=0A=
@@ -797,6 +797,10 @@ static int wear_leveling_worker(struct u=0A=
 			scrubbing =3D 1;=0A=
 			goto out_not_moved;=0A=
 		}=0A=
+		if (err =3D=3D MOVE_SOURCE_BITFLIPS) {=0A=
+			scrubbing =3D 1;=0A=
+			goto out_moved;=0A=
+		}=0A=
 		if (err =3D=3D MOVE_CANCEL_BITFLIPS || err =3D=3D MOVE_TARGET_WR_ERR ||=
=0A=
 		    err =3D=3D MOVE_TARGET_RD_ERR) {=0A=
 			/*=0A=
@@ -830,6 +834,7 @@ static int wear_leveling_worker(struct u=0A=
 		ubi_assert(0);=0A=
 	}=0A=
 =0A=
+out_moved:=0A=
 	/* The PEB has been successfully moved */=0A=
 	if (scrubbing)=0A=
 		ubi_msg("scrubbed PEB %d (LEB %d:%d), data moved to PEB %d",=0A=
@@ -845,7 +850,7 @@ static int wear_leveling_worker(struct u=0A=
 	ubi->move_to_put =3D ubi->wl_scheduled =3D 0;=0A=
 	spin_unlock(&ubi->wl_lock);=0A=
 =0A=
-	err =3D schedule_erase(ubi, e1, 0);=0A=
+	err =3D schedule_erase(ubi, e1, scrubbing);=0A=
 	if (err) {=0A=
 		kmem_cache_free(ubi_wl_entry_slab, e1);=0A=
 		if (e2)=0A=
=0A=
=0A=
