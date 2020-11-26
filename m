Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEF7C63777
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:36:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8444F20DD4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g2m0Z2hM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8444F20DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4sNFB3HioeAFDgkXDpcDM2mC0/VSGoDZ8I9lbo1WO6M=; b=g2m0Z2hMBX1zgDNDcry92LaIv
	tZZCMhCiHPbR9zrByAWGo7heOSGbKQH8N8cXpSMyMZVpxO5K9COFVXrw0pJ+1cUnhk3AC0i38wLjD
	a/fan5mgzYoW40IHKFhwrutZptW272JP77XTC+AM0GGbaTYfYvXJ8CSyRvZx6904UVMsMDBrgzbp5
	sI2nVlzc5oVGE4Mrty/bRwmMAVmrFoOpl2RK5UbRDyz4tQsUeMtltLt3swKnhX4qupcDMXmsUi6jP
	2Cv0gjJaX3enTYEYQ1Z8xzMD54eV0ZOPfZQtu5jMxsot7U7vaqVLPeGneXRwAoh+DltR1TpcOQAmb
	YRijRd//A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQmt-0008AL-02; Thu, 26 Nov 2020 23:34:55 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQls-0007pG-NS
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:33:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 69AA9181C8918;
 Fri, 27 Nov 2020 00:33:41 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id y0WI_39iVq3Y; Fri, 27 Nov 2020 00:33:40 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4muHbyB312yT; Fri, 27 Nov 2020 00:33:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: miklos@szeredi.hu
