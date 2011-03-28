Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q46xD-00011i-Ts
	for linux-mtd@lists.infradead.org; Mon, 28 Mar 2011 07:33:37 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2S7XWdi001348
	for <linux-mtd@lists.infradead.org>; Mon, 28 Mar 2011 10:33:32 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] UBI: use __packed instead of __attribute__((packed))
Date: Mon, 28 Mar 2011 10:36:10 +0300
Message-Id: <1301297771-14624-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301297771-14624-1-git-send-email-dedekind1@gmail.com>
References: <1301297771-14624-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

There was an attempt to standartize various "__attribute__" and
other macros in order to have potentially portable and more
consistent code, see commit 82ddcb040570411fc2d421d96b3e69711c670328.

Note, that commit refers Rober Love's blog post, but the URL
is broken, the valid URL is:
http://blog.rlove.org/2005/10/with-little-help-from-your-compiler.html

Moreover, nowadays checkpatch.pl warns about using
__attribute__((packed)):

"WARNING: __packed is preferred over __attribute__((packed))"

It is not a big deal for UBI to use __packed, so let's do it.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/ubi-media.h |    6 +++---
 include/mtd/ubi-user.h      |   12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 503ea9b..6fb8ec2 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -164,7 +164,7 @@ struct ubi_ec_hdr {
 	__be32  image_seq;
 	__u8    padding2[32];
 	__be32  hdr_crc;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubi_vid_hdr - on-flash UBI volume identifier header.
@@ -292,7 +292,7 @@ struct ubi_vid_hdr {
 	__be64  sqnum;
 	__u8    padding3[12];
 	__be32  hdr_crc;
-} __attribute__ ((packed));
+} __packed;
 
 /* Internal UBI volumes count */
 #define UBI_INT_VOL_COUNT 1
@@ -373,6 +373,6 @@ struct ubi_vtbl_record {
 	__u8    flags;
 	__u8    padding[23];
 	__be32  crc;
-} __attribute__ ((packed));
+} __packed;
 
 #endif /* !__UBI_MEDIA_H__ */
diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index e70bd34..a390342 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -310,7 +310,7 @@ struct ubi_mkvol_req {
 	__s16 name_len;
 	__s8 padding2[4];
 	char name[UBI_MAX_VOLUME_NAME + 1];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubi_rsvol_req - a data structure used in volume re-size requests.
@@ -326,7 +326,7 @@ struct ubi_mkvol_req {
 struct ubi_rsvol_req {
 	__s64 bytes;
 	__s32 vol_id;
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubi_rnvol_req - volumes re-name request.
@@ -368,7 +368,7 @@ struct ubi_rnvol_req {
 		__s8  padding2[2];
 		char    name[UBI_MAX_VOLUME_NAME + 1];
 	} ents[UBI_MAX_RNVOL];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubi_leb_change_req - a data structure used in atomic LEB change
@@ -383,7 +383,7 @@ struct ubi_leb_change_req {
 	__s32 bytes;
 	__s8  dtype;
 	__s8  padding[7];
-} __attribute__ ((packed));
+} __packed;
 
 /**
  * struct ubi_map_req - a data structure used in map LEB requests.
@@ -395,7 +395,7 @@ struct ubi_map_req {
 	__s32 lnum;
 	__s8  dtype;
 	__s8  padding[3];
-} __attribute__ ((packed));
+} __packed;
 
 
 /**
@@ -409,6 +409,6 @@ struct ubi_set_vol_prop_req {
        __u8  property;
        __u8  padding[7];
        __u64 value;
-}  __attribute__ ((packed));
+}  __packed;
 
 #endif /* __UBI_USER_H__ */
-- 
1.7.2.3
