Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB902CD342C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 03:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8S75h88u+McHlrxrUdwiKuNmn5m6isDUB1MsZ/kGiv0=; b=tJLFHJCznynwU0
	l1gmjHdwQY81n4SRKrwmPPMxtSZ0i1vskLu6UQQqMesbvAIukT+3jbkAZ/nxGBiYLrXki5m/BtLbz
	E0yzi5LmS9fHP5MkWnEd6Sn6BWqn6sUQXQ96EqYvJAst6oZUVkWadEyBzCSG8TR+pNaqFkJ39uJQw
	hCUVdQtoIwOx/UZnepLXyE47tttQ4cquilrx2CtAEOR950IqHUkrfbil2yGNU537iW8pc7bu9bYv5
	XQ4Z2ZlhTAHAxazUe+EselxzQwoW1VDJPQ9s+vfxHfzga3xMiZR2cRpOLFeebFv69gJK97JLSts33
	H4Re781oyV1Lumqv5bDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpKW-00000002cjr-374b;
	Thu, 07 May 2026 03:23:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKpKV-00000002cjI-1WgS
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 03:23:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ba4a1a0325so2707205ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 06 May 2026 20:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778124194; x=1778728994; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdDg8/HMfxwGVYCeCx4VqYijHS+xPr41cT4+HzVmNBw=;
        b=DFecDhYv75m7/hTChYxtJwZqocyg+4wk6FckV32pv7+E8b2SxfKrvEzVez00Cp1wLx
         XWYaX8MF2CXg03qWqvU52EY2qyCUqZDsZC3ygleLt17nZYj+CDOlSYw0FQlGOgEI6t/m
         9oN7t9IwJWOmYmom683HqIn+ZU2RPLqTymnhNULti/QOrvwuAbnpIuqHk32C15OnBoBd
         990/STWzSZXsPJedm+L2Gk5lBR1yvTw7vNvPjpJl72zmtWE8oo7KX3g3+W7bM28Fb5vS
         CZHgrI7wp90EAheTuMStz340PpTQTuxRAAJ86AKjrX5nOldlBWsyoJv6zFjNpWe6gGqE
         iCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778124194; x=1778728994;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdDg8/HMfxwGVYCeCx4VqYijHS+xPr41cT4+HzVmNBw=;
        b=HpJ9qRgsSMDoAFyYKw0V+G1fG545lQUScrhmh8VmTpTe/beR29kVF59uZQmtLY1w3f
         YLYZcXW+lDRkPAYrrOkqleHQTbyQVotLpqNhf6vssAlHBrAk+f7x7LnapBwh21t6bOrd
         +wn+T8JlFzEX65HcvJripEorcf03JaIaZaHUBN5bsT6gjgNz0tCkTRJc8Dxodji+LUyi
         I3BpMfm7OWacX2FjOft4R0J4rSFiEeuccdjGank0q3Y9+vcTiJYYovdclnbsNFHT6/Ef
         xSyaFzqDBCLUyDftiKk8zYhjonEkryWylbTUoGmQQVnChSvZdXiLf5qDjWCaBnxmqUK3
         tKEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wFdXYpp6uGzEALn2tGgnDSmvJPQYRvNXWSMHgizlOG/l2iR2ctuCCi6P9/fOe6uzhXVK+qlJi1iw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNV0KHvxOp1OLryPLfpPi62Oodqzpp4R2hXtk0wODkqKZHvswW
	K31ewrsMpGSgF04Rv76lJXYIYEInOy/3dKu6sbcFQ9JhJJi4GVhWa/+k
X-Gm-Gg: AeBDiesvGvjMBMsFOLYN6HcvKUivg06/4pYQJACyuJclCK90NQUW8XFK8ZYJEI6a81j
	wTvnhSG5atbfaVeOBo/7V51Gxl/ScAMZsDZXCTRf9CShlJmTOEOIb+vUWpsjlXyZewizKl+lO8X
	dIkz9ilHuFjJbFVND0ZxSPCbEjPJaQOTJssAXnrXyoHxQ7Pmun0ULF7N93QRK06jMPBfyd7Q/kQ
	ffBqLqen3qz793cVmSrBrWfopXq8/FjLtmAoKl+9T0dShz4FmXBAbyjYIRv32+pVy0y39C5FQLW
	1kU8/1rKViSFp14HU2z4uT4+7pxsFyvWR6gws4X/R0sw0pq38dABJynfObFaavyF3RBwxDgDl3R
	GM9dJ4UkjltvwYt4FjdjUMQ5tUoJMT/zbtsCaqwMm3SR/Hqcq42MTMDgXvvHI7EzpVRWICII652
	ESSusyHQU66hEChvR1XxGnUW5CPSeINABSu/YHRT3IqqFaQht/1cXCYlS9uTj1zQWw8TVwillI
X-Received: by 2002:a17:902:cec8:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2ba794b80d1mr66074765ad.22.1778124193787;
        Wed, 06 May 2026 20:23:13 -0700 (PDT)
Received: from localhost.localdomain ([123.139.40.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2babadd2427sm7435005ad.38.2026.05.06.20.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 20:23:13 -0700 (PDT)
From: "haoyu.lu" <hechushiguitu666@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH 1/2] ubi: build: replace simple_strtoul with kstrtouint in open_mtd_device()
Date: Thu,  7 May 2026 03:23:07 +0000
Message-Id: <20260507032308.16485-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_202315_411692_34C73D1C 
X-CRM114-Status: GOOD (  14.52  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Haoyu Lu <hechushiguitu666@gmail.com>

Replace the deprecated simple_strtoul() with kstrtouint() for parsing
the MTD device number string. kstrtouint() provides stricter validation
and better error handling.

In open_mtd_device(), a string that can be parsed as a pure number is
treated as an MTD device index; otherwise it is treated as a device
name. kstrtouint() returns 0 on success and -EINVAL if the string
contains non-numeric characters, which aligns with this logic and
eliminates the need for manual endp checks.

For compatibility with kstrtouint(), mtd_num is changed from int to
unsigned int, consistent with the existing simple_strtoul ->
kstrtouint conversions in mtdoops.c and mtdsuper.c.

The multi-line comment is simplified to a concise single-line comment
since the logic is self-explanatory with kstrtouint().

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/mtd/ubi/build.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 674ad87809df..03ef195dc25c 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1210,21 +1210,16 @@ static struct mtd_info * __init open_mtd_by_chdev(const char *mtd_dev)
 static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 {
 	struct mtd_info *mtd;
-	int mtd_num;
-	char *endp;
+	unsigned int mtd_num;
 
-	mtd_num = simple_strtoul(mtd_dev, &endp, 0);
-	if (*endp != '\0' || mtd_dev == endp) {
-		/*
-		 * This does not look like an ASCII integer, probably this is
-		 * MTD device name.
-		 */
+	if (kstrtouint(mtd_dev, 0, &mtd_num) != 0) {
+		/* Not a plain number, treat as MTD device name */
 		mtd = get_mtd_device_nm(mtd_dev);
 		if (PTR_ERR(mtd) == -ENODEV)
-			/* Probably this is an MTD character device node path */
 			mtd = open_mtd_by_chdev(mtd_dev);
-	} else
+	} else {
 		mtd = get_mtd_device(NULL, mtd_num);
+	}
 
 	return mtd;
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
