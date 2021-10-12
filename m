Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA077C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E35761039
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E35761039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMBFTTP0ef7UStCK5ZMXgLFVyQCNvmhpMWgCkHM2CMs=; b=lXLGRTeBFPPVui
	vaMqJWpPGzTLOHogXtgF+5Z/1zky2+Pncb3vhHUCefts2oEbDQG4SXR8JckJa4+iLB6fJqMoou1Xd
	m0Byy/8Ud2w7e0MRGAAzv0/5JxdIXcV039OMrY+LSd8klKiEs14Q9z/L25CFUog8/7n5PKJIdvMgY
	n/+TaVGErwj9NHLegC8VgOvFIhdgfbcMG1U8MnJWx7O64oFla84AXYdB/Zq9isEbfnxgeFjlWxff9
	50nfLPGsV00kovuyz1H7E4rohzVdMl1Dt81hPMnodAEGU0063zF6xIRSE2XzFvAdoOXV6ajv7K3nB
	CBsvVl6/18tsccbDudWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDgM-00C8Nc-EQ; Tue, 12 Oct 2021 09:02:46 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDg9-00C8MY-Oz
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 09:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1634029345; x=1636621345;
 h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mZjtxLGYiQp+V5F2LelpXx1dwQeCj+sUiDU88BA1hb4=;
 b=UKCHfAOQ9sHJvWmDoqbEM3eqgwTTLYUZyF847XJXeaCYeLfiNu5+LuejLGVl1vht
 XJmLzRrqY+cqWXqEVkAV8BHwRnhgERR6AkKyp0dwL3ATfv5gjK0RSKkITisOCVL8
 0Ug4qcgF2EuILaUsq9bFPRhTI4k8HrV+ujNoqDnzHjU=;
X-AuditID: c39127d2-c275470000001d24-d1-61654f21f1e2
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 3F.24.07460.12F45616;
 Tue, 12 Oct 2021 11:02:25 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
 by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
 with ESMTP id 2021101211022453-1874428 ;
 Tue, 12 Oct 2021 11:02:24 +0200 
From: Stefan Riedmueller <s.riedmueller@phytec.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Christian Eggers <ceggers@arri.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Greg Ungerer <gerg@kernel.org>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
 Christian Hemp <C.Hemp@phytec.de>, Boris Brezillon <bbrezillon@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Date: Tue, 12 Oct 2021 11:02:24 +0200
Message-Id: <20211012090224.4101984-2-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012090224.4101984-1-s.riedmueller@phytec.de>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
 17, 2016) at 12.10.2021 11:02:24,
 Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.10.2021 11:02:25
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPLMWRmVeSWpSXmKPExsWyRoCBS1fRPzXR4MJlNovVLdMZLRp7rzNa
 7Hi1hdFi4Y8GZovdTcvYLU41trJYHG7fx2rxd/smFgcOj7Uf77N6HFuzmdVj3ppqj02rOtk8
 Ni+p99j4bgeTR/9fgwD2KC6blNSczLLUIn27BK6MmTcuMhXsF6/Y293M1MB4ULiLkZNDQsBE
 YsvSRuYuRi4OIYFtjBJ/525ghXAuMErs/vSAEaSKTcBIYsG0RiaQhIjAWkaJZWe6wRxmgb+M
 Ev39K5hBqoQFgiS+XHnKAmKzCKhKdPyYDdbNK2AnMe3eKzaIffISMy99ZwexOQXsJa4t3gFW
 LySQIHF90iaoekGJkzOfsIAskBC4wiix6XcbE0SzkMTpxWfBljELaEssW/iaeQKjwCwkPbOQ
 pBYwMq1iFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAz0wxPVL+1g7JvjcYiRiYPxEKMEB7OSCO8f
 m9REId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rz3e5gShQTSE0tSs1NTC1KLYLJMHJxSDYyLzdyT
 i/2PJEyo/rpkm0/T2TPbL5/dHuf1bNOJ4zNP2B+UCmRcEefR8YJt5hdr1YvXn5WYvrvmGv/p
 0S7x+2tfsE/LSjmy53Kv3PXQfa+mem/nnNDY4KFWWnhjp/eK3Q8Sz52V3ckczxq1hMt05qay
 kpq8Pm4Vk7pDu+v4FP8p/WZSui34+ZKKEktxRqKhFnNRcSIA3dANhWICAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_020234_000446_41F1F0A7 
X-CRM114-Status: GOOD (  14.80  )
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

According to i.MX 6 erratum ERR007117 gpmi clocks need to be gated off
when doing a gpmi_io clk rate change. So gate the clocks off before
the rate change in nfc_apply_timings and ungate them again after the
change.

Otherwise this rate change can lead to an unresponsive GPMI core which
results in DMA timeouts and failed driver probe:

[    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
...
[    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
...
[    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
[    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based read: -22
[    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
[    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
...

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Hi,

I'm not sure about the error handling here, if it is actually neccessary.
So some feedback would be nice here.

Thanks,
Stefan
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index a1f7000f033e..326c8a895f1f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -713,15 +713,28 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD : 0);
 }
 
-static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
+static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
 {
 	struct gpmi_nfc_hardware_timing *hw = &this->hw;
 	struct resources *r = &this->resources;
 	void __iomem *gpmi_regs = r->gpmi_regs;
 	unsigned int dll_wait_time_us;
+	int ret;
+
+	if (GPMI_IS_MX6Q(this)) {
+		ret = __gpmi_enable_clk(this, false);
+		if (ret)
+			return ret;
+	}
 
 	clk_set_rate(r->clock[0], hw->clk_rate);
 
+	if (GPMI_IS_MX6Q(this)) {
+		ret = __gpmi_enable_clk(this, true);
+		if (ret)
+			return ret;
+	}
+
 	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
 	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
 
@@ -739,6 +752,8 @@ static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
 
 	/* Wait for the DLL to settle. */
 	udelay(dll_wait_time_us);
+
+	return 0;
 }
 
 static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
@@ -2271,7 +2286,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
 	 */
 	if (this->hw.must_apply_timings) {
 		this->hw.must_apply_timings = false;
-		gpmi_nfc_apply_timings(this);
+		ret = gpmi_nfc_apply_timings(this);
+		if (ret)
+			return ret;
 	}
 
 	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op->ninstrs);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
