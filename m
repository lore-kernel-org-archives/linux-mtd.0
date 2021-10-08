Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B36C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 14:39:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1CCC60F58
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 14:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1CCC60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3fYJgWd83PLVM0uS/0bKuYGUMDN2C1DCLmRB9otKlrE=; b=V+0CROSxz0iFd0
	BV8ZP5rM5LHIUcdcV9BZ7KdVepa/roaiPsxHkksY2sE9Txe67XBvzuetdy6+UI/0j9Pxrc5rkGCiX
	pdbS0383o/mtpsatI7bWL1Q0EhJTlKrNYFXSVMkGMrX7JdXXmF0zLxS9P0EJpgXfudM/l6FuxbLeU
	CAzmHUB/HEObPu75DbZFRg6gC4K0lql1d62OtvCCR0PlqhfifRYepHlMLrACxLqx3dLK5ZjYyTz+9
	LdTClFEED2HpB7Msrki2+qiA58NzL2mj7Yd/7Dn9dLXcIaqo/Z7KST5Hx6MstZPkw1X2nRL/kVFy6
	a2lCu0u6lRzEDvOmtSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYr1X-0037ES-Hn; Fri, 08 Oct 2021 14:38:59 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYr1T-0037C5-6Z
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 14:38:57 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id A046CC3B5C;
 Fri,  8 Oct 2021 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633703931; bh=c1SgJ9T6g8A+11+EuJzpHcBIGdJS0HhtpmvKb6agfcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=D1dC5wY3Uj3FTyXO+CXAFip2Knr+6pqvJdvXq1AayN7nXZK6ExL0QuFI+57uSf9Qk
 3vMYSQa0lFvcN9e3wP/dq+YZUrF42i2JIifY8g1kKPjXuHvoyT3/svqoTx1c+ny0Nu
 SRyhEwT5E82SSJmfbYC9eV728pwpYCnViwZhAh9zzJfeus09lMTM/BGOqGsgNtkX+5
 /bluvwsYb9TsjZzYJtX8yP3IDw7hsIbWudnlVXF6eQUh1vtPDHtjNTc6Srdg1FKSi4
 5ohB/7RhMbTXZKV2CtDosztH7q27mrExFRw6FWI9X/Kxja8Gy3mUb71ab0qnYst/qw
 YLFCVeZUR9ocA==
From: Sean Nyekjaer <sean@geanix.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] mtd: core: protect access to mtd devices while in
 suspend
Date: Fri,  8 Oct 2021 16:38:24 +0200
Message-Id: <20211008143825.3717116-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008141524.20ca8219@collabora.com>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_073855_586596_FE415285 
X-CRM114-Status: GOOD (  22.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This will prevent reading/writing/erasing to a suspended mtd device.
It will force mtd_write()/mtd_read()/mtd_erase() to wait for
mtd_resume() to unlock access to mtd devices.

Exec_op[0] speed things up, so we see this race when rawnand devices going
into suspend. But it's actually "mtd: rawnand: Simplify the locking" that
allows it to return errors rather than locking, before that commit it would
have waited for the rawnand device to resume.

Tested on a iMX6ULL.

[0]:
ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Hope I got it all :)

 drivers/mtd/mtdcore.c   | 57 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/mtd.h | 36 ++++++++++++++++++--------
 2 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index c8fd7f758938..3c93202e6cbb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -36,6 +36,44 @@
 
 struct backing_dev_info *mtd_bdi;
 
