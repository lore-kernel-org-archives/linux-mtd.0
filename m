Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T5yL4-0002UA-Ve
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 12:22:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: use pr_ helper instead of printk
Date: Mon, 27 Aug 2012 15:22:54 +0300
Message-Id: <1346070174-17871-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1346070174-17871-1-git-send-email-dedekind1@gmail.com>
References: <1346070174-17871-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Use 'pr_err()' instead of 'printk(KERN_ERR', etc.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/attach.c |    6 +-
 drivers/mtd/ubi/build.c  |   23 ++++---
 drivers/mtd/ubi/debug.c  |  149 ++++++++++++++++++++++------------------------
 drivers/mtd/ubi/debug.h  |    8 +--
 drivers/mtd/ubi/gluebi.c |    2 +-
 drivers/mtd/ubi/ubi.h    |    8 +--
 6 files changed, 93 insertions(+), 103 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 8da4cff..239c101 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1074,10 +1074,10 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	if (ai->corr_peb_count) {
 		ubi_err("%d PEBs are corrupted and preserved",
 			ai->corr_peb_count);
-		printk(KERN_ERR "Corrupted PEBs are:");
+		pr_err("Corrupted PEBs are:");
 		list_for_each_entry(aeb, &ai->corr, u.list)
-			printk(KERN_CONT " %d", aeb->pnum);
-		printk(KERN_CONT "\n");
+			pr_cont(" %d", aeb->pnum);
+		pr_cont("\n");
 
 		/*
 		 * If too many PEBs are corrupted, we refuse attaching,
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index dd9bc0a..998a0bf 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1304,8 +1304,7 @@ static int __init bytes_str_to_int(const char *str)
 
 	result = simple_strtoul(str, &endp, 0);
 	if (str == endp || result >= INT_MAX) {
-		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
-		       str);
+		ubi_err("UBI error: incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
 	}
 
@@ -1321,8 +1320,7 @@ static int __init bytes_str_to_int(const char *str)
 	case '\0':
 		break;
 	default:
-		printk(KERN_ERR "UBI error: incorrect bytes count: \"%s\"\n",
-		       str);
+		ubi_err("UBI error: incorrect bytes count: \"%s\"\n", str);
 		return -EINVAL;
 	}
 
@@ -1349,20 +1347,20 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		return -EINVAL;
 
 	if (mtd_devs == UBI_MAX_DEVICES) {
-		printk(KERN_ERR "UBI error: too many parameters, max. is %d\n",
-		       UBI_MAX_DEVICES);
+		ubi_err("UBI error: too many parameters, max. is %d\n",
+			UBI_MAX_DEVICES);
 		return -EINVAL;
 	}
 
 	len = strnlen(val, MTD_PARAM_LEN_MAX);
 	if (len == MTD_PARAM_LEN_MAX) {
-		printk(KERN_ERR "UBI error: parameter \"%s\" is too long, max. is %d\n",
-		       val, MTD_PARAM_LEN_MAX);
+		ubi_err("UBI error: parameter \"%s\" is too long, max. is %d\n",
+			val, MTD_PARAM_LEN_MAX);
 		return -EINVAL;
 	}
 
 	if (len == 0) {
-		printk(KERN_WARNING "UBI warning: empty 'mtd=' parameter - ignored\n");
+		pr_warn("UBI warning: empty 'mtd=' parameter - ignored\n");
 		return 0;
 	}
 
@@ -1376,8 +1374,7 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		tokens[i] = strsep(&pbuf, ",");
 
 	if (pbuf) {
-		printk(KERN_ERR "UBI error: too many arguments at \"%s\"\n",
-		       val);
+		ubi_err("UBI error: too many arguments at \"%s\"\n", val);
 		return -EINVAL;
 	}
 
@@ -1394,8 +1391,8 @@ static int __init ubi_mtd_param_parse(const char *val, struct kernel_param *kp)
 		int err = kstrtoint(tokens[2], 10, &p->max_beb_per1024);
 
 		if (err) {
-			printk(KERN_ERR "UBI error: bad value for max_beb_per1024 parameter: %s",
-			       tokens[2]);
+			ubi_err("UBI error: bad value for max_beb_per1024 parameter: %s",
+				tokens[2]);
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index dd97324..26908a5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -62,21 +62,15 @@ out:
  */
 void ubi_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr)
 {
-	printk(KERN_DEBUG "Erase counter header dump:\n");
-	printk(KERN_DEBUG "\tmagic          %#08x\n",
-	       be32_to_cpu(ec_hdr->magic));
-	printk(KERN_DEBUG "\tversion        %d\n", (int)ec_hdr->version);
-	printk(KERN_DEBUG "\tec             %llu\n",
-	       (long long)be64_to_cpu(ec_hdr->ec));
-	printk(KERN_DEBUG "\tvid_hdr_offset %d\n",
-	       be32_to_cpu(ec_hdr->vid_hdr_offset));
-	printk(KERN_DEBUG "\tdata_offset    %d\n",
-	       be32_to_cpu(ec_hdr->data_offset));
-	printk(KERN_DEBUG "\timage_seq      %d\n",
-	       be32_to_cpu(ec_hdr->image_seq));
-	printk(KERN_DEBUG "\thdr_crc        %#08x\n",
-	       be32_to_cpu(ec_hdr->hdr_crc));
-	printk(KERN_DEBUG "erase counter header hexdump:\n");
+	pr_err("Erase counter header dump:\n");
+	pr_err("\tmagic          %#08x\n", be32_to_cpu(ec_hdr->magic));
+	pr_err("\tversion        %d\n", (int)ec_hdr->version);
+	pr_err("\tec             %llu\n", (long long)be64_to_cpu(ec_hdr->ec));
+	pr_err("\tvid_hdr_offset %d\n", be32_to_cpu(ec_hdr->vid_hdr_offset));
+	pr_err("\tdata_offset    %d\n", be32_to_cpu(ec_hdr->data_offset));
+	pr_err("\timage_seq      %d\n", be32_to_cpu(ec_hdr->image_seq));
+	pr_err("\thdr_crc        %#08x\n", be32_to_cpu(ec_hdr->hdr_crc));
+	pr_err("erase counter header hexdump:\n");
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 		       ec_hdr, UBI_EC_HDR_SIZE, 1);
 }