Subject: [PATCH 6/7] fuse: Implement MUSE: MTD in userspace
Date: Fri, 27 Nov 2020 00:32:59 +0100
Message-Id: <20201126233300.10714-7-richard@nod.at>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126233300.10714-1-richard@nod.at>
References: <20201126233300.10714-1-richard@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_183353_136130_EC10A24B 
X-CRM114-Status: GOOD (  31.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

MUSE allows implementing a MTD in userspace.
So far userspace has control over mtd_read, mtd_write, mtd_erase,
mtd_block_isbad, mtd_block_markbad, and mtd_sync.
It can also set the following MTD parameters:
name, flags, site, writesize and erasesize.

That way advanced simulators for many type of flashes
can be implemented in userspace.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/fuse/Kconfig  |  11 +
 fs/fuse/Makefile |   1 +
 fs/fuse/muse.c   | 730 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 742 insertions(+)
 create mode 100644 fs/fuse/muse.c

diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 9c8cc1e7b3a5..2fc63dc18a53 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -56,3 +56,14 @@ config FUSE_DAX
 
 	  If you want to allow mounting a Virtio Filesystem with the "dax"
 	  option, answer Y.
+
+config MUSE
+	tristate "Memory Technology Device (MTD) in Userspace support"
+	depends on FUSE_FS
+	select FUSE_HELPER
+	select MTD
+	help
+	  This FUSE extension allows an MTD to be implemented in userspace.
+
+	  If you want to develop or use a userspace MTD based on MUSE,
+	  answer Y or M.
diff --git a/fs/fuse/Makefile b/fs/fuse/Makefile
index 7a5768cce6be..67a7af3fb047 100644
--- a/fs/fuse/Makefile
+++ b/fs/fuse/Makefile
@@ -6,6 +6,7 @@
 obj-$(CONFIG_FUSE_FS) += fuse.o
 obj-$(CONFIG_CUSE) += cuse.o
 obj-$(CONFIG_VIRTIO_FS) += virtiofs.o
+obj-$(CONFIG_MUSE) += muse.o
 
 fuse-y := dev.o dir.o file.o inode.o control.o xattr.o acl.o readdir.o
 fuse-$(CONFIG_FUSE_DAX) += dax.o
diff --git a/fs/fuse/muse.c b/fs/fuse/muse.c
new file mode 100644
index 000000000000..b947f5aa2e1c
--- /dev/null
+++ b/fs/fuse/muse.c
@@ -0,0 +1,730 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MUSE: MTD in userspace
+ * Copyright (C) 2020 sigma star gmbh
+ * Author: Richard Weinberger <richard@nod.at>
+ */
+
+#define pr_fmt(fmt) "MUSE: " fmt
+
+#include <linux/fuse.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/slab.h>
+
+#include "fuse_i.h"
+
+static struct file_operations muse_ctrl_fops;
+
+/*
+ * struct muse_conn - MUSE connection object.
+ *
+ * @fm: FUSE mount object.
+ * @fc: FUSE connection object.
+ * @mtd: MTD object.
+ * @init_done: true when the MTD was registered.
+ *
+ * Describes a connection to a userspace server.
+ * Each connection implements a single MTD.
+ */
+struct muse_conn {
+	struct fuse_mount fm;
+	struct fuse_conn fc;
+	struct mtd_info mtd;
+	bool init_done;
+};
+
+struct muse_init_args {
+	struct fuse_args_pages ap;
+	struct muse_init_in in;
+	struct muse_init_out out;
+	struct page *page;
+	struct fuse_page_desc desc;
+};
+
+static void muse_fc_release(struct fuse_conn *fc)
+{
+	struct muse_conn *mc = container_of(fc, struct muse_conn, fc);
+
+	kfree_rcu(mc, fc.rcu);
+}
+
+static int muse_mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
+{
+	struct muse_conn *mc = mtd->priv;
+	struct fuse_mount *fm = &mc->fm;
+	struct muse_erase_in inarg;
+	FUSE_ARGS(args);
+	ssize_t ret;
+
+	inarg.addr = instr->addr;
+	inarg.len = instr->len;
+
+	args.opcode = MUSE_ERASE;
+	args.nodeid = FUSE_ROOT_ID;
+	args.in_numargs = 1;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+
+	ret = fuse_simple_request(fm, &args);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int muse_mtd_markbad(struct mtd_info *mtd, loff_t addr)
+{
+	struct muse_conn *mc = mtd->priv;
+	struct fuse_mount *fm = &mc->fm;
+	struct muse_markbad_in inarg;
+	FUSE_ARGS(args);
+	ssize_t ret;
+
+	inarg.addr = addr;
+
+	args.opcode = MUSE_MARKBAD;
+	args.nodeid = FUSE_ROOT_ID;
+	args.in_numargs = 1;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+
+	ret = fuse_simple_request(fm, &args);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int muse_mtd_isbad(struct mtd_info *mtd, loff_t addr)
+{
+	struct muse_conn *mc = mtd->priv;
+	struct fuse_mount *fm = &mc->fm;
+	struct muse_isbad_in inarg;
+	struct muse_isbad_out outarg;
+	FUSE_ARGS(args);
+	ssize_t ret;
+
+	inarg.addr = addr;
+
+	args.opcode = MUSE_ISBAD;
+	args.nodeid = FUSE_ROOT_ID;
+	args.in_numargs = 1;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+	args.out_numargs = 1;
+	args.out_args[0].size = sizeof(outarg);
+	args.out_args[0].value = &outarg;
+
+	ret = fuse_simple_request(fm, &args);
+	if (ret < 0)
+		return ret;
+
+	return outarg.result;
+}
+
+static void muse_mtd_sync(struct mtd_info *mtd)
+{
+	struct muse_conn *mc = mtd->priv;
+	struct fuse_mount *fm = &mc->fm;
+	FUSE_ARGS(args);
+
+	args.opcode = MUSE_SYNC;
+	args.nodeid = FUSE_ROOT_ID;
+	args.in_numargs = 0;
+
+	fuse_simple_request(fm, &args);
+}
+
+static ssize_t muse_send_write(struct fuse_args_pages *ap, struct fuse_mount *fm,
+			       loff_t from, size_t count, int *soft_error)
+{
+	struct fuse_args *args = &ap->args;
+	ssize_t ret;
+
+	struct muse_write_in in;
+	struct muse_write_out out;
+
+	in.dataaddr = from;
+	in.datalen = count;
+	in.flags = 0;
+	args->opcode = MUSE_WRITE;
+	args->nodeid = FUSE_ROOT_ID;
+	args->in_numargs = 2;
+	args->in_args[0].size = sizeof(in);
+	args->in_args[0].value = &in;
+	/*
+	 * args->in_args[1].value was set in set_ap_inout_bufs()
+	 */
+	args->in_args[1].size = count;
+	args->out_numargs = 1;
+	args->out_args[0].size = sizeof(out);
+	args->out_args[0].value = &out;
+
+	ret = fuse_simple_request(fm, &ap->args);
+	if (ret < 0)
+		goto out;
+
+	ret = out.datalen;
+	*soft_error = out.soft_error;
+
+out:
+	return ret;
+}
+
+static ssize_t muse_send_read(struct fuse_args_pages *ap, struct fuse_mount *fm,
+			      loff_t from, size_t count, int *soft_error)
+{
+	struct fuse_args *args = &ap->args;
+	ssize_t ret;
+
+	struct muse_read_in in;
+	struct muse_read_out out;
+
+	in.dataaddr = from;
+	in.datalen = count;
+	in.flags = 0;
+	args->opcode = MUSE_READ;
+	args->nodeid = FUSE_ROOT_ID;
+	args->in_numargs = 1;
+	args->in_args[0].size = sizeof(in);
+	args->in_args[0].value = &in;
+	args->out_argvar = true;
+	args->out_numargs = 2;
+	args->out_args[0].size = sizeof(out);
+	args->out_args[0].value = &out;
+	/*
+	 * args->out_args[1].value was set in set_ap_inout_bufs()
+	 */
+	args->out_args[1].size = count;
+
+	ret = fuse_simple_request(fm, &ap->args);
+	if (ret < 0)
+		goto out;
+
+	ret = out.datalen;
+	*soft_error = out.soft_error;
+
+out:
+	return ret;
+}
+
+/*
+ * set_ap_inout_bufs - Set in/out buffers for fuse args
+ *
+ * @ap: FUSE args pages object
+ * @iter: IOV iter which describes source/destination of the IO operation
+ * @count: Inputs the max amount of data we can process,
+ *	   outputs the amount of data @iter has left.
+ * @write: If non-zero, this is a write operation, read otherwise.
+ *
+ * This function takes a IOV iter object and sets up FUSE args pointer.
+ * Since in MTD all buffers are kernel memory we can directly use
+ * fuse_get_user_addr().
+ */
+static void set_ap_inout_bufs(struct fuse_args_pages *ap, struct iov_iter *iter,
+				size_t *count, int write)
+{
+	unsigned long addr;
+	size_t frag_size;
+
+	addr = fuse_get_user_addr(iter);
+	frag_size = fuse_get_frag_size(iter, *count);
+
+	if (write)
+		ap->args.in_args[1].value = (void *)addr;
+	else
+		ap->args.out_args[1].value = (void *)addr;
+
+	iov_iter_advance(iter, frag_size);
+	*count = frag_size;
+}
+
+/*
+ * muse_do_io - MUSE main IO processing function.
+ *
+ * @mc: MUSE connection object.
+ * @ops: MTD read/write operation object.
+ * @pos: Where to start reading/writing on the MTD.
+ * @retcode: Outputs the return code for the MTD subsystem.
+ * @write: If non-zero, this is a write operation, read otherwise.
+ *
+ * This function is responsible for processing reads and writes to the MTD.
+ * It directly takes @pos and @ops from the MTD subsystem.
+ * All IO is synchronous and buffers provided by @ops have to be kernel memory.
+ * Each MUSE_READ/MUSE_WRITE operation is at most mtd->writebuffer long,
+ * such that the userspace server can assume that each operaion affects at most
+ * one page.
+ * The userspace server can inject also custom errors into the IO path,
+ * mostly -EUCLEAN to signal fixed bit-flips or -EBADMSG for uncorrectable
+ * bit-flips.
+ *
+ * It returns the amount of processed bytes and via @retcode the return code
+ * for the MTD subsystem.
+ */
+static ssize_t muse_do_io(struct muse_conn *mc, struct mtd_oob_ops *ops,
+			  loff_t pos, int *retcode, int write)
+{
+	struct kvec iov = { .iov_base = ops->datbuf, .iov_len = ops->len };
+	struct fuse_mount *fm = &mc->fm;
+	struct fuse_conn *fc = fm->fc;
+	size_t fc_max_io = write ? fc->max_write : fc->max_read;
+	size_t count;
+	size_t retlen = 0;
+	struct fuse_args_pages ap;
+	unsigned int max_pages;
+	int bitflips = 0;
+	int eccerrors = 0;
+	ssize_t ret = 0;
+	struct iov_iter iter;
+
+	/*
+	 * TODO: Implement OOB support
+	 */
+	if (ops->mode != MTD_OPS_PLACE_OOB || ops->ooblen) {
+		ret = -ENOTSUPP;
+		goto out;
+	}
+
+	iov_iter_kvec(&iter, write ? WRITE : READ, &iov, 1, ops->len);
+
+	/*
+	 * A full page needs to fit into a single FUSE request.
+	 */
+	if (fc_max_io < mc->mtd.writebufsize) {
+		ret = -ENOBUFS;
+		goto out;
+	}
+
+	count = iov_iter_count(&iter);
+
+	max_pages = iov_iter_npages(&iter, fc->max_pages);
+	memset(&ap, 0, sizeof(ap));
+
+	ap.pages = fuse_pages_alloc(max_pages, GFP_KERNEL, &ap.descs);
+	if (!ap.pages) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	*retcode = 0;
+
+	while (count) {
+		size_t nbytes = min_t(size_t, count, mc->mtd.writebufsize);
+		int soft_error;
+
+		set_ap_inout_bufs(&ap, &iter, &nbytes, write);
+
+		if (write)
+			ret = muse_send_write(&ap, fm, pos, nbytes, &soft_error);
+		else
+			ret = muse_send_read(&ap, fm, pos, nbytes, &soft_error);
+
+		kfree(ap.pages);
+		ap.pages = NULL;
+
+		if (ret < 0) {
+			iov_iter_revert(&iter, nbytes);
+			break;
+		}
+
+		if (soft_error) {
+			/*
+			 * Userspace wants to inject an error code.
+			 */
+
+			if (write) {
+				/*
+				 * For writes, take it as-is.
+				 */
+				ret = soft_error;
+				break;
+			}
+
+			/*
+			 * -EUCLEAN and -EBADMSG are special for reads
+			 * in MTD, it expects from a device to return all
+			 * requsted data even if there are (un)correctable errors.
+			 * The upper layer, such as UBI, has to deal with them.
+			 */
+			if (soft_error == -EUCLEAN) {
+				bitflips++;
+			} else if (soft_error == -EBADMSG) {
+				eccerrors++;
+			} else {
+				ret = soft_error;
+				break;
+			}
+		}
+
+		/*
+		 * No short reads are allowed in MTD.
+		 */
+		if (ret != nbytes) {
+			iov_iter_revert(&iter, nbytes - ret);
+			ret = -EIO;
+			break;
+		}
+
+		count -= ret;
+		retlen += ret;
+		pos += ret;
+
+		if (count) {
+			max_pages = iov_iter_npages(&iter, fc->max_pages);
+			memset(&ap, 0, sizeof(ap));
+			ap.pages = fuse_pages_alloc(max_pages, GFP_KERNEL, &ap.descs);
+			if (!ap.pages)
+				break;
+		}
+	}
+
+	kfree(ap.pages);
+
+	if (bitflips)
+		*retcode = -EUCLEAN;
+	if (eccerrors)
+		*retcode = -EBADMSG;
+
+out:
+	/*
+	 * If ret is set, it must be a fatal error which overrides
+	 * -EUCLEAN and -EBADMSG.
+	 */
+	if (ret < 0)
+		*retcode = ret;
+
+	return retlen;
+}
+
+static int muse_mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
+{
+	struct muse_conn *mc = mtd->priv;
+	int retcode;
+
+	ops->retlen = muse_do_io(mc, ops, from, &retcode, 0);
+
+	return retcode;
+}
+
+static int muse_mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops)
+{
+	struct muse_conn *mc = mtd->priv;
+	int retcode;
+
+	ops->retlen = muse_do_io(mc, ops, to, &retcode, 1);
+
+	return retcode;
+}
+
+static int muse_mtd_get_device(struct mtd_info *mtd)
+{
+	struct muse_conn *mc = mtd->priv;
+
+	fuse_conn_get(&mc->fc);
+
+	return 0;
+}
+
+static void muse_mtd_put_device(struct mtd_info *mtd)
+{
+	struct muse_conn *mc = mtd->priv;
+
+	fuse_conn_put(&mc->fc);
+}
+
+struct mtdreq {
+	const char *name;
+	struct mtd_info_user mi;
+};
+
+static int muse_parse_mtdreq(char *p, size_t len, struct mtd_info *mtd)
+{
+	struct mtdreq req = {};
+	char *end = p + len;
+	char *key, *val;
+	int ret;
+
+	for (;;) {
+		ret = fuse_kv_parse_one(&p, end, &key, &val);
+		if (ret < 0)
+			goto out;
+		if (!ret)
+			break;
+
+		if (strcmp(key, "NAME") == 0) {
+			req.name = val;
+		} else if (strcmp(key, "TYPE") == 0) {
+			ret = kstrtoul(val, 10, &req.mi.type);
+			if (ret)
+				goto out;
+		} else if (strcmp(key, "FLAGS") == 0) {
+			ret = kstrtoul(val, 10, &req.mi.flags);
+			if (ret)
+				goto out;
+		} else if (strcmp(key, "SIZE") == 0) {
+			ret = kstrtoul(val, 10, &req.mi.size);
+			if (ret)
+				goto out;
+		} else if (strcmp(key, "WRITESIZE") == 0) {
+			ret = kstrtoul(val, 10, &req.mi.writesize);
+			if (ret)
+				goto out;
+		} else if (strcmp(key, "ERASESIZE") == 0) {
+			ret = kstrtoul(val, 10, &req.mi.erasesize);
+			if (ret)
+				goto out;
+		} else {
+			pr_warn("Ignoring unknown MTD param \"%s\"\n", key);
+		}
+	}
+
+	ret = -EINVAL;
+
+	if (!req.name)
+		goto out;
+
+	if (!req.mi.size || !req.mi.writesize || !req.mi.erasesize)
+		goto out;
+
+	if (req.mi.size % req.mi.writesize)
+		goto out;
+
+	if (req.mi.size % req.mi.erasesize)
+		goto out;
+
+	if (req.mi.flags & ~(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE))
+		goto out;
+
+	/*
+	 * MTD_ABSENT and MTD_UBIVOLUME and special, and can only be used by
+	 * internal MTD drivers. Allowing userspace to emulate them asks for
+	 * trouble.
+	 */
+	if (req.mi.type == MTD_ABSENT || req.mi.type == MTD_UBIVOLUME)
+		goto out;
+
+	mtd->name = kstrdup(req.name, GFP_KERNEL);
+	if (!mtd->name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	mtd->size = req.mi.size;
+	mtd->erasesize = req.mi.erasesize;
+	mtd->writesize = req.mi.writesize;
+	mtd->writebufsize = mtd->writesize;
+	mtd->type = req.mi.type;
+	mtd->flags = MTD_MUSE | req.mi.flags;
+
+	ret = 0;
+out:
+	return ret;
+}
+
+static void muse_process_init_reply(struct fuse_mount *fm,
+				    struct fuse_args *args, int error)
+{
+	struct fuse_conn *fc = fm->fc;
+	struct muse_init_args *mia = container_of(args, struct muse_init_args, ap.args);
+	struct muse_conn *mc = container_of(fc, struct muse_conn, fc);
+	struct fuse_args_pages *ap = &mia->ap;
+	struct muse_init_out *arg = &mia->out;
+	struct page *page = ap->pages[0];
+	struct mtd_info *mtd = &mc->mtd;
+	int ret;
+
+	if (error || arg->fuse_major != FUSE_KERNEL_VERSION || arg->fuse_minor < 33)
+		goto abort;
+
+	fc->minor = arg->fuse_minor;
+	fc->max_read = max_t(unsigned int, arg->max_read, 4096);
+	fc->max_write = max_t(unsigned int, arg->max_write, 4096);
+
+	ret = muse_parse_mtdreq(page_address(page), ap->args.out_args[1].size, mtd);
+	if (ret)
+		goto abort;
+
+	mtd->_erase = muse_mtd_erase;
+	mtd->_sync = muse_mtd_sync;
+	mtd->_read_oob = muse_mtd_read_oob;
+	mtd->_write_oob = muse_mtd_write_oob;
+	mtd->_get_device = muse_mtd_get_device;
+	mtd->_put_device = muse_mtd_put_device;
+
+	/*
+	 * Bad blocks make only sense on NAND devices.
+	 * As soon _block_isbad is set, upper layer such as
+	 * UBI expects a working _block_isbad, so userspace
+	 * has to implement MUSE_ISBAD.
+	 */
+	if (mtd_type_is_nand(mtd)) {
+		mtd->_block_isbad = muse_mtd_isbad;
+		mtd->_block_markbad = muse_mtd_markbad;
+	}
+
+	mtd->priv = mc;
+	mtd->owner = THIS_MODULE;
+
+	/*
+	 * We want one READ/WRITE op per MTD io. So the MTD pagesize needs
+	 * to fit into max_write/max_read
+	 */
+	if (fc->max_write < mtd->writebufsize || fc->max_read < mtd->writebufsize)
+		goto abort;
+
+	if (mtd_device_register(mtd, NULL, 0) != 0)
+		goto abort;
+
+	mc->init_done = true;
+
+	kfree(mia);
+	__free_page(page);
+	return;
+
+abort:
+	fuse_abort_conn(fc);
+}
+
+static int muse_send_init(struct muse_conn *mc)
+{
+	struct fuse_mount *fm = &mc->fm;
+	struct fuse_args_pages *ap;
+	struct muse_init_args *mia;
+	struct page *page;
+	int ret = -ENOMEM;
+
+	BUILD_BUG_ON(MUSE_INIT_INFO_MAX > PAGE_SIZE);
+
+	page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!page)
+		goto err;
+
+	mia = kzalloc(sizeof(*mia), GFP_KERNEL);
+	if (!mia)
+		goto err_page;
+
+	ap = &mia->ap;
+	mia->in.fuse_major = FUSE_KERNEL_VERSION;
+	mia->in.fuse_minor = FUSE_KERNEL_MINOR_VERSION;
+	ap->args.opcode = MUSE_INIT;
+	ap->args.in_numargs = 1;
+	ap->args.in_args[0].size = sizeof(mia->in);
+	ap->args.in_args[0].value = &mia->in;
+	ap->args.out_numargs = 2;
+	ap->args.out_args[0].size = sizeof(mia->out);
+	ap->args.out_args[0].value = &mia->out;
+	ap->args.out_args[1].size = MUSE_INIT_INFO_MAX;
+	ap->args.out_argvar = true;
+	ap->args.out_pages = true;
+	ap->num_pages = 1;
+	ap->pages = &mia->page;
+	ap->descs = &mia->desc;
+	mia->page = page;
+	mia->desc.length = ap->args.out_args[1].size;
+	ap->args.end = muse_process_init_reply;
+
+	ret = fuse_simple_background(fm, &ap->args, GFP_KERNEL);
+	if (ret)
+		goto err_ia;
+
+	return 0;
+
+err_ia:
+	kfree(mia);
+err_page:
+	__free_page(page);
+err:
+	return ret;
+}
+
+static int muse_ctrl_open(struct inode *inode, struct file *file)
+{
+	struct muse_conn *mc;
+	struct fuse_dev *fud;
+	int ret;
+
+	/*
+	 * Paranoia check.
+	 */
+	if (!capable(CAP_SYS_ADMIN)) {
+		ret = -EPERM;
+		goto err;
+	}
+
+	mc = kzalloc(sizeof(*mc), GFP_KERNEL);
+	if (!mc) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	fuse_conn_init(&mc->fc, &mc->fm, get_user_ns(&init_user_ns),
+		       &fuse_dev_fiq_ops, NULL);
+
+	fud = fuse_dev_alloc_install(&mc->fc);
+	if (!fud) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	mc->fc.release = muse_fc_release;
+	mc->fc.initialized = 1;
+
+	ret = muse_send_init(mc);
+	if (ret)
+		goto err_dev;
+
+	file->private_data = fud;
+
+	return 0;
+
+err_dev:
+	fuse_dev_free(fud);
+	fuse_conn_put(&mc->fc);
+err_free:
+	kfree(mc);
+err:
+	return ret;
+}
+
+static int muse_ctrl_release(struct inode *inode, struct file *file)
+{
+	struct fuse_dev *fud = file->private_data;
+	struct muse_conn *mc = container_of(fud->fc, struct muse_conn, fc);
+
+	if (mc->init_done)
+		mtd_device_unregister(&mc->mtd);
+
+	fuse_conn_put(&mc->fc);
+
+	return fuse_dev_release(inode, file);
+}
+
+static struct miscdevice muse_ctrl_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name  = "muse",
+	.fops = &muse_ctrl_fops,
+};
+
+static int __init muse_init(void)
+{
+	muse_ctrl_fops = fuse_dev_operations;
+	muse_ctrl_fops.owner = THIS_MODULE;
+	muse_ctrl_fops.open = muse_ctrl_open;
+	muse_ctrl_fops.release = muse_ctrl_release;
+
+	return misc_register(&muse_ctrl_dev);
+}
+
+static void __exit muse_exit(void)
+{
+	misc_deregister(&muse_ctrl_dev);
+}
+
+module_init(muse_init);
+module_exit(muse_exit);
+
+MODULE_AUTHOR("Richard Weinberger <richard@nod.at>");
+MODULE_DESCRIPTION("MTD in userspace");
+MODULE_LICENSE("GPL");
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
