Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67D6C35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jcs1Zq1uHegJi2FqY2PdxvxqLNZ2apZ9YNBwg2kE6fU=; b=rN56YpPnd4fA+s
	gW8FMrMP0NiqSBiydMsgptal9Kz8L0B0PjYAkH3FnZEhFozh5mv++FIW0sxNK2gj45VmFwTZ2mAhp
	UZt0eDsKGT0LNyY3POwT7B4A93cx9oMli0rFjpMVSsRn9K47vbi+Qj4AW7b4NFA5XRHZeGKHGYhSa
	5W0yz+muMWQxBnsNKRKU6xQW3SJJ2+al7eBXyc+SObGLSZjpvZwpwrgrfN2O/MV0Dw0j8elAKshy7
	bwzSUmaHnQEGMwa0o5w3VbDUPoanGBAUfmq3WOa5pigtCAu/chanjLTf336ERyn2EE6p20ZXGOhiY
	Ekf1MXBAikcc+dJgfQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1d-002Ayr-0V;
	Thu, 21 Dec 2023 09:07:29 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGF1Y-002Asp-1Q
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:07:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6d3954833a5so547624b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 01:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703149640; x=1703754440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvIhwt0vqF8M7QdZkDO8YAzc5+AtoNCNzj+w9oDKZaw=;
        b=GRKGtiW7UgF6SOvlkl0ZrpQUwR0+/Ym3Xe9+/d53ckF/9n2i53uRqH/BD/Xz77dux1
         DkvWzzJbSvwuH9J+n7nCi9Ot7LdAgriL4NMm+JVk65Aok3s6HVUA7QUd3Emq82LASXwj
         DiXB+WdsrXFewM1eUGu3OSKMlFmrvGWYEvs3fqIFN2w7o1TpwUlHYxqYF7TN8nGwi92B
         Zs9a0IBvekNJG1DVu4cfy80AfwN3CKEvKp7p1qK4j3BTeNCGzBCkuKlYM9MocBEgCGRM
         d8yGzYxlKrEHPl6i3+wyuxIqju9tlAZnamVaggFWJuIn3N+tIrH6oIqe8wZKOubWAb2e
         qn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703149640; x=1703754440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvIhwt0vqF8M7QdZkDO8YAzc5+AtoNCNzj+w9oDKZaw=;
        b=GbFGBJPCuJaPzlbolvsjWoGbZOkqylOKdiUHr0fSW+Hp9F0X7ZiV5cWt+C1v51O9hA
         57G1BmTB1oxl1WgyIhe0gTUj3NXs6e+aBUPxHUJgsgaA0rhUwCAM+MtJO+MVQI3I77tK
         Xn5KET3D5hLgVToOtStdsE1RTaD0fHVf9XGkiihFoPmSx++Ay823OjhhTHZUAblfzHy6
         I8CdnNfns2/TW44li2vnRBcSvDH/yv7R+IvF9xK/yWz+tNRYVSG/UikSQxrJ9A+4HGyB
         A0Fh9pHogkP2m1vLVUkpR/Lz70TW8s84M32EWyXSSQQyeXsjJkpmzXnzicPj+R0Gwo7+
         OrAg==
X-Gm-Message-State: AOJu0YwMGtz9QjUZpnvqutxVIgMNmwMF/x3/ydAbMZWpJUKoIaAZv0wC
	/UhEmZuG6W20hMOR5ZbQnZoJXL0auDs=
X-Google-Smtp-Source: AGHT+IFOiCDGkmkihGVw/K6GKULvcriXqWs5H0I5dPfLCVwXRL9j3Av7PzfyJiO/xgDJ8Pa/Kshpig==
X-Received: by 2002:a05:6a00:419a:b0:6d8:835b:b0d1 with SMTP id ca26-20020a056a00419a00b006d8835bb0d1mr7535917pfb.5.1703149640197;
        Thu, 21 Dec 2023 01:07:20 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id fb4-20020a056a002d8400b006d3b7f40292sm1140757pfb.19.2023.12.21.01.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:07:19 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 2CFDD80113;
	Thu, 21 Dec 2023 17:11:29 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v7 0/7] Add octal DTR support for Macronix flash
Date: Thu, 21 Dec 2023 17:06:55 +0800
Message-Id: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010724_500560_889CEF01 
X-CRM114-Status: UNSURE (   8.47  )
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
 drivers/spi/spi-mxic.c         |  19 +++-
 include/linux/spi/spi-mem.h    |   6 ++
 8 files changed, 205 insertions(+), 4 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
