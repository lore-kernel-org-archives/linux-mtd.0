Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F77BEFCE47
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2026 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/9IkWrGglDmx6GycH0GvRv26guZn5bE0FkaPdKwX+E=; b=oZ7Qsh+Ac2KQhP
	a7eEduNNFULMAO/HRnGQ4SFlBQTF+/6s6Atecj0Z+UE2D0RU92XXn4diyYKiw/2Ek2no8qdQuC9+X
	nCfh6rOkVo5XDYtozsTtUzsbWIENg5cTPu+WDje3xo2ZQ4P2BJbfzHR0cDGvk517UX+UXuApZzYFO
	uIirdv+Po+QMikbXadVXUMpG8/CATwfQu89kwjwQ2UiHDRFmIhOOD/Yxem42clakT5oHf2xwvOwaX
	5M0DEtfBwI2KoRJnfbYwzdUkRkd7kF5m8KKhmbjDxc9lhulxxwyz0Nv39owtcodkv20RRt1slFlDq
	lAmdwRyIFE7EMzfSa61w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVY-00000000ZDG-2w8m;
	Wed, 04 Mar 2026 22:15:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuVU-00000000ZBf-1h40
	for linux-mtd@lists.infradead.org;
	Wed, 04 Mar 2026 22:15:55 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-827307b12dfso3952951b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 04 Mar 2026 14:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772662551; x=1773267351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6xGxKiEmjafobho7Pm8BBn/5trBV+odB8B7flKPqK4=;
        b=YsW8XUWwFtEVFWcACQq12syF1W9GsqnSEOGYlTDkU0qzSvNLB5BH4NUE8OIJwceDZ+
         VetM9ttD7BIWv8cMIeXvA06A3iScd9a0C1z32vIT6v0baHUxEPochOJ4HKmAxHZG+Vty
         JnlHqf2hYJ5hrGAd8EQ1bma8Ara8GV7zW3xOgisqcobKV1BI+Dng5tMeLqFq78RfY4bJ
         JtFHdNRD0bMVjbn4mww1HnCmnnRHIhjRJALUA/qEv18WJmGlKd+kmlWfxNGiACQu7ziA
         aBPEldD2fbO4hPnmz+0OACJF3t5DGKe/jAI9vAZDyMojwPTLaq7eERoavVd5R12K6fpm
         u8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772662551; x=1773267351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6xGxKiEmjafobho7Pm8BBn/5trBV+odB8B7flKPqK4=;
        b=UblqMd1769bJ34LakOCvg1Ua4obX/O+hfo9HNlBhuZ0UAuaDOf7LF/DMcv1noYPgB1
         5ntDDVcclBbNRYwj+qkMxaHbkzAF3EDueqiGdsp5ervZE6eAAe9udI+k5IIWh8V0VO/K
         5zGIXDIqUsxtcPLGeJY8dzWdNLjI5qUe4/OxSYp99WRxhh3E0cnH4sKvMw7PvXrvhqLW
         5tAEnH3094ikD/+u4VkWBk0hJCi0Aev+2GxR0Y6e9PF9kuXQV0ma5ibO7qnifE1A/cBC
         zXxQSKgKj98Tw61YxqU7bhuofpLTB3iw2bHov3uVolzdxF97WXLTuNBopj3x2sqR9ICU
         J35A==
X-Gm-Message-State: AOJu0Yx+WlsZ2kr07P6it9N5ntQ9ZA9pD3m3dV8yUx8SeDSRZv9ZB+Ie
	bycD1Jh63HvuEYFqtnFgDqEdh1WZcXAsN4jVptZt2TDmowG7KsG3c5mjywmGfZr+fk4=
