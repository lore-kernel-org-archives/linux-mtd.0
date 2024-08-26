Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC104C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxvXoAYkgc//nmfulx/MGT2MBCqR649qyZSu/gn1PyA=; b=pDGnn11zN/lai3
	5pfjvDRtLFGB4wOrOkoUcNbtz6Qma4bUvz8M803hLmtbBrCzAvjEduWGKe+qg2GWRFS+5i/N1cOuF
	fAGiRDNV0CyYfYLC42ldsht1KgIh8wYOuvLFXB1ekeJZwZzzp6u4vR/PaKL/IqhC5kXOj2KF668hK
	rez4t6dkFYElCi8GRK16Qn2cvXQ465b84/3PZgbz0Hb4DtDc9h+Z+/jvNpvtxfWWpXdLTjPseR/dQ
	QDgzTCDr4jvgOUpX5hOmx/7qTbtB9pjsmBZpIuTF7vwhAke0hrkIENxGXbx8CriOWSCNl6h9P+9tw
	sNtkgijQC5/SBqEes9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMx-00000006lpc-0c0c;
	Mon, 26 Aug 2024 09:50:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ3-00000006kUV-1X1j
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C11BC000B;
	Mon, 26 Aug 2024 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98/GyyqNmsf2nYRjYC2j52ntHiuGsC2XFpthS0Dap2s=;
	b=bTvx87TrVdDYNMaNisiKxbW83ijus/WqPXdtucaTuECxDykPnm32J1Nl/zt61FgF4WYGCf
	WBxH10UiUgtdMrmDBwSgloS2LfYrQhB7IRXfsoHz6F6x7JdGdRmfcZvMtJsXti4kAbBuwi
	GPF56y2g2ET2/Cq/LH0kAJGZiGCFFkpMlTGr3WPUg175AZrlRqU7GPlxGpK7de1YdDhFEs
	NL19vmOsNZJJjzXq2k9PUssSAKvs4DtNbUvoN7GSI3yOHRCPSh1W3Jzy1UL5V+yPNAIJgo
	LFwQx+/z46tFWE+9kppeFyI+BhEbsv61X/lluo0vaTzfLVIaBwpSk+x5nAhvdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 06/10] mtd-tests: flash_speed: Drop an apparently useless block
Date: Mon, 26 Aug 2024 11:46:25 +0200
Message-ID: <20240826094629.19065-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024637_605409_0D36422C 
X-CRM114-Status: GOOD (  10.13  )
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

I know no device without a multiple of 2 number of pages in each
block. Even though it might be the case, it is clearly not a big deal
and we don't really care about reading the last page, we are doing a
speed benchmark; so as long as the throughput calculation knows how much
data has been read it's fine. Eitherway, I don't think we ever have
fallen in this block because we would read the content of two pages (so
one past the block) and put it in a page-wide buffer, which would
probably lead to an out-of-bound abort.

Just drop the block.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/flash_speed.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tests/mtd-tests/flash_speed.c b/tests/mtd-tests/flash_speed.c
index 3489233..f542a8d 100644
--- a/tests/mtd-tests/flash_speed.c
+++ b/tests/mtd-tests/flash_speed.c
@@ -265,13 +265,6 @@ static int read_eraseblock_by_2pages(int ebnum)
 		}
 		buf += sz;
 	}
-	if (pgcnt % 2) {
-		err = mtd_read(&mtd, fd, ebnum, i * sz, iobuf, pgsize);
-		if (err) {
-			fprintf(stderr, "Error reading block %d, page %d!\n",
-					ebnum, i*2);
-		}
-	}
 
 	return err;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
