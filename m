Return-Path: <SRS0=TxBo=7X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BB7C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 22:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B412074B
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Jun 2020 22:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6keE0JF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="H+S9mH+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B412074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6G+s6RJmMFKxPZoNKovDI7WTua5x/h4R2v3Ik4jCdpY=; b=Z6keE0JFOk5JdK
	R/qICPQcUVobofvzfbCKuovzUkjO/3/djXkHjhWiFxtj9nkDa/pQxAn0UY2y1yskTj2lTHmE8trrV
	VQTlbJ/9Y/g1+a6SsNoZ+BsD/N40zKbc/OxkiYp/Lv12/vW9WSgD34RcsegzOnZuR4jMqAUgCxFHp
	vKK0zVWc+3vV6OBwA2dXBEPMH1n/Jv2yhJAKYRSKjzFR7JvFYfir5vCyyKatrsDiQ2umZm34KYivo
	3q8YCEQDSBMvhL94rGGgmGkTsT2/qhhorKBWK7GMU6pnu9Prno0bCxUdSUI96WvEUT70q8XL3MTRU
	ryqCSdctIXs4I4GIzvkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj9V0-0004mQ-S9; Wed, 10 Jun 2020 22:47:10 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj9Ux-0004lS-TY
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2020 22:47:09 +0000
Received: by mail-qt1-x84a.google.com with SMTP id d2so3245031qtw.4
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2020 15:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=H71MExYm/CGiyWc/B8p0G3A3RqB8QbYwFWDgAbb3BjM=;
 b=H+S9mH+IiwxAwIQTSovuAEu2EFLyte/T9t8Mco9jzx/THTvUBD5wHEtcNNustYp43W
 DSCiCYS6v4m7JHRJfIZxXH7KN7DLgQDTC7B8xDTZtkXral/lxUJISHBSRb+VwVqwXFlP
 WrAssSVfB2Vj+KnFewuA4m02kp+KuEhmWThgB5O25FmeLxTOhRmUXi343gSefNH6/VnI
 lEa9gW/ptqBD336Eh08d2R6P2UzriNj+oHjp3Jvy41xOLoTQVPr6qmarB4wrmH5C1EVw
 r3J3n8+JBAwu1TVkokVBXsfyrDnii+NpaRCsUDlj2a86BHTmfaDngC0oD/cTLxsOVo6B
 TqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=H71MExYm/CGiyWc/B8p0G3A3RqB8QbYwFWDgAbb3BjM=;
 b=d5HvkkPOO/1yR23MneOIi0oBwu6Qeh+BB8JudMWpaVE7FfYpsMjG3yDkNsCN8Mk7sk
 SkZdW0nBLckE+iyas6VT+xGOXqXGMXFnRhaAIxaZ07k20u2p0r63VH2lTXGITSUDe0gu
 AoPmXC/12w7iIL56sfnawhiNfvFzGLTxYiEQKH1dZVe0SthO8EF6n4XQ21iKXalsdOK2
 A6DFTuugbw2pvLKXnGCe5HD9O9ZGHRzI9h2RR9pNS6oJve/NOtp3IUGsJqLXfB85m0fW
 IiVCQhR0bJkiniKTMKr8G6O48RtZkuB5UuBxSZORFADsYvN8S9hkklnRmsS+jSeuoUxU
 CSbQ==
X-Gm-Message-State: AOAM530mpiIjhuuQeDRNQSlaSkOyl45gfF8ykh4hOqOICL8Ss4AEu7Za
 1oRpAard7RQ2+UmDNwp3NMrtT5wY8gIpaE+XZQ==
X-Google-Smtp-Source: ABdhPJzJYz+fyBLjsOWr76YEXLuzWpBMVdATp7e+yVnxro1rX8w4AIJwNDBOxf4Vh5dVRZUj4+RQR/pgQE2zI5rFog==
X-Received: by 2002:a05:6214:10cb:: with SMTP id
 r11mr5342385qvs.203.1591829225669; 
 Wed, 10 Jun 2020 15:47:05 -0700 (PDT)
Date: Wed, 10 Jun 2020 22:46:49 +0000
Message-Id: <20200610224652.64336-1-luisalberto@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH] mtd: revert "spi-nor: intel: provide a range for poll_timout"
From: Luis Alberto Herrera <luisalberto@google.com>
To: tudor.ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_154707_968379_5616447E 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 Luis Alberto Herrera <luisalberto@google.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change reverts aba3a882a178: "mtd: spi-nor: intel: provide a range
for poll_timout". That change introduces a performance regression when
reading sequentially from flash. Logging calls to intel_spi_read without
this change we get:

Start MTD read
[   20.045527] intel_spi_read(from=1800000, len=400000)
[   20.045527] intel_spi_read(from=1800000, len=400000)
[  282.199274] intel_spi_read(from=1c00000, len=400000)
[  282.199274] intel_spi_read(from=1c00000, len=400000)
[  544.351528] intel_spi_read(from=2000000, len=400000)
[  544.351528] intel_spi_read(from=2000000, len=400000)
End MTD read

With this change:

Start MTD read
[   21.942922] intel_spi_read(from=1c00000, len=400000)
[   21.942922] intel_spi_read(from=1c00000, len=400000)
[   23.784058] intel_spi_read(from=2000000, len=400000)
[   23.784058] intel_spi_read(from=2000000, len=400000)
[   25.625006] intel_spi_read(from=2400000, len=400000)
[   25.625006] intel_spi_read(from=2400000, len=400000)
End MTD read

Signed-off-by: Luis Alberto Herrera <luisalberto@google.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index 61d2a0ad2131..2b89361a0d3a 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -292,7 +292,7 @@ static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
 	u32 val;
 
 	return readl_poll_timeout(ispi->base + HSFSTS_CTL, val,
-				  !(val & HSFSTS_CTL_SCIP), 40,
+				  !(val & HSFSTS_CTL_SCIP), 0,
 				  INTEL_SPI_TIMEOUT * 1000);
 }
 
@@ -301,7 +301,7 @@ static int intel_spi_wait_sw_busy(struct intel_spi *ispi)
 	u32 val;
 
 	return readl_poll_timeout(ispi->sregs + SSFSTS_CTL, val,
-				  !(val & SSFSTS_CTL_SCIP), 40,
+				  !(val & SSFSTS_CTL_SCIP), 0,
 				  INTEL_SPI_TIMEOUT * 1000);
 }
 
-- 
2.27.0.278.ge193c7cf3a9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
