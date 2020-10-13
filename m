Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FE8C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5271120872
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x4dHoK/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dHJbEnt9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5271120872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iTZuhe9InG5OMAuVj0kGZeGn6EG1DfreE7XYGoXl7i4=; b=x4dHoK/S4tZm8M0ee2ik65WkrY
	1kZD3r0XaDdDr/b32fkbfRAchgOi3Wv0ndM28Q4Ei0a8VKy0UFVkV+pqUJeqyDgPMu/1eSfz/+WVX
	6GmxZCS18Qn2WEgeF3Ve6MoZ0VeW+xz0IDvJyi2IBsF41fbXG4cyK2/FEmoK3XS5xBjE182K22Zbc
	P/DIx6QRAs5zL835vsbWuQwdk6F/3GFlWgdTK8y6FeRfUw01sAjLiztZxlBJ/yeZfDMTk21kaInQO
	sS+j1tW8DgYJSkrj6szHsHpX9Qz6QUdqAOyp9Py5yHYbc1lWINCBqkdIjgrxjWN5W8+lQ9kF3vImN
	eHT10+FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSCfL-0001pA-0f; Tue, 13 Oct 2020 05:16:03 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSCfE-0001n8-Bq
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 05:16:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602566160; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7DJYeM79DwYCNxvdVN1/Efj/wUPrE6lX2eZDDy8scis=;
 b=dHJbEnt9wIjRu2tMqTWaWgKMSPx2LG4k8tdWVtOBhSXMJhtMPi5/vm5QKZjB2h6R1apl9dWG
 T13dUup0adZWYGObh0hrtYa+zxVJ9U4gQy8RmPhw81gQ2bSvmRrDJt20DfFDPJ5DbYGnaVTc
 pngbplzsVKDW2qFgF9FhDrcLKZo=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f8537fd588858a304c95a5e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 05:15:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F1237C433F1; Tue, 13 Oct 2020 05:15:40 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirav)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 89512C433CB;
 Tue, 13 Oct 2020 05:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89512C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kathirav@codeaurora.org
From: Kathiravan T <kathirav@codeaurora.org>
To: agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
 peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add QPIC NAND support for IPQ6018
Date: Tue, 13 Oct 2020 10:45:21 +0530
Message-Id: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_011600_945457_AA027C3D 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: kathirav@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

IPQ6018 has the QPIC NAND controller of version 1.5.0, which
uses the BAM DMA. Add support for the QPIC BAM, QPIC NAND and
enable the same in the board DTS file.

Kathiravan T (3):
  dt-bindings: qcom_nandc: IPQ6018 QPIC NAND documentation
  mtd: rawnand: qcom: Support for IPQ6018 QPIC NAND controller
  arm64: dts: ipq6018: Add the QPIC peripheral nodes

 .../devicetree/bindings/mtd/qcom_nandc.txt    |  2 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts  | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 41 +++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c             |  4 ++
 4 files changed, 63 insertions(+)


base-commit: bbf5c979011a099af5dc76498918ed7df445635b
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