+static void mtd_start_access(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	/*
+	 * Don't take the suspend_lock on devices that don't
+	 * implement the suspend hook. Otherwise, lockdep will
+	 * complain about nested locks when trying to suspend MTD
+	 * partitions or MTD devices created by gluebi which are
+	 * backed by real devices.
+	 */
+	if (!master->_suspend)
+		return;
+
+	/*
+	 * Wait until the device is resumed. Should we have a
+	 * non-blocking mode here?
+	 */
+	while (1) {
+		down_read(&master->master.suspend_lock);
+		if (!master->master.suspended)
+			return;
+
+		up_read(&master->master.suspend_lock);
+		wait_event(master->master.resume_wq, master->master.suspended == 0);
+	}
+}
+
+static void mtd_end_access(struct mtd_info *mtd)
+{
+	struct mtd_info *master = mtd_get_master(mtd);
+
+	if (!master->_suspend)
+		return;
+
+	up_read(&master->master.suspend_lock);
+}
+
 #ifdef CONFIG_PM_SLEEP
 
 static int mtd_cls_suspend(struct device *dev)
@@ -1000,6 +1038,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	ret = mtd_otp_nvmem_add(mtd);
 
+	init_waitqueue_head(&mtd->master.resume_wq);
+	init_rwsem(&mtd->master.suspend_lock);
+
 out:
 	if (ret && device_is_registered(&mtd->dev))
 		del_mtd_device(mtd);
@@ -1241,6 +1282,8 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 	struct erase_info adjinstr;
 	int ret;
 
+	mtd_start_access(mtd);
+
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	adjinstr = *instr;
 
@@ -1278,6 +1321,8 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		}
 	}
 
+	mtd_end_access(mtd);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_erase);
@@ -1558,6 +1603,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 	struct mtd_ecc_stats old_stats = master->ecc_stats;
 	int ret_code;
 
+	mtd_start_access(mtd);
+
 	ops->retlen = ops->oobretlen = 0;
 
 	ret_code = mtd_check_oob_ops(mtd, from, ops);
@@ -1577,6 +1624,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
 
 	mtd_update_ecc_stats(mtd, master, &old_stats);
 
+	mtd_end_access(mtd);
+
 	/*
 	 * In cases where ops->datbuf != NULL, mtd->_read_oob() has semantics
 	 * similar to mtd->_read(), returning a non-negative integer
@@ -1597,6 +1646,8 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
 
+	mtd_start_access(mtd);
+
 	ops->retlen = ops->oobretlen = 0;
 
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -1615,7 +1666,11 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		return mtd_io_emulated_slc(mtd, to, false, ops);
 
-	return mtd_write_oob_std(mtd, to, ops);
+	ret = mtd_write_oob_std(mtd, to, ops);
+
+	mtd_end_access(mtd);
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(mtd_write_oob);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 88227044fc86..cfab07b02dc9 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -231,6 +231,8 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	wait_queue_head_t resume_wq;
+	struct rw_semaphore suspend_lock;
 };
 
 struct mtd_info {
@@ -546,30 +548,42 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs);
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
-	int ret;
+	int ret = 0;
 
-	if (master->master.suspended)
-		return 0;
 
-	ret = master->_suspend ? master->_suspend(master) : 0;
-	if (ret)
+	if (!master->_suspend)
 		return ret;
 
-	master->master.suspended = 1;
-	return 0;
+	down_write(&master->master.suspend_lock);
+	if (!master->master.suspended) {
+		ret = master->_suspend(master);
+		if (!ret)
+			master->master.suspended = 1;
+	}
+	up_write(&master->master.suspend_lock);
+
+	return ret;
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
 
-	if (!master->master.suspended)
+	if (!master->_suspend)
 		return;
 
-	if (master->_resume)
-		master->_resume(master);
 
-	master->master.suspended = 0;
+	down_write(&master->master.suspend_lock);
+	if (master->master.suspended) {
+		if (master->_resume)
+			master->_resume(master);
+
+		master->master.suspended = 0;
+
+		/* The MTD dev has been resumed, wake up all waiters. */
+		wake_up_all(&master->master.resume_wq);
+	}
+	up_write(&master->master.suspend_lock);
 }
 
 static inline uint32_t mtd_div_by_eb(uint64_t sz, struct mtd_info *mtd)
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
