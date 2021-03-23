Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C71C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 07:40:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0B2619C5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 07:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C0B2619C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AeMz6+NmHg+KEPzgGQMfu5yK0vJwvn7KlTXMwluykOA=; b=eApJVRo7umrwoQOloS8OXFLk6I
	CT446FlTT5kXmZr8TGvSz059z/weHuZtHCXPcu+9ZzkxPnf7Olytg0ktxQnDogcBd73vNg5TUkqHZ
	1L1YosFogwr5Ointk8gkoHsJP2DM3clmMgKkHNKGEoIewbnRKb3eHaTwiNsOCFB1m+bNxyS53PuHb
	zy8HQ8xrZc/j/AYbgElsFb0+zQJEYrVnKPziqBeouykcnSWT3A8DPS95VFCIHyT0xCQ/K5xj7+qn6
	rXkqQsKAuaxyVB6OhWgswOuWgf1pV4xmsnSybapArFFUQhaWF8Zb5ExR2KrQylQJPZL0k2kP3/NNX
	E+R8IeiQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lObdl-00EBCK-O0; Tue, 23 Mar 2021 07:39:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lObdd-00EBAU-Pi
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 07:39:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id x126so13414651pfc.13
 for <linux-mtd@lists.infradead.org>; Tue, 23 Mar 2021 00:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvF1HrRBEs+yUQZzjOuXkf0eJP1lcdc9T4URK25JLiE=;
 b=IOgARvtDCkd4788B8IVLLNeGvkRiH8zapo76SvNMeVay8WkXWauSzwj6e0dBENjmcK
 svY9lsPOKeQ+1xfPCB+k1EROasuAfuFETH6u+Uqg64de5xEBcmf1qyuIuiooVVgRvpjc
 HBza6moWYqIUGNg/6cb9RV9zBFZrn3IBY2e3ZlLFCmsggYn3EG6gyMrbS1GtS7F6v/4z
 PbU0PFYNWZh5FMfniriUqJrHOC4ZyiAk1HumjI0Z1Yxf0F2rrWWa9sG3O3JqWBwijEPr
 PMGYM1y8Zp/nONQwprb1zliScimQZ4gHxaqqkBc58xIQKVYkPPOh9kIl7L1aFa7+1kWt
 ynyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PvF1HrRBEs+yUQZzjOuXkf0eJP1lcdc9T4URK25JLiE=;
 b=X8DBM4MSiDPTbRUDaXYij+slIl+xggkLZOOcFLRTjwXy2bn9SssZUkN+O0WdnXmnU8
 mR2fUeeEz047YQ87NDAh1x1obaTV9XYTAtY7nShmRWm4KWBS/bj5HP9Q9WmI+BGooikt
 8Wm4VB015K7mVgANXzivkYJnv3C1hp8BUmUqPb2yUoPo0zVdBTRc1NRh8/uhI9m+YKB9
 gOgpVNJQSk5iw+jxqDyicZzc7AQ4/jq4mIiZtxvqsMg/MeGiiMqwZ2+Tjefq77aWgc2c
 +wO8b0X/ksfN3Rrb5f8aDhy7+DUgo4+4Y4xve1xjGoIbdUOs3AylZ+AXSw4BsWkA825m
 hkyw==
X-Gm-Message-State: AOAM533hgMUA/wCvf9bIGiuIUS2QXALdCM9YdL9KV4Zs1m2eQJ7rlT8I
 txAlyoyImnAn8hpihnPX/bpU
X-Google-Smtp-Source: ABdhPJwKcCmBgi+2BFyvGBP7U0ZM5gtxyveh/rSEI9A3yXA7Pto+p2nuS8rNdoos58t2dRw3w8NfFA==
X-Received: by 2002:a05:6a00:1ad4:b029:216:aa9d:dcea with SMTP id
 f20-20020a056a001ad4b0290216aa9ddceamr3596742pfv.47.1616485179957; 
 Tue, 23 Mar 2021 00:39:39 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.149])
 by smtp.gmail.com with ESMTPSA id fs9sm1587465pjb.40.2021.03.23.00.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:39:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 0/3] Add support for secure regions in NAND
Date: Tue, 23 Mar 2021 13:09:27 +0530
Message-Id: <20210323073930.89754-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_073944_460295_6D881B69 
X-CRM114-Status: GOOD (  12.80  )
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

Manivannan Sadhasivam (3):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in NAND
    chips
  mtd: rawnand: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/nand_base.c              | 105 ++++++++++
 include/linux/mtd/rawnand.h                   |  14 ++
 5 files changed, 322 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
