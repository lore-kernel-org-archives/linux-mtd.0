Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F3AC43467
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED1ED208C7
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YBqJIL2H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED1ED208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gb/dFtamThGD99ONFBsuQ9n4yMQSaLRNCvbIQ5iH3SI=; b=YBqJIL2HHgPr6gBxfW149mgK0p
	UtvidUmAUb4oxyvOg4kd9cfgAs2uI41xjRIdG0rILSVmrO5Cbs/zfdhMtOjOPbcfhwUEw4k0BgzMz
	zh5VEPdNh2F3u6DKMp2vknACiVCyYbr3xHer4Mhy6hsWFvXDUJI8kbmUyEz9RzA6H3ZVcly2Q9JpK
	Kv+QRvrLrc8K9efDNyLUoaIpvGaoutN9YSCARsyq4uI3sWCacFQf2CNcsB5dKyRieKQPY5Cl+vuOB
	h+jVa+Zvgv0AoCR5s4v8RIbTmp3ZCvxXifIo5d0fXaphyfp70UpbXFpy3bTT7Z3Ni+fODDAaQIzkz
	pw5cAXnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR7UR-0003ek-Aw; Sat, 10 Oct 2020 05:32:19 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR7UJ-0003bz-T0
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 05:32:12 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:06 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Oct 2020 22:32:05 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id CCD51219FF; Sat, 10 Oct 2020 11:01:42 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: qcom_nandc: IPQ5018 QPIC NAND documentation
Date: Sat, 10 Oct 2020 11:01:38 +0530
Message-Id: <1602307902-16761-2-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_013212_058134_1E8D9A22 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Qualcom IPQ5018 SoC uses QPIC NAND controller version 2.1.1
which uses BAM DMA Engine and QSPI serial nand interface.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 5c2fba4..0bfa316 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -8,6 +8,9 @@ Required properties:
                             IPQ4019 SoC and it uses BAM DMA
     * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
                             IPQ8074 SoC and it uses BAM DMA
+    * "qcom,ipq5018-nand" - for QPIC NAND controller v2.1.1 being used in
+                            IPQ5018 SoC and it uses BAM DMA and QSPI serial
+                            nand interface.
 
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
