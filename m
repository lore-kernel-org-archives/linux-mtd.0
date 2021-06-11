Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A055C48BD1
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 14:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 271FE613C8
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 14:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 271FE613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U09U9AUIGqNLbAu++FDr05nIpU/Uw67ik5+7JpyQDEw=; b=PXyFJFp9fAZ4q+
	TokkF+szt1j1GUi5hwrOtNZgbyG5v8NdzFeWraqKYZuhl54XInFl30Nfp3epJtlY0J8YUWgT6O/mo
	n7U22VZwowGHaAggy6iLgDlvuqqwmLbgHSx5METxCxsl5jpJ2N0KObUO2JtLVRleYCAYyDKmkk2jz
	UysxOrOAb2lA67NVeb+Gw1XTBUB7OrYteFxoDxuZT8lhzH3PBT4pG1GM3w6ruP1T9HfiS0lRSid4L
	XRkQKx3p8czlYLyTZjzK6JcHCODnl5DpK54k8VAFOcxHYgDK5CMvw4zqgR/0Kl98MdNqIKIgOr48J
	Dyzb6bS81rMu9f3xi8eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrhoT-005ZB0-Ek; Fri, 11 Jun 2021 14:07:09 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhoQ-005Z9w-3e
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 14:07:07 +0000
Received: from mail-wm1-f71.google.com ([209.85.128.71])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrhoO-00087b-NY
 for linux-mtd@lists.infradead.org; Fri, 11 Jun 2021 14:07:04 +0000
Received: by mail-wm1-f71.google.com with SMTP id
 v2-20020a7bcb420000b0290146b609814dso4489029wmj.0
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jun 2021 07:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mqsnDnK7H+bSvfKugt2B4WpV7d9OZN/SZMGSsmxI6wU=;
 b=Gcr/Ne9G82TaeGCCjQFt5LuNFLfXewt1h8564p13aRE8TBO7sZafj3f3XRh7TzOFtz
 TF0oHaI8g/gPyUxw2v7bm6jDi5WKoauPlRsS68LN5O7hRsRpYUK8mQzEyGyeb9BEqtj+
 HSXl5xD4+RmN8x85WJfgSHfO77SewDN/WAaqv0n8dEdUxYn9Wsy95XskZbMVs85GRno2
 viFuP39TDfW5A1yvAiJsWaqfZtQm0lL15EI4scaAVEchvjvIrzVVWxnvuGeoVgkZemGv
 X2OSxbYLwzx5f6KocaDebnaFhW7lZGP8W3PvtSdzRLOJD9EGSrkdgaIBpfigZfube/Cb
 E3Mw==
X-Gm-Message-State: AOAM5324Ka0woKGWtqewLxzOvMXd6UF1o6OcIOcPm5ydqoVIVy04z4ku
 V690GXJCv/IwOI7KuaGDaAHdyxs+Bv8j/k/eYHNZxGkDgC5u/3EuK9erypkh8yzJy4zEesMjlht
 TTdhoRbiaTqrSBserwQhO+0ilVy7XFp2sBbFLmyvDbow=
X-Received: by 2002:a05:600c:3b23:: with SMTP id
 m35mr20872890wms.185.1623420424475; 
 Fri, 11 Jun 2021 07:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW0V9/o7YdR45rEYnx1wo71TwuMvkOq+3bkmhazImZbtBzmFJpq+VyYMzaUqGgT7eBeJZfOQ==
X-Received: by 2002:a05:600c:3b23:: with SMTP id
 m35mr20872866wms.185.1623420424343; 
 Fri, 11 Jun 2021 07:07:04 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id j34sm12055035wms.19.2021.06.11.07.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 07:07:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [GIT PULL 2/2] memory: pl353-smc for v5.14
Date: Fri, 11 Jun 2021 16:06:59 +0200
Message-Id: <20210611140659.61980-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
References: <20210611140659.61980-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_070706_185281_D530B468 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Hi,

Dedicated branch for pl353-smc driver changes.

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-pl353-5.14

for you to fetch changes up to d3d0e1e857110a2f8147b1aa3a045b1fccc1e7c3:

  dt-binding: memory: pl353-smc: Convert to yaml (2021-06-10 23:09:05 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - PL353

Bigger work around ARM Primecell PL35x SMC memory controller driver by
Miquel Raynal built on previous series from Naga Sureshkumar Relli.

This includes bindings cleanup and correction, converting these to
dtschema and several cleanyps in pl353-smc driver.

----------------------------------------------------------------
Miquel Raynal (14):
      dt-binding: memory: pl353-smc: Rephrase the binding
      dt-binding: memory: pl353-smc: Document the range property
      dt-binding: memory: pl353-smc: Drop the partitioning section
      dt-binding: memory: pl353-smc: Describe the child reg property
      dt-binding: memory: pl353-smc: Fix the example syntax and style
      dt-binding: memory: pl353-smc: Drop unsupported nodes from the example
      dt-binding: memory: pl353-smc: Fix the NAND controller node in the example
      memory: pl353-smc: Fix style
      memory: pl353-smc: Rename goto labels
      memory: pl353-smc: Let lower level controller drivers handle inits
      memory: pl353-smc: Avoid useless acronyms in descriptions
      memory: pl353-smc: Declare variables following a reverse christmas tree order
      MAINTAINERS: Add PL353 SMC entry
      dt-binding: memory: pl353-smc: Convert to yaml

 .../bindings/memory-controllers/arm,pl353-smc.yaml | 131 +++++++++
 .../bindings/memory-controllers/pl353-smc.txt      |  47 ---
 MAINTAINERS                                        |   8 +
 drivers/memory/pl353-smc.c                         | 314 +--------------------
 include/linux/pl353-smc.h                          |  30 --
 5 files changed, 149 insertions(+), 381 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
 delete mode 100644 include/linux/pl353-smc.h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
