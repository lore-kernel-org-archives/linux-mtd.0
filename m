Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F22FEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaUa9p5PqawuCU1pqp2+9Ea7qrrw4PMqYoFtHgv5ees=; b=ON60nU9oDphSzG
	SsW5KVs5XvIZy/xjtfiJhRCRXwTRd0ZoSlFmtN6OeaT+tVTF5FGeGIsclnpiDmRRzVQT/Cr5LBMiO
	MG63AHd9Dauv4tiUQdNoFIgwfaNQI6BSh0yT7sXWKBPew8+ZeJGRo97uDRyaP2xPuvCPzpz3PWiq3
	Ai9amjQazL/FH21pPzF2BeBYfKMZJ8d6XzFc1/yZVZCfm38CyL+vcJDn1xFWCmlsMR/DbAGPKWCkU
	Lk8qsQjem6gdbinvPfxRNkd501IJk6dm8j1oR2mdJQ68yUEygdgYXrebdeaQcQEPpXJD9Bo3TlREl
	KtRMQFmeuY195f+tGwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL32e-00Bzpr-22;
	Sun, 16 Jul 2023 14:48:09 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30y-00BynG-2m;
	Sun, 16 Jul 2023 14:46:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0152AC0003;
	Sun, 16 Jul 2023 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmzryFqTCSgWb87QZHgHCREpQhRIJTKPTM0lwJ8hqQo=;
	b=f8Yo9W0QLqSYbsr4tUbU53sExGciHY2um6ZqSvAkUZakwZw5o88vpsNySSQUO0K1OO54DA
	lLN0tOCj+s8N9cwbHXU2Q/B4lRBjZ2Zc80Hb++Iddx0r4f21N0Qc0oV6KvD4P2iHAdHHrm
	z/5a7reyADiAGsnodxZwPtJjiSpCfwyGCvcGkYRdoF9HtTtsv7mRb3nDbhMa8lCVVKXh9a
	gWd2Q6698x/62QPj9juk9qi0Bm4W2WiC263v+NllkZ1u40qUZFqLghU5FkckgSVQp/vfMT
	QMqzqYapGtigc2qETyvMWD2I1HURf34Ph4i5jAhv9yCXXZBp9tFVFeQB1UsTJQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 8/8] mtd: rawnand: qcom: Fix address parsing within ->exec_op()
Date: Sun, 16 Jul 2023 16:46:12 +0200
Message-Id: <20230716144612.32132-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074625_327259_307FB634 
X-CRM114-Status: GOOD (  12.61  )
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

The naddrs variable is initialized but not used. Fixing this could have
been a matter of dropping the variable, but the right way to do it looks
a bit more complex: we can avoid useless writes to the q_op structure by
using it. In practice we could even have possible out-of-bound bugs with
the existing implementation. Let's fix all that by just performing the
right number of assignments in the addr{1,2}_reg fields.

Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202307131959.PdPSC86K-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202307131730.NOYbcjBr-lkp@intel.com/
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4fc8dafa8f03..dc8ca60fc2e2 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2616,12 +2616,13 @@ static void qcom_parse_instructions(struct nand_chip *chip,
 			offset = nand_subop_get_addr_start_off(subop, op_id);
 			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
 			addrs = &instr->ctx.addr.addrs[offset];
-			for (i = 0; i < MAX_ADDRESS_CYCLE; i++) {
-				if (i < 4)
-					q_op->addr1_reg |= (u32)addrs[i] << i * 8;
-				else
-					q_op->addr2_reg |= addrs[i];
-			}
+
+			for (i = 0; i < min_t(unsigned int, 4, naddrs); i++)
+				q_op->addr1_reg |= addrs[i] << (i * 8);
+
+			if (naddrs > 4)
+				q_op->addr2_reg |= addrs[4];
+
 			q_op->rdy_delay_ns = instr->delay_ns;
 			break;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
