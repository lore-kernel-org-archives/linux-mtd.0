Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B0ECE8D6F
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HZvZPvl8++/S75Y9hTTBxBlSAJwR3PBlEYq9oE6rH0=; b=35+aBvGIJgnJJm
	BWGn9OsImlikro8O+tPv7hi+M6BMJ6VPxy045cvUMjajR3UhQf0lQtXaRMt62ynvfVkk8AJKacegs
	KKZq82PZu7aCIRj9sJlvzS07wI0fKGufH5Yl3qwuBV4Qu1dnvskyi/svf4kIvmEOJnDyQqqo72AFp
	VHphn48WpGPpzgrQTTnU8qBLKOyH3+DtqlT4+h1RaQ8bwjKTo0nFEwAJEwMxk7SdepiEWKHGKhfQb
	P5uB+ii3d1rXFC/uuL0VbP1JKlu2reXhv+FzMoxav3n0B0dVjbqlBKKgkYHojm3qLOznGwUvGy0H7
	GVQFQ5cTFlDH6VzoAC/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzJ-0000000Cszj-2oiY;
	Fri, 14 Nov 2025 17:53:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzH-0000000Csy1-261h
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22ABD1A1A84;
	Fri, 14 Nov 2025 17:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF8C16060E;
	Fri, 14 Nov 2025 17:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60B5B10371990;
	Fri, 14 Nov 2025 18:53:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zf6LUiYn/3u+vAWeXjeBqil6Me6m7QnaOwnhP98Y64A=;
	b=Nz//iQpTUagqt+7K8jY/dv2ImU9f5CC+4WRRpiyHwwQCxud4CoBcXBajJGtnEShOSwRwJA
	nHjEF6xhRE0laiJkb/aH8X1LJOj2YwQLUTXNkphn8yoOHVtwgBZeTLkcERBGHzu+IX0ZHg
	XpsvyAYqQw5BduFy7O5wXBOF5NSOOEBDkQ4F28vv5IWkbVDorPAQfajBR3sn4dkv266/xb
	26GnxI96ogCR3xiLBG3muBgyhqLkB6BvKzzurCamaDMaLP3sOj1RGEhao89FIdkxoHvITH
	qOhQ6YBofZ0UfNI9/BmJUlliSXyeuCqtquuhmPKTfCo0gn/r5D5OiO8Y5r8gOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:06 +0100
Subject: [PATCH 05/19] mtd: spi-nor: debugfs: Enhance output
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095331_675019_1CE91D30 
X-CRM114-Status: GOOD (  11.31  )
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

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad4399009185983549647f3be61ad5d1c84..d0191eb9f87956418dfd964fc1f16b21e3345049 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
