Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12238C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 12:26:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893E064F72
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 12:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893E064F72
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxuXDF6KXXRzUEnaXJGmkHkeqrEvpxhCeUNO/+EHcc4=; b=hfOv1RWmny3q8XKWVkCoyDUuWV
	tr3RnU30dBX3BGkWW30YYV9vmZI/PLN1s0afa2rK295lfzoQ7y6IOzmboZG76ZdAT9PHNQSZB6PUp
	xL+Zqb3eDx5iVZRuJtAWLzXTN9RZwtlY9LLsDuBnUBrBhPgussomx1bXqGAEB+XD1v4lpJwExTwqg
	ORtQ9KuYmDrXCpUwHqBHAvDdhUBBTxT6lzFn2KON2xTM4UzIcCDdLteyCQDjvyyFWihi5bly0WLmN
	YwYhT7ISkSGn1bdQ27AJaE9+ATmS7Hl960+ZMcc4EnaGUeHncY0KpjXAy1z30zl18RoLn+ZB+37Dd
	agtuZZhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMVF8-0035uP-54; Wed, 17 Mar 2021 12:25:42 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMVF2-0035sk-8o
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 12:25:38 +0000
Received: by mail-pf1-x42f.google.com with SMTP id g15so988131pfq.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 05:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dytfyZh+t/6hBvEK1wCLf/jrNd0VZgcEm5bChCDpMzg=;
 b=T8mMHzfr8C/YC+9JiBfAbhRi52k5vAbU1VVHjqSTp3ajN4ZKLsUYVNhz0EYauoAGnJ
 Z7UUo63Zr9zkYEyhXZZM8ARh8/UHXXPR+XznYaUit7xmRsRY78J9rUmRtLjynb254c41
 hiH/Hdonpd46H7Fv3uvZ9bXzU64vn0UZ1InzI/8I2zfNnjcYAf7aeJGmJJZmDqAroUfa
 RUJwxQQDAbWtj9v/eHgVrtvzdizvw59Ryky9bpdn7XS3QxLI7jGFKMIycbUV+rqLZYQG
 bJ4KNzUdYCtl/VgFYXbqnGLeyTprjcxQy7inOiff5CFNh17dEGC7A+9cSfSLVRSh8K5+
 tSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dytfyZh+t/6hBvEK1wCLf/jrNd0VZgcEm5bChCDpMzg=;
 b=nIdzHoWBo/2/33Z5yfSN/wa8o2eYxIgo+tm01jjt36GRhiOqo4gwXzS7lSbuCvCHt8
 hdYPY3fYL6Ee98q99UUb+F8tvdT+JUas/0DwKtt/Ss3WEDqjLGZxCK8IyEkD0+eDubEy
 3PK+WTlWhWjj2e57USX0Lo/mT5JTp63OHP46Wls5oPWIVWA2SqnJcSLpCo6XwV+A+JOz
 NtQeH91ggOKhhLwH7YFuf7ZYhu2lLU/ZKQKwXA0ObaGhIEtb1cJpSg6Ak1R7lI8AfctN
 WDTvVWN3Ci0rn6+0f3gPMqzoFjBuT1z3YGAiwRHSjqISJvbOlR9eqThL+d2lnHWBYDv5
 pBBw==
X-Gm-Message-State: AOAM533Qf+wqOzRK+6Jf2bAeNcRb4I1Mu9s5dMglgLd5pXm2Y6R2a4qV
 m4MRw+YvoaivsmHHxGmz1Evo
X-Google-Smtp-Source: ABdhPJxQBvjNynU90CGeAQhvI+CodJMu3cpJ1BPfySYq2j+bTcpYj1MoGwp4aHHogsCKuoK9qkeGuQ==
X-Received: by 2002:a63:1d0b:: with SMTP id d11mr2426883pgd.190.1615983929440; 
 Wed, 17 Mar 2021 05:25:29 -0700 (PDT)
Received: from localhost.localdomain ([103.66.79.72])
 by smtp.gmail.com with ESMTPSA id y23sm19285730pfo.50.2021.03.17.05.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:25:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 0/3] Add support for secure regions in NAND
Date: Wed, 17 Mar 2021 17:55:10 +0530
Message-Id: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_122536_430030_FFC34231 
X-CRM114-Status: GOOD (  12.33  )
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
 include/linux/mtd/rawnand.h                   |   4 +
 5 files changed, 312 insertions(+), 142 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
