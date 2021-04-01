Return-Path: <SRS0=GKVC=I6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11ACC433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:20:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36424610CF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Apr 2021 15:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36424610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77bptBbe1a+hnHrNSugJvHd2usHfqffJJCq1jqr2d68=; b=Ai0tUYwLK+KKNvWcBzqKoGgxjv
	rWAsf8/LiQFyIcWowqn/I1Pr51MRCsfl4Pqztx+j6h5w/1YB/ZNIJ69KhO0UEIbh3wxLzYcJ9+TsN
	IuaFl0nt2f0MRfeZ8WST8Wf/AFcEHJwQ++3WEoTXtUkkPxNzPSTlLoPUUoqzWSGDPf7MfIVb5yV1C
	lYr5EsKfAqG/N9N34yuXa9z7YvPJGvoDKgas91HrYcXn1OQPikPnxVJXR/EKExKiinNJ4LvwlkSMI
	HEYaVZQ58JeoLperPxUXT/UaziqFbZQ7/jJbh4ssEHPeg9EH8mzzlm8y8adRhjuvhZ5xeCI/LVI9/
	8wgGOnbA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRz7F-009zUr-NY; Thu, 01 Apr 2021 15:20:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRz78-009zTU-G9
 for linux-mtd@lists.infradead.org; Thu, 01 Apr 2021 15:20:09 +0000
Received: by mail-pj1-x1031.google.com with SMTP id s21so1337081pjq.1
 for <linux-mtd@lists.infradead.org>; Thu, 01 Apr 2021 08:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbD76d1dqB6q8MXTffec9yNB90qyRTdmg3kpNe3oDsE=;
 b=k2pOlXXTM8fN/cGpPVsybsAWGnSRAxRRm3W4WVLToLIMzwK3lbEwCM3TqPfxodbE2J
 r3yY+owOLk5EKoeGbmrxxDhUfzBbuf4Dyqk8lW32hi1asrJHmsaLzF3A9fCIg6kaFsiW
 UgKWaBS38yhD1nMukXSa8ISpqQPu1OuFjigUcw3DwYUDyUSVm5JoD8Sk/RPpwQ+PD1o4
 5F5/Xk6u5S+kvieTgpnAQVD0mSaVpAcRxwy80OmiP1q9gSVKNhPG4ohY/YOwpScuGq3h
 LhFbNBilA+bftoqCAsuB8Vw+YFdVt9fEkxF1+2fzpZnuPnd4kJDYC9U5PgS5ftL2u3ZK
 pVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CbD76d1dqB6q8MXTffec9yNB90qyRTdmg3kpNe3oDsE=;
 b=oy5fRAM+p8nlCq6OOI5k2tKYvLTHpmzrtFv0BFi05+GsMfsqMkahcCL5Uhzd6RoWtY
 GIy/xDL09xpOtaqypKnZglra+8aKQHxVRnRF/TleAuO29lk015TedTjevn7u5aSGE+2p
 oFjqwXnxiK/VVMO8awIjh2PSV9itQOb/XPDJGitEgTgYc60q9pVeJupaSR18EQiwvqQH
 Z8ONZPVEkjNhvmlvtZbGKhahrXtXZmXXIhcJdiq5mL+Ityk25E8DC0KUE1GdYxZgGUSq
 GuBXW3WIx6iuVi6A1BbI7/PnCgCecNFFzdEBtT929RcxuThiEldCSDqGVWnNXKuonIGq
 WY0A==
X-Gm-Message-State: AOAM531XYYaXt/srH3HzyLkDzVrS5rkJdvoBykLu2yfQlD6Uht6Ustnm
 FT8Lw3uDMo8mkO3TBlg9oUFj/0mGdpkr
X-Google-Smtp-Source: ABdhPJzfS/Kx1OAi9bjnKkHmQhTNDY6Cc4WwA375CsZZiIXoudnNb14Aqnx3JfGBo5ydSI+5HBVZHg==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id
 x4-20020a170902ec84b02900e5bd054a98mr8340208plg.76.1617290404772; 
 Thu, 01 Apr 2021 08:20:04 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id l22sm6500919pjl.14.2021.04.01.08.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:20:03 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v10 0/4] Add support for secure regions in NAND
Date: Thu,  1 Apr 2021 20:49:51 +0530
Message-Id: <20210401151955.143817-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_162006_936174_3A09D99C 
X-CRM114-Status: GOOD (  14.55  )
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

Changes in v10:

* Added Rob's review tag for binding

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
