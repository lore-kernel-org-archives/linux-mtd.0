Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B8CEB64DA
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Jul 2023 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+YlgAaHsNuABSAEtCqO5beFiR1N3+VKcpSZX5L5mUg=; b=QLZYvDSSQXsjqW
	eBJW1aBcc4HHJNziJ53Xn3Edjs78E5jWnH2rrCX4Cuja5D+WA77PdrRK1Z3boLv9W1M7SKHOI6Uew
	RNk8rldX7IhJQXZfltqOAkowyUFeUCJ3ydDm9YoWn0UeHVvQCPVWwio9VywbRH8mG/AxUX8zcg21f
	8WhkNfAKlFx3uP4dSuDCe1WdQmjzaSeO1aIYBSRE7xu9gVjRcgsjFmA0jPVEAhNdUNd7MzRMHLffK
	gRuk8H7iqPPXHJY/P1OGRNWz89JZRmwY8OEMEntdy75EbKZHjlF2knUPopNU5VOokr7WeY60gbRtr
	sVh3HF1kR15K1oSzYG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL32F-00BzYe-0W;
	Sun, 16 Jul 2023 14:47:43 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL30x-00Bym9-1f;
	Sun, 16 Jul 2023 14:46:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07007C000B;
	Sun, 16 Jul 2023 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689518781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLeQqfCx8nAn9vATW1wynYf7SZDQtBCqBuyuLU8LITA=;
	b=jkOuC/Pn+c7WZJqCDfp9qEDxR41yT2rYyaIWC8BqbPZoquTOWFDhPy6su8+k/6IVIx1p4i
	GczOwmsiADQjj68n2HskaCb18H+Xg/wUdESb7Ohx6SyvwF/SNLkevvfwnR+3ix2hcfWV7d
	DHLFLlBvDpDuMKc+33FGSgZUwdj0/U1ZwaazKQRTbqTW3zBzLinOUvVE6hhrzCtK+UOZxG
	f4IBqXqIobqZdPMU6rCpUiJcN1VCCnWsdLAR2kc4b8f8UGAN6CqkcEC8u3x18zcNbxIaL8
	Mq0nFcIKFW6IZmizI57QvCNVZccoffRzwWGx5noTXVp7dL0OVxZJAHNcGY/46w==
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
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 7/8] mtd: rawnand: qcom: Early structure initialization
Date: Sun, 16 Jul 2023 16:46:11 +0200
Message-Id: <20230716144612.32132-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-1-miquel.raynal@bootlin.com>
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_074623_895985_A34AFAA8 
X-CRM114-Status: GOOD (  11.61  )
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

Instead of allocating a structure on the stack with random data and then
expect the callee to perform the initialization (which is, in general,
error prone), prefer zeroing the structure explicitly at allocation and
provide the already zeroed area, so no explicit memset operation is
needed. It is probably safer to do so, so we limit the timeframe when
dirty data could actually be accessed by mistake.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index cb6ccaa19224..4fc8dafa8f03 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2600,8 +2600,6 @@ static void qcom_parse_instructions(struct nand_chip *chip,
 	unsigned int op_id;
 	int i;
 
-	memset(q_op, 0, sizeof(*q_op));
-
 	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
 		unsigned int offset, naddrs;
 		const u8 *addrs;
@@ -2681,7 +2679,7 @@ static int qcom_read_status_exec(struct nand_chip *chip,
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
-	struct qcom_op q_op;
+	struct qcom_op q_op = {};
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
@@ -2744,7 +2742,7 @@ static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subo
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-	struct qcom_op q_op;
+	struct qcom_op q_op = {};
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
@@ -2795,7 +2793,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-	struct qcom_op q_op;
+	struct qcom_op q_op = {};
 	int ret = 0;
 
 	qcom_parse_instructions(chip, subop, &q_op);
@@ -2838,7 +2836,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 {
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct qcom_op q_op;
+	struct qcom_op q_op = {};
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
@@ -2935,7 +2933,7 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
 {
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct qcom_op q_op;
+	struct qcom_op q_op = {};
 	int ret = 0;
 
 	qcom_parse_instructions(chip, subop, &q_op);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
