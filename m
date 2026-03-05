Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D770F513E7
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 22:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21xeVRt/Qdx4RFblcd5NAHTwyuAnitGqbacO5bitxmU=; b=pezx9fJ7dNMvRK
	HLsna7lfOITFzKKfjiyReV1YL8UvviKhSs0FE/n6I8LOm3jOS5RJ9/cpBcQLvu3Iy8HBer4mwFKZh
	XW3wC/Gdyykb2nm3jMAelm01FEF1MUBOmkxQWPDlJNpyIhBpr/cb8e4nBy1tiYkjqTUhLogIlwCuP
	lWj0x6uXJgC23FDOG2c0SBHDMksxryfM6RCtL5AsbfUxf8xON4/X9LC+Yz7kyk0mTzwbHnWkEIQfl
	/8jTjJi+3cZe9zkRzRq+jkzsa8yHQHyocz+x2LN57ZVFm+BKrNyKWWaVlS7ErwWzQjy9o0eVWEliw
	W462wEA0ooJEDHjd9ncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQo-00000002hA4-38cH;
	Thu, 05 Mar 2026 22:44:34 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyHQm-00000002h8j-2Kzw
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 22:44:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so8721975b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 14:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772750671; x=1773355471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOmbFn8ywU95rp5pZjzICmiW6tw+/7i3nDvDUHUWrQE=;
        b=hPprwu6wx5UzF5s/P4K1x8QW23+cErPg8qYkc9NWt+LkBd9OoYQqb1hJ20WbuAbC7v
         05s+vrxxx4Z6hFXs5Pwit/4/V8jSteoiHSnqUrD5N3XpjWSiV2q9bFBor05jXAsXMpSh
         P05M9JL/+cawALtyAAQz9yFw+ikpV8hg1kan2vwiktGn7nN5yypSjpyqcPTANHZi0ET5
         NfxvVyfVNR+mPqdkfTd8HDpWw12lCHaaEa1iy5hIKPVBLslUbVNtyr4z/0CNisE2zB0R
         cHGjtESCLs2r42BDtnnUrnpbGFzawUxgkjwbNGpTyRu0owydAhzejQZWFoncWtZtV4Gk
         D0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772750671; x=1773355471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOmbFn8ywU95rp5pZjzICmiW6tw+/7i3nDvDUHUWrQE=;
        b=GZjbjYZ45S5YjuqC1KRJxMtuBaHSGqH49J81j5lINqL95KzYuXles2CmsGzShjxECO
         TS7TedPW+qD6AowMriyRobebRzwdWs4WDDt1IrA8JcKQNgHXVkl7NZIrnDfF1SYq3UFT
         6Z7w8d9k2DXhE5EpmkJf5pdO2dIAmJlmIj3zEp+HkDF7ZYzS0SoJBHECtlmUd3hiAXaA
         IpIAJxCcvMM04qEQAEELjGj80Ivi59F54aqOBDp0CKbwo0UEEfF60kHH6NXnHon5Yzr+
         KO/eZ+vPmi/zrZRxbQLolkYlklGBh46J51Q7fgPSyjRu5yORBjOpO48aYk6nzu8IRDJz
         tt2Q==
X-Gm-Message-State: AOJu0YxpTbbWtAEt/mkArhQKHosCtzsmKha6WauEk3muNXHTo2XruQUM
	moLjHL234kwCJCQLKmX7IJannL1A98zVHSg+LSYtW79os79jb0kivjXcNzxkxhNTsnQ=
X-Gm-Gg: ATEYQzx60JVPiHfTSb6OgNLnpXsbe5mRNis2Dr9Znj1Krl1Ia2N8gHdPgEg/T4SQycE
	AdQDcywSaXD6Y/KZeAr4C7hijggQus+ZybescCeu4pRGVcGnspFNCI4rQ/KaWbFBCrFlDuve6hY
	VFr+sWU7vGnfcJdnFhev+RQbFJaLbNXeVaMFRKBkm1sZjRcXGt3CxT19kvmJYfUKgEWWBg8ihS2
	6fbe7l+Q8BhzUOFPhST0/GUGR/Ey+iGw0btGTii4wDTfTQOuInIEI9WzLl6C7TK+dnsCqjRiDyV
	8B7KkF1Y30/xys/to8q2FrEJg8NnhKN/zA99a4+Pzd4fcZGVX/9j8rCrkJ88dnOv+Grjwgb5JJY
	CmTBgEXAHqFpilAC1XeWvyG0d2vdTmpFvWe2OtQ8q5GTiHl3NF4ixyKxg0VemmG3i+mE13wz5Uj
	gcyonFCt8SHBrrzwx4EoNGAHJ7YdWLBfXizRtUfwTziT4fxhv3+q+KWw==
X-Received: by 2002:a05:6a21:6b12:b0:394:65bb:d1b9 with SMTP id adf61e73a8af0-39858fdbd15mr159399637.20.1772750671359;
        Thu, 05 Mar 2026 14:44:31 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738877202fsm3565477a12.25.2026.03.05.14.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 14:44:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 2/2] mtd: concat: replace alloc + calloc with 1 alloc
Date: Thu,  5 Mar 2026 14:44:10 -0800
Message-ID: <20260305224410.14251-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305224410.14251-1-rosenp@gmail.com>
References: <20260305224410.14251-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_144432_619987_9124A8CE 
X-CRM114-Status: GOOD (  16.97  )
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
 drivers/mtd/mtd_virt_concat.c | 8 +-------
 drivers/mtd/mtdconcat.c       | 5 +----
 include/linux/mtd/concat.h    | 2 +-
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 33f9a63dd450..b56f2431974b 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
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
