Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C6DC3DA70
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e56dvmobwUDJCE5G6Y7qcaln+ACZz0Xe3TwjxzWoU04=; b=Qr77VlD3vovn4L
	RurfMrPkpcRnoB8OaMfiaDA7MjaERrOrx1Uv1syB2uT/OXU7bIBhlDB3hUaQfwfToI9DssobI4tKD
	A0bdH37I/LF9CJvsWSIF03CUuqQBMeuYdMbi5sMIns1hkcGx0x7WygqDkd7jhyAHOsxIDAFP+REkc
	XEICWydxvPkl58nh4aNV5AvvxEqJU636mjOdOigVR1nAFAsJPSJSE5q5c2aZqH6rGVpKmD8MvODsJ
	DGPFhgiSaTndYfwFnp+62msIDzOhOgzRFQYQDRt+G3WQn317g7UWLHlmbTHQwXaJsA27cp0qCHMHD
	M4RooSwdLqEWdrokm3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmsq-00000008ZUZ-0DW5;
	Mon, 22 Jul 2024 06:50:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmsi-00000008ZRF-2MaZ
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 06:50:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a0b2924e52so413062a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2024 23:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721631048; x=1722235848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJCDkDHUe0i/zLQZ0saQxvrhTTRS1dH3nPv+QtvXQHA=;
        b=E4bVbVTRfmAB/JykZu/o8qs8z8w5R62+3clN+150Gkwrd8gSLGhCVZe7iHs8S0QHHl
         bClzLEIplZ7Qb+YsJgAzi++d+WPMesX+RSCoaUWjpCuWCxRRjcfvZML+1bhnqFVKsM5s
         VA0lXJ9A7yT9+MV84mNHVL2UMHcZnkFENNCuo+G4BIcSCLlw6tAiiRkmuK0V6LxEa3UF
         mxYVOA30W1LUL2E4IyWjuwMovB+E7YouvefqKtXPK7OUjxmtjKF0FY9r3EALSdLetR8J
         oIXgiV3Z9wP1MR0uE+2fMLLLHH/BZTLEwqfoRHWrlghEdCFR6nMhOklib9ATsb9W39H1
         ND6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631048; x=1722235848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJCDkDHUe0i/zLQZ0saQxvrhTTRS1dH3nPv+QtvXQHA=;
        b=Qq7sE05DF5XS3GoDfm2YymI+lAwhPSKL1dWA3tOcUrvPwYc5UzwqKj8/i0rdnhKqXY
         l8A5UEmVvGWeYGL7xaR7PpqfXPW4vg6jkkKaC7DpO3yZivZRLMTTD56QiitIDK5UhttB
         He4sCVtSSt8YvPIIxmHYrTM3UIKKJSJHUe1jwV37GBKqnqaWJYhbQMbEGppYeVJHJP54
         EjyTdJ4LzRaLgp5Szgd5NvPkD1PwaGaKT3pPaup98Chl7gcLhM0HVaXY/PdgRDdK9xBq
         NDMUlq2AyHTumVDbPjmr+NoT5sctNTnArWMGM7y4qPQ4YYfFZMaZJWQTujG6JZlnGiQr
         IFIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJPbDZ5v1gJ4H5kLdPDgr1DaljaUck9vH6uqtqud8nve2zSeLusqEWo4oEfJDFrNv1fM8JNzXHP4KdOQtoHEvVJm22Yu4EH8rfZ05osA==
X-Gm-Message-State: AOJu0YyBGQTgi2aOBj5KZTh+tvwdftRD9RcSSp2+0+zHZ1Zu2uHCROYx
	RuM5odj6qBkTsNnGQqinB3wa5dBIAYfMSTk167xlTI6d5WGFDNRn
X-Google-Smtp-Source: AGHT+IGenYDEmZuw45sDxN0ZWvdGhm8Vv68TCey7sPL9Z636mLJxswdd2LHFS63u61UraD2sVFkZPQ==
X-Received: by 2002:a05:6a20:1595:b0:1be:ca6c:d93 with SMTP id adf61e73a8af0-1c428679304mr3527108637.52.1721631047643;
        Sun, 21 Jul 2024 23:50:47 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf808f05bsm6155248a91.40.2024.07.21.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:50:47 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id C928B805EC;
	Mon, 22 Jul 2024 15:00:27 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: leoyu@mxic.com.tw,
	alvinzhou@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 0/3] Add support for Macronix serial NOR flash
Date: Mon, 22 Jul 2024 14:49:19 +0800
Message-Id: <20240722064922.606172-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235048_742759_2D2832B7 
X-CRM114-Status: UNSURE (   5.84  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Add support for Macronix serial NOR flash.

Cheng Ming Lin (3):
  mtd: spi-nor: macronix: Add support for serial NOR flash
  mtd: spi-nor: macronix: Add support for Macronix Octal flash MX25
    series with RWW feature
  mtd: spi-nor: macronix: Add support for Macronix Octal flash MX66
    series with RWW feature

 drivers/mtd/spi-nor/macronix.c | 61 ++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
