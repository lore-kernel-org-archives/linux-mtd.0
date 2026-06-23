Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D74CD4F26
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2026 06:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0D80obcRe9s6HTRW7yRiL7gT8YlZWBU71BwVlIN8SlE=; b=RWGWk1MV1mSkFI
	qJeROlWaNOU3/0//8w+MHQmM9rLosMN6RhvfPqMJQc6YhuEeTIIRYFInqwoO5y8pwPiekYnvQEDFP
	dYjJzGQxeoRxIT6ODqZ0wfSBjzNl9HA4/Vc0hW/aqXV/TsWH6CANZXOBXBHRTX5bP0VOvLiudXTFa
	k6Hbd1jQRLeBW8QbE9xTM2zMEP4JnoxWZqBUeShMAf8HsPgysDeNATG7+djA9WD8TsELoEB7Vj5L6
	wXFFJ4Kp0iMbGomO0dbaRH9COvjnC0MbRloJ8qHBMF6PMWH0lFG8gST7a+DijMkomqERVBrXvLfCQ
	P0bL9pwYhxNKKhfEmJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuOt-00000005lBw-26OS;
	Tue, 23 Jun 2026 06:14:23 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbuOq-00000005lAk-2yTG
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jun 2026 06:14:22 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABnvhE6JDpqWyfKFA--.24858S2;
	Tue, 23 Jun 2026 14:14:18 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fsl_ifc: return errors for failed page reads
Date: Tue, 23 Jun 2026 14:14:07 +0800
Message-ID: <20260623061413.47409-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABnvhE6JDpqWyfKFA--.24858S2
X-Coremail-Antispam: 1UD129KBjvJXoWruw45Ar1rAFy5tF17uFWkCrg_yoW8JF1UpF
	ZrX3y7GFWDJFWIyw4aka1Fqry5G3s7JrZ2krZFqas8urn3Zr4Ykas8KryI9F4rXryUGw17
	Xrn5t3s8CFyrArUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTnQ
	UUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_231421_123935_FEF2778B 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fsl_ifc_run_command() logs controller timeout and other non-OPC
completion states in ctrl->nand_stat. fsl_ifc_read_page() then only
increments the ECC failure counter for non-OPC status and still returns
max_bitflips, which can be zero.

Return -ETIMEDOUT when the command did not complete at all and -EIO for
other non-OPC read completions so the NAND core does not treat a failed
page read as a clean page.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index fad0334f759d..a88ac2cfaccd 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -684,8 +684,15 @@ static int fsl_ifc_read_page(struct nand_chip *chip, uint8_t *buf,
 		return check_erased_page(chip, buf);
 	}
 
-	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC)
+	if (!ctrl->nand_stat) {
 		mtd->ecc_stats.failed++;
+		return -ETIMEDOUT;
+	}
+
+	if (ctrl->nand_stat != IFC_NAND_EVTER_STAT_OPC) {
+		mtd->ecc_stats.failed++;
+		return -EIO;
+	}
 
 	return nctrl->max_bitflips;
 }
-- 
2.50.1 (Apple Git-155)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
