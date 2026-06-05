Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157DACD6E7C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XjRF+0ddGi91F3rbJs/tTAl/3r0BDsFhAjSeBjAazQ=; b=jFd0dZ0dFtEWJF
	T86x8ycbj0bR/9P2uRBMGnFonWFp4BYkcIqNc4TNz5YwEHXKpnxck+nv8ymqDH4JxFOMILkaDr2ld
	ZimqF/jxnangojEO4gyIPLcVP5KiqNw1p0cF3caeWbLhIHI3JeA0vw/E8loREiu58x8cUwCb4/e90
	eiaQGFDQfhfLEFdwpyCA0hdzv+M9a8mu3IDSAfk/NkwiZWJEZMKcNAR9yQvHnAYeo3S+iBvAb7o0T
	iOvdXtoxb7lX2r3k1rRDAZD6F6zlwDzPIwKN8Rj8eg7H6hFXUw8fNqJW9SMXUPZVHAD98Wf/MFri2
	rBLTOvB0TqtFsstycyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIuq-0000000HTRu-0dws;
	Fri, 05 Jun 2026 01:00:04 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVIul-0000000HTQU-0pps
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 01:00:00 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84231305a80so703871b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jun 2026 17:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780621198; x=1781225998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2yNPrajpmUjXUxkDV8KTQdIiGB5qpjbVC2V+xxbVWk=;
        b=Q3gf7VriB2lVfca669Wdp9y5p1o2t/uIsLr8IU6taMmXQp2f7XHD4hxuK1eGc8fHsK
         7x5JLjMsbW3WeqPUMo4bMudNc4ZReKUuTq7hrAF6L2bPHGhmk6llzkhSY81ZJWPX30sV
         OZI0N0fB/dT+Xx8mH2pD/1QGH8aELWseJPF320UdfljnbwCFrWlZVaxHJ1cY4CQfyaJq
         OXicL5JcaFXe7xDkxdJPRnUSNKAf8Psy3rvIRp3i29nLm0Lm+r0j1a3r2V+9Y5JLqTZj
         omrPmC/bCrppli67eUhHj0U4f+OIuI+iKROWwYNP3wfCAIOea3upkq2bLJxjHMtanSnF
         DwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621198; x=1781225998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q2yNPrajpmUjXUxkDV8KTQdIiGB5qpjbVC2V+xxbVWk=;
        b=iEb2BCpjFkMP82f0uIzFEncFOUfdQDEgviGXuqkA4VhFyCN0i0BI189DFF722T8X2e
         x5bNJSg9FNL3+Q57b7hI/qOvp48bn3NGD/oxuVYXYmoD5FV8xf22q1K0TtBh/6NRbivZ
         BgY5Nut4ZupYVA1txiKkbYvYLS+XzffLWR6RGK5pzcAl6q6c0YZ9QVoFIwVi5B0Z4XGJ
         uQK8/W2Chr6MTc3D5Bg8D00PjifpbkRCfxZNN/p0Lo7inTq7/lgqM1qMvmWjvP9GqG5u
         VXD2p8/zC6jehvp/qsC440pApBrMFUduOt6E35/XEnnlvfVl9PFJX2gWBGt9gVIWv5ra
         6K0A==
X-Gm-Message-State: AOJu0Yw0lEbA37ze7FRo8Wv+11wlxojXs7Uyy7MUW+np1diAHVFtv/n/
	dl/rccnezLr8GZGIg/6xMOcPVP8WbdEPZ7wZoyaqHWzpySNEvMAJRGMo
X-Gm-Gg: Acq92OFYLZjOSH4q8v+dNQ3Ak4kbULLso3G4AkOcnCX0W0bhMTi/XHK8IL4MbwIrz7C
	1KSSQ23j1NsYJhvk9DQePIOSOFDr0HPDr4Qha0/7iu9+FEwpaetKskJK3wk0GHMPc/Q/qe0MwxO
	4/moKtyeMsXyRZXY7zrZBg8fkRO0g8cDpACQ3teGI6BlRhzc7uQI+06hccrKWytoFwNFhmmGq/w
	yN8jM5fQkF/OWPJAtqvzMzRjVFZDMGjwQXiVdO904ZGb+5Geu9d30QPix0qwFZh1cLVN2hhHjSP
	2an73/0FkpHwDAVMHlIDWV5gkEMcIR1BOrmFjx71wG3J9FILGbeMVW3i/MKGiP+aC3HTgCWDWeu
	tt/BoPzn09wRDYSuJZXdevGNDrrDhnLJOzpcNc9Dd+pkUBQfmFjmmp6QJwAWxyqHlUYHdMpCvjj
	oBICIAN8+7dODS5/8XhOwTXxPa524Yy1lvnGDQvRSlIgK7bd1510Xpo0ua
X-Received: by 2002:a05:6a00:908e:b0:842:459b:d61b with SMTP id d2e1a72fcca58-842b0f90d88mr1002312b3a.32.1780621198003;
        Thu, 04 Jun 2026 17:59:58 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428235006dsm7730884b3a.13.2026.06.04.17.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 17:59:57 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 7F6284163B72;
	Fri,  5 Jun 2026 08:59:55 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] mtd: spi-nor: macronix: Restore fallback parameters for MX25L12805D
Date: Fri,  5 Jun 2026 08:57:20 +0800
Message-Id: <20260605005720.1857413-3-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260605005720.1857413-1-linchengming884@gmail.com>
References: <20260605005720.1857413-1-linchengming884@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_175959_244940_739A1121 
X-CRM114-Status: GOOD (  12.25  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

In a previous effort to drop flash_info fields and rely on SFDP, the
static size and no_sfdp_flags were removed from the MX25L12805D entry
(JEDEC ID 0xc22018).

At that time, the legacy MX25L12805D was already EOL and unavailable
for physical testing. Verification was inadvertently performed using
the newer MX25L12833F, which shares the same JEDEC ID but supports
SFDP. As a result, the probe succeeded during testing, leading to
the mistaken removal of the fallback parameters.

Since the actual MX25L12805D lacks SFDP support entirely, it strictly
requires these static parameters.

Restore .size = SZ_16M and .no_sfdp_flags = SECT_4K to this entry
to fix the probe failure for the legacy part.

Fixes: 947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index febcef6a1..4cb7c1e98 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -155,7 +155,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L12805D, MX25L12833F, MX25L12845G */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
+		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
+		.no_sfdp_flags = SECT_4K,
 		.fixups = &mx25l12805d_4pp3b_fixups,
 	}, {
 		/* MX25L25635E, MX25L25645G */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
