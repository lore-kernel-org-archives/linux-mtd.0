Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF40C48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 08:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=atvI/mRxYYZ+LWMTKCHjzACRLighJfJNiS/LQ4KA+9g=; b=tMy7Pfck2QOABP
	RDlK93D5Inh3eoM+knJ9f3YKduXbQOu8zXP4/OsXw3jDL9M5xTt0h1FzFA03kDM3xXief1bQ9615z
	+HlCtjhVNd9bdZthiBMlYgi7NU0YI7lfAzOl14ciJ3SyxJ58PTeQOPP7CxqsKcP3frbe+a0NlCAzL
	iQdwiDik3mExVkks84Qpz30o8Mwmx+F05D5qQP+H2CAQUP2r/CTGUrSMrpuox8g+XTfQF1dnd7zYh
	0Gj1GIPFRG44dy+nku+TzdJ9lkiT8VrUgweAvYmM++OIDDYJvJYsDSIB7OWq4ML1skbUBJn3VKmH9
	DBt/WTwsiNc2uxpEjtLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLa3-0000000Djyu-2ZJS;
	Tue, 20 Feb 2024 08:34:23 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcLa0-0000000DjyQ-3ijx
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 08:34:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d51ba18e1bso52335495ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 20 Feb 2024 00:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708418059; x=1709022859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUpftnyqk2wi69nXZ2DEClvqqDVHgLQf8Eu0MCCrDo8=;
        b=LguEPp23sh/pg3i5NqFQLfWI+7Y1RcGdOSEMbc4n3/XmgccIHoRqjCia1M5uLnZNJ9
         7+qkhVDLSxupNgf0eJO5nywUHhwF66DXOGxW5CCk67Uf10JrGcX7hlu4Z/XuKBPz4xpx
         eRW+WydxaRhuBpiM7NLCH1f6FQHO5epDwv2PJjGMIVokMRz0kgZAnIiKSa/DGKO/Cxre
         j96FYsP6yJ8LRYOwp8mA1+fcabtBGPYDaRJwTHYUgtFfsiq6l78LTrMQ2lJESmW7Qwr/
         kKDDSk/6QumHjg3SXKQM5I4QccRoGVuk5YVxYMBhF8ax08Joidv739KVJv41pMdM85bi
         ac7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708418059; x=1709022859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUpftnyqk2wi69nXZ2DEClvqqDVHgLQf8Eu0MCCrDo8=;
        b=kPrp1N/nLm5wbB5bhhZFTnKQmbJSjHK+036SxNmgioBrOS7Zwd8M3/qzGUdXJPOai/
         DgIj8XM2iM2GyK+ngdbLWhvujuTxOZ0V6g06gjjBfh0NHPxyA+jadvhL/w+osePjxJG5
         JIbtHjrI+VSwzOloE9Yv7fNHnN2rIJJXHIE3KTSKvZAsZS4NdV4L1q8DxvzcAiaTzXfl
         Jdw7amShYESyR0Z4qWRKg2H+Orcs+XVcvrQbu025+uVlf49lcDf/12kqtucQPRhfV4wS
         kRZbCovIBBW/Q1xUH30W+KyrXmuZQhD3JeZJURkihRBgTK4uAqBMWbaTm+YvQqZ9WMAh
         490w==
X-Gm-Message-State: AOJu0YwqJ3MVS6gc9GdnTEqc/98x0Uhp1ZDYGF2hKclL/FPzF3fUDIwD
	ARbwfbIy9+ZCbNnGUauTNoQgCR1W8BlYpvJeGHDXB7R63P//BLBgjDE3EYaL
X-Google-Smtp-Source: AGHT+IEvJhI7xeVJ4oFH/UVbk0d1vH2f3g9tFOot6VkJEh6IN41YMcwslkpZPl5vazycZMz42RBqjQ==
X-Received: by 2002:a17:902:aa0b:b0:1d9:5371:bc with SMTP id be11-20020a170902aa0b00b001d9537100bcmr13920102plb.37.1708418059589;
        Tue, 20 Feb 2024 00:34:19 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id lo5-20020a170903434500b001db715d3bf2sm5655655plb.137.2024.02.20.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 00:34:19 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH v4 0/4] mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map
Date: Tue, 20 Feb 2024 17:34:05 +0900
Message-Id: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_003420_949275_76F17170 
X-CRM114-Status: UNSURE (   7.08  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

In v4, split two flags removement into separated patches. Reworked
spi_nor_init_erase_cmd() to use n_regions in outer loop.

In v3, reworked to remove LAST_REGION and OVERLAID_REGION flags. Updated
and tested debugfs.

In v2, reworked spi_nor_erase_region to stop bitmask encoding in offset.
And added n_regions member to spi_nor_erase_map.

Takahiro Kuwano (4):
  mtd: spi-nor: core: rework struct spi_nor_erase_region
  mtd: spi-nor: core: get rid of SNOR_LAST_REGION flag
  mtd: spi-nor: core: get rid of SNOR_OVERLAID_REGION flag
  mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map

 drivers/mtd/spi-nor/core.c    | 187 +++++++++++++++++-----------------
 drivers/mtd/spi-nor/core.h    |  30 ++----
 drivers/mtd/spi-nor/debugfs.c |  26 +++--
 drivers/mtd/spi-nor/sfdp.c    |  47 +++------
 4 files changed, 128 insertions(+), 162 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
