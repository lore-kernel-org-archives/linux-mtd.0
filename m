Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F8CA0FFE
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 13:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EOQoOkfw1O1FsaJl4o88quBP1gJDFw5vVFz6PTU1b5I=; b=C/HsrD/1Gh1Ajc
	68fl2cakvG3R90Dr+WvsPXMIBhTC+7q1WmO9d7GXLATEfhAEiRXlRGf7ZalyJThsaZjSWQWGqjbEE
	Ye9NXLOaOpIjtazEiwjy/mu3PRdnUE5mZa9zaJY48qZKSSlHki/Nu2mSosUgpkARFJrt8v9IBWlW5
	3ml3q9p1QZg2qJegriyYS/Kcl9zD85B6dCtZfrG7acpEXeoZykre6CGfLzJ7voDu3hTRdY0WmlEnc
	++Qe4PDqRrOsoSDmPRATFyf5gb7zU3aZFD8rNZ7ILup8qtS+lWrAMR5fwkjeWTPlOoiwEUYd9lJlJ
	oyGHkbNu34qYUHA7Yekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRFZ-000000006gK-0aVP;
	Tue, 02 Sep 2025 13:40:41 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNRN-0000000GQOD-21Ly
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 09:36:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cGLGm3Z1MzYQvDZ
	for <linux-mtd@lists.infradead.org>; Tue,  2 Sep 2025 17:36:32 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 02E0E1A10E7
	for <linux-mtd@lists.infradead.org>; Tue,  2 Sep 2025 17:36:31 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP4 (Coremail) with SMTP id gCh0CgCn8IyburZob2GEBA--.23566S4;
	Tue, 02 Sep 2025 17:36:28 +0800 (CST)
From: Wang Zhaolong <wangzhaolong@huaweicloud.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH V2] mtd: core: skip badblocks increment for blocks already known bad
Date: Tue,  2 Sep 2025 17:27:32 +0800
Message-Id: <20250902092732.2244544-1-wangzhaolong@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgCn8IyburZob2GEBA--.23566S4
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1kGw47Kw4UKryxuF1fXrb_yoW8ur4Up3
	y5AryrCw4Fgw1Iq3ZrC3yxZa4fKwnagFy5KF4xGw15Cr98XF17Wrn5KF18Xr1IgFn2yFnI
	grs5tayDWay0vrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyEb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1veHDUUUUU==
X-CM-SenderInfo: pzdqw6xkdrz0tqj6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_023637_832700_0371A232 
X-CRM114-Status: GOOD (  12.59  )
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

Repeatedly marking the same eraseblock bad inflates
mtd->ecc_stats.badblocks because mtd_block_markbad() unconditionally
increments the counter on success, while some implementations (e.g.
NAND) return 0 both when the block was already bad and when it has just
been marked[1].

Fix by checking if the block is already bad before calling
->_block_markbad() when _block_isbad is available. Only skip the counter
increment when we can confirm the block was already bad. In all other
cases continue incrementing the counter.

This keeps the logic centralized in mtdcore without requiring driver
changes.

Link: https://lore.kernel.org/all/ef573188-9815-4a6b-bad1-3d8ff7c9b16f@huaweicloud.com/ [1]
Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
---

V2:
- Checks old state when _block_isbad exists and bails out early if already bad

 drivers/mtd/mtdcore.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 5ba9a741f5ac..096a3c94670f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2337,10 +2337,11 @@ int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 EXPORT_SYMBOL_GPL(mtd_block_isbad);
 
 int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	loff_t moffs;
 	int ret;
 
 	if (!master->_block_markbad)
 		return -EOPNOTSUPP;
 	if (ofs < 0 || ofs >= mtd->size)
@@ -2349,11 +2350,19 @@ int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return -EROFS;
 
 	if (mtd->flags & MTD_SLC_ON_MLC_EMULATION)
 		ofs = (loff_t)mtd_div_by_eb(ofs, mtd) * master->erasesize;
 
-	ret = master->_block_markbad(master, mtd_get_master_ofs(mtd, ofs));
+	moffs = mtd_get_master_ofs(mtd, ofs);
+
+	if (master->_block_isbad) {
+		ret = master->_block_isbad(master, moffs);
+		if (ret > 0)
+			return 0;
+	}
+
+	ret = master->_block_markbad(master, moffs);
 	if (ret)
 		return ret;
 
 	while (mtd->parent) {
 		mtd->ecc_stats.badblocks++;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
