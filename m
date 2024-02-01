Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E54DC47DDF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Feb 2024 09:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXu8f5bc47hNV41POH8gk3iycbkH7pCNBCF/mnjMFy0=; b=d2hLCvJ7B1FMGI
	ou2POnrbPvVq09p9aIiMHWcKkWWfOqAMPIxFgoWx/WGfsK7t3sVQ2tUHP+Q5FtkDZWh42Xcx/KnHg
	f1f3qEUeCplaBaiymV0AwtcUDUF2jsVlIN34YoHh52ooyt6fQ9TqplFw4PYOcebBnJ0c+e1ydtgNT
	xOEApHKQbdyAHeMAz8cuIFESvvOBeRqz8BkdGinloCguoih1JF3lsseVojRsxq/XzfDsZLpmy1f49
	PVtvgeiDdcCfwQIsErnwXF9aWv0+DNiaA57sOXe2fEBT4Irx9JVPafbUpiI1p6UxkytHOHVSl1TsU
	sxWmC9fSDwZl4DXYVNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc7-00000007K6n-3uJY;
	Thu, 01 Feb 2024 09:44:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVTc3-00000007K3P-0L2L
	for linux-mtd@lists.infradead.org;
	Thu, 01 Feb 2024 09:44:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d911c2103aso4313605ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Feb 2024 01:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706780641; x=1707385441; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ss0g81yT9wKFWo2ZDitmqtrp4zEL5b51ea1juRM0Zrs=;
        b=Ep5jD346XhSaRXRacCwIoQ5uRgx+rKlnFqgoGG7raZFEpKQG/j29tOrW3cGCbRj+Uw
         ntWHqPyFJMRF3wBKoXmwUspMSflyjvy9CD/DFX+F1KIqwDP4WpfxiQL90wjqjMmLKo6E
         ONRVLWzIX9C86uhxRz4FtELFxlzDOPsbhFqDrKCruwun89uhcQgT/IjBdBT7wWDhGMXT
         00Cr64hiJBjfFISomlLHi735iYI+hyNN8hvehQkYuOprARRBoOqNDCrYvSz5ZCCdfVdO
         QnZvazH/VFu671hPPIjM06iNwNwejVzAljcu3Be8CJKjoqeIMk89stucDjnvH9MJMZdr
         +u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780641; x=1707385441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ss0g81yT9wKFWo2ZDitmqtrp4zEL5b51ea1juRM0Zrs=;
        b=mAw5iqEs5aUqvAIFzNUBdz+BuPUXlqe3jIk6ChFzgD9wa21fpnFyfeJnwvYYeZssWt
         B+izt5QM9PcldJc6hQtbX+wNvAyImEECwuvqHtbnmjHHQzw+PyyoxT7aKGZshlFFjdKr
         8ggxlGzEKanf7ui8GHEfgXTApIAzgM1T6MlQFgsXvYXvUZO2CcAmoqqiDx1E2TzZV6q/
         Vgppzn3iS5uEnroZbppE8i+VCBdJ4pT60bTA5iRN9VzAC9gi7ljWsl4YL7oc2WDsra+X
         YVlED4BKBGzgbQ8/HOzLDqteuw+XPYxPvfTQZhj5vihUd2fpYW/KuoCjFAufEKZbhZHm
         WBHg==
X-Gm-Message-State: AOJu0YzhqJjsT/xNyFqewbEehNKBh7Zz4Oq4kqrqmpXqqzzm86Oht6Th
	VN7R/6t4ncCl/TgmBR4+iZtRL77BfO5iXhFKCUVaQ4I5ZidCyIyo
X-Google-Smtp-Source: AGHT+IHf6QCg39RRgRDgdcGuFr1Kao9gOXa1qvRZhMQpEpoPKQ8ek4HSeixoDorqxT8VmeR6jvCkWQ==
X-Received: by 2002:a17:902:ab83:b0:1d8:deb5:3390 with SMTP id f3-20020a170902ab8300b001d8deb53390mr3301038plr.42.1706780640889;
        Thu, 01 Feb 2024 01:44:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWtE9lhj2AhOrYca3MMGemp0z/sV6d7fOfQ/L17BuTp0zSqeJjZISTmQjuaALLQwfQQW6gU0eKVv5KvlWQEHUU+O7mUKyKjpDiu/yGj1NijZ8bm/n48xfdzIUIJ2Qs0UBNjWpMF04zxaHQj9ZbLwz9/Xd0p+2LxLYVoWGmX4XemlMcUiWMQlg3X8j9XB2m6RGnqSche/xkqsrLV8N/1vgeVIWPtCeTI0a7fMOO+SPhqPHzazrL1FTkRHV+58qMGIiOqm3EyyJYcjNGyCkvsKRwp42Xq82T/rz8gajN6CB9mGh6KdNZIJDFbXXJqN8g+y+tAtQ==
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id u6-20020a170903124600b001d71ef6afe0sm10481963plh.103.2024.02.01.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:44:00 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id B87E280671;
	Thu,  1 Feb 2024 17:50:00 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-spi@vger.kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	broonie@kernel.org
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v8 0/9] Add octal DTR support for Macronix flash
Date: Thu,  1 Feb 2024 17:43:44 +0800
Message-Id: <20240201094353.33281-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_014403_151410_4BEDF029 
X-CRM114-Status: UNSURE (   9.52  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Add method for Macronix Octal DTR Eable/Disable.
Merge Tudor's patch "Allow specifying the byte order in DTR mode"
Add support for Macronix flash

v8:
  Supplement missing S-o-b
  Remove function spi_nor_is_octal_dtr_swab16
  Split IDs by MX25 & MX66
  Add dump of capability in debugfs
  Add dump of params in debugfs
  Add dump of reult for mtd-utils tests
  Add SNOR_ID(0xC2) in last of Macronix ID table

v7:
  Add dtr_swab16 judgement to enable/disable Macronix xSPI host
  controller swap byte feature.

v6:
  Add byte swap support for spi-mxic.c
  Remove flash name in ID table.

v5:
  Remove manufacturer read id function.
  For increased readability, separate Flash IDs based on whether
  it supports RWW feature.

v4:
  Add patch for adding manufacturer read id function.
  remove patch "hook manufacturer by checking first byte id"

v3:
  Add patch for hook manufacturer by comparing ID 1st byte.
  Add patches for specifying the byte order in DTR mode by merging
  Tudor's patch.

v2:
  Following exsting rules to re-create Macronix specify Octal DTR method.
  change signature to jaimeliao@mxic.com.tw
  Clear sector size information in flash INFO.

JaimeLiao (9):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  spi: spi-mem: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in Octal DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  spi: mxic: Add support for swapping byte
  mtd: spi-nor: add support for Macronix Octal flash MX25 series with
    RWW feature
  mtd: spi-nor: add support for Macronix Octal flash MX66 series with
    RWW feature
  mtd: spi-nor: add support for Macronix Octal flash MX25 series
  mtd: spi-nor: add support for Macronix Octal flash MX66 series

 drivers/mtd/spi-nor/core.c     |   5 +
 drivers/mtd/spi-nor/core.h     |   1 +
 drivers/mtd/spi-nor/macronix.c | 169 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |   4 +
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/spi/spi-mem.c          |   4 +
 drivers/spi/spi-mxic.c         |  17 +++-
 include/linux/spi/spi-mem.h    |   6 ++
 8 files changed, 203 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
