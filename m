Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D477CC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w6bIyhUtNZviR0uZU5rg86Tk6vkizXsUHLu5KiBwHoM=; b=GmdPVDInGCygiH
	XkyK2XFn3C/tOrm0Idf1liOc7/dnAOb9jhJUpgZ9na9vtbOgk5vNnZbtb83z5KsDxFuz0ud/XPOkH
	GnhaCRkfj7YhXwuoSmnyEihzdH/dIjid3bv2gNXg5ym+5nJRgOQL7uJvr8meCTfluIG1g+2B0UIf1
	8GXFABpLMde2igM3j+taZKEO3YTp3h/wjY2uX/3+gIHyShmwlbs3FGirgKKT1yBQUWPbFJGd52nax
	6I0w3JRrx0ecjYkBcb4Xs8jvGlsetsv7dUBoEnXr23n3d5aYOLXeLzdN409dxhtaiNVmuk/FtHvU+
	uEwDR39NgBnrCCUqa4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrOde-003TRS-Oh; Wed, 18 May 2022 18:43:14 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrOdb-003TPy-51
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 18:43:13 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 m2-20020a1ca302000000b003943bc63f98so1501554wme.4
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=629EuCNPVzAl5BBiBBvqoC7bqwWqe2HUHf+13KFi4EU=;
 b=N7x9i4oKZ4spJf0nC2xpourbHxhcMVu1vA8uxqp5db6agGtadWpvfKgcSZy22+razd
 khZ0cUQWoy5hjWYylmTD1NFHpSGizMg6fRaNDnQm2QlQ+aEarO4QJ32JZyYRTsyngtjX
 6dPEhuvVZUaye94Mqb90L+BRJwrvfHuiMaoC17GrGBnJ8e3R8mVi8MjvFDOMlUePZCD9
 0VfRzgsQox21clqN0799qYokGk+yT8mwnpyR3Uc1sSL1Bz8Dp3HffTJ+w0+tkV0l2T78
 rPoQT5NzN3z6Mn088Dl9UpHyCbOjYnttWzROnXrzuHSba7O4XP3RKFmu83NAVelwIKkC
 xTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=629EuCNPVzAl5BBiBBvqoC7bqwWqe2HUHf+13KFi4EU=;
 b=RaGPt3qqTFsBEWry1R91YYupcjjLJkQD93EIP+6s+fMUmMr4jXTU2BOAzGMfjFIJ5S
 UUb2ntjEtYGettS4z/5XmvjKfgWbRD86Hmf6AIUwJT0O7+LL86b1b7JkH3uEk6dcJPrd
 XH/+aRv2lFzJn+zjb37hW3J7k2I8+mXhaWbLDPqudtB2gHlsLSbddfPvKSrlzbcZLWMz
 kBiNVeYnzBcO5kmtfl5aMP+iilRF4MODxuLSRYH/+6mMt2sbxQfwJA43aZpUxcbFppqg
 q8oUl3F+yqOfxos9w5HYdllSRPcp6ku3ChdcAdM93UeK2HBYkr3jS2Z+WQycDzJYdMd5
 d/DA==
X-Gm-Message-State: AOAM532HLxXOVpvtOxTzyag3w9FzFqLHUlb6QF8//kiKqU3rfidirT4j
 ULDYCza5ocpiq8KfzKqdIF0=
X-Google-Smtp-Source: ABdhPJwv3JxgSmNPpRs7CVBBT2W/2LDoLrHtng0kDykKkolE2BmoGPlfR5Iwtvh5hNhPGcBkeIxznw==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id
 m4-20020a7bcb84000000b00382a9b92339mr1137496wmi.91.1652899386459; 
 Wed, 18 May 2022 11:43:06 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 q9-20020adf9dc9000000b0020d02ddf4d5sm2768546wre.5.2022.05.18.11.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 11:43:05 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add support for unprotected spare data page
Date: Wed, 18 May 2022 20:42:54 +0200
Message-Id: <20220518184256.21238-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_114311_249577_3AA55BD8 
X-CRM114-Status: GOOD (  20.23  )
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
