Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B790E65298
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Feb 2026 16:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xy/TRIqSAWgCgjbYH1gTpWDjJPiIf9GJBr0rkAyB/eY=; b=tVi8dav/8b5eUH
	Jflc5SclADjkczRomt7jCmu4ViUT2jNljej04D5oV5e0fW/AKXM/MNdF9SYDxDhJNwYp//9+yvNns
	aVFF0jwZrTQ+Sp0ZMskZvMbFqt+xrxxcfpQduhjEqritmR63L5AWQEEDUvtliNnaYbYcTHf84IBrE
	+dpHRb/V2IlfFRgzlvAYbP82tQFC9dLoGSB0tG/zEb6IYXlj0DsiSASX1rLPsoSZQe58EP2SW30g8
	vqeTCBS0qft27yLn5tAuumtTQYkBGlDzYSvu12Th/k6KEetpUQRiIvvuo1x/riSydU6ycvqEmd+5j
	CIj7fU310olMAzhG72/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmamh-000000040oa-0GEb;
	Sun, 01 Feb 2026 16:58:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmamf-000000040ns-1MjB
	for linux-mtd@lists.infradead.org;
	Sun, 01 Feb 2026 16:58:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a79998d35aso23651215ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2026 08:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769965128; x=1770569928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKlyXwPFG6GKEH0YaZ7/fSJxwTIFwYdtxia1Wrm6PzE=;
        b=MBf6eeX+ZicPy/RQSHE9mRkC6kCAbgB0HehKtZAAwctnDaWhyNDQPmyyknQKqrk3cV
         PXw8x6JyhI7VYAM9L6ZXEO/XIiJYn9t0eEnaVsnicDo//PcZWSblDdceKTVshkg0f3hn
         +755nHCrCIlI6A35aDacyxEE5GO7nsIz+80RQemKFrqPT6YYJetpEBw4v042aWLscGMg
         3uyBZNrjW6EC0CMvYUqPik15T7Vdtk8nROMOmWrrihZlkLpJUA8/TK+6Vj78VbBKGr8Y
         BUCt/cZFGoM8DQH0A9v2v5NGCw60x6VzwSmhgDB+uxgSeDagKUvC9Ol42mptNa3xsjuy
         tEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769965128; x=1770569928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKlyXwPFG6GKEH0YaZ7/fSJxwTIFwYdtxia1Wrm6PzE=;
        b=FE5g9/yvlbJ0yNLrzGUXxRIkR9hNl5gbf/wOINYlnqZYd2qII94N5CZr6O8fx3T/ZA
         gK9AhtKMZPXd9I4Zwj2BurrxZBeTny85Xh13m6P79+lf6IZ9B52WSWRnX6zg14VsK0uw
         dU9Gj7x/nGPWWcIHKVz1UKnpGhON7W3/xtPLREHkKZkZ3wFjPhl9/tuPY+k+VF4PgIvE
         y9tCVB6QILenta6rJS+WQ0SzTvA6K0lNunfdpSfGUqGSpUT+clqdCW63ErrCyfWjH/Cq
         kYaSJy+nGyzUK1A2QQH9MZQndX/uEW2cqEMtQDS/eKLY1GKF20yJtpGVu8wIUAm9HiLv
         k5AQ==
X-Gm-Message-State: AOJu0YwpH9AGeCqeLjAaf5psLSDF8Qv9A2ANyMmytd8Unf5P7T0/jGJb
	+bVZF3RmvbwQChRjsXY7PA130tPvSgldTIiVVA1Qz+jPGucmY8a3GGt5
X-Gm-Gg: AZuq6aL6d+K8Hh9MqC5EoxIZvXNmcXBv9UoknLz0e/3vIjGJQN5RAfiemiUwYGixtOH
	FE3nTo/NTTB9pCQjz7ZbECI38FwTK5OboWLrKKT6LUryZzP+UI+2FCv8n6rl6uqU/3TKV+qnHvP
	KXe06GAZKUHknm6i4ngPbO7SEzN34T7rq8xSIizGdfvk19O06mhtjwHhm/SmzdZKecHcql9hfGb
	G5CRrZEzhl3qo0y5SJosjkAbs/Sw5qIloouOEVBczSWfGJIkGG66t0yQAB7tK/Mbxa+DFXaL44w
	UKIm0HthqtEzQEeRmG9jt1OS5WsXn4IkHtpyHzSn86Zae/1KxGQ2ACyo66S2gdIBwlYovQzEtDG
	l/937EJ2Kxz6PPpjhWta/u7kysq0SlEhKg8ExOeJNd0Nz9qE9UA3H64cbRBgqiMbJmR3PvQ74pi
	4AN+prAQNB7qm67Fd/XTuLQ2RWdrMWNjEHNeo=
X-Received: by 2002:a17:903:2bcb:b0:2a1:1074:4199 with SMTP id d9443c01a7336-2a8d9918dafmr92847555ad.32.1769965128369;
        Sun, 01 Feb 2026 08:58:48 -0800 (PST)
Received: from 4aee0dccb4bc ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3afdsm120222755ad.61.2026.02.01.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 08:58:46 -0800 (PST)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
X-Google-Original-From: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael.walle@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sanjaikumar V S <sanjaikumar.vs@dicortech.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is not available
Date: Sun,  1 Feb 2026 16:58:17 +0000
Message-ID: <20260201165817.53-3-sanjaikumar.vs@dicortech.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201165817.53-1-sanjaikumar.vs@dicortech.com>
References: <20260201165817.53-1-sanjaikumar.vs@dicortech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_085849_364593_1CCD1D1F 
X-CRM114-Status: GOOD (  12.44  )
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

When the SPI controller does not support direct mapping (nodirmap=true),
spi_nor_spimem_write_data() calls spi_mem_dirmap_write() which falls
back to spi_mem_no_dirmap_write(). This fallback uses the operation
template created at probe time with the standard page program opcode.

For SST flashes using AAI mode, this fails because the template cannot
handle the dynamic opcode and address byte changes required by AAI.

Fix by checking nodirmap and using spi_nor_spimem_exec_op() directly,
which uses the runtime-built operation with correct AAI configuration.

Cc: stable@vger.kernel.org
Signed-off-by: Sanjaikumar V S <sanjaikumar.vs@dicortech.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3b..7caeb508d628 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -281,7 +281,7 @@ static ssize_t spi_nor_spimem_write_data(struct spi_nor *nor, loff_t to,
 	if (spi_nor_spimem_bounce(nor, &op))
 		memcpy(nor->bouncebuf, buf, op.data.nbytes);
 
-	if (nor->dirmap.wdesc) {
+	if (nor->dirmap.wdesc && !nor->dirmap.wdesc->nodirmap) {
 		nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc, op.addr.val,
 					      op.data.nbytes, op.data.buf.out);
 	} else {
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
