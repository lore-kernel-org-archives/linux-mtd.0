Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6366C5AE4A
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n2+FPWGPYy0t1akj5rTVFcXQGxZM/xKLTDVZjqUbM5w=; b=NWApL7ogFFDA2N
	wMwBCQQL266Kan/rOECVcS7NjJNqrkgzwNgaNwg9+FhdEc0JDyCHnhNtESo3sAkULUSXybkXrY4ED
	BdZyIUWNtZBh68yvvPHz/C/G+iUWU7i7iuiinB9PW0BhQfD0ccsH7xO9m6UHpBA+IsubgA7XMsnf5
	iZrgwkiqjvDYJRb+Jl/MsSivAJf6wW7rgSe5ABF4VBAhPnize1FxCW34HJa/VEqjwPEEDm8RmNfys
	6WWzfELxVqAC+q1P7L02UxLZvRdvqDK88/YEIUFEjwFVBulmkelfdxhJseA7ugakWTueWN8K6bICG
	cFwt3FPqtyV02SHYrb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNW-005xE3-26;
	Fri, 17 Nov 2023 08:39:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uNS-005xCJ-2C
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:39:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc58219376so15232685ad.1
        for <linux-mtd@lists.infradead.org>; Fri, 17 Nov 2023 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700210340; x=1700815140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FoKr+tuqWGDMe8kS6mxFNPbv+7vjGY4MouDuP+AVaEc=;
        b=MH32lveamSQMvTpgYsrNkhsk1kr4iCR3nKkKe3p/jLRdndCmkA8LgxzALyLiPBgK5/
         sPk+lhb4mwwgmCRhEumtkStbp8O9mHAw5nEHMwemO3GZ2sITj5ThlbkId60E3wMzmI+i
         Pm8L0cUsq/Uzd8fy2ymr2d/TKkIcBh5OsGizVpJFx7bGa/Pfl6Nj4+PDfqKXFT6aYLAv
         Y27QOUPC4TO8hhHcUSC/OGIylaEj3db/77Jv68N8hkrQRXwYSMA8XSKwn69+jW8mzY19
         H3JzGppM7V5KAh3Sp32q68BxYo7O959yWsdr6hnRk+0t/Fw3CT3WryMEfHiI8jQM/ZLH
         7NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700210340; x=1700815140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoKr+tuqWGDMe8kS6mxFNPbv+7vjGY4MouDuP+AVaEc=;
        b=Nnnuo3ZvwUY1IhQ9JZ/oIaSU7SS4cmgwUJ+Y+yrEQK/onCFrlSHKNTy6wwwb9pzNKz
         A7hb0wldAyCjoebcexCsaPwbw1IUkzAQEXhKRdMCxATc8b7zmvz5j+pT1fm0577l/cwY
         aecrP0YBzZ2c1BBFot/8j8V2wu+nEgU3po/lT0yrB3GeAfHMGpUtILvBuzFiC2rQwVmY
         j1sx+5c42yOn1s7RYcgfUK1LFeox8f0uRS6hqryp4D65Il1lcGFlMzIHxjgsNWIYnhPe
         L9vzoKvnVA0y/ENuL4vtqi7+j2bFyr2bmJsupXBjBfJ99MhdFnhyi0z/44gV+/Bk2t5c
         Nk/A==
X-Gm-Message-State: AOJu0Yw/NgbHs7reHysQiEOKdauS9ptnUQx9DO0Fj0sAm5xKRvh1lv/L
	XjTy3pTYLXPUU19UhmWv4so=
X-Google-Smtp-Source: AGHT+IHer/C0s5pa2U+lcgeH3DiNZXk3F9lNZWMkXL1Ffv6oY9dR+hD6gpYjFNlVmIo8CmBwVQmZ0Q==
X-Received: by 2002:a17:902:d505:b0:1cc:4828:9b07 with SMTP id b5-20020a170902d50500b001cc48289b07mr14678162plg.0.1700210340526;
        Fri, 17 Nov 2023 00:39:00 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 20-20020a170902ee5400b001c724732058sm890730plo.235.2023.11.17.00.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:39:00 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 83CA280345;
	Fri, 17 Nov 2023 16:38:59 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v5 0/6] Add octal DTR support for Macronix flash
Date: Fri, 17 Nov 2023 16:38:47 +0800
Message-Id: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_003902_719189_D732D837 
X-CRM114-Status: UNSURE (   7.64  )
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

v5:
  Remove manufacturer read id function.
  For increased readability, seperate Flash IDs based on whether
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

JaimeLiao (6):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  mtd: spi-nor: add support for Macronix Octal flash with RWW feature
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/core.c     |   8 ++
 drivers/mtd/spi-nor/core.h     |   1 +
 drivers/mtd/spi-nor/macronix.c | 181 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |   4 +
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/spi/spi-mem.c          |   4 +
 include/linux/spi/spi-mem.h    |   6 ++
 7 files changed, 205 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
