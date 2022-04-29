Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DF9C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 21:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ytSxP20WGIpF91Vv5E6DwLnJlCYmfbU2KtyJNehDKA=; b=YT4aHKyrB6zQZo
	bCejdnN0z9xFJan4izPNrW5LOzaN8Rz5sNhDC3UZH6lVJGL6TVGIyDTtGzPgRaFSMrir1nznG5wZl
	/fzgEz3Jt7ewUbcMWTCiw91RIJ3mjxRdLMIVCcwGCTd08ROqAEakWpEmv9bqaRyr8ASp4Es5BGE+d
	ELULOlFXVLiHgjFUQysopFKtkBPYWfhnmDH4FWyBGY/ZrbuENrZWwJqE5vuzLC4Imq52SlfP5jkQf
	daBr5HTyiprVU+3Fpu5P4MjFHqSCU9FNXB115Asl/DGVTBINlaW7zfmQkw6tRdcuFXu3rKBtgYynS
	Yokt0+X6+vcqY4NnDYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkY1L-00Cm8S-V4; Fri, 29 Apr 2022 21:19:24 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkY1G-00Cm6R-U0
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 21:19:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z19so10396789edx.9
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K2J9IpbhSCPKo6hzR7ThFh9qjKVKTI0ZkWcQbeRkMDk=;
 b=PwYEjNaLcUkFL2XGgIJqUNbApGZRjWJnK2K7xbQvY6Uq47p9cQ1QHQbwpSwOrKI2LJ
 bWZEDifkPN25f5ZSWd4wBl9n8dMFaMiwmQvVYMKv75WgJFL52ln6NsWYEjPCrfVjut3t
 oJHXvSS4JZM9DSEhEP2Nm8Y6cg9H9vCOejhy/Ewt17g6u2iNi9tky+7/oHFz8VPuhR3c
 YE+0AGOJLTVy9Q2JFBEAS1wE6Dywv4f7B4HYzQqTgSaYRP30k+wrGoUlO+eLGoLcVj1o
 NNJlsjqwRpUshSLKj+OVjN9UZeKVgj00t3zWpAD/473AVwZI4Qe5ikHPlyV++S+A4O1n
 6sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K2J9IpbhSCPKo6hzR7ThFh9qjKVKTI0ZkWcQbeRkMDk=;
 b=ihAeZgv86gAjsjsZbC6gtDPIdeuFN3VrB3/F/mXpeKm0j9IElv1XbqNLHCDPZOsupU
 lNjbzG0k/iP/P1lBLN/q9PxwqC3uxSxWg6IoOzJDEyUQyk+rLmzDC1dfeLb2JjjO//CM
 KSDNYbH5s26ke4H63x1IsLyfOk541wJQ6KHYgTbFsHMCAsqwtRhAEn48vuKdkBMpJzfb
 04Z0EUHa3CV5nUnSdDnReEdULRCrcIefqgHWVZ/nranMH6W/NiufKFreLnoqutRidzhV
 1lhl7GB3vL/AXVXpnyiml3cyoKETrAytwyu8TFXRxLw542wEE1sjDhCr7ROYP8U9Q/el
 KtQQ==
X-Gm-Message-State: AOAM531FiiGOiTD9/Vi0FrPr0Ik/Aqp6/O7xpuaF2Dfpra08IUw4q8np
 Vm3baB9MEEogzrK3tHKdyEg=
X-Google-Smtp-Source: ABdhPJwBRJhQVI/1OpMBYtbw+lNoE/b14U4g6oyC/i7QkEXxzC6xu7jOcyYah4jtZN+gJaUczzEvfw==
X-Received: by 2002:aa7:d4c3:0:b0:425:e26d:aee2 with SMTP id
 t3-20020aa7d4c3000000b00425e26daee2mr1300785edr.64.1651267155541; 
 Fri, 29 Apr 2022 14:19:15 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it.
 [93.42.70.190]) by smtp.googlemail.com with ESMTPSA id
 hx14-20020a170906846e00b006f3ef214db6sm990143ejc.28.2022.04.29.14.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 14:19:15 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for unprotected spare data page
Date: Fri, 29 Apr 2022 23:16:28 +0200
Message-Id: <20220429211630.7812-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_141919_002220_454315D0 
X-CRM114-Status: GOOD (  18.80  )
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
qcom,boot_pages binding.

An initial implementation of this assumed that the boot_pages started
from the start of the nand but we discover that some device have backup
of these special partition and we can have situation where we have this
partition scheme
- APPSBL (require special mode)
- APPSBLENV (doesn't require special mode)
- ART
- APPSBLBK (back of APPSBL require special mode)
- APPSBLENVBK (back of APPSBLENV doesn't require special mode)
With this configuration we need to declare sparse boot page and we can't
assume boot_pages always starts from the start of the nand.

A user can use this form to declare sparse boot pages 
qcom,boot_pages = <0x0 0x0c80000 0x0c80000 0x0500000>;

The driver internally will parse this array, convert it to nand pages
and check internally on every read/write if this special configuration
should used for that page or the normal one.

The reason for all of this is that qcom FOR SOME REASON, disable ECC for
spare data only for these boot partition and we need to reflect this
special configuration to mute these warning and to permit actually
writing to these pages.

Ansuel Smith (2):
  mtd: nand: raw: qcom_nandc: add support for unprotected spare data
    pages
  dt-bindings: mtd: qcom_nandc: document qcom,boot_pages binding

 .../devicetree/bindings/mtd/qcom,nandc.yaml   |  13 ++
 drivers/mtd/nand/raw/qcom_nandc.c             | 148 +++++++++++++++++-
 2 files changed, 156 insertions(+), 5 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
