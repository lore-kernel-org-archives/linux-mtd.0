Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmeIE-0007kT-CT
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:58:28 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH v2 46/46] mtd/nandsim: Add ioctl for info
Date: Wed, 21 Sep 2016 11:57:55 +0200
Message-Id: <08f4115e8c68001317fc35a67dc791933073c787.1474450296.git.dwalter@sigma-star.at>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a ioctl() call for nandsim information.
This information includes, nand id, backend type
and path to the file if the file backend is used

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 drivers/mtd/nand/nandsim.c      | 65 +++++++++++++++++++++++++++++++++++++++++
 include/uapi/mtd/nandsim-user.h | 11 +++++++
 2 files changed, 76 insertions(+)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index b901155..dd78fc3 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -2893,6 +2893,56 @@ out:
 	return ret;
 }
 
+static void ns_put_device(struct mtd_info *);
+static int ns_get_device(struct mtd_info *);
+
+static int ns_ctrl_info_instance(struct ns_info_instance_req *req)
+{
+	struct mtd_info *nsmtd;
+	int id = req->id, ret = 0;
+	struct nand_chip *chip;
+	struct nandsim *ns;
+	struct ns_file_data *file_data;
+	char buf[NANDSIM_FILENAME_SIZE];
+	char *tmp;
+
+	if (id < 0 || id >= NANDSIM_MAX_DEVICES)
+		return -EINVAL;
+
+	mutex_lock(&ns_mtd_mutex);
+	nsmtd = ns_mtds[id];
+	if (nsmtd) {
+		ret = ns_get_device(nsmtd);
+		if (ret)
+			goto out;
+		chip = mtd_to_nand(nsmtd);
+		ns = nand_get_controller_data(chip);
+		req->no_oob = ns->no_oob;
+		memcpy(req->id_bytes, ns->ids, 8);
+		req->parts_num = ns->nbparts;
+		if (ns->bops == &ns_cachefile_bops) {
+			req->backend = NANDSIM_BACKEND_CACHEFILE;
+		} else if (ns->bops == &ns_file_bops) {
+			req->backend = NANDSIM_BACKEND_FILE;
+			file_data = ns->backend_data;
+			tmp = d_path(&file_data->file->f_path, buf, NANDSIM_FILENAME_SIZE);
+			memcpy(req->filename, tmp, NANDSIM_FILENAME_SIZE);
+		} else if (ns->bops == &ns_ram_bops) {
+			req->backend = NANDSIM_BACKEND_RAM;
+		} else {
+			req->backend = -1;
+		}
+
+		ns_put_device(nsmtd);
+	} else {
+		ret = -EINVAL;
+	}
+out:
+	mutex_unlock(&ns_mtd_mutex);
+	return ret;
+
+}
+
 static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			  unsigned long arg)
 {
@@ -2931,6 +2981,21 @@ static long ns_ctrl_ioctl(struct file *file, unsigned int cmd,
 			ret = ns_ctrl_destroy_instance(&req);
 			break;
 		}
+		case NANDSIM_IOC_INFO_INSTANCE:
+		{
+			struct ns_info_instance_req req;
+
+			ret = copy_from_user(&req, argp, sizeof(struct ns_info_instance_req));
+			if (ret) {
+				ret = -EFAULT;
+				goto out;
+			}
+			ret = ns_ctrl_info_instance(&req);
+			if (ret)
+				goto out;
+			ret = copy_to_user(argp, &req, sizeof(struct ns_info_instance_req));
+			break;
+		}
 
 		default:
 			ret = -ENOTTY;
diff --git a/include/uapi/mtd/nandsim-user.h b/include/uapi/mtd/nandsim-user.h
index b52d620..a00ab2d 100644
--- a/include/uapi/mtd/nandsim-user.h
+++ b/include/uapi/mtd/nandsim-user.h
@@ -7,9 +7,11 @@
 
 #define NANDSIM_IOC_NEW_INSTANCE _IOW(NANDSIM_IOC_MAGIC, 0, struct ns_new_instance_req)
 #define NANDSIM_IOC_DESTROY_INSTANCE _IOW(NANDSIM_IOC_MAGIC, 1, struct ns_destroy_instance_req)
+#define NANDSIM_IOC_INFO_INSTANCE _IOW(NANDSIM_IOC_MAGIC, 2, struct ns_info_instance_req)
 
 #define NANDSIM_MAX_DEVICES 32
 #define NANDSIM_MAX_PARTS 32
+#define NANDSIM_FILENAME_SIZE 64
 
 enum ns_backend_type {
 	NANDSIM_BACKEND_RAM = 0,
@@ -99,4 +101,13 @@ struct ns_destroy_instance_req {
 	__s8 padding[7];
 } __packed;
 
+struct ns_info_instance_req {
+	__s8 id;
+	__s8 no_oob;
+	__s8 id_bytes[8];
+	__s8 parts_num;
+	__s8 backend;
+	__u8 filename[NANDSIM_FILENAME_SIZE];
+} __packed;
+
 #endif /* __NANDSIM_USER_H__ */
-- 
2.8.3
