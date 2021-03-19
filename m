Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033EBC433C1
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 15:01:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCDE6187E
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 15:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCDE6187E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xBZK2DolIaN9Yx5yjQsCO+MRUO2whuedekMiGCfvVSA=; b=e5dYwYdLLtUyQEcjRRfczoRM6c
	7WDZkPZWzEIW3v8ucKsVEvk7CxrpT3XXSpM1cN61ALquv5i0FiRuz73u7mTCNI24m+ruHjL3OkNx7
	2qAsvyO9my8hhTAuTjNjoIA0N+sT2YY21Q72TuoHq4tFxwh6YEfUink7ZBsHLUgbUTAkVBKgtWPjw
	L4r8mKz5uJr0KxriKT0T5dKwQnj5Mf+WrjeBcQNOlGDGDlCrjgEtQEzatCNSVTlbVP47EozFPwXJo
	DxIied73TOyCcP3CX+j8sTBnDqqV0aeAXhAkece3wxy65VPhU8yPtIHNCUqpepRQSyd1x4rops5c8
	YU76Xu3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNGc4-007a4O-1k; Fri, 19 Mar 2021 15:00:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNGbz-007a41-Fy
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 15:00:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so5015286pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Mar 2021 08:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M5Nw3l3C9BhgQoUREMWsI0hgInH8MQVfR6+8IVWCIdo=;
 b=LRfVRr52FqDBkEVxTUXWNlPa4tABOweGyyPlJeYU/Y4rVMgc4Bk30CXouKPWd/ngAt
 c/kNNTvvcSVlT58veMoXnjecZ2pAftOLbWfUWf3A0DdBhBsC71WmhL1mRSBbGB05GyBc
 JN+r9/zzKisMlhi4ItfeSr0fcJVsk9KuCM638bJikQJG3c7J2r8i0WOcImvgzyzWp+/V
 UB0XnGmHoUpNFBN7v99yEwj8hBysFV+73wkjXSmvv4wrWiiJ4ds14SaWY1Ow7AEnLml+
 Lp2hbrVKQwlQ2+VOIV40epu/D99cdP2CPfv27K1nIh6+jWmkbLx+pwAWKQi78eXDjAdt
 U4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M5Nw3l3C9BhgQoUREMWsI0hgInH8MQVfR6+8IVWCIdo=;
 b=ESUMWrl1rjW/OYRlS3VKKcl6jfwYCUndYAcXrz7HU0y0WzD810+0g8ei3sC+9FoCdr
 +nOTW5QbUfNRVqzlMDNC3FmLr9kwltjTUIu0xxqGjpZiMLAmRmV36IXt5MpJOfjPr/xK
 Nd7laPVm32/Q7HWPt7oMYViQzDnxCaVC94SxvwA9b828aX9VA3mq/SbmosPMnKIxEyyy
 soHujpnzBJjlo63qKbWnX/qyPFApS+RZ/nEsZGN5Xt/vMAhHL8MFUaIaVG5a2n7xN16Z
 Yc5GCab8hZu64kddcB62XgskvYtj8rJK+2f3FG/cuOF3q+gXsM9yh1s8mGj/DLJwIaWj
 hrBw==
X-Gm-Message-State: AOAM532X304V65iVGx+WE/SIBr57WOWfvrpKp365J5cQgYjWALPoAhdI
 +0eKFWqZwfmZzxA7mqqYhUCL
X-Google-Smtp-Source: ABdhPJzRdG3EHRNcsqeZH3zxvrakB+67UgBZfGqv+04SW1ZSsKQqM3nJoZmfPsjgN7aWs6aw8q5tdQ==
X-Received: by 2002:a17:90a:be07:: with SMTP id
 a7mr10450804pjs.75.1616166023408; 
 Fri, 19 Mar 2021 08:00:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:387:dba9:92f4:36c7:1aec:59de])
 by smtp.gmail.com with ESMTPSA id h19sm6092345pfc.172.2021.03.19.08.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 08:00:22 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 0/3] Add support for secure regions in NAND
Date: Fri, 19 Mar 2021 20:30:07 +0530
Message-Id: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_150027_690263_693E4A3E 
X-CRM114-Status: GOOD (  13.11  )
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

Manivannan Sadhasivam (3):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 111 ++++++++++
 include/linux/mtd/rawnand.h                   |   4 +
 5 files changed, 318 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
