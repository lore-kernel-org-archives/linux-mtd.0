Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00512C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EF1C61367
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EF1C61367
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=scZ+poTeHQybBfq+baOf/dHebHrzUI4PLmGHoF+1Es0=; b=AfTX1WYHhViXichou9wQwgu2fR
	ZB00E6EDS+B42EFp53SmQ7EQ9cavhMe/G5fpyasJlk/lXkxupMG2ZRK5pZBFKjcL3pORfQleuSJx9
	b0iBMNQ2/UUMpNKCQSmBPSdEdZ+DnRk2V+vY4CHQJMijQRwL5eNTbFMejxq2+ctFPEyFwyl64piMK
	6BQmjUWri8CDXEv0m3eB7dLZ4TmbWvU2TQ1a83RrFReSY8pUp9DNrkKdUGs5aUpqTKC6+3oqgb2dl
	YhMJdCiTSnv2wbzZXPhTC1I4bGGmPE0XWMPF58cZsLtMsUFLay/NUhqsuZ/ldT20559IA5o2WZEUQ
	nUXIh3dA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz2d-009yXU-M5; Thu, 01 Apr 2021 15:15:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz2X-009yVk-MU
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:15:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id g15so1706002pfq.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hVxFcdqIWJsoJww2TX8Rs1EJ/1vV+wVzt8D6tZZ7vg=;
 b=V2SSL0Pi5+6mu3HiAmhqpMolEG4wuNHWrS2TVrZcHy9mpYl3rGgtq+Quq5UKfKlA1I
 /BowUj9PF06X3mwejz+A4ImVUz1iLhRkAI/qCJOcgCwIqKZc3JwpB3ayur3M+v4rFPbW
 qzqua/OwHMqEnMrnCeD5ilTR7H+RN7GToXmaWcsZm+rGNfI1TNTSPwt/YJInMBXTrTBW
 3upl4/jMJQO1dt97S5SFBr5aIAbFfQFPB+2CT8kyYstKqt4IBwjxzAsTgAuJSrte02a6
 tURtcps7W2BPrmm+TvkaQUW13BHkhx01llGLVuHVJxAlN1voarzqxgybOJ4FFV7QHIbG
 9mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6hVxFcdqIWJsoJww2TX8Rs1EJ/1vV+wVzt8D6tZZ7vg=;
 b=UrIcjQW9u6IBUwJnRe0n0TYq4Bp9i4/Vf6VOsbGUxqC59Kk+0xoyxArM5iNJvL4ALZ
 RUH1DiLN8gJYiCntbHdmfzQc204LHDAGyPGCyFFGnli63mo/1U8k7CvD56WB3ZdwyhQJ
 6dULmEZ03yMloh6gJuk5HUKIr+jDBd8Tagc/dB69NMcI4/2KessdboCsVMbrStlvb8Vf
 vQBgQuWNAcbj2CRTzQgEaEmUJYMUNTejlljFjE19BlVYC0fLi6ee0C1pDv5941RLPF3a
 1IxH9X6cqXn3Ihb6vgoXg/CMaWkSgrkkJrM3Ne4LhkjlcFUz1igsfmy8pc8JVA35ABKK
 87xg==
X-Gm-Message-State: AOAM5316lAXj+YWiyVOmEvWxOr9NW6pQ8Forb4QFsnSCpA53kG8FaVjd
 b3rdSXMs5FeaskH1amGrH9Kd
X-Google-Smtp-Source: ABdhPJxwsf37PFmW0FURNCujtvANPBeSWY2X75PU4vA3tHobt9EELwTTBv6yWyv1K8e8UN8+g5pOHw==
X-Received: by 2002:a65:5a4a:: with SMTP id z10mr7745684pgs.240.1617290119691; 
 Thu, 01 Apr 2021 08:15:19 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id 35sm5652769pgr.14.2021.04.01.08.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:15:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v9 0/4] Add support for secure regions in NAND
Date: Thu,  1 Apr 2021 20:45:04 +0530
Message-Id: <20210401151508.143075-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_161522_832848_8339EB16 
X-CRM114-Status: GOOD (  14.66  )
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

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So this series adds a property for declaring such secure regions in DT
so that the driver can skip touching them. While at it, the Qcom NANDc
DT binding is also converted to YAML format.

Thanks,
Mani

Changes in v9:

Based on review comments from Miquel:

* Fixed the secure-regions check
* Renamed the function to nand_region_is_secured() and used bool return
* Moved the parsing function to nand_scan()

* Added a patch to fix nand_cleanup in qcom driver

Changes in v8:

* Reworked the secure region check logic based on input from Boris
* Removed the check where unnecessary in rawnand core.

Changes in v7:

* Made "size" u64 and fixed a warning reported by Kernel test bot

Changes in v6:

* Made use of "size" of the regions for comparision
* Used "secure" instead of "sec"
* Fixed the sizeof parameter in of_get_nand_secure_regions()

Changes in v5:

* Switched to "uint64-matrix" as suggested by Rob
* Moved the whole logic from qcom driver to nand core as suggested by Boris

Changes in v4:

* Used "uint32-matrix" instead of "uint32-array" as per Rob's review.
* Collected Rob's review tag for binding conversion patch

Changes in v3:

* Removed the nand prefix from DT property and moved the property parsing
  logic before nand_scan() in driver.

Changes in v2:

* Moved the secure-regions property to generic NAND binding as a NAND
  chip property and renamed it as "nand-secure-regions".

Manivannan Sadhasivam (4):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory
  mtd: rawnand: qcom: Add missing nand_cleanup() in error path

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 107 +++++++++-
 drivers/mtd/nand/raw/qcom_nandc.c             |   1 +
 include/linux/mtd/rawnand.h                   |  14 ++
 6 files changed, 324 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
