Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BAFCD5BDE
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JfCJv0T8j2rOlUjjLThlc3+PCrITjSbsI5KdE4IFfwE=; b=4YCRWzQs1d8vci
	bVLb6U7bz2ERgQsz61RiXcDv7Bbb8h9sCombIRbwxThoc09n6G2lPH4HfOmhd9galgH0H8sY8ILh3
	NR6cSqQIUJYoLrxLD7zOtOVungtR2412oHcxI0lHeKZkT6Dm8MCHKALcZkWYNuz1MQjL589/oAmzR
	FN0/9JKGwAcidmU7jeTiSMCru7+ezjwm7f9e3uXnIJh0Q6yOj0NFTcUy+WZq3uO6+QlIg04NJmPYL
	ZlEEV8XGgIlpIzSM7c9HSiSbbqry0rGsOHDVnD/FbgZcAKKMvN1cUOVSDC9qh1OFJuf0L4DPKRCXl
	nRAN4U8rH5ZS3P0T006w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAE1-00000003auz-07lB;
	Wed, 27 May 2026 09:06:53 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSADy-00000003aua-3Uuf
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:06:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36622412e97so8700697a91.2
        for <linux-mtd@lists.infradead.org>; Wed, 27 May 2026 02:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872809; x=1780477609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UqPGNBmr56nxLuOd9kmPqb2AGqal/fu21YYx+TdGkkQ=;
        b=Ofd5qxN7iu3qB6CpUdVZPCXPhcd5mmil1UJUIudxl+ecU0xk5wbUZvEOukjRJSgT8S
         epYsxA8B7DcslmSCKGR7GwJig8Kbh2PhuHpWUPpDdtpEq1JvOIkTJLz0zel/9PiqIRMo
         8cJ4gyK3y2UQlWdn4IVlayrJRAE2LY2gEijXd81ODCy+/3fYcOX8BK1GQme+h9mkdwcI
         7XtsU3zlhOv5NaHwfr55Vpb7LEZ/PaSaHrKQfrJjr/20NP9kUOfLcgZTTTTLkq59BDCg
         lFORT9UbIGjoLI8gJ2MS85uN9laZ9N5enetO2bCMV4xrV9hGY4D1nPyTqmzXN4fBGRR+
         HLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872809; x=1780477609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqPGNBmr56nxLuOd9kmPqb2AGqal/fu21YYx+TdGkkQ=;
        b=Vnj70azkAxKvloiLdiFjS6rOGo+s3hxRjFk5dN0Yq1BDi1IWVONEmFLBhJNn6xD+63
         L7Fw9MEOAvM7krkIKgx/9nAvJ7b3fj8WVP5KCADlhNJmTRUQkgxlj4savTC06JIq/ztX
         mvGlFOxfIB1foqujT7JJ9Q7Avxqmuh5GNrNHEtaREiPDXf2HCLVzIInVWBFA0ZuKYJ2J
         otclZXuFYvaaJ+TXTVZkr9uhgr2aTo3NAx0DDJfE6y5gSMkc1lCmpVkibKkh/9RI+Fp7
         cU06OXMMP3rstcLTzZ0vaevhtNNqA5AHnbo8dnRLvhmXEn0LQnxFIbGMfmPfpl5QQ9Un
         uRaQ==
X-Gm-Message-State: AOJu0YyEZenz42K9uh9N+8zjmFeUhi6AYECBU+fMVoL0uzGDkleb3aH9
	I9xL5qHuV/0SUKWLj1rgPNrdT4KOq3ytuB8TSm0jYH4P5gbAHYEP8GmL
X-Gm-Gg: Acq92OHg42XEv8CamFqTZgJmqi9hY9yzqTWgi+8Bf2uF+qCtUpc4yvbw8bCxvfGYTHr
	mRcsb3AD+m67jEt13Ktrp5rSOfa+81nRWaeSaD8SYsS0GmNFWSgCvXok17fu1gogvMNz6HCIWyG
	jsi/6eLbLLVL/TIkbUsub95QlJc59NVktG/25oweRwx80+jvkS0Exr4ksYJUb0elhPK1/K5gDeS
	t2KswN1JAADEsWQFkmXl6BxZI2zMPxQ+mtsw74qDCh/TrTqvozjG2ulXN5Oj79L7+rRIjyyFsSH
	Zu8E0YN59uNOnGyAuJVNxVBPLVp3T/ybqiq+xAfNDi+jdIcALXMNfzWxiafF68I5zfyIP8BOI0Z
	TbqSVk9g1cN0APEDthxJwFMLtgRwDRsyAIoGfeZJgTFT2hYphZ/1ZYRx9EB4Fg+XRVAvZqOCRoX
	t6bRc2ygUYiOdytXUFmiPYDnsSbU6dTgZe1BD3Oia0tqA4Gcm177IOY5gsB3ECPeTeQ1a+b6KK4
	CQHujc7oICtSjS5UYI=
X-Received: by 2002:a17:90b:1d8c:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-36a67422decmr20623704a91.4.1779872809392;
        Wed, 27 May 2026 02:06:49 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm12065004a12.14.2026.05.27.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:06:48 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: takahiro.kuwano@infineon.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: spansion: fix die erase support
Date: Wed, 27 May 2026 18:05:38 +0900
Message-ID: <cover.1779872008.git.takahiro.kuwano@infineon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_020650_880734_3F300154 
X-CRM114-Status: UNSURE (   7.73  )
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

From: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Changes in v2:
- Collected trailers
- Fixed author email in headers

Takahiro Kuwano (2):
  mtd: spi-nor: spansion: use die erase for multi-die devices only
  mtd: spi-nor: spansion: add die erase support in s28hx-t

 drivers/mtd/spi-nor/spansion.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
