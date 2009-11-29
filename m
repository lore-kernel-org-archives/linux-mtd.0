Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NEomZ-0000bY-QZ
	for linux-mtd@lists.infradead.org; Sun, 29 Nov 2009 18:46:08 +0000
Date: Sun, 29 Nov 2009 19:46:02 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [RFC / PATCH] mtd/ubi: flush wl before clearing update marker
Message-ID: <20091129184602.GB30617@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubiupdatevol -t does the following:
- ubi_start_update()
  - set_update_marker()
  - for all LEBs ubi_eba_unmap_leb()
  - clear_update_marker()
  - ubi_wl_flush()

ubi_wl_flush() physically erases all PEB, once it returns all PEBs are
empty. clear_update_marker() has the update marker written after return.
If there is a power cut between the last two functions then the UBI
volume has no longer the "update" marker set and may have some valid
LEBs while some of them may be gone.
If that volume in question happens to be a UBIFS volume, then mount
will fail with

|UBIFS error (pid 1361): ubifs_read_node: bad node type (255 but expected 6)
|UBIFS error (pid 1361): ubifs_read_node: bad node at LEB 0:0
|Not a node, first 24 bytes:
|00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

if there is at least one valid LEB and the wear-leveling worker managed
to clear LEB 0.

The patch waits for the wl worker to finish prior clearing the "update"
marker on flash. The two new LEB which are scheduled for erasing after
clear_update_marker() should not matter because they are only visible to
UBI.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
Artem, I got a faulty image which shows this error message on mount. I
The image had no super block any more, not even an older version in a
different PEB. So I came to the conclusion described above. Is this
possible or did miss a detail?
I've made the same fix in ubi_more_update_data() because there is the
same pattern however I'm not 100% sure if it is required / correct.

 drivers/mtd/ubi/upd.c |   22 +++++++++++++---------
 1 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
index 74fdc40..312d0ec 100644
--- a/drivers/mtd/ubi/upd.c
+++ b/drivers/mtd/ubi/upd.c
@@ -147,12 +147,15 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
 	}
 
 	if (bytes == 0) {
+
+		err = ubi_wl_flush(ubi);
+		if (err)
+			return err;
+
 		err = clear_update_marker(ubi, vol, 0);
 		if (err)
 			return err;
-		err = ubi_wl_flush(ubi);
-		if (!err)
-			vol->updating = 0;
+		vol->updating = 0;
 	}
 
 	vol->upd_buf = vmalloc(ubi->leb_size);
@@ -362,16 +365,17 @@ int ubi_more_update_data(struct ubi_device *ubi, struct ubi_volume *vol,
 
 	ubi_assert(vol->upd_received <= vol->upd_bytes);
 	if (vol->upd_received == vol->upd_bytes) {
+
+		err = ubi_wl_flush(ubi);
+		if (err)
+			return err;
 		/* The update is finished, clear the update marker */
 		err = clear_update_marker(ubi, vol, vol->upd_bytes);
 		if (err)
 			return err;
-		err = ubi_wl_flush(ubi);
-		if (err == 0) {
-			vol->updating = 0;
-			err = to_write;
-			vfree(vol->upd_buf);
-		}
+		vol->updating = 0;
+		err = to_write;
+		vfree(vol->upd_buf);
 	}
 
 	return err;
-- 
1.6.2.5
