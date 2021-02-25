Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F43EC433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2782A64ECB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2782A64ECB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GaITvhsXNzLswh26T02EFKOu3HdABRW18QJ5bKrWEMI=; b=r4eNlx3yk3dL65zuxNSuf6s5oB
	coLL5eDxRWnn1YBAezI8Eyy9nYZ3uoqOUsgq2WbhzqkG4kZ+CcaGNltyA8DJoJdVqoOvKIg0vEOf1
	jZUlIJQOURHo+hg69lU4Dfhp9hNSrd1uVL6WiPUkik2w5QqyFltbqg7J9LrmENR/JUJkaTp6FhDLe
	gAeKpojnjMHznOE9Z+98MuUs3EQxFKfE6TWIMQOQHXl5MTN/Lvbvrcq1BzxthCZa/nknqv6JyCWW+
	MPnnZMGjIfBGqJRGeuREAOGfRRDOU/F6aOgSDvG8/86rCwGwFJHOfcYRCnhb6uX8GUbe5p7f2jiiy
	FrVeaeIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF80H-0001Am-8d; Thu, 25 Feb 2021 04:11:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF808-0001AA-8K
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 04:11:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b15so2726794pjb.0
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 20:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWvndBzAFJbUCgudW2fOtKqRm0n+8przz6MQZbJUpfg=;
 b=z4pBsimnaBnUQtZQfOxFmngvwePpdxMwoFXUQNzRUF6W57v0QRDbUckzNug5MJjice
 Ylc/0iP8yBDCx3i4li2GTnuEVaMOmwZBn7cxpoL6epUvjJlWDYCBAatTBs3BPyAguiJJ
 O6IggNMCEvlkIyPl0oaqW5mVKwsqr/ChMHMiL2HT+0+Luea5yXgjgADE8BxuTStQFk4i
 nBgUiYciwvHWE66gHpQcCFHhF1QJlcdjWLxEZUxwBIC/vUNwS7wBHDF1Ui62lPgDDbQ6
 fpMMPa9xBndwbaCSTG53HrFm5gb3XF/lAbz2TT/0Wp3PK8mNHGOrIIjZANC4Kj8dFJzz
 8D0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kWvndBzAFJbUCgudW2fOtKqRm0n+8przz6MQZbJUpfg=;
 b=XYiAVKeQt8q951xsW0LeOyp+H0ogZCTB0pNUIH9J/pNl2XZv9AsGT06TkqB698K4OQ
 kBDZj8du1YIuYzMYB9Q1YCcLbgBL1iKFUoPmf8h+WHK8icndtWmFLsDI2q3MmjCyFGvQ
 Rt5AnLffLiZUNO2V27BWzqqWQSGRFPwnGUk2qSxtJ8xmxdXJyMFnS/LKoZVSvLeQQQ49
 luhwP63u/3oCtkMPT0+1xzi0MF4I6QffXr1+HnsrHt0/TydhV1duHvxefVrG1mmPEU3O
 GEDjv3k0YrqA2VbwXft3dplkJW8d3ut25CkEfNV2N8ElbfvIpPUrOzMBxd0u9EmYG1vi
 tsJA==
X-Gm-Message-State: AOAM531AoSFth9iuPWQn2QeOetHmkUPxuDGnT31aUDgxroS6KMI4OjpL
 LlKD7y6HfthfTaJ15NNFD8Ne
X-Google-Smtp-Source: ABdhPJxjzQUHOO9pmE1ewQkHZu3Xe9wtIoxLEISh0thnwTBmC8+3r4lMS1sM7XmWKFQW+4N+4+6qoQ==
X-Received: by 2002:a17:90a:cc02:: with SMTP id
 b2mr1240825pju.115.1614226299834; 
 Wed, 24 Feb 2021 20:11:39 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id c12sm4155494pjq.48.2021.02.24.20.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 20:11:39 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 0/3] Add support for secure regions in Qcom NANDc driver
Date: Thu, 25 Feb 2021 09:41:26 +0530
Message-Id: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_231144_599811_57CD346C 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: devicetree@vger.kernel.org, Daniele.Palmas@telit.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
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
