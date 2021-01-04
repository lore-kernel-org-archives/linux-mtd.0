Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F39C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:12:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 770E820C56
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 04:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 770E820C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gBHC55Pmt19U3cmhj2YMrhXf17i9VixA+WWHE0lRicI=; b=GeNJuYpTeV5sUf0oOpdkFc5ivF
	ilaj2OH5wmAeQGTkceFY0uUj5ZJQfr28+goJLcMxyRJhc7ZYClEOy3A7XK/hSvApE20fmwtiSHyCl
	1Qa7kcbyvTFV42eSpD31V9OCaPojn3kjHO2HpyM2KIeAjhHgFUPT+0t4hRO8fnCyZEWojdmeyozh+
	6kHxdiyVemuZRitgzhJ0d6vEgIyFQrPgKZyT/zOJoPl2XmWC2It4qEVLunBqNDYwVIcFrJgT2AWAM
	tc0FlYYT7A7nbnnZFhcJRctHlo3y/Gpud+GFC7kGMiD+0xgyJ7C0IUpxIgcCkTY7bgq5Xm9BzCKxo
	DCGJhm9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwHDp-0002Mm-4B; Mon, 04 Jan 2021 04:11:57 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwHDg-0002Lt-Oo
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 04:11:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id b8so13840932plx.0
 for <linux-mtd@lists.infradead.org>; Sun, 03 Jan 2021 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Grh8LVLxZbPSeLfGLY8K51tF7uQFUuJHdSxM01ZGF7c=;
 b=uJzrp68vKoBt3m1TKKBBazO/BXkmXTTsLlX+dKObQDFHrjJXm0MXp8OrQQMTnaLWvk
 sNGOHR4ByD+3nIhj/DIjvNigOLCRwn8dx3EzYsPPVPOfc2C4aZcTl5Aj3LtovPdj5JTw
 mBK7aqEkdJ6+tG5VMaqaY2s3iVp0wdRm+fc3N+p5GYZbKZzUpDd0hHd27fu4kBSOp5A/
 gowTEAQc6P5337/bZbuQhVcCTWiliy9qhGyeVXhFn6nU5aXwkFDvqLcTqO5dyak+l12s
 16I9Zy9EleXwL8EgNVC3QgE8J5/IEe8+VZJ6fsNlIL9XiGd6A+VYCUIFJ92jS/sxmUtE
 l47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Grh8LVLxZbPSeLfGLY8K51tF7uQFUuJHdSxM01ZGF7c=;
 b=FIVdxqBHmldy55AkEC0agDTUUV+dmekiRM0Cost3Bu9hdz34+9qXpVYp0SM0ejvVFI
 sxV/0jz0Yi+Y2ujqaS3bK9X2OsfAi7/eAgoxenOstIlVdkV3FJz4z6dDUp+LzKYpo6bo
 j3yfweLzQ9fg3GDGGnwM/vP9HrHT5oe6g2JqTfAkPOD1M7mSkhcATYfyVSplpv6WY5xZ
 VO+gxk8Zj8Ctjvwokk6Jy/j6co41Dn7fwmJx7uvd7yf26it27xPe7h9nK2sKC2CWvc3l
 LOUwu69VoJN8X5xodii6aGUIyFyFSIWxE+L7URaGhfZ5lgxVT+bwTLkBrJietoTSwdRS
 8YyQ==
X-Gm-Message-State: AOAM532NYsLfpnSf8JkXULcaOxSWwCBchKHti7kAqFwvmUAVHOkSrEUE
 IcNohl0GXVerO9Wq/qDheFLr
X-Google-Smtp-Source: ABdhPJwae8vPcMs1Lo2Hf5RvnoiB/HN9I3+ucXjlyUIXzsVbpdX43N9vnb431pb0W7TO0yFqOLIh5A==
X-Received: by 2002:a17:90a:de95:: with SMTP id
 n21mr27323714pjv.62.1609733506091; 
 Sun, 03 Jan 2021 20:11:46 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
 by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 20:11:45 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v4 0/4] Add support for Qcom SMEM based NAND parser
Date: Mon,  4 Jan 2021 09:41:33 +0530
Message-Id: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_231149_177020_526F155C 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series adds support for parsing the partitions defined in Shared
Memory (SMEM) of the Qualcomm platforms supporting NAND interface.
Current parser only supports V3 and V4 of the partition tables.

This series has been tested on SDX55 MTP board which has an onboard NAND
device.

Thanks,
Mani

Changes in v4:

* Added Rob's review for binding

Changes in v3:

* Handled le32 parameters in parser, collected review from Linus W.

Changes in v2:

* Added additionalProperties: false and removed unit address in binding

Manivannan Sadhasivam (4):
  dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
  mtd: parsers: Add Qcom SMEM parser
  mtd: rawnand: qcom: Add support for Qcom SMEM parser
  mtd: parsers: afs: Fix freeing the part name memory in failure

 .../mtd/partitions/qcom,smem-part.yaml        |  33 ++++
 drivers/mtd/nand/raw/qcom_nandc.c             |   4 +-
 drivers/mtd/parsers/Kconfig                   |   8 +
 drivers/mtd/parsers/Makefile                  |   1 +
 drivers/mtd/parsers/afs.c                     |   4 +-
 drivers/mtd/parsers/qcomsmempart.c            | 170 ++++++++++++++++++
 6 files changed, 216 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
 create mode 100644 drivers/mtd/parsers/qcomsmempart.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
