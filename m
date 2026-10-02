Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E5CCA5FE3
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaGxNAD3tgMLzqrAq/NYqflCa65bChfbt6Ercdaav34=; b=lba6QfjQeh99JQ
	p8Yd74thJZwkz5knwG6zdocSOvL7cEZeCF/FtAKMbqEKTOhezf4y6w5vOLBGoMFBEZQeQGg4nz6eW
	FAQ5WM4DKJ2/5ezzATHvYEibCAF70QsLJy2Ty5TQJzYsSloTC6ZlJ0eFjcy+u2uLWF/jDQBK9nFUJ
	AP6vqE8gShqyKGp87FY79nsDUQa3gWACLgWudxdEtw38Y62L9fXcxNAlME1Uu0Fi7k7GGwGO/VJWd
	jOHLlI2lcOJ3wl4FE6a/12mnNbs3Mi+d22FYzhRVEewLEd1LntM9F5f8CspHhuDEIv3PbHMx1KOit
	zLgYw4os3TFXPHcfc29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGj-0000000BYXI-2Oqb;
	Fri, 02 Oct 2026 12:21:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGg-0000000BYVS-47wY
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E0684E4110E;
	Fri,  2 Oct 2026 12:21:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DCF0603DC;
	Fri,  2 Oct 2026 12:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EE56103281D8;
	Fri,  2 Oct 2026 14:21:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ear8Ahh2j2AUiHu3vy3cVps1i5/MTD54IMpodJAajE0=;
	b=k9wVgl8y+pvQ06Abp8F13fp5ySSaNJqx3wsPDx61Egl7y6FMNuK6k5AMvHFNn19q8Kjp11
	SFwWznuxuV6f8yoYP8ctOyR6Fq9nF7dHsw1Dv8VPaSAIAA4VQ4onqRagxevbDD/L7sx5Ut
	odVAa9m7i2y9Y3uVR05f/5XUGyXe8HH7SuvVsv6YBs/ZqatqjZo10Y9A47l9ZqcmqnPs72
	Hnytw4ExJo3rhTl/MNBdOAukq6e/FtUumCRMVrqThkuiz3rZVUnFFMeFz/zSD9sRv7ZWmX
	a4+3EaIPRW7++fxt/9loKB+C8Tp0N/JNWHJUD5G5sH9Ly4F1fRgFD3vU3tXHtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:16 +0200
Subject: [PATCH 03/15] mtd: spi-nor: Fix comment indentation to clarify the
 intent
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-3-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_052139_187585_564C9717 
X-CRM114-Status: UNSURE (   8.77  )
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

The comment is misaligned with the content it describes and this kind of
bothered me when I first read that code. Move it to the correct
indentation level for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4b9e0410f2f5..2bbec3feda39 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2459,7 +2459,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 		 */
 		if (!erase && tested_erase->size)
 			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
+
+		/* keep iterating to find the wanted_size */
 	}
 
 	if (!erase)

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
