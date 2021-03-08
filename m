Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935FEC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:45:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3CE60C3D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C3CE60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rbFP5gdv/VUeoYE9DAhXvlegr/65QTRDs2VzVrIxBE8=; b=q7rZb/lfYYW7LiNX0qrEQ+Nej8
	J0wqQBlEKa54yZwdZt/ZcS6qmY63s25nmx08Lu0Xw6G/kJzFpjhWKh0AQX36vogrqfMz6LugIdS9d
	zLECZZaLO2NWGdUSXZatXVExOhiremXAABrq5EKRv6arXfaH7AaZJaQgeVEYkvO3bZc8BHlx4HP2q
	OThsVp08Xfypsy6ZTjGwqRdiztkq6iCIqSX0bjVtrsQacfTYvY64XKpemf0ridy341yb6jMUxN8mU
	lbDLoyj49DM37brFYMsgWj/me6rM5yqyMiBNZbBI++Lavd83tcKuZwWeL9YjizlLnPuWvbLoWvS3T
	orqAOxkQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8hU-00FKOR-AN; Mon, 08 Mar 2021 05:45:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8hP-00FKJ1-Jy
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:45:01 +0000
Received: by mail-pf1-x42d.google.com with SMTP id y67so6495704pfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 07 Mar 2021 21:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SXCYzspKBCoyyJ1FFt7aWMYlwDTufHYvWslcl7WK64=;
 b=lwHpzsee0fzcbNu5lYKDDS+LdgwVgLwSPOaJNZYr3qLYXarSg8G1rASLkNI0f7Bueb
 eD3JuKtQCoAo5HokyozXqBHlv2n8lgwvomRc8DCmJ4vQI4TFIEXiOD4rRXvEXCyVQ0Fc
 R5LUdwhIcPy8EfOxN3P3Gjl7VvSq71lo934bAs0FhKUlpb9JlEthhnlrSzp/+Anx6A7Z
 9Vkys7kKGYIDZdT9kGv6REmx4Xm7PMDNMppdTcwGv5Z5VlDzcqx2kIngjuyTwlw3+LAe
 XSDQyHnp1JjuFJeWGYG2RbENXrgxDSsVRPfHFj6+qiUo1HolX/mNbOaaJltbu2LlzeYt
 kteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SXCYzspKBCoyyJ1FFt7aWMYlwDTufHYvWslcl7WK64=;
 b=HrUxDM9dC3TzyjGaY8FB+Rawq8cOtf4BWl+4w0ACI60LO7FrK1SjcVWVntfXKHz4Ws
 913CuKdMUlj99vcNjVFRfSq6ssvjSw35ugzK0CbUHvhwgBZ9Y6+tCJm3FMQFTs62N1ms
 q19Pkomf4UPo8PMrpuZW132jKZK9MD5AplCwuKEo2ATKOXrbYR7ZQOA/u8U+IPlHDj/k
 vpprCvqsAesda6NCs5pO5GBxXyqUJCZR3Pn2VCXCV6lhHPeMl+zifvzjN5kX6np+NmRx
 H0T/mg9qI7fUSxXtOsvswTr+lAN3TeuMnP5PIhYpu6yr9rzJ9gg0XcWmMcSp9//dtX7f
 WA6w==
X-Gm-Message-State: AOAM530Wege7DkunNFMczLouQvhK+zohGRbfbBLXOxAuF/YIpchgB4LD
 cYVmFGMHRUQ2LdeKiyrQAFVX
X-Google-Smtp-Source: ABdhPJzGe+8gHr46qDNXakAL+WuSxgWyHWTWrJ/1/9zpTuM0aJyok+9hxLLvvrOpK4J3wJJ/AEz1AQ==
X-Received: by 2002:a05:6a00:8d2:b029:1f1:5b57:85ae with SMTP id
 s18-20020a056a0008d2b02901f15b5785aemr12963263pfu.60.1615182297909; 
 Sun, 07 Mar 2021 21:44:57 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6e84:fef9:1070:d306:6d0e:bf6b])
 by smtp.gmail.com with ESMTPSA id y29sm4331506pfp.206.2021.03.07.21.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 21:44:57 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/3] Add support for secure regions in Qcom NANDc driver
Date: Mon,  8 Mar 2021 11:14:44 +0530
Message-Id: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054459_837931_07ABCA3A 
X-CRM114-Status: GOOD (  12.46  )
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
  mtd: rawnand: qcom: Add support for secure regions in NAND memory

 .../bindings/mtd/nand-controller.yaml         |   7 +
 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 196 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 -------------
 drivers/mtd/nand/raw/qcom_nandc.c             |  72 ++++++-
 4 files changed, 266 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
