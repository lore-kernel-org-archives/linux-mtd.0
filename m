Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sgefo-0000cl-NZ
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 16:19:30 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/22] UBI: Fastmap: Store scrub list in fastmap
Date: Mon, 18 Jun 2012 18:18:47 +0200
Message-Id: <1340036345-96726-5-git-send-email-richard@nod.at>
In-Reply-To: <1340036345-96726-1-git-send-email-richard@nod.at>
References: <1340036345-96726-1-git-send-email-richard@nod.at>
Cc: artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, shmulik.ladkani@gmail.com,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Marius.Mazarel@ugal.ro, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If scrub work is pending while writing the fastmap we have to
store it into the fastmap otherwise we'd leak PEBs.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c   |   26 ++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi-media.h |    3 ++-
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 9ed4723..bc29835 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -560,6 +560,17 @@ static int ubi_attach_fastmap(struct ubi_device *ubi,
 			be32_to_cpu(fmec->ec), 0);
 	}
 
+	/* read EC values from scrub list */
+	for (i = 0; i < be32_to_cpu(fmhdr->scrub_peb_count); i++) {
+		fmec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
+		fm_pos += sizeof(*fmec);
+		if (fm_pos >= fm_size)
+			goto fail_bad;
+
+		add_aeb(ai, &used, be32_to_cpu(fmec->pnum),
+			be32_to_cpu(fmec->ec), 1);
+	}
+
 	ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
 	ai->bad_peb_count = be32_to_cpu(fmhdr->bad_peb_count);
 
@@ -1016,6 +1027,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	struct ubi_volume *vol;
 	struct ubi_vid_hdr *avhdr, *dvhdr;
 	int ret, i, j, free_peb_count, used_peb_count, vol_count;
+	int scrub_peb_count;
 
 	fm_raw = vzalloc(new_fm->size);
 	if (!fm_raw) {
@@ -1055,6 +1067,7 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	fmh->magic = cpu_to_be32(UBI_FM_HDR_MAGIC);
 	free_peb_count = 0;
 	used_peb_count = 0;
+	scrub_peb_count = 0;
 	vol_count = 0;
 
 	fmpl1 = (struct ubi_fm_scan_pool *)(fm_raw + fm_pos);
@@ -1099,6 +1112,19 @@ static int ubi_write_fastmap(struct ubi_device *ubi,
 	}
 	fmh->used_peb_count = cpu_to_be32(used_peb_count);
 
+	for (node = rb_first(&ubi->scrub); node; node = rb_next(node)) {
+		wl_e = rb_entry(node, struct ubi_wl_entry, u.rb);
+		fec = (struct ubi_fm_ec *)(fm_raw + fm_pos);
+
+		fec->pnum = cpu_to_be32(wl_e->pnum);
+		fec->ec = cpu_to_be32(wl_e->ec);
+
+		scrub_peb_count++;
+		fm_pos += sizeof(*fec);
+		ubi_assert(fm_pos <= new_fm->size);
+	}
+	fmh->scrub_peb_count = cpu_to_be32(scrub_peb_count);
+
 	for (i = 0; i < UBI_MAX_VOLUMES + UBI_INT_VOL_COUNT; i++) {
 		vol = ubi->volumes[i];
 
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index a36748c..bea8c95 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -440,9 +440,10 @@ struct ubi_fm_hdr {
 	__be32 magic;
 	__be32 free_peb_count;
 	__be32 used_peb_count;
+	__be32 scrub_peb_count;
 	__be32 vol_count;
 	__be32 bad_peb_count;
-	__u8 padding[12];
+	__u8 padding[8];
 } __packed;
 
 /* struct ubi_fm_hdr is followed by struct ubi_fm_scan_pool */
-- 
1.7.6.5
