Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9158C2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:15:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192F7246B8
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 07:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j51+1SCR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfq0w1k7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 192F7246B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R4dvIDXjKobblKCl7jtZkl1cCRYwoT/GwOww+lAe3Ek=; b=j51+1SCRxOHxnJH1qQnF3N7eIr
	jbGUvEJZIGH5RSuWPhDRZ/G15tXVTx65FPuPjgUzYEBIGfOFrIPDMSo8I7Zekfknmz4rsP/9C6oTh
	Wga6yGehMQNYpsP3JQnUyVQDcl9mJycbq4Du4kOWY7oNW4f/U0bDQpSRotcfPWg1KnzKSI5ikFpyn
	Zj8+6/yF4mXh2A+rm21lt90vailIu1BhUmtBmH+DsoQaKiO1miy9rMO8IRp0ZipTjDtLC7G3p9OlY
	Qvvlj+FhMCXfaJROl0Ldc7nOKLfYVuhPoPSjh2uvPFQU68B1Cmeb19LTQOh3qOZwh97FWGE/bIDZP
	S7a1blVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfe8M-0005nV-7Y; Thu, 19 Nov 2020 07:13:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfe8I-0005mb-6X
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 07:13:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id a18so3585362pfl.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2020 23:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=bGNcqxYnOHhOZtfJNAtDrw2wBE2QoPyR5Zl7cAGRdMw=;
 b=xfq0w1k7b6vO2HarqCo8bcfEVI5yGEoHqURu3OKVPUFab3LDSkTCKNPp8xYdKbp+Ae
 jEoCbdbVqUEmUc21swwNu+YuH4zSQCO1V28koNZrdrGy/y3NlNu1c6I88E5AiDw8/m+D
 nub3EmI05n3oL7At9KMrnDIjuxwdnVO6N8hrB3JQI2+5UrcPDFmI7qlyacnodV1pmikb
 ARD+bJI5Agf2Kvxz4cEDU+SSxCGu1S6MBL3+MKAkPlXOMUo5J/Cjxjk7pGr+nEN8wwIb
 9UPtfixfKQeSXfKEHbLyGRYoCbVa0Ibiu5WboDlPZjsU2n8AJdVAGStXrBX5p6BVfbFz
 HPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bGNcqxYnOHhOZtfJNAtDrw2wBE2QoPyR5Zl7cAGRdMw=;
 b=RkQ721l9fgT29Rx27AbmZbKD2WLupflv1sO6RpK7kUKXAxvtQJvcqA+r7x4LB/FY1T
 M2LCSh5/mT6+mb46sZmataC3GgA/8IT2FSXMh4IU5FmubyJbRV5A2ZSYohfnE2elQyQq
 8o/jAp4rUtHuBxyIjArKYa/RM8dQLtMykKyj2D2w05vnRw4WayyArwqopVrc/+5BUOPU
 vSB1n7eWuuEP/A7EzkxHIuIjsfrq7rPSybUrkNep/auByc9FgrxQNmfTI0LmpSDKUfnq
 3sjrG3iNdr0HGAMnG94NpBDtj5ITzQ6lh2BTJKRtD3b0cPJ4zqgthkiTgKZiFv4O2xnL
 cy1w==
X-Gm-Message-State: AOAM533mIq4Deg3e5sKj7ac6vlFbHj9nY3kdKB6mJ7r5J2Iat5ez3Rhy
 gTcqn6cKDQaZ5tXCQjjN1jNc
X-Google-Smtp-Source: ABdhPJw0FPdnVet/uHusHx7i2K23oB/4LC4hMHKMN0jNYd9V2zMFlhkeix3cTV/aSJnfjUSAsdiqOg==
X-Received: by 2002:a63:d549:: with SMTP id v9mr3790785pgi.242.1605770006649; 
 Wed, 18 Nov 2020 23:13:26 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 23:13:25 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 0/4] Add support for Qcom SMEM based NAND parser
Date: Thu, 19 Nov 2020 12:43:04 +0530
Message-Id: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_021330_259417_755C21D5 
X-CRM114-Status: GOOD (  13.74  )
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
MIME-Version: 1.0
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
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
