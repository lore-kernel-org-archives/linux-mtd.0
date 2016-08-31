Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf01N-0003NX-Bh
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:33:18 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 6A64B16B4CC3
 for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2016 09:32:55 +0200 (CEST)
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH 3/4] Add info support for nandsimctl
Date: Wed, 31 Aug 2016 09:32:43 +0200
Message-Id: <20160831073244.29106-4-dwalter@sigma-star.at>
In-Reply-To: <20160831073244.29106-1-dwalter@sigma-star.at>
References: <20160831073244.29106-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Display nandsim information as default command

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 include/mtd/nandsim-user.h | 19 +++++++++++++---
 nand-utils/nandsimctl.c    | 56 +++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 69 insertions(+), 6 deletions(-)

diff --git a/include/mtd/nandsim-user.h b/include/mtd/nandsim-user.h
index 0254b09..50a39a5 100644
--- a/include/mtd/nandsim-user.h
+++ b/include/mtd/nandsim-user.h
@@ -7,9 +7,13 @@
 
 #define NANDSIM_IOC_NEW_INSTANCE _IOW(NANSIM_IOC_MAGIC, 0, struct ns_new_instance_req)
 #define NANDSIM_IOC_DESTROY_INSTANCE _IOW(NANSIM_IOC_MAGIC, 1, struct ns_destroy_instance_req)
+#define NANDSIM_IOC_INFO_INSTANCE _IOW(NANSIM_IOC_MAGIC, 2, struct ns_info_instance_req)
 
 #define NANDSIM_MAX_DEVICES 32
 #define NANDSIM_MAX_PARTS 32
+#define NANDSIM_FILENAME_SIZE 64
+
+#define __packed __attribute__((packed))
 
 enum ns_backend_type {
 	NANDSIM_BACKEND_RAM = 0,
@@ -78,7 +82,7 @@ struct ns_new_instance_req {
 	__s32 padding[4];
 
 	__s32 simelem_num;
-} __attribute__((packed));
+} __packed;
 
 enum {
 	NANDSIM_SIMELEM_BADBLOCK = 0,
@@ -92,11 +96,20 @@ struct ns_simelement_prop {
 	__s32 elem_id;
 	__s32 elem_attr;
 	__s8 padding[7];
-} __attribute__((packed));
+} __packed;
 
 struct ns_destroy_instance_req {
 	__s8 id;
 	__s8 padding[7];
-} __attribute__((packed));
+} __packed;
+
+struct ns_info_instance_req {
+	__s8 id;
+	__s8 no_oob;
+	__s8 id_bytes[8];
+	__s8 parts_num;
+	__s8 backend;
+	__u8 filename[NANDSIM_FILENAME_SIZE];
+} __packed;
 
 #endif /* __NANDSIM_USER_H__ */
diff --git a/nand-utils/nandsimctl.c b/nand-utils/nandsimctl.c
index d91fe33..78ef1ff 100644
--- a/nand-utils/nandsimctl.c
+++ b/nand-utils/nandsimctl.c
@@ -97,7 +97,7 @@ static int parse_args(int argc, char *argv[])
 	int option_index;
 
 	for (;;) {
-		key = getopt_long(argc, argv, "b:i:h?rcfwod:D", long_options, &option_index);
+		key = getopt_long(argc, argv, "b:i:h?rcfwod:Dn", long_options, &option_index);
 		if (key == -1)
 			break;
 
@@ -294,6 +294,55 @@ static int do_attach(void)
 	return 0;
 }
 
+static int do_info(int id)
+{
+	struct ns_info_instance_req req;
+	int i, ret;
+	memset(&req, 0, sizeof(req));
+	req.id = id;
+	ret = ioctl(ctrl_fd, NANDSIM_IOC_INFO_INSTANCE, &req);
+	if (ret < 0 && errno == EINVAL)
+		return 0;
+	if (ret < 0) {
+		sys_errmsg("unable to fetch info for nandsim instance");
+		return ret;
+	}
+	printf("%2d ", req.id);
+	switch(req.backend) {
+	case NANDSIM_BACKEND_RAM:
+		printf("%-10s ", "mem");
+		break;
+	case NANDSIM_BACKEND_CACHEFILE:
+		printf("%-10s ", "cache-file");
+		break;
+	case NANDSIM_BACKEND_FILE:
+		printf("%-10s ", "file");
+		break;
+	default:
+		printf("unknown");
+		break;
+	}
+	for (i = 0; i < 8; i++) {
+		printf("0x%02X ",(uint8_t)req.id_bytes[i]);
+	}
+	if (req.backend == NANDSIM_BACKEND_FILE)
+		printf("%s", req.filename);
+	puts("");
+	return 0;
+}
+
+static int do_info_all(void)
+{
+	int id, ret = 0;
+	printf("%2s %-10s %-39s %s\n", "ID","Backend","NAND-ID", "Filename");
+	for (id = 0; id < NANDSIM_MAX_DEVICES; id++) {
+		ret = do_info(id);
+		if (ret)
+			break;
+	}
+	return ret;
+}
+
 int main(int argc, char *argv[])
 {
 	int ret;
@@ -310,8 +359,9 @@ int main(int argc, char *argv[])
 		return do_detach(args.detach);
 	else if (args.detach_all)
 		return do_detach_all();
-	else
+	else if (args.backend != -1)
 		return do_attach();
-
+	else
+		return do_info_all();
 	return 0;
 }
-- 
2.8.3
