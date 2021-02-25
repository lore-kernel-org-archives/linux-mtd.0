Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89683C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1305364F10
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1305364F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PoAS4PxpucO31OOgFI3em4N2YlfpNKnFbKKJ19Gc20U=; b=g5OLyAPwrSprPydVGL6NN8/QgR
	Ey0xtG8VBaOVdCkzbZTw9SaSKAxdnZWar/DasUFo7iz/F9NjgMUwPPWWiuZ5haorb8t5tvhCpHeIU
	fp04XebVoaV5+wfAVCGhRtYouJvcngzvCz4uN5F+CHieHuwLGmwAf6PiaveNHzrD3juqz89OdaY+0
	hUJIilOeHTbuDBiFyy3HuWDCUzfZZQEVkeXDb61G45UAjrBIbMIEgvY0A4e/+KIAcgwPT8g1pq0CV
	/ZyDpLtlRMqOeyY0hgQM5xRSgvagUN/eu02yF/NkIjHz+Da7tb0XmXy3mO+6VBRHEHmlaGZ61Zq0S
	xiZZBsEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFHKM-0006x5-95; Thu, 25 Feb 2021 14:09:14 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFHKK-0006wL-4v
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 14:09:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id e9so902322pjs.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2021 06:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tKcivPFN2h0/UnBHfn2oaLkXaEoyZMnjPH5QcCiUS+0=;
 b=TX/HcySKKK8XnsD5gnNA9IaluRvYuYTE4k0lPmWFDtfTgaCCK4AG10jTRYIjsGHFQa
 Owf16ImiPkPRFHphQkwKE8Y9KSdBpBc24eKjAL1Cdu8YPaCjplmm5LkytDiRinEco0X9
 1qQ3wLJ1fHRQ9Q5UlooG9LMWRxIpGSxJRlsVqaNurJQ7PwjUk3ny3vNEKvoQEkUG5Gj9
 PTxVT+dKjNPOKBMwcg3nLO4HTlor3vuWcZrtdJJopym10kPSwuyXW7fAbVZiSSen5xux
 PxYW1GMHkqCnVozClhhbyF4p0awjdendxJveY0hCf5P2fyP8nPbJRYoNdJbX7JrUsF1n
 7QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tKcivPFN2h0/UnBHfn2oaLkXaEoyZMnjPH5QcCiUS+0=;
 b=N2IhwmropoZw+LRshzYOFkWL/AcjYVobUYMVcKDwXhV1xuOb+9fH4usJDfZlNdn6Is
 FmI4dKs8qhjQ+HrU4vlyXAr2E59Ek5OO2zGJcGjz77p1z5/1oo3MHC+3opDrsa22fr02
 7RhWPMtcXoPqtKQLIGkX4XgkgMxQvByjD2TOaiMJ89qkcf8f9PnHnTQqZ+yFqLiZTXVJ
 koKCITOWkuyMIgz0K5iSGb6uW4t1G9cLLCmGSOXNf8c70ZGuYkdqqsC4GhdKCXp4GSBE
 4QlKEc4SWusT7ygIuEdozRt1gSJ9kyCyAvgVLRLBC5Ukrj1xG8jnu/SvmZtOZcGQqC4H
 lp6A==
X-Gm-Message-State: AOAM5322zH3e10woXGrc0Gk5hK4H5M6gxveui/LDAmldNehp0v5/DWKS
 pqiRMxsAnc+Xcw9adci01x2u
X-Google-Smtp-Source: ABdhPJxscaya0qL8fgFVo7mx9w6+pyaHb01XtiJTko0mYD4+CSg09xG96lMEB0GxL+lgRSoqF0yIvQ==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr3415429pjb.40.1614262149867; 
 Thu, 25 Feb 2021 06:09:09 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id f3sm6228918pfe.25.2021.02.25.06.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 06:08:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 0/3] Add support for secure regions in Qcom NANDc driver
Date: Thu, 25 Feb 2021 19:38:39 +0530
Message-Id: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_090912_510985_D341843A 
X-CRM114-Status: GOOD (  13.07  )
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