X-Gm-Gg: ATEYQzzG/RdFsJxefo8vQBJxDcWoy0cvgd7xMYYpbkK/kPyWZytV2phal/b/FBLwj+P
	IJL4kVYWHO1Nt7PyaEQRFx1Bz2f9xWEB1qVuaZCSSC4NiFNnntNOIcmEDZsgVBIPQeZ7FUh4X7D
	7xsyv1hOhsV7xXI14MWqcpgnRwuvQF6gzurcNjdi1f1KHfMTHWjdSdzZTeuSa67R67MjutKmJ5p
	HE9Or3SwEqj9Te62zLKNBCKq88s0F6aK9juD5CA/4MrKK1fcqD+Z3b/9A88nGL9Yet72UcACAR+
	KgBUSDVNY++yheN0IHTEJxcT2dFSxWDbnsgeBYjd2/iFuK1+6TqTNP9t67Uljg+A2IcD92r/xRZ
	0nNj9IefEas+R3fdCXAvzkjxiCOL+QSIvdXqjdnv/XsLlcbdwrH9UTAYa+rGL1R/lStGtK1QSe2
	HnPVsNIYWg6xxxvz6+FHPH2rEc2JKLdqPxLdG2xkXWuHDc5g6aFNcFlA==
X-Received: by 2002:a05:6a21:207:b0:394:782c:cb8e with SMTP id adf61e73a8af0-398425c24d9mr73436637.28.1772662551223;
        Wed, 04 Mar 2026 14:15:51 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa6203a6sm17637399a12.8.2026.03.04.14.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:15:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH 2/2] mtd: concat: replace alloc + calloc with 1 alloc
Date: Wed,  4 Mar 2026 14:15:30 -0800
Message-ID: <20260304221530.15018-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304221530.15018-1-rosenp@gmail.com>
References: <20260304221530.15018-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141554_223944_4141F44D 
X-CRM114-Status: GOOD (  17.61  )
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

A flex array can be used to reduce the allocation to 1.

And actually mtdconcat was using the pointer + 1 trick to point to the
overallocated area. Better alternatives exist.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/mtd_virt_concat.c | 10 ++--------
 drivers/mtd/mtdconcat.c       |  5 +----
 include/linux/mtd/concat.h    |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 89e223edac6a..b56f2431974b 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -32,7 +32,7 @@ struct mtd_virt_concat_node {
 	struct list_head head;
 	unsigned int count;
 	struct mtd_concat *concat;
-	struct device_node *nodes[] __counted_by(nodes);
+	struct device_node *nodes[] __counted_by(count);
 };
 
 /**
@@ -182,18 +182,12 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 	for (i = 1; i < count; i++)
 		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
 
-	concat = kzalloc(sizeof(*concat), GFP_KERNEL);
+	concat = kzalloc_flex(*concat, subdev, count, GFP_KERNEL);
 	if (!concat) {
 		kfree(item);
 		return -ENOMEM;
 	}
 
-	concat->subdev = kcalloc(count, sizeof(*concat->subdev), GFP_KERNEL);
-	if (!concat->subdev) {
-		kfree(item);
-		kfree(concat);
-		return -ENOMEM;
-	}
 	item->concat = concat;
 
 	list_add_tail(&item->head, &concat_node_list);
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 241d15235d01..c97167d51fe2 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -627,7 +627,6 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 				   const char *name)
 {				/* name for the new device   */
 	int i;
-	size_t size;
 	struct mtd_concat *concat;
 	struct mtd_info *subdev_master = NULL;
 	uint32_t max_erasesize, curr_erasesize;
@@ -640,15 +639,13 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 	printk(KERN_NOTICE "into device \"%s\"\n", name);
 
 	/* allocate the device structure */
-	size = SIZEOF_STRUCT_MTD_CONCAT(num_devs);
-	concat = kzalloc(size, GFP_KERNEL);
+	concat = kzalloc_flex(*concat, subdev, num_devs, GFP_KERNEL);
 	if (!concat) {
 		printk
 		    ("memory allocation error while creating concatenated device \"%s\"\n",
 		     name);
 		return NULL;
 	}
-	concat->subdev = (struct mtd_info **) (concat + 1);
 
 	/*
 	 * Set up the new "super" device's MTD object structure, check for
diff --git a/include/linux/mtd/concat.h b/include/linux/mtd/concat.h
index 2cd9d48958a8..f8d4d6ac1fc1 100644
--- a/include/linux/mtd/concat.h
+++ b/include/linux/mtd/concat.h
@@ -18,7 +18,7 @@
 struct mtd_concat {
 	struct mtd_info mtd;
 	int num_subdev;
-	struct mtd_info **subdev;
+	struct mtd_info *subdev[];
 };
 
 struct mtd_info *mtd_concat_create(
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
