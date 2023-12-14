Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2E2C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0b/e/N5t12X1I+7g/C3XZA9MEkXmG/58p3d0uKMChws=; b=I67vH0R6P0iYlX
	TYaCfA0+gWJ8eMZ4cALS/ShdUrq02/MtuWQmiq7fWMM5bixp+eAiO3iOMd0gDeA3jnHxD4JsdHWuD
	+ykV7xLADnFLk/oYbR1VBsbh3DUMxffV60bDO3jhBMEEj2V5xOfn7OfbkKKfyriwkB05Gf7mboIdA
	Jy39Idm3kLbzS8TPcYIl/xVCY6d9RGucuq6R4VPVvLVP1m6kSvNkB0QDB6flmBjivJa0J7TmhOdPu
	ZnvsLBUDbKBZ6x78rHH1yoa5mkdua2nn9qV+QOvIAocva5M3jY1k9kUpkQH1C1oySRN4/dbRUdsAO
	PuQBKgRHh1gLHkTxuMAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgJ9-00H9X0-0j;
	Thu, 14 Dec 2023 07:38:59 +0000
Received: from aliyun-cloud.icoremail.net ([47.90.88.91] helo=aliyun-sdnproxy-2.icoremail.net)
	by bombadil.infradead.org with smtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgJ5-00H9WH-1B
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 07:38:57 +0000
Received: from localhost.localdomain (unknown [10.190.71.46])
	by mail-app3 (Coremail) with SMTP id cC_KCgDHP9_8rnpl7+PcAA--.38858S4;
	Thu, 14 Dec 2023 15:30:10 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: diskonchip: fix a potential double free in doc_probe
Date: Thu, 14 Dec 2023 15:29:43 +0800
Message-Id: <20231214072946.10285-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: cC_KCgDHP9_8rnpl7+PcAA--.38858S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ury5Kr1Dtw1UCF48CrW8Crg_yoW8JFW7pF
	WUua42kayUJ3y09a4qvF48GFy5Jw4kGrW7GrZ3Zay7u34rurn3Gr1rCry7ZF4qqa4IqayY
	q395ta48JF1UtrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk21xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
	w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
	IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWl84ACjcxK6I8E
	87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
	8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
	Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
	aVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgIIBmV4LpY5mAAGsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_233855_726737_BC67F8ED 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When nand_scan() fails, it has cleaned up related resources
in its error paths. Therefore, the following nand_cleanup()
may lead to a double-free. One possible trace is:

doc_probe
  |-> nand_scan
  |     |-> nand_scan_with_ids
  |           |-> nand_scan_tail
  |                 |-> kfree(chip->data_buf) [First free]
  |
  |-> nand_cleanup
        |-> kfree(chip->data_buf) [Double free here]

Fix this by removing nand_cleanup() on failure of
nand_scan().

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/mtd/nand/raw/diskonchip.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 5d2ddb037a9a..5243fab9face 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1491,10 +1491,12 @@ static int __init doc_probe(unsigned long physadr)
 	else
 		numchips = doc2001_init(mtd);
 
-	if ((ret = nand_scan(nand, numchips)) || (ret = doc->late_init(mtd))) {
-		/* DBB note: i believe nand_cleanup is necessary here, as
-		   buffers may have been allocated in nand_base.  Check with
-		   Thomas. FIX ME! */
+	ret = nand_scan(nand, numchips);
+	if (ret)
+		goto fail;
+
+	ret = doc->late_init(mtd);
+	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
