Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF4DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 19 May 2022 19:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdXOMo2Qac+7bspFjZDLshbbgLrAsvHMNxfl55jNHbo=; b=36Z3r+4ei/zkNP
	95KUylu4zVW+19V+NE4kdlvIVmXPVp5wG7FN3v9oOsXKv3oTr+v1E3gWfLKYnGq4afAidk0/wWsar
	jfwlXIV8//ZOqc7huYcYPhbDTOoUITuRuxthtgbf3hq7FjJ1WXqDvG7IR4Q3iIgkhdcbmf7QATEv7
	dORZQHHCT5+/4XFATZAOz4Kv7zwuv8CSUDqjQbz2pndsySnjbaCEn5UaSzCmbltdBJAGUfNMjDRYS
	07ss6oinuexgYdoT/IlY6um/opaWwE4ttClluFwSKoyjQoxyRwpUvsIoUHxTwB0Cd6rPTO95xwSRW
	L7OYp7trkUmVMTq3gUgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrlOu-0093TR-Gy; Thu, 19 May 2022 19:01:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrlOq-0093QK-Hw
 for linux-mtd@lists.infradead.org; Thu, 19 May 2022 19:01:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id f2so8491624wrc.0
 for <linux-mtd@lists.infradead.org>; Thu, 19 May 2022 12:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AnHJhI+ziwlPwu5NQv9qfEIlA0yv7rIa46hdD1NJODM=;
 b=ZrADJC4tGLoNcGAx8Qx4Eb5CgbinQIveNghZ//NlZ8fWbRVGQ7LKm7TcI5hQhWwtIi
 CWxfO5AbVAJwpI1Vck1+m97SJaLJFmWp9HxcucF8wENR1bYBt4ZvM9eiT8PILEnjX1iz
 CR69gxZYZTZ0TdSPFAjmvTGRgWYczpVOkphmgREswSfNdrDeN4yKoqPjMnFDCX6E27Il
 yqIBAKkdVQ5/ONOLwuQlQk4lnDVyF/iLieKy9sjvEX3K/Zv3xIP72WPpV/21SzBnVqil
 Fx4bQKv2B5OhD9uENiKov8Co1Tufwqgbe8PQgh7qWPXXBkH90kFUWbbeA+qMBRqO0Ttc
 Bx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AnHJhI+ziwlPwu5NQv9qfEIlA0yv7rIa46hdD1NJODM=;
 b=NekWVIRSafpNiQ94vrO3GIkoGpc2HcllSdDLWQZxNYJDxcrjeMT9wVFKmG9giWaXYk
 SoWjVy3JTzEAaTMYpZ/fVZA1YOCseK7AZz43cXYmsjKtRQrPG3jS+00jy+gwNKwERryw
 lTiFpUuCqEErxax4JDPML2R0wt3HW0fG/HjkWqFCM+EyHZl7hNB6oKcMv4p7S04KuXKr
 JFO7gs+Xgsx18ko86jXZUanMBkMXs0Qh8VCFEhnoahjRZlHGRGD2ofB7XIuHuSsZVH6D
 8fMzryiv6Yptg+zdEFVkjBzXFuY9eTN1657uYPx3Icbk57+oEhfvP1SEgmwYX9U8LQNq
 I4vw==
X-Gm-Message-State: AOAM533VE3HKeqqCSnGAlx30l4OQfkAKqr+lzwTOPclEKqpTrp28bCrT
 W+jNtqeXcmRg22ktb9r+jGY=
X-Google-Smtp-Source: ABdhPJyvhOD959sAuMcgvEsVvIrvXhEaFh8Ke8XoUH7NYV+vpHFVBmrCAta15kxCI5oIdxA6psDWsg==
X-Received: by 2002:a5d:47c5:0:b0:20e:73a0:79a0 with SMTP id
 o5-20020a5d47c5000000b0020e73a079a0mr1901351wrc.632.1652986885110; 
 Thu, 19 May 2022 12:01:25 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 h11-20020a05600c414b00b00395b809dfd3sm333767wmm.12.2022.05.19.12.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 12:01:24 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v4 0/2] Add support for unprotected spare data page
Date: Thu, 19 May 2022 21:01:10 +0200
Message-Id: <20220519190112.6344-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_120128_685733_D409CBC6 
X-CRM114-Status: GOOD (  20.44  )
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

Some background about this.
On original qsdk ipq8064 based firmware there was a big separation from
boot partition and user partition. With boot partition we refer to
partition used to init the router (bootloader, spm firmware and other
internal stuff) With user partition we refer to linux partition and data
partition not used to init the router.
When someone had to write to these boot partition a special mode was
needed, to switch the nand driver to this special configuration.

Upstream version of the nandc driver totally dropped this and the result
is that if someone try to read data from these partition a CRC warning
is printed and if someone try to write that (if for example someone
wants to replace the bootloader) result is a broken system as the data
is badly written.

This series comes to fix this.

A user can declare offset and size of these special partition using the
qcom,boot-pages binding.

An initial implementation of this assumed that the boot-pages started
from the start of the nand but we discover that some device have backup
of these special partition and we can have situation where we have this
partition scheme
- APPSBL (require special mode)
- APPSBLENV (doesn't require special mode)
- ART
- APPSBLBK (back of APPSBL require special mode)
- APPSBLENVBK (back of APPSBLENV doesn't require special mode)
With this configuration we need to declare sparse boot page and we can't
assume boot-pages always starts from the start of the nand.

A user can use this form to declare sparse boot pages
qcom,boot-pages = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

v4:
- Fix wrong compatible set for boot-pages (ipq8074 instead of ipq806x)
v3:
- Fix typo in Docmunetation commit desription
- Add items description for uint32-matrix
v2:
- Add fixes from Krzysztof in Documentation

Ansuel Smith (2):
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-pages binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  26 +++
 drivers/mtd/nand/raw/qcom_nandc.c             | 148 +++++++++++++++++-
 2 files changed, 169 insertions(+), 5 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
