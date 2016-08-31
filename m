Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bf01N-0003Na-Bf
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:33:19 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id DCB7616B4CC1
 for <linux-mtd@lists.infradead.org>; Wed, 31 Aug 2016 09:32:56 +0200 (CEST)
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH 4/4] Add support for bad and weak blocks/pages
Date: Wed, 31 Aug 2016 09:32:44 +0200
Message-Id: <20160831073244.29106-5-dwalter@sigma-star.at>
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

Added new flag to support the creation
of badblocks, weakblocks, weakpages, and gravepages.

example:
./nandsimctl -B 0x100,0x200 -W 0x101:100,0x202:1200 -r

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 nand-utils/nandsimctl.c | 159 +++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 136 insertions(+), 23 deletions(-)

diff --git a/nand-utils/nandsimctl.c b/nand-utils/nandsimctl.c
index 78ef1ff..e6043d5 100644
--- a/nand-utils/nandsimctl.c
+++ b/nand-utils/nandsimctl.c
@@ -23,13 +23,18 @@ enum action {
 
 static const struct option long_options[] = {
 	/* ordering of these is important, do not change */
-	{ .name = "version",	.has_arg = 0, .flag = NULL, .val = 0},
-	{ .name = "backend",	.has_arg = 1, .flag = NULL, .val = 'b' },
-	{ .name = "id",		.has_arg = 1, .flag = NULL, .val = 'i' },
-	{ .name = "detach",	.has_arg = 1, .flag = NULL, .val = 'd' },
-	{ .name = "detach-all",	.has_arg = 0, .flag = NULL, .val = 'D' },
-	{ .name = "no-oob",	.has_arg = 0, .flag = NULL, .val = 'n' },
-	{ .name = "help",	.has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "version",		.has_arg = 0, .flag = NULL, .val = 0},
+	{ .name = "backend",		.has_arg = 1, .flag = NULL, .val = 'b' },
+	{ .name = "id",			.has_arg = 1, .flag = NULL, .val = 'i' },
+	{ .name = "detach",		.has_arg = 1, .flag = NULL, .val = 'd' },
+	{ .name = "detach-all",		.has_arg = 0, .flag = NULL, .val = 'D' },
+	{ .name = "no-oob",		.has_arg = 0, .flag = NULL, .val = 'n' },
+	{ .name = "bad-blocks",		.has_arg = 1, .flag = NULL, .val = 'B' },
+	{ .name = "weak-blocks",	.has_arg = 1, .flag = NULL, .val = 'W' },
+	{ .name = "grave-pages",	.has_arg = 1, .flag = NULL, .val = 'G' },
+	{ .name = "weak-pages",		.has_arg = 1, .flag = NULL, .val = 'P' },
+	{ .name = "help",		.has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "wide-addr",		.has_arg = 0, .flag = NULL, .val = 'w' },
 	{ NULL, 0, NULL, 0},
 };
 
@@ -44,6 +49,14 @@ static struct {
 	enum action act;
 	int detach;
 	bool detach_all;
+	struct ns_simelement_prop *bad_blocks;
+	struct ns_simelement_prop *weak_blocks;
+	struct ns_simelement_prop *weak_pages;
+	struct ns_simelement_prop *grave_pages;
+	size_t len_bad_blocks;
+	size_t len_weak_blocks;
+	size_t len_weak_pages;
+	size_t len_grave_pages;
 } args = {
 	.backend = -1,
 	.detach = -1,
@@ -55,6 +68,14 @@ static struct {
 	},
 	.backing_file = NULL,
 	.no_oob = false,
+	.bad_blocks = NULL,
+	.weak_blocks = NULL,
+	.weak_pages = NULL,
+	.grave_pages = NULL,
+	.len_bad_blocks = 0,
+	.len_weak_blocks = 0,
+	.len_weak_pages = 0,
+	.len_grave_pages = 0,
 };
 
 static int do_help(int status)
@@ -70,6 +91,11 @@ static int do_help(int status)
 "  -c, --backend=cache               Use cached backend\n"
 "  -f, --backend=file                Use file backend\n"
 "  -n, --no-oob                      Disable OOB data\n"
+"  -w, --wide-addr                   Use wide addressing\n"
+"  -B, --bad-blocks=id,...           List of Bad Block IDs\n"
+"  -W, --weak-blocks=id:erases,...   List of Weak Block IDs and the number of maximum erases\n"
+"  -G, --grave-pages=id:reads,...    List of Grave Page IDs and the number of maximum reads\n"
+"  -P, --weak-pages=id:writes,...    List of Weak Page IDs and the number of maximum writes\n"
 "  -q, --quiet                       Don't display progress messages\n"
 "  -h, --help                        Display this help and exit\n"
 "      --version                     Output version information and exit\n"
@@ -97,7 +123,7 @@ static int parse_args(int argc, char *argv[])
 	int option_index;
 
 	for (;;) {
-		key = getopt_long(argc, argv, "b:i:h?rcfwod:Dn", long_options, &option_index);
+		key = getopt_long(argc, argv, "b:i:h?rcfwod:DnW:B:P:G:", long_options, &option_index);
 		if (key == -1)
 			break;
 
@@ -167,6 +193,60 @@ static int parse_args(int argc, char *argv[])
 			if (args.detach < 0 || args.detach >= NANDSIM_MAX_DEVICES)
 				return errmsg("bad instance number to detach");
 		break;
+		case 'B':
+		case 'W':
+		case 'P':
+		case 'G':
+		{
+			char *tmparg = xstrdup(optarg);
+			char *tmp = xstrdup(optarg);
+			char *t = NULL;
+			int ctr = 0;
+			size_t arr_size = 0;
+			uint32_t id = 0;
+			int32_t elem_type;
+			struct ns_simelement_prop *ids = NULL;
+
+			for (arr_size=0; tmp[arr_size]; tmp[arr_size]==',' ? arr_size++ : *tmp++);
+			arr_size++;
+			ids = xcalloc(arr_size, sizeof(struct ns_simelement_prop));
+
+			if (key == 'B') {
+				elem_type = NANDSIM_SIMELEM_BADBLOCK;
+				args.bad_blocks = ids;
+				args.len_bad_blocks = arr_size;
+			} else if (key == 'W') {
+				elem_type = NANDSIM_SIMELEM_WEAKBLOCK;
+				args.weak_blocks = ids;
+				args.len_weak_blocks = arr_size;
+			} else if (key == 'P') {
+				elem_type = NANDSIM_SIMELEM_WEAKPAGE;
+				args.weak_pages = ids;
+				args.len_weak_pages = arr_size;
+			} else {
+				elem_type = NANDSIM_SIMELEM_GRAVEPAGE;
+				args.grave_pages = ids;
+				args.len_grave_pages = arr_size;
+			}
+
+			tmp = strtok(tmparg, ",");
+			while (tmp) {
+				if (ctr >= arr_size)
+					break;
+				t = strchr(tmp, ':');
+				if (t) {
+					*t = '\0';
+					t++;
+					ids[ctr].elem_attr = strtoul(t, NULL, 10);
+				}
+				id = strtoul(tmp, NULL, 16);
+				ids[ctr].elem_id = id;
+				ids[ctr].elem_type = elem_type;
+				tmp = strtok(NULL, ",");
+				ctr++;
+			}
+		}
+		break;
 		case 'D':
 			args.detach_all = true;
 		break;
@@ -262,36 +342,69 @@ static int get_temp_file_fd(void)
 
 static int do_attach(void)
 {
-	struct ns_new_instance_req req;
-	int i, ret, fd = 0;
+	uint8_t *tmp_ptr = NULL;
+	struct ns_new_instance_req *req;
+	int i, ret = -1, fd = 0;
+	size_t tmp_sz = 0;
+	size_t sim_elem = args.len_bad_blocks + args.len_weak_blocks + args.len_weak_pages + args.len_grave_pages;
+	size_t req_size = sizeof(*req) + (sizeof(struct ns_simelement_prop) * sim_elem);
+	req = xmalloc(req_size);
 
 	if (args.backend == NANDSIM_BACKEND_CACHEFILE) {
 		fd = get_temp_file_fd();
 		if (fd < 0)
-			return fd;
+			goto out;
 	} else if (args.backend == NANDSIM_BACKEND_FILE) {
 		fd = open(args.backing_file, O_RDWR | O_LARGEFILE | O_CLOEXEC);
-		if (fd == -1)
-			return sys_errmsg("unable to open \"%s\"", args.backing_file);
+		if (fd == -1) {
+			sys_errmsg("unable to open \"%s\"", args.backing_file);
+			ret = -1;
+			goto out;
+		}
 	} else
 		args.backend = NANDSIM_BACKEND_RAM;
 
-	memset(&req, 0, sizeof(req));
+	memset(req, 0, req_size);
 
-	req.backend = args.backend;
-	req.bus_width = args.wide_addr ? 16 : 8;
-	req.no_oob = !!args.no_oob;
+	req->backend = args.backend;
+	req->bus_width = args.wide_addr ? 16 : 8;
+	req->no_oob = !!args.no_oob;
 	for (i = 0; i < 8; i++)
-		req.id_bytes[i] = args.id[i] & 0xff;
-	req.file_fd = fd;
+		req->id_bytes[i] = args.id[i] & 0xff;
+	req->file_fd = fd;
+	req->simelem_num = sim_elem;
+
+	tmp_ptr = (uint8_t*)req;
+	tmp_ptr += sizeof(*req);
+	if (args.len_bad_blocks) {
+		tmp_sz = args.len_bad_blocks * sizeof(struct ns_simelement_prop);
+		memcpy(tmp_ptr, args.bad_blocks, tmp_sz);
+		tmp_ptr += tmp_sz;
+	}
+	if (args.len_weak_blocks) {
+		tmp_sz = args.len_weak_blocks * sizeof(struct ns_simelement_prop);
+		memcpy(tmp_ptr, args.weak_blocks, tmp_sz);
+		tmp_ptr += tmp_sz;
+	}
+	if (args.len_weak_pages) {
+		tmp_sz = args.len_weak_pages * sizeof(struct ns_simelement_prop);
+		memcpy(tmp_ptr, args.weak_pages, tmp_sz);
+		tmp_ptr += tmp_sz;
+	}
+	if (args.len_grave_pages) {
+		tmp_sz = args.len_grave_pages * sizeof(struct ns_simelement_prop);
+		memcpy(tmp_ptr, args.grave_pages, tmp_sz);
+		tmp_ptr += tmp_sz;
+	}
 
-	ret = ioctl(ctrl_fd, NANDSIM_IOC_NEW_INSTANCE, &req);
+	ret = ioctl(ctrl_fd, NANDSIM_IOC_NEW_INSTANCE, req);
 	if (ret < 0) {
 		sys_errmsg("unable to create new nandsim instance");
-		return ret;
+		goto out;
 	}
-
-	return 0;
+out:
+	free(req);
+	return ret;
 }
 
 static int do_info(int id)
-- 
2.8.3
