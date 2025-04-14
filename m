Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78342C3601E
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Apr 2025 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C8+vkCFL/ERkF6APLtgiKqcF75AGgpqsM+yVtjSQmKA=; b=CUhIf1vF5VJRn9
	Usly6teNF9vH9rPCrbWtIwwoEnkK0LmylTfrJEr1E29uGe6vV1cx7zwdmtCfICKc2ML4F6H9F7Mox
	mF4QKw8czKbninA02Vzae2j0PeNzUtXlftb6Q0wJwBlqx6HZtEC+T3kj93Rdgu7IZh0l9Mm+idvrl
	GFyXT5ei5CSApakc0oGuOYAwhiIevMJfL9hSxD7uHhgPlJEvaz4sbJ2huQs7BQJ3k25NOnKe+BGVI
	7ofKjEYF2hgRiWo5Ue9Xet/l5Tvp3/u5velYNyqbbvUL5JEmCSJhql+mzNuIajqoQI2RMFwLQE3dG
	VikjSzeur5BqZXTrrrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DMf-00000000ntn-2wSX;
	Mon, 14 Apr 2025 06:32:17 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DLh-00000000nl7-1MOm
	for linux-mtd@lists.infradead.org;
	Mon, 14 Apr 2025 06:31:19 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAAnYgqqq_xnDYjlCA--.14406S2;
	Mon, 14 Apr 2025 14:31:08 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v3 RESEND] mtd: bcm47xxnflash: Add error handling for bcm47xxnflash_ops_bcm4706_ctl_cmd()
Date: Mon, 14 Apr 2025 14:30:40 +0800
Message-ID: <20250414063041.2060-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnYgqqq_xnDYjlCA--.14406S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw18WF17uw47XFyUAr1UZFb_yoW8WFWUpr
	47Xa45t3Z5X3WDtFyUWF18KF1Yv348KF4jg3yvva48ursavFWxGrZ3Ga4jq3y8Gw18Jw17
	XF4F93WxWr9FkrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUmL9UUUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRAMA2f8nMA0BgAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_233117_788252_EA8B5876 
X-CRM114-Status: GOOD (  11.26  )
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

The function bcm47xxnflash_ops_bcm4706_cmd_ctrl() calls the function
bcm47xxnflash_ops_bcm4706_ctl_cmd(), but does not check its return value.
A proper implementation can be found in bcm47xxnflash_ops_bcm4706_write().

Add error log to the bcm47xxnflash_ops_bcm4706_ctl_cmd() via pr_err()
to prevent silent failure. The error Log funciton 'dev_err' is unsuitable
in this situation for it is hard to get device pointer.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
v3: Improve code for logging error.
v2: Fix spelling problem.

 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
index 6487dfc64258..e532c3535b16 100644
--- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
+++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
@@ -171,6 +171,7 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 {
 	struct bcm47xxnflash *b47n = nand_get_controller_data(nand_chip);
 	u32 code = 0;
+	int rc;
 
 	if (cmd == NAND_CMD_NONE)
 		return;
@@ -182,7 +183,9 @@ static void bcm47xxnflash_ops_bcm4706_cmd_ctrl(struct nand_chip *nand_chip,
 	if (cmd != NAND_CMD_RESET)
 		code |= NCTL_CSA;
 
-	bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	rc = bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, code);
+	if (rc)
+		pr_err("ctl_cmd didn't work with error %d\n", rc);
 }
 
 /* Default nand_select_chip calls cmd_ctrl, which is not used in BCM4706 */
-- 
2.42.0.windows.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