@@ -87,21 +81,21 @@ void ubi_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr)
  */
 void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
 {
-	printk(KERN_DEBUG "Volume identifier header dump:\n");
-	printk(KERN_DEBUG "\tmagic     %08x\n", be32_to_cpu(vid_hdr->magic));
-	printk(KERN_DEBUG "\tversion   %d\n",  (int)vid_hdr->version);
-	printk(KERN_DEBUG "\tvol_type  %d\n",  (int)vid_hdr->vol_type);
-	printk(KERN_DEBUG "\tcopy_flag %d\n",  (int)vid_hdr->copy_flag);
-	printk(KERN_DEBUG "\tcompat    %d\n",  (int)vid_hdr->compat);
-	printk(KERN_DEBUG "\tvol_id    %d\n",  be32_to_cpu(vid_hdr->vol_id));
-	printk(KERN_DEBUG "\tlnum      %d\n",  be32_to_cpu(vid_hdr->lnum));
-	printk(KERN_DEBUG "\tdata_size %d\n",  be32_to_cpu(vid_hdr->data_size));
-	printk(KERN_DEBUG "\tused_ebs  %d\n",  be32_to_cpu(vid_hdr->used_ebs));
-	printk(KERN_DEBUG "\tdata_pad  %d\n",  be32_to_cpu(vid_hdr->data_pad));
-	printk(KERN_DEBUG "\tsqnum     %llu\n",
+	pr_err("Volume identifier header dump:\n");
+	pr_err("\tmagic     %08x\n", be32_to_cpu(vid_hdr->magic));
+	pr_err("\tversion   %d\n",  (int)vid_hdr->version);
+	pr_err("\tvol_type  %d\n",  (int)vid_hdr->vol_type);
+	pr_err("\tcopy_flag %d\n",  (int)vid_hdr->copy_flag);
+	pr_err("\tcompat    %d\n",  (int)vid_hdr->compat);
+	pr_err("\tvol_id    %d\n",  be32_to_cpu(vid_hdr->vol_id));
+	pr_err("\tlnum      %d\n",  be32_to_cpu(vid_hdr->lnum));
+	pr_err("\tdata_size %d\n",  be32_to_cpu(vid_hdr->data_size));
+	pr_err("\tused_ebs  %d\n",  be32_to_cpu(vid_hdr->used_ebs));
+	pr_err("\tdata_pad  %d\n",  be32_to_cpu(vid_hdr->data_pad));
+	pr_err("\tsqnum     %llu\n",
 		(unsigned long long)be64_to_cpu(vid_hdr->sqnum));
-	printk(KERN_DEBUG "\thdr_crc   %08x\n", be32_to_cpu(vid_hdr->hdr_crc));
-	printk(KERN_DEBUG "Volume identifier header hexdump:\n");
+	pr_err("\thdr_crc   %08x\n", be32_to_cpu(vid_hdr->hdr_crc));
+	pr_err("Volume identifier header hexdump:\n");
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 		       vid_hdr, UBI_VID_HDR_SIZE, 1);
 }
