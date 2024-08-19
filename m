Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F2C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2024 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zJlXTm1qr+XvKOjHWWO13ddZ7yZh4UzjDSlSq9XsH/Q=; b=4ZdFxhkckn6UaT
	BQjqfxMWfF7NteOkw+NwBfR211w+Fvn/UVgs2y/VCra9uFT5B5mDcI70XP18AzXE5WHGLPm6k5zJJ
	c0gyiriuHDM/gXk6NqRnWEUa+W2pFhs55cajuu/Cn+3XPYmcTrBYArA0/X6j6ITfTGHWr5uDdY/66
	k8M5oi2nSLz28Q04sRxRlAKyaOnV/6h3JDqU170ie5+6o/X0sS3A1nVdgEegxDfj7AnrtYBe+auE2
	bY4dO8cZ6HjLMvtaVulVcJsUjXyTYl5GSSJ1HNVbLSRz905XESFbfx/aTgdkxEjARr7l1yED1zJRW
	tGSn6OCW0I9c5TYMPBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyZq-00000000wBp-3mse;
	Mon, 19 Aug 2024 09:21:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfyZ9-00000000w1d-46J4;
	Mon, 19 Aug 2024 09:20:45 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d3d662631aso2666189a91.1;
        Mon, 19 Aug 2024 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059243; x=1724664043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
        b=kT72YRLGz7j6YxwcVxeKZ/ibtARCoIYrS1Qnu5HHlzPx+OYDVsHJuCHtzkz8puO8wT
         xgR+RdAfVVdgbwG1p8wD2YBfr8qrcpaJUdKPuhId+XHX4/E1NW7PwVZ2m6Vp2ZG/iyrK
         YXWgSGetiNAbFLYEpbkw+28bW/pPil0ysAXhxyJiAkd0b64qPGVyGxU7KCtyB021JJAF
         miOnrR7ILRM2+nbN9oQlTE0TjeHoblykqI8JDuX3okMu2dsOh4AN+n2EN/TbQhGhfP27
         qBl96vdqJt78a15A57NXdXACIZ0czqobDhU8HmOLe61VkJKtQijCT4hBl2MrZrPuOHFm
         Z4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059243; x=1724664043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
        b=gS/v3Jfjm+uh1gAZzk2zvykc1lQeCjK9eSiIF8tN4WrkmVxZohbVWg8YWwz1PSVm7r
         FN9NSm+Niq0pjeaEdD8MMK+AyzGdvRaDHizAPuJkWrGs0H3856tBxoPItoYQUPLvZYuf
         Ds/jdTd1NJru2juT+4+M7dUiLZLo9niUG2ykgMGqRuASzXGm5eaM0TtxA0qimLmmbPHe
         go5ovFOrB/SZ8N7NQVz8Q7XMHwjVmU2NOPJbqae4hQnoZlVTXLwos5N+xGMYbdxTmwUL
         fq23ZV3nja600w9wcRWaRr5UMfSjn9qjElg3t8LbAfaOVna7MSf9rbTRZMpxnjlwYeQK
         HOrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQYfEZ5b32jKyfnp2tAbWhEeuHYxkHejyXmA2cmIrfkowVvllvF27M614spKspMDRmJwam4I07Vl4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuJySMnpXsqrvyKBstTN7K3iy4cvroJfVaAzqJyjlexvU26Z7B
	HXaLL/oaWZXQCPPingXF0xHSdaURrUHF1hMpOu0iSfDq+sLzSxD3
X-Google-Smtp-Source: AGHT+IHDa/2IA2Yd+H2It0zLuwLh7wv+zRrgCvpU/eheNHrt2fXxv3jnNWn//LpF09xkmOdVGCrL0w==
X-Received: by 2002:a17:90a:fa06:b0:2d3:da99:b41b with SMTP id 98e67ed59e1d1-2d3dffc6078mr10004128a91.17.1724059242482;
        Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v2 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 19 Aug 2024 09:20:35 +0000
Message-Id: <20240819092037.110260-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_022044_037484_08933B0E 
X-CRM114-Status: GOOD (  11.11  )
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

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   93 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1070 +++++++++++++++++
 4 files changed, 1172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
