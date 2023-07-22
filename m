Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56017EB64DA
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jul 2023 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K21YS3WDH+V1MSBEv/etZrKfaRwD4VU4mB5HOLgAhPE=; b=4nEyyKYi0reaF0
	Ojpw7Y4+eCqzUjft8peIxJH6nJud6xaVhR+w7d6npL5lVMYlmcMXhUqT/hygLnKelOnhGCf/aZb4E
	KMFB05y5yd863A4ljS7RyxaT+q0lz91rQjWLeBhkABvczeulaAoI29326fumKn+kKGojbkyPRZ8YD
	zEXcdC/ssCXqAejvvbxpM+YgYMYcH5CoPcG8bt92hWLq5yDWYub33jx0NKphziWni+FCscuLdr0sN
	xpDRmKv3a/+mWaxLOjNY3XEy1YoUusR0AdViLDoYy7TonPpO9xGL0k5dif01IuXVDzJ9I492+HQZI
	aVZizemkUIkNW6nmWRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN89y-00GA4E-16;
	Sat, 22 Jul 2023 08:40:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN89v-00GA3N-1U
	for linux-mtd@lists.infradead.org;
	Sat, 22 Jul 2023 08:40:16 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-993d1f899d7so436900466b.2
        for <linux-mtd@lists.infradead.org>; Sat, 22 Jul 2023 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690015213; x=1690620013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDbxGBBa8HzdMTgp8+AGW1sIJ+nN/+KO59SLLlDp6qg=;
        b=XjQ0zDZWbGFbMNROZ9LxtaA/NTqhyZbwM62OQaBHsT1ez0iWPLPGW2xoQYDVRXw1eb
         ojV6FoMjtHc7FeugJDIZdX0P3q5tlzA74A/x+jwWEY5rDr2uprnWN/yHYhwAgGTdkUmB
         fXGlLx8k6PeNdxUs3X/VesAJj/uKJiyOuLEvQCr83Fo1i0bsM43CEyCw8saJHoHWg1x+
         jbeYK/amukmQ1CbCnI3IpmrTM9+NLcKcxDYz4VV+Yc0vdqSECkN8rpHmCnOfnj0RxLGR
         gqE/LWhGWeidbdx+SvYXaTWxTfDO8zgsWKoWI29UtyfYN12LU0jFPmz3XMKr/j979G7c
         4j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690015213; x=1690620013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDbxGBBa8HzdMTgp8+AGW1sIJ+nN/+KO59SLLlDp6qg=;
        b=AZqTrrjPblGJTcmJdGHKuBmk0bwbaoEfjCOZH8I1xKcwoSO+doKcJk5kZy+viCV/Ws
         baq75SJS1oFXPP1gncMQsClP/KsfI2ExaZf7BvgcJpe/NB7unKeDLwZ70PPGHCMf0nad
         dqObiuPTa/QdhJMPAxXl8wN+Rht1o4SsGLkRlGopRwYsHjBclaA0qzUve+ZFJfv5huES
         n9lvQRlHV5cqRTIkw6I2rs30OUJL1zAR6NG8G1g5LT6okwahw5xU4rrJp3+ZRBOf6jKv
         FpQxIfSFMv1ul/GMznT4iLXE2CdtQGOXWvcHfSHKRfPBwAaVrclHvVwmuvBAw7bvGhuv
         G+1w==
X-Gm-Message-State: ABy/qLZlNsirEWCqJCngH9n+QoiWFYprlK5P+TFuaQJ/qAPRqt6nJ2Dj
	F9qumkmwzZOjdLRwCgnbuD1s6w==
X-Google-Smtp-Source: APBJJlEqWoA0uVdEyLN/A+Z69+lmf3cZMmh7DhBEDSmoMbu1dJn2om86VqVXY+oHG0DXlt1He0NREQ==
X-Received: by 2002:a17:906:64d2:b0:993:d6a7:13b with SMTP id p18-20020a17090664d200b00993d6a7013bmr3972686ejn.22.1690015212827;
        Sat, 22 Jul 2023 01:40:12 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm3253861ejb.84.2023.07.22.01.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 01:40:09 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	takahiro.kuwano@infineon.com,
	michael@walle.cc
Cc: pratyush@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bacem.daassi@infineon.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 00/11] mtd: spi-nor: spansion: Add support for Infineon S28HS02GT
Date: Sat, 22 Jul 2023 11:39:55 +0300
Message-Id: <20230722084004.21857-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=tudor.ambarus@linaro.org; h=from:subject; bh=1H2nUh8+DtT2I4SlyapMiSVxwqMawXA1UY2QiNflkLY=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBku5Xj3a4UjnbXGOAwpzYTCmJoLtQ4oOBgtXo86 mlFzvHNdbuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLuV4wAKCRBLVU9HpY0U 6V0jCACADkPWEmB8IML4vMgl+L4XiES6DE7MPeGWFNkwp6YkmaZKuYHuHlkzNRnfg8HlKMQsFae UjUp56l1CUWHsoSDIl1TOq8yYiZRiz2j2Jzq1GEZBIwRtW9tunQxVSLyYvdjNHp1NUDIWrWQtav gR/6xJ1jsnLvOz2pTOSKcew68Nw3uf8D9Y13E/6Tpv3m48nLc6Z335JkgxrQ7ek8V71Jmt76Sjm jyIbQqiky3/nUiW2pFf4N4CQJLuhkdzePCag7r6ChDgKnEJsaAL18ZMfe0aZy7MQavAHgV3bdwM XqBsX9d0IQyB6W1FNAqZlbODCbKylg3Y5obmj+3jBGJx0sUN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_014015_591876_DD78B308 
X-CRM114-Status: GOOD (  13.25  )
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

Takahiro, since you already have to test all these flashes, I took the
liberty and added some other changes that would be good to have. The
first one lets SFDP determine the flash size and sector size. Michael is
in the process of changing how INFO is handled, we'd like to get rid of
these params when SFDP tables are defined. The other 2 patches
consolidates a bit the spansion code with the idea that we should use
the same code paths for both single (SCP) and multi chip package (MCP)
flashes were possible. We avoid this way code duplication and have
better test coverage on the code. On your patches I modified how/where
"if (!params->n_dice || !params->vreg_offset)" is handled. Please review
all and if you agree with the changes, retest on all flashes. Everything
looks good to me, if the tests pass, I'll queue all.

Cheers,
ta

Takahiro Kuwano (8):
  mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
  mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
  mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
    support
  mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
  mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
  mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
  mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
  mtd: spi-nor: spansion: add support for S28HS02GT

Tudor Ambarus (3):
  mtd: spi-nor: spansion: let SFDP determine the flash and sector size
  mtd: spi-nor: spansion: switch s25hx_t to use vreg_offset for
    quad_enable()
  mtd: spi-nor: spansion: switch cypress_nor_get_page_size() to use
    vreg_offset

 drivers/mtd/spi-nor/atmel.c     |   8 +-
 drivers/mtd/spi-nor/core.c      |  23 ++-
 drivers/mtd/spi-nor/core.h      |   4 +-
 drivers/mtd/spi-nor/issi.c      |   4 +-
 drivers/mtd/spi-nor/macronix.c  |   4 +-
 drivers/mtd/spi-nor/micron-st.c |   4 +-
 drivers/mtd/spi-nor/spansion.c  | 294 +++++++++++++++++++++-----------
 drivers/mtd/spi-nor/sst.c       |   8 +-
 drivers/mtd/spi-nor/winbond.c   |   4 +-
 drivers/mtd/spi-nor/xilinx.c    |   4 +-
 10 files changed, 239 insertions(+), 118 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
