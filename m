Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145E3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 05:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JvC5uafiSOzsdwotLGpIxSUgOwstHpW1dX1gaXw877Y=; b=nqZyvJ2eBftA1x
	uSyEEZXKIZLTOzJwxAKqu1j4/9wtZNYEVy/GYdozzcKCAWSlZ1SwsI7cyr8rxRYN1e4kJHHlIfL76
	ZCNEAnqI5C0H0kGS38DGsZDaa/jylR5D2SLKgUCBtay+WCPNN6QuY8BfHFTjQkOI12Nwsy9PSHzyY
	eMz8M2BdltDA+kL3J1HxpAUtroV880epBSwICFsgcTC2kv/S8a7ow8tQwr+RB4roMGXH8Hyb51D32
	1mIuaF7Stft5Q9914+GzLdN5hRSYkMg09JiYQpjkw/D8lkJVT0Y9ZV8GKa39gXFf+okgoUvBFnwb4
	hy86/WMms/k4K0eU7uLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nesD3-003xBb-K2; Thu, 14 Apr 2022 05:40:01 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nesD0-003xAM-0i
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 05:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1649914798; x=1681450798;
 h=from:to:cc:subject:date:message-id;
 bh=zU+ic3t12YFwBKYTyaQfNpKvhtBinV5WV8Ejoc+WOpY=;
 b=Yq0b+s8yTDN1FYNt3sM6ITiw+kjy44edwFb4diWCZkJaMUA+7HGwmWyc
 h269dlnCIyUf3yCs+lp8xjxiJxUhW3AcX9JoiVi8wmD9KFlr+TJJKwrQ0
 2E4Q57OQ7Rqxv2iFcDBAz9owKTh/K4fPiSy1NMRmiZQUOi08kOm8J1ljW 4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 13 Apr 2022 22:39:54 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA;
 13 Apr 2022 22:39:53 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 14 Apr 2022 11:09:40 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id D033C229C7; Thu, 14 Apr 2022 11:09:38 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: konrad.dybcio@somainline.org, quic_srichara@quicinc.com,
 quic_mdalam@quicinc.com
Subject: [PATCH] mtd: rawnand: qcom: fix memory corruption that causes panic
Date: Thu, 14 Apr 2022 11:09:33 +0530
Message-Id: <1649914773-22434-1-git-send-email-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_223958_154644_7F931319 
X-CRM114-Status: GOOD (  14.32  )
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

This patch fixes a memory corruption that occurred in the
nand_scan() path for Hynix nand device.

On boot, for Hynix nand device will panic at a weird place:
| Unable to handle kernel NULL pointer dereference at virtual
  address 00000070
| [00000070] *pgd=00000000
| Internal error: Oops: 5 [#1] PREEMPT SMP ARM
| Modules linked in:
| CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-01473-g13ae1769cfb0
  #38
| Hardware name: Generic DT based system
| PC is at nandc_set_reg+0x8/0x1c
| LR is at qcom_nandc_command+0x20c/0x5d0
| pc : [<c088b74c>]    lr : [<c088d9c8>]    psr: 00000113
| sp : c14adc50  ip : c14ee208  fp : c0cc970c
| r10: 000000a3  r9 : 00000000  r8 : 00000040
| r7 : c16f6a00  r6 : 00000090  r5 : 00000004  r4 :c14ee040
| r3 : 00000000  r2 : 0000000b  r1 : 00000000  r0 :c14ee040
| Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM Segment none
| Control: 10c5387d  Table: 8020406a  DAC: 00000051
| Register r0 information: slab kmalloc-2k start c14ee000 pointer offset
  64 size 2048
| Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
| nandc_set_reg from qcom_nandc_command+0x20c/0x5d0
| qcom_nandc_command from nand_readid_op+0x198/0x1e8
| nand_readid_op from hynix_nand_has_valid_jedecid+0x30/0x78
| hynix_nand_has_valid_jedecid from hynix_nand_init+0xb8/0x454
| hynix_nand_init from nand_scan_with_ids+0xa30/0x14a8
| nand_scan_with_ids from qcom_nandc_probe+0x648/0x7b0
| qcom_nandc_probe from platform_probe+0x58/0xac

The problem is that the nand_scan()'s qcom_nand_attach_chip callback
is updating the nandc->max_cwperpage from 1 to 4.This causes the
sg_init_table of clear_bam_transaction() in the driver's
qcom_nandc_command() to memset much more than what was initially
allocated by alloc_bam_transaction().

This patch will update nandc->max_cwperpage 1 to 4 after nand_scan()
returns, and remove updating nandc->max_cwperpage from
qcom_nand_attach_chip call back.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1a77542..aa3ec45 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2652,9 +2652,6 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
 
-	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
-				     cwperpage);
-
 	/*
 	 * DATA_UD_BYTES varies based on whether the read/write command protects
 	 * spare data with ECC too. We protect spare data by default, so we set
@@ -2909,7 +2906,7 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct device *dev = nandc->dev;
-	int ret;
+	int ret, cwperpage;
 
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
@@ -2955,6 +2952,9 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		return ret;
 
+	cwperpage = mtd->writesize / NANDC_STEP_SIZE;
+	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
+				     cwperpage);
 	if (nandc->props->is_bam) {
 		free_bam_transaction(nandc);
 		nandc->bam_txn = alloc_bam_transaction(nandc);
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
