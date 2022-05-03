Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2gbaXu1jJ9NzBc3v3JBCtLk7RUFIKNTD7MCbYp34Ey0=; b=xHc0247046kQ75
	Sjg6xqQFB6O3YAl7IDeKIySjA/EAIiKsdf/g+bTfY1Nw8gQXOYOO8dsjGuD3oJ289kjP9vA7m3ncg
	dTyVfNtZL3N64/dTH3W/zXEq2UB8BuqBCuTaYrv+CvRWO/Gh3xsgs4B4xnvwJvZB5PutB8vg2JwTG
	FIVAnBzIK5UHNvlDxN5yZ5ks9h0sVkUkVqAOa5VYlBT7bXBbSO1ULssHr4wF3u0HhaAzlg0w6BBO/
	VAZsk9uirHxr50VhIzyUcD5EaPZbPlUtUSdSI9I4iCSabHGdPWyHTpmjnjXp8IfcPSEBGYWQfgkso
	ZySjQdjx1xoRq7ePxB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluiU-006ZnT-JW; Tue, 03 May 2022 15:45:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluiR-006ZmS-Pg
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 15:45:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id m20so34195733ejj.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mINKKACEUSc3nz+5DZb97F3BUF/I57s2OxAWUmNfvkI=;
 b=CtOHYiswVqrgLZHaIvLLcJVTDwKunZ3vcO9GDZyyGL9OsouVQRjUzC6okDPrLMMbO6
 cjmw+dSZidAG0zEKjylz97DYzb8FWeO/vgwz53Ctd3iFpMR7we5kKNOo3hHKWukX/tE/
 LogxrcMw+GHPD5VEDuWKkRpR7zIuMm/qUVLehApFmEpx8BPQAB5kcQeVJtLuucse9QYK
 6pbwUHVFPAUgXvkc3up19qOfM/cdb+M2GE8a3U1SqYufTaWOYZi0UlnFmxEJD2UuqZN6
 hubN3Rs+FlvRh2uOPAwGu3W8YYd6AQvuLx847bUhukuqPG2F4hSUuF3DsEAddbvLVbEG
 J8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mINKKACEUSc3nz+5DZb97F3BUF/I57s2OxAWUmNfvkI=;
 b=jjge5Af9RFZB53YARoY9Bz29ddUHhvrHBN0ymQ3yJWF8UfarGoPDhfpFBkumDiBVcS
 D5reaGOJ6oy6z9LGBTdNIEJShuOJwl+ald9MQqqJErTI1MtTkXqZixA8uJQ3VNWKrNyL
 5f5R/kK66qNjMR5ko4RV1NF4qoVXfn3ooTNN6EUdgvjMWFjwZ4iz+CUpR4S/bsO7fIf6
 uP9CLE7EyMR4KvS0dRSaiQfOh+wbnKRr0pXXmcUsudpgEuGuMYsQ2NUPACDDawnwJBRg
 BhYCyHJGbab7of9oFj/BehBUyJSIR9RXI5eX2aiw67QLRXqfN+r9xKTwJBz4U0/IMfpY
 LCYw==
X-Gm-Message-State: AOAM531Km1SDSEPRlxl7fmdyYWNUKlEgpBzylvZeM2/f48DC3OZGCrKp
 TpNvLRhiSHQWfbcU2+YPoec=
X-Google-Smtp-Source: ABdhPJz02pBN9VWvWZakAo8EyGCtLIpnR5f9jaXZwXt64fPpWKFXYnVJ/WyG4ipB+qpc5sSjErRu3Q==
X-Received: by 2002:a17:907:3c81:b0:6e6:cf3e:6e14 with SMTP id
 gl1-20020a1709073c8100b006e6cf3e6e14mr16468035ejc.181.1651592729117; 
 Tue, 03 May 2022 08:45:29 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 zp26-20020a17090684fa00b006f3ef214e62sm4723961ejb.200.2022.05.03.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 08:45:28 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/2] Add support for unprotected spare data page
Date: Tue,  3 May 2022 17:43:51 +0200
Message-Id: <20220503154353.4367-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_084531_879027_BF718B09 
X-CRM114-Status: GOOD (  20.57  )
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

v2:
- Add fixes from Krzysztof in Documentation

Ansuel Smith (2):
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot-pages binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  22 +++
 drivers/mtd/nand/raw/qcom_nandc.c             | 148 +++++++++++++++++-
 2 files changed, 165 insertions(+), 5 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
