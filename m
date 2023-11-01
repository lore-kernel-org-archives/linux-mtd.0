Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5233C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Nov 2023 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/XC7DwGT6s7yHxQaPKVU+i3v0OIHEa/+t4rfVnCJ54=; b=r1CoxglosmtPDi
	O07xvAVsljhPG+3n5DHzuSRkQjprYFlnYGTw2hOT6YwBVFlJ/ETXJt+LhurRJenZrPI1c0AOQZKEe
	9yXUa1fsfQttsB/QES+VYIPHjeImk1kA03o02d73knK75mN+UNFGIuQoUgTdc+Y0DqiZ1LKMacThe
	HNJHmi22Us9XXSh1f3q5mw3Da916OKGZigwlrxC7BEak9d2X54/Th2jb5ritYfaxzsmHwZ0XZc3wa
	bpAiHtiy3a04gA8bqpiycqyF8UgCiEOmsWSmtWCewBmezBr7qkOIvehAtLSU9sBOGOfRsaVcqNHAp
	gARC1nzNebva58Po/APQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7lD-006y9O-2x;
	Wed, 01 Nov 2023 09:43:39 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy7l8-006y6Y-0L
	for linux-mtd@lists.infradead.org;
	Wed, 01 Nov 2023 09:43:37 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9adb9fa7200so140683566b.0
        for <linux-mtd@lists.infradead.org>; Wed, 01 Nov 2023 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698831810; x=1699436610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TP3JT7V1ZBm7nu6F9v4TXclyTCPwXiPtChsKdde8Zq0=;
        b=gI7+o5tWpsMufh0ERNRam8Vy9OqTifCj1DOPWmLXg+Y05SFj3Ir4sOYgbRsvGkfuWn
         mDREMTfLce08eDCJHmrAS3w8lDSPTwPNS0ROrw1O2USh8jR3JB3anxnp8H1NhwMbjUqC
         itHveJREistVLPCIhHP2RPqmAIwA1XvFK6oeWNBi6lqRdtLC6uGmM/5IWvLZHFbO1N7Y
         30kZIFFz5F2IwDX/p4Sa/SlVbC2xUTrFKN7tWoED7FyKqEyPfkjakLid7DW0gTwINgD+
         l6qHiJd+qlM42AOqKhXZei2DJU+e0Fy2ZJhTt1ZCEYdPCIO9wzc+jgsRCM9xLDaVHzZT
         Fh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698831810; x=1699436610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP3JT7V1ZBm7nu6F9v4TXclyTCPwXiPtChsKdde8Zq0=;
        b=PJBo5JLyf+ekjFiqQi06EsRrHS84GRbxnqY+Okc5WpLQ9qD9ZPD2WZFcYjHYNdEoqj
         H95TIXg/2+RTOQP/ACmXe/gyd8As3y++fMMDQNcOWSPHjCT+y09KzkUGhwl7bR81zdEB
         EHXNDyUrlgVuK/0PPOSZGyexywOIuRwwCSz2BgK1qLXUXvYad79Q5lS8u/Z/pAjM/4+v
         nncJ2+KqP+X0wp3ys8gRMlmQz1ZKGzdqlHeirJ2RLbSCnxBKDClnfgTC0h/Q5jRXqp9S
         rGikMPmDkGJMcAbSZW1gg9ocfnWqoPKfqU4dc3/LfP0W7LlahmA7U88PPJGneykRAUgf
         puGA==
X-Gm-Message-State: AOJu0YxmQnVnI3i/lep4VFU2Jqk4kfkToI/4wCQbXiR1KrK3n6R3pvg2
	Kz5XS0YqPkwbpQIQDKvz0o9bxbUc2LDm0cyYQT8=
X-Google-Smtp-Source: AGHT+IEUzcI0BCWjlWuT86CV7htMD5jHkLSQGWIKqDLDr9OK6mVz7kosZmwRaeOlzAojrEypTVMVLw==
X-Received: by 2002:a17:907:72d0:b0:9a9:f042:deb9 with SMTP id du16-20020a17090772d000b009a9f042deb9mr1567941ejc.19.1698831810084;
        Wed, 01 Nov 2023 02:43:30 -0700 (PDT)
Received: from 1.. ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id gq23-20020a170906e25700b0099e12a49c8fsm2206415ejb.173.2023.11.01.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 02:43:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: michael@walle.cc,
	festevam@denx.de,
	takahiro.kuwano@infineon.com
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bacem.daassi@infineon.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/6] mtd: spi-nor: introduce die erase
Date: Wed,  1 Nov 2023 11:43:19 +0200
Message-Id: <20231101094325.95851-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=tudor.ambarus@linaro.org; h=from:subject; bh=r0vLJEoC/vE1Xl8/Y3tVJBH/QybCEGnthZ4EstXtUXE=; b=owGbwMvMwMXoHervvrRX5CXjabUkhlQn2T1rE65M4ZykKXjV+WzOk0M6j9YXuh498XCnm9x1Y QNuMWmXTkZjFgZGLgZZMUUWWSetU+f5TuTGyf67DzOIlQlkCgMXpwBM5BEDB0Prmq2tvUe3RH6b Nb+92yMu5W215d290pPMpYMf8lzksDM/7h1fOH/P3UXub5htg59eds9QD4pO2O682Yl1VYJGkoO T2cfepfKJdcpunBnialp/Tpa2Ck1l3fPTTuTEvQOfhKNu/Zti9ks5pJqR/1dM86b3F0vuCtgcyb KasiLOmvclT09BB0//oa9LDllq5P8zrynr2eQvlOzYMvf3T6dPdi5Fjjt7ti1XYc+2Tp0zm7lc5 bmPoWpZ9ZuW1P1CF87FxPNm736n1Fhbcq/hqpvOYpamiyuYE5WFA5243+1YFiLarHDxvbJeWu/7 z5zKnX1SpU0XrjGKzrNOY+yfb6K85aZfk0Ig+z6JaR8B
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_024334_182538_23074F30 
X-CRM114-Status: UNSURE (   9.99  )
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

The patch set is just compiled tested as I don't have a multi die flash
at hand. Takahiro and Fabio, please test the series and let me know if
it works on your side.

This will be followed by the removal of SNOR_F_NO_OP_CHIP_ERASE and
implicitly of the old xilinx SPI NOR driver, but let's take it all in
small bites.

Fabio Estevam (1):
  mtd: spi-nor: micron-st: Add support for mt25qu01g

Tudor Ambarus (5):
  mtd: spi-nor: use kernel sized types instead of c99 types
  mtd: spi-nor: add erase die (chip) capability
  mtd: spi-nor: spansion: enable die erase for multi die flashes
  mtd: spi-nor: micron-st: use die erase for multi die flashes
  mtd: spi-nor: remove NO_CHIP_ERASE flag

 drivers/mtd/spi-nor/atmel.c     | 16 +++++------
 drivers/mtd/spi-nor/core.c      | 30 ++++++++++++++-------
 drivers/mtd/spi-nor/core.h      | 20 +++++++-------
 drivers/mtd/spi-nor/debugfs.c   |  2 +-
 drivers/mtd/spi-nor/micron-st.c | 47 ++++++++++++++++++++++++++++++---
 drivers/mtd/spi-nor/spansion.c  |  4 +--
 drivers/mtd/spi-nor/sst.c       |  6 ++---
 drivers/mtd/spi-nor/swp.c       | 25 +++++++++---------
 8 files changed, 99 insertions(+), 51 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
