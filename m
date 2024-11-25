Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE85D3B7DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 05:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bq0R+WyWAnf2DLfVDnjBjLGOn2q7SO+lVkNyXalaBv4=; b=iDKCTW5hRdVxeJ
	00zEmh7qaji+Fl32wFQACZwyI5rXXt0YLrl6romZY9MW1ykA9EpFMi1AUsMaawLCNQtirgyQ6+yqu
	R8a9p8mxs+obXgCwKWHaORPE4+z7/lgcnQYxt9egldVsJ2pNgDWv3ojkcEobkj/wLQa8wqXn8hjQL
	tvKa8DgR/E3u9oHDyqeJUoaz+nqX0vBEJ359gus6K1GYQuVeaWakZkApdzJdhoH1QwddQfFOXeQLr
	vQmIEY3NP3cuyYTozjSJBP4jQHmFgOm/FpbKh57TSDu564g6lmbY1tFXHWbu63+UasguTWjkH3vLC
	dG9TS0PCxzDJ2IFRCsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRcG-000000075hn-24q7;
	Mon, 25 Nov 2024 05:26:32 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFRbH-000000075UX-2HOD;
	Mon, 25 Nov 2024 05:25:32 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3e5f6e44727so2296118b6e.0;
        Sun, 24 Nov 2024 21:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732512330; x=1733117130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NWNdeipp9Lz+yCgnatMjLdoGegxlT8lsdQAdmeK6GM=;
        b=HvSM38d/dsRCqRs7XeUgYwDBZCEsYI56ZHliinMLM8TDsMLG9/uRHRGsjsEN8gBgbm
         4+O6fsLzTprxXBj25DOOiOeWjxgQsSdOdriqi8c2l82eQUC/ZhJPPQ8ji0IoPyCYVcGQ
         2R81xpsX8RM9zLj+G11ZbWForsf+Q5KLJRTvfgSOJtIZbERdP/KGYQCPqBYGu8maFp7p
         ccklg+V9sQLMr930qucMWBP9cZMwhaEAsXZEhOqX9HlVQAjMY1Xt+WV9hXfvsho74Dou
         lF/I27mJquZ/Ubbz/8SlN8WFA8fODLH61n3kEn8qsfuAsTT+aZLDd7e/3b+KcUKNz9B1
         IXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732512330; x=1733117130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NWNdeipp9Lz+yCgnatMjLdoGegxlT8lsdQAdmeK6GM=;
        b=v0wVWH+Y2NouU9BDmdbOHXo7e2tyGGef56Aep2R3OYIL6y1kHey1IZNQ+Y8y2vxGB8
         pzdEUOmP7Pl6gkPoZdEXLYRUTeqrN0sX8tXWsMGtlB9CSjp1sMf0HE7x+tHLrye9t0Jp
         pJNC97RQp1HmFOpuAPuqJo8YzcCVnur4XtzSqZvzqm+onnW/99YPGyGVzTFP3JCxLi1M
         KKqYBLlNFyvVKF1CjeWBFNXKVPEBCgP+IOEYobj7IS25l37AEtt3GOoajpCpxxv1X3FS
         LQjISVHmsWzVNEdkg87ZamMmuG2J6G+DdwR8mow2NN+yTCt6VdEYHOQICP+xOtVmr/rQ
         vdVw==
X-Forwarded-Encrypted: i=1; AJvYcCXOEpLmd7k8BHAYMui9RaGSelSI6gjHDldkAOlHF4XAeOmzsZoVWuEfzSW8GZQvPrctn92KcvXkWP4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzR1DhnxsDWAuQ1Y1BMWnTA99Rv6gNtDiWBDSFzE6QWgEtXLaYE
	uU+9AZ3M76YK52hs7jKSoj2gnYi0aoz4cI7CtYxm64TEpanr3PXx
X-Gm-Gg: ASbGncuZWX+nA/OBZpD0nRgB3UC2ySBeoaVRUfclGT7pjzntQ2eztLThDSc3+9iM+wU
	ORwK9F1sTy1n4q/J6aevZw0FGezEo9L43dtoyRK6hZriY+wgkCq86VgkHS9VtYqBK9uaHxC4LV3
	n18M9DnbV+gQDO1vU4xcnR6ilpLYXknXviZmUI4hPO5kZ2SUQ/Vmj0rlIBmGdgS8BVBUHZJkpqd
	evb+rwlSrIqY1zy9Mz7Lr2mPbOkfIUXuWeeVxMd6eI7JrVephwO7MijHh/fRbNEwEAoGQ9yF/9/
	vESur7ram/hMM4BW1sAHMtLRiBH6sEpNJeQ=
X-Google-Smtp-Source: AGHT+IEThhx0hkE8eNOImQOECxAu4miExvbPkYIPbmiK1xCB8nCLXsvTsOlU0MGcVv6gP4Op5+TxkA==
X-Received: by 2002:a05:6808:14c7:b0:3e5:c7f8:ad7d with SMTP id 5614622812f47-3e915b57082mr10486001b6e.39.1732512330089;
        Sun, 24 Nov 2024 21:25:30 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc1e2490sm5698557a12.31.2024.11.24.21.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 21:25:29 -0800 (PST)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nikita.shubin@maquefel.me,
	arnd@arndb.de,
	vkoul@kernel.org,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v9 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 25 Nov 2024 05:25:22 +0000
Message-Id: <20241125052524.135362-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_212531_579361_D2F4FBDD 
X-CRM114-Status: GOOD (  14.34  )
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v9:
  - Update ma35d1 mtd nand driver
    - Remove NAND_NO_SUBPAGE_WRITE flag.
    - Remove of_get_property().
    - Add ecc.write_subpage and ecc.read_subpage.

v8:
  - Update ma35d1 mtd nand driver
    - Rename to nuvoton-ma35d1-nand-controller.c.
    - Use switch case instead of if else.
    - Move some parameters to be set during initialization.
    - Fix the ecc.read_page return value issue.
    - Add enable/disable ECC engine before and after reading/writing the page.
    - Return IRQ_NONE if (isr & INT_DMA) == 0.
    - Move the HW ECC related settings to ON_HOST.
    - Move hw_init() to probe.

v7:
  - Update nuvoton,ma35d1-nand.yaml
    - Remove required 'nand-ecc-step-size' and 'nand-ecc-strength'.
    - Add 'reg' for chip select.
  - Update ma35d1 mtd nand driver
    - Update space and comments style.
    - Add chip select setting from DT.
    - Add switch case which supports various ECC configurations.
    - Set reset before NAND controller enable.

v6:
  - Update ma35d1 mtd nand driver
    - Remove extra blank lines and add comments.

v5:
  - Update ma35d1 mtd nand driver
    - Remove unnecessary definitions and comments.
    - Modified DMA API call sequence.
    - Move the ECC check out of the interrupt handler.
      Check it after reading a page.

v4:
  - Update nuvoton,ma35d1-nand.yaml
    - rename 'nuvoton,ma35d1-nand' to 'nuvoton,ma35d1-nand-controller'.
  - Update ma35d1 mtd nand driver
    - Rewrite the NAND driver using the exec_op API.

v3:
  - Update ma35d1 mtd nand driver
    - Release IRQ handler.
    - Remove unused functions.
    - Remove '.owner'.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   95 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../nand/raw/nuvoton-ma35d1-nand-controller.c | 1024 +++++++++++++++++
 4 files changed, 1128 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton-ma35d1-nand-controller.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