@@ -112,25 +106,25 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
  */
 void ubi_dump_vol_info(const struct ubi_volume *vol)
 {
-	printk(KERN_DEBUG "Volume information dump:\n");
-	printk(KERN_DEBUG "\tvol_id          %d\n", vol->vol_id);
-	printk(KERN_DEBUG "\treserved_pebs   %d\n", vol->reserved_pebs);
-	printk(KERN_DEBUG "\talignment       %d\n", vol->alignment);
-	printk(KERN_DEBUG "\tdata_pad        %d\n", vol->data_pad);
-	printk(KERN_DEBUG "\tvol_type        %d\n", vol->vol_type);
-	printk(KERN_DEBUG "\tname_len        %d\n", vol->name_len);
-	printk(KERN_DEBUG "\tusable_leb_size %d\n", vol->usable_leb_size);
-	printk(KERN_DEBUG "\tused_ebs        %d\n", vol->used_ebs);
-	printk(KERN_DEBUG "\tused_bytes      %lld\n", vol->used_bytes);
-	printk(KERN_DEBUG "\tlast_eb_bytes   %d\n", vol->last_eb_bytes);
-	printk(KERN_DEBUG "\tcorrupted       %d\n", vol->corrupted);
-	printk(KERN_DEBUG "\tupd_marker      %d\n", vol->upd_marker);
+	pr_err("Volume information dump:\n");
+	pr_err("\tvol_id          %d\n", vol->vol_id);
+	pr_err("\treserved_pebs   %d\n", vol->reserved_pebs);
+	pr_err("\talignment       %d\n", vol->alignment);
+	pr_err("\tdata_pad        %d\n", vol->data_pad);
+	pr_err("\tvol_type        %d\n", vol->vol_type);
+	pr_err("\tname_len        %d\n", vol->name_len);
+	pr_err("\tusable_leb_size %d\n", vol->usable_leb_size);
+	pr_err("\tused_ebs        %d\n", vol->used_ebs);
+	pr_err("\tused_bytes      %lld\n", vol->used_bytes);
+	pr_err("\tlast_eb_bytes   %d\n", vol->last_eb_bytes);
+	pr_err("\tcorrupted       %d\n", vol->corrupted);
+	pr_err("\tupd_marker      %d\n", vol->upd_marker);
 
 	if (vol->name_len <= UBI_VOL_NAME_MAX &&
 	    strnlen(vol->name, vol->name_len + 1) == vol->name_len) {
-		printk(KERN_DEBUG "\tname            %s\n", vol->name);
+		pr_err("\tname            %s\n", vol->name);
 	} else {
-		printk(KERN_DEBUG "\t1st 5 characters of name: %c%c%c%c%c\n",
+		pr_err("\t1st 5 characters of name: %c%c%c%c%c\n",
 		       vol->name[0], vol->name[1], vol->name[2],
 		       vol->name[3], vol->name[4]);
 	}
@@ -145,29 +139,28 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 {
 	int name_len = be16_to_cpu(r->name_len);
 
-	printk(KERN_DEBUG "Volume table record %d dump:\n", idx);
-	printk(KERN_DEBUG "\treserved_pebs   %d\n",
-	       be32_to_cpu(r->reserved_pebs));
-	printk(KERN_DEBUG "\talignment       %d\n", be32_to_cpu(r->alignment));
-	printk(KERN_DEBUG "\tdata_pad        %d\n", be32_to_cpu(r->data_pad));
-	printk(KERN_DEBUG "\tvol_type        %d\n", (int)r->vol_type);
-	printk(KERN_DEBUG "\tupd_marker      %d\n", (int)r->upd_marker);
-	printk(KERN_DEBUG "\tname_len        %d\n", name_len);
+	pr_err("Volume table record %d dump:\n", idx);
+	pr_err("\treserved_pebs   %d\n", be32_to_cpu(r->reserved_pebs));
+	pr_err("\talignment       %d\n", be32_to_cpu(r->alignment));
+	pr_err("\tdata_pad        %d\n", be32_to_cpu(r->data_pad));
+	pr_err("\tvol_type        %d\n", (int)r->vol_type);
+	pr_err("\tupd_marker      %d\n", (int)r->upd_marker);
+	pr_err("\tname_len        %d\n", name_len);
 
 	if (r->name[0] == '\0') {
-		printk(KERN_DEBUG "\tname            NULL\n");
+		pr_err("\tname            NULL\n");
 		return;
 	}
 
 	if (name_len <= UBI_VOL_NAME_MAX &&
 	    strnlen(&r->name[0], name_len + 1) == name_len) {
-		printk(KERN_DEBUG "\tname            %s\n", &r->name[0]);
+		pr_err("\tname            %s\n", &r->name[0]);
 	} else {
-		printk(KERN_DEBUG "\t1st 5 characters of name: %c%c%c%c%c\n",
+		pr_err("\t1st 5 characters of name: %c%c%c%c%c\n",
 			r->name[0], r->name[1], r->name[2], r->name[3],
 			r->name[4]);
 	}
-	printk(KERN_DEBUG "\tcrc             %#08x\n", be32_to_cpu(r->crc));
+	pr_err("\tcrc             %#08x\n", be32_to_cpu(r->crc));
 }
 
 /**
@@ -176,15 +169,15 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
  */
 void ubi_dump_av(const struct ubi_ainf_volume *av)
 {
-	printk(KERN_DEBUG "Volume attaching information dump:\n");
-	printk(KERN_DEBUG "\tvol_id         %d\n", av->vol_id);
-	printk(KERN_DEBUG "\thighest_lnum   %d\n", av->highest_lnum);
-	printk(KERN_DEBUG "\tleb_count      %d\n", av->leb_count);
-	printk(KERN_DEBUG "\tcompat         %d\n", av->compat);
-	printk(KERN_DEBUG "\tvol_type       %d\n", av->vol_type);
-	printk(KERN_DEBUG "\tused_ebs       %d\n", av->used_ebs);
-	printk(KERN_DEBUG "\tlast_data_size %d\n", av->last_data_size);
-	printk(KERN_DEBUG "\tdata_pad       %d\n", av->data_pad);
+	pr_err("Volume attaching information dump:\n");
+	pr_err("\tvol_id         %d\n", av->vol_id);
+	pr_err("\thighest_lnum   %d\n", av->highest_lnum);
+	pr_err("\tleb_count      %d\n", av->leb_count);
+	pr_err("\tcompat         %d\n", av->compat);
+	pr_err("\tvol_type       %d\n", av->vol_type);
+	pr_err("\tused_ebs       %d\n", av->used_ebs);
+	pr_err("\tlast_data_size %d\n", av->last_data_size);
+	pr_err("\tdata_pad       %d\n", av->data_pad);
 }
 
 /**
@@ -194,13 +187,13 @@ void ubi_dump_av(const struct ubi_ainf_volume *av)
  */
 void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type)
 {
-	printk(KERN_DEBUG "eraseblock attaching information dump:\n");
-	printk(KERN_DEBUG "\tec       %d\n", aeb->ec);
-	printk(KERN_DEBUG "\tpnum     %d\n", aeb->pnum);
+	pr_err("eraseblock attaching information dump:\n");
+	pr_err("\tec       %d\n", aeb->ec);
+	pr_err("\tpnum     %d\n", aeb->pnum);
 	if (type == 0) {
-		printk(KERN_DEBUG "\tlnum     %d\n", aeb->lnum);
-		printk(KERN_DEBUG "\tscrub    %d\n", aeb->scrub);
-		printk(KERN_DEBUG "\tsqnum    %llu\n", aeb->sqnum);
+		pr_err("\tlnum     %d\n", aeb->lnum);
+		pr_err("\tscrub    %d\n", aeb->scrub);
+		pr_err("\tsqnum    %llu\n", aeb->sqnum);
 	}
 }
 
@@ -212,16 +205,16 @@ void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
 {
 	char nm[17];
 
-	printk(KERN_DEBUG "Volume creation request dump:\n");
-	printk(KERN_DEBUG "\tvol_id    %d\n",   req->vol_id);
-	printk(KERN_DEBUG "\talignment %d\n",   req->alignment);
-	printk(KERN_DEBUG "\tbytes     %lld\n", (long long)req->bytes);
-	printk(KERN_DEBUG "\tvol_type  %d\n",   req->vol_type);
-	printk(KERN_DEBUG "\tname_len  %d\n",   req->name_len);
+	pr_err("Volume creation request dump:\n");
+	pr_err("\tvol_id    %d\n",   req->vol_id);
+	pr_err("\talignment %d\n",   req->alignment);
+	pr_err("\tbytes     %lld\n", (long long)req->bytes);
+	pr_err("\tvol_type  %d\n",   req->vol_type);
+	pr_err("\tname_len  %d\n",   req->name_len);
 
 	memcpy(nm, req->name, 16);
 	nm[16] = 0;
-	printk(KERN_DEBUG "\t1st 16 characters of name: %s\n", nm);
+	pr_err("\t1st 16 characters of name: %s\n", nm);
 }
 
 /**
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index d9e89ec..ea4cb7c 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -29,13 +29,13 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 
 #define ubi_assert(expr)  do {                                               \
 	if (unlikely(!(expr))) {                                             \
-		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
+		pr_crit("UBI assert failed in %s at %u (pid %d)\n",          \
 		       __func__, __LINE__, current->pid);                    \
 		dump_stack();                                                \
 	}                                                                    \
 } while (0)
 
-#define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  \
+#define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)                   \
 		print_hex_dump(l, ps, pt, r, g, b, len, a)
 
 #define ubi_dbg_msg(type, fmt, ...) \
@@ -43,8 +43,8 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 		 ##__VA_ARGS__)
 
 /* Just a debugging messages not related to any specific UBI subsystem */
-#define dbg_msg(fmt, ...)                                    \
-	printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n", \
+#define dbg_msg(fmt, ...)                                                    \
+	pr_err("UBI DBG (pid %d): %s: " fmt "\n",                            \
 	       current->pid, __func__, ##__VA_ARGS__)
 
 /* General debugging messages */
diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index c25aa29..4bd4db8 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -41,7 +41,7 @@
 #include "ubi-media.h"
 
 #define err_msg(fmt, ...)                                   \
-	printk(KERN_DEBUG "gluebi (pid %d): %s: " fmt "\n", \
+	pr_err("gluebi (pid %d): %s: " fmt "\n",            \
 	       current->pid, __func__, ##__VA_ARGS__)
 
 /**
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 2a2475b..383ee43 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -51,12 +51,12 @@
 #define UBI_NAME_STR "ubi"
 
 /* Normal UBI messages */
-#define ubi_msg(fmt, ...) printk(KERN_NOTICE "UBI: " fmt "\n", ##__VA_ARGS__)
+#define ubi_msg(fmt, ...) pr_notice("UBI: " fmt "\n", ##__VA_ARGS__)
 /* UBI warning messages */
-#define ubi_warn(fmt, ...) printk(KERN_WARNING "UBI warning: %s: " fmt "\n", \
-				  __func__, ##__VA_ARGS__)
+#define ubi_warn(fmt, ...) pr_warn("UBI warning: %s: " fmt "\n",  \
+				   __func__, ##__VA_ARGS__)
 /* UBI error messages */
-#define ubi_err(fmt, ...) printk(KERN_ERR "UBI error: %s: " fmt "\n", \
+#define ubi_err(fmt, ...) pr_err("UBI error: %s: " fmt "\n",      \
 				 __func__, ##__VA_ARGS__)
 
 /* Background thread name pattern */
-- 
1.7.10.4
