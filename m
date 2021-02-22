Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC80C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6204E64E2E
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6204E64E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuG2hn7h9GF9q+vIZINozZaY8X8scS5qFkdODcPeW9Y=; b=R7se5CK2gPxTmWwQQnsLPW7ADb
	g3axVcvPHASE4l9THzhuDWyWr7+JhoPmT91EW1LgXXdTOp8+ikrLSsEXSI2PTAuc88WCPYILQbRPz
	vh3eHQ3b/tUkiIkcrXdPA6NKvRKgorajtFP1CZ1kXLvWekcCOYes5upzsHr/lHy5ExvhXsgxiG1HI
	O6SUyhsuJrOy+QOGBCQyTm9JyeR23q6pAl4itUsHV0uSSTkZT+ot0mEZ7nhV+3epy7VxL5H5KqkQ3
	zOtW5L53pd1sDd6JbinSj69xvajWCZhHEhCIBZ9TV7zfBKadMc3QXjVm6URl/gxH/BmpOQpLFT1E3
	QiWVwh0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE9vq-0000iA-JE; Mon, 22 Feb 2021 12:03:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE9vo-0000hd-8z
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 12:03:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id w18so4450184plc.12
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 04:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RN+J/cQ3UYA8vDbFfio0gcTzGBY9lrHpdeKD2Fs7CY8=;
 b=dnQirMY5XNWssjV5xFor/9+hdJe4/wfpv97ncukvlQAzGaPfy9ro0xc81E3lQEfqRX
 nb/0G0CQ1GQFisu4YekJ+WITrBoTYF5V6CEXVo7tpB4/fUFxxcpKuHpJQhKoVr/QqoMt
 PCbi01ymtzy4fT7/69m3M8rODxX9INJ+JLQsAkhMMQRBLx3UFXph733iUaJbEaKJaf4a
 DpuUKoEWPcWTB5LMP6q7h2Sr1kOb5dVtP7lBIYy/9Bf+/ykXlmBZdTrh2PoF/7kMHepZ
 1EbdWAuQ9qPelQQcHoQZ9O3m1p9JvhpqboG9ubF2GldaeFjrlOY9x4HcpSuKmn1Pw5Ih
 Xm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RN+J/cQ3UYA8vDbFfio0gcTzGBY9lrHpdeKD2Fs7CY8=;
 b=Lqfj6gkrfGaaTSjUnN2cjFIPYXwF98yKcqAAORBi1yLb1oRuFqlGGTCEaqJrzvOAiH
 E4jrDJufIc1gpYwKExzD3hxZG4Ra1pWJBXgCD2CDp0JEpT0ON/5nuxL4xGCyEw8HBmDW
 1MJTkbG+2kKoWeV3OZhlQ8+kx5tVW6sYBqEyJb1nrOV8UdjFiNVmTfZOawlgaOIzFt68
 3S/80UGJiwV8L6cvbbG3BwdbUCCFD/Kscgc8KirJxGxh0iZXcBQKg6Z5nB6DYBogXK0y
 G4+sz8Mkjn9er3k/J9DCzR+uIIgbd6WePpkieuQzy8h+Sf63F77R3TnXTl03kFLs5Pqz
 d98A==
X-Gm-Message-State: AOAM532ixYL/5YRRDXr+joZhxVLXW5twaq+NxoRk3iEqFfiyWzOoieGy
 1bFhHjStiE44lHAPMSAHBYpq
X-Google-Smtp-Source: ABdhPJxyO+GrVKVH43RmyAk94dqCfrZLr6eaBqYt8ot+9/AYZLVN3rjsFb2r8BHf3f9aIJetks2D1Q==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr23173772pjr.39.1613995391573; 
 Mon, 22 Feb 2021 04:03:11 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6215:cc7b:cb8f:abf4:d1c9:3864])
 by smtp.gmail.com with ESMTPSA id g17sm17017221pfh.14.2021.02.22.04.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:03:10 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 0/3] Add support for secure regions in Qcom NANDc driver
Date: Mon, 22 Feb 2021 17:32:56 +0530
Message-Id: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_070316_332572_5D24F6CA 
X-CRM114-Status: GOOD (  11.33  )
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
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
so that the driver can skip touching them. While at it, the DT binding
is also converted to YAML format.

Thanks,
Mani

Manivannan Sadhasivam (3):
  dt-bindings: mtd: Convert Qcom NANDc binding to YAML
  dt-bindings: mtd: Add a property to declare secure regions in Qcom
    NANDc
  mtd: rawnand: qcom: Add support for secure regions in NAND memory

 .../devicetree/bindings/mtd/qcom,nandc.yaml   | 203 ++++++++++++++++++
 .../devicetree/bindings/mtd/qcom_nandc.txt    | 142 ------------
 drivers/mtd/nand/raw/qcom_nandc.c             |  72 ++++++-
 3 files changed, 266 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
