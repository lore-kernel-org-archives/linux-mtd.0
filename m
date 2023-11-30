Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8904AC10F05
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y/D1UCKhHMV8vT2V92LCMCnrEdxIdiJAjIPaGD28ULo=; b=A1ALIoZdHUeuCY
	SCKj3HfyyiFSC60zLURvecma+kwhHSvC+gK0NfUgSvzA7kEs0YVvJ/6xoX+MquabaNr3Zovzgc38n
	ee9EgrjCtQvPMUjyk5QwwU5JAfaeCsKor7E+ZV5iwgNuxaLlxdWWDG4JuhN70c7PK3jBo4/fgPFf2
	b9Wrs6SuPvPPxK5Q0ouEUzpayezDnlKwzMx4hS4jHM2LVP7rSrG3xuH+a9SCNzTB9oaLaPq8wMVke
	DgL3r+FkdMB3KqMEkCEZuV+Q5EYuYCJjrK+gPYkMcqnbyOVbioyVxw5bZhSspA2q8Kp2BvPl/82K7
	A5AuXUMwNBcfhwTJ6DSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZm-00AEUe-0H;
	Thu, 30 Nov 2023 08:39:14 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZi-00AES2-2Z
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 08:39:12 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-35d2d0cb3b5so1807975ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 00:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701333546; x=1701938346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Sm9KZh59tyGwqhrcmzsLypVdhzt9q93Px0g44U3nNo=;
        b=hvlqnUhise86NtnbYKW4krBx+dUtVFcsSA0uuCPfgY2WnW2AF6/5SVgoq975O+s+hc
         9TxqSFAXoPhL6pz0JV9TSK/dhUl9xjySlCyeiJ+92ok+xUtJealGVe2PylkuR2x0RLRh
         2PLqG4E6X3kgk3g4GpewpKkMOUDFZQ816v6R4bSKYsD4fjuJ4jP3pXrSMzFCbnjbkrdD
         ljkh7KEJqNVmv8JozfP/PlYX7/Xxo+BZlEJeSbE1NEGDqWCk3GYBOFEj4yvyMZT1b5b7
         k/6y0nkoomyZEzzq7xcgP+zX37Z9VYT6iVYmlpWnAJlkB2Cma2hyX/IaAAPoCNFHdsns
         rt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333546; x=1701938346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Sm9KZh59tyGwqhrcmzsLypVdhzt9q93Px0g44U3nNo=;
        b=phtRozuik8P3zbs/uTJ4z0oSiMnYHZSz/lkQixBdUUDThfgowIYwzf5ptMaQ8MnmW5
         JE09Cy0YyeHgU0Rv+s8mg+kDdhZoxutcSgp/mvV4/6hvTlff2TaHUZrIxMV9RbZJosus
         9ctRzmyThfGdg/kmcSs5RCCf9CJTvIFOHMyX+SkPffSc6gRsrVzDQ3Y3S+e8phC0Dqqc
         Uw6MEnv2cG3yKlJxpv6W5+3vome18iMIOYbnQCJN38FtatMe7soSGsVoB0ICIO0GTVBw
         34ThL4JaKIYMXQD4nL99/JF5wfOFBaGHLrEo6YNBl37ydui4oT0I/WTilrwpEEeqC/Uw
         a40w==
X-Gm-Message-State: AOJu0Ywp5Kgp6fQXYpjr24RKGBcTiZ++BiiaiyMpuz2pBjmYGIy3mhox
	c+mjRtsjHY3d+sT5W+9OgGA=
X-Google-Smtp-Source: AGHT+IFKCKSXt3Var5gwf4wYlmvdT404Pl/3tlCwHm9SHp0ErtFYkpbhaXbnLwdBiO+wZu+dvNGiHw==
X-Received: by 2002:a92:d8c3:0:b0:35d:3bd8:7ba2 with SMTP id l3-20020a92d8c3000000b0035d3bd87ba2mr1111884ilo.4.1701333546519;
        Thu, 30 Nov 2023 00:39:06 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id l29-20020a63571d000000b005c2185be2basm709022pgb.54.2023.11.30.00.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:39:06 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 5B0468050C;
	Thu, 30 Nov 2023 16:38:44 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v6 0/7] Add octal DTR support for Macronix flash
Date: Thu, 30 Nov 2023 16:38:47 +0800
Message-Id: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003910_832592_E616971B 
X-CRM114-Status: UNSURE (   8.27  )
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

v6:
  Add byte swap support for spi-mxic.c
  Remove flash name in ID table.

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

JaimeLiao (7):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  spi: spi-mem: Allow specifying the byte order in DTR mode
  mtd: spi-nor: core: Allow specifying the byte order in DTR mode
  mtd: spi-nor: sfdp: Get the 8D-8D-8D byte order from BFPT
  spi: mxic: Add support for swapping byte
  mtd: spi-nor: add support for Macronix Octal flash with RWW feature
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/core.c     |   8 ++
 drivers/mtd/spi-nor/core.h     |   1 +
 drivers/mtd/spi-nor/macronix.c | 166 +++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/sfdp.c     |   4 +
 drivers/mtd/spi-nor/sfdp.h     |   1 +
 drivers/spi/spi-mem.c          |   4 +
 drivers/spi/spi-mxic.c         |   1 +
 include/linux/spi/spi-mem.h    |   6 ++
 8 files changed, 191 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
