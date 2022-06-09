Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51703C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ig2cUf1MSbUFFjMs83SpCoydSL5nn51zdZxgVAsyEAo=; b=BoamR5z9f4Oa8W
	fsu6KyHh5kYesNzRF6koWGe6WZj6hq1iwT3S9f21VjyCqGjiLVAZcLbVG7zq7FXnQe+4VGCvGIrtV
	DasXWIxYXh4sZpKne3lBN9Ul7GmmNVsMh6AtYG5z9hYVi8l5+5Ts4I3l+nKUg/7tJ/kOBsVZcZ8k1
	CC5PzRcyhkbrhePIdFwPEvoOp+R+jS5Yn9hjXOHVz1Xj4iwGBAeHld2TlwkRdubtxD0Umtmp9O/11
	AbLCRntXI4v7xz/fMOLq8t4j8asoNDgV+VHi/CO9zbwZMLAlSQQe+HctiH8BsOIT+ZiGbNYtInd76
	N412PGk5E4j3/hNF6pUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI97-0027wV-HN; Thu, 09 Jun 2022 13:24:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzI93-0027tn-To
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:24:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id v25so31198434eda.6
        for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2022 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOp49jraaiqTwhYF0mD/jVJfnTt8MnTWTGqz+xRTGq0=;
        b=d4kQYyM0yvnckDXPuCHW9lAxap+AYxbPdjcG00CMIxwFvwa/g8Lxynqud3+wQGqBLU
         l8a4gAg0NSFJoO6339vafPYusRxUSh6YDbuyRNfn4RVLpOGnfLpbUoik54Z8DTlfZxqi
         6DZukQ43NvrbT3hKz311Ic9q+3xU7uF/NQOO1ocqqS58t5IGbzguWrhy3We2UUerPuOZ
         IiHpqMebjgvBXHOYsvnH0Jw0gDcU7RqdY4DXI0vBpS4+b1dbjEaYrx03NiEXLHnCEhvq
         k8XD2H2ERMGyz2vwABv7WCt1fXyoy/mbnkuxV7lUFTP7pVmvKZagNZY/vpVp7TXCObcf
         YJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xOp49jraaiqTwhYF0mD/jVJfnTt8MnTWTGqz+xRTGq0=;
        b=bXovNkcAknT2M26268fe+O86b2Q4BDaXpABcCozbHDdupC4l0DT2OG+wm32SeC73bd
         dmmzP6BjtYvzQTJUcLa1yskV157jgb4EJxL/K1vectUNsmEOMyg2C7+3bEZJA0/HhAsa
         TN2aZxEehlzP6H3+G06D3j8QcX7jOuWV5XXY8ni5hwuBjJkzcRCIs2pJSP3yl28vXdi6
         phUjRRf092V4pSZkLN+8NCb1HKMR9p+B2awHbIn+9BwXlPLBhy2Ul9iL4vFCD5IuMwOb
         rHCdAMaLlsKhuPjoKRE909DB+8w2hONfB308AyCkWy+G12Tn//tbi1MnWjF/LcepsgKg
         JbhA==
X-Gm-Message-State: AOAM531y+5qxeVyz/lYK6hEyBL2WygkAULL8Wwi4aAsLktIfzBKjp+Bm
	B6wG0stmVcLsPuCcHeNNHK4=
X-Google-Smtp-Source: ABdhPJw+G30MAFfNqV3/fVSa6QC3D052TECaWZBqwRPk2jH0eVMb5bWimZSB9eMFpoY8YCgWaAEhiQ==
X-Received: by 2002:a05:6402:3207:b0:42d:dba6:8ef0 with SMTP id g7-20020a056402320700b0042ddba68ef0mr45929939eda.410.1654781054042;
        Thu, 09 Jun 2022 06:24:14 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id i2-20020a056402054200b004315050d7dfsm8360263edx.81.2022.06.09.06.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 06:24:13 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v6 0/3] Add support for unprotected spare data page
Date: Thu,  9 Jun 2022 15:23:41 +0200
Message-Id: <20220609132344.17548-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_062417_998825_3B7EAC28 
X-CRM114-Status: GOOD (  21.04  )
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
qcom,boot-partitions = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

v6:
- Add additional comments on boot partition check
- First reorder struct then make change
- Add additional changes request from Manivannan
- Add review tag for dt commit
v5:
- Rename boot-pages to boot-partitions
- Add additional check to parsing function
- Rename unprotect_spare_data to codeword_fixup
- Add additional info from Manivannan
- Add patch to remove holes in qcom_nand_host struct
v4:
- Fix wrong compatible set for boot-pages (ipq8074 instead of ipq806x)
v3:
- Fix typo in Docmunetation commit desription
- Add items description for uint32-matrix
v2:
- Add fixes from Krzysztof in Documentation

Ansuel Smith (3):
  mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-partitions binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  27 +++
 drivers/mtd/nand/raw/qcom_nandc.c             | 214 +++++++++++++++++-
 2 files changed, 232 insertions(+), 9 deletions(-)

-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
