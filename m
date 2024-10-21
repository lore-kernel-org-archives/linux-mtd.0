Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4900DD17129
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vJhDGkmJfkr2N9HefIrr80L0vWGJ+v45oO9lmlB3wlA=; b=ORq0EQtfkNssiM
	WbJ8Fw5tQ6XUTaPj7CN87/M+FiPJxHg1kk2/1mJ1SNMP5dgn8gdnemurD76VbiFT9+5kvocOHNF2C
	LdsW1u2vmKJIQP3IiseCuqYJzQoasPxjVjc6dXxhALtlCxUPmGNtnNcb9IMjqfiVEb9HCYvbDI5mA
	x39Vco+U6ePShCLoVD4hFhepv/Vc+fIgu0zuDtUX1yhthb+z/1UVOJ1hlxXUmzVmMTzyuL6sc6kvO
	ekpLNyUwR1t7gS6uDmRzOR9JleaVbYfqX+kjQJ/ZDU77n8BOS5AE3vDTT2Rp15KP89rHkGuocJOWH
	9yYaDNp15ALr7tN1Ycqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2y5H-00000008RZr-3MfP;
	Mon, 21 Oct 2024 19:28:55 +0000
Received: from mail-oo1-xc43.google.com ([2607:f8b0:4864:20::c43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2y5E-00000008RZ3-2lcN
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 19:28:53 +0000
Received: by mail-oo1-xc43.google.com with SMTP id 006d021491bc7-5ebc1af9137so785064eaf.2
        for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2024 12:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729538931; x=1730143731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mBMfKxH8ag4Ae+tW4e9dl5gv0htsJvcBbJflchSvao=;
        b=A0KKt/VEFk5QHpvb2T+JaXHpLQ4N4MxfkIQRB91iLNwf/tCzpyHuhp9j4NCQBMtkVm
         eucBovpNJLFQsMPyaSTPBiKlJijjzUf6/Hx94iCRz0JrhOM3RVr+5hBhqLAKss/E//WV
         slTGd9ksUVRRRrDNlfmgf/UIuF21RfphxNoA/1pUf9x0MC08Zq8gNCoDivs0gVjNrYYa
         0ZRYeh/y9+HWOCC/em8zwXx4Ejm+nTrSWM375pOafRgmwdOeK0Um1SlKY6z5HsSffG1g
         f2rPveHRJGGQKI5IjyYGQeI9+Ll6EIfHvwX6hKwS/Pu+IyMcLZpeVmXD+GP49254rnf5
         FUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538931; x=1730143731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mBMfKxH8ag4Ae+tW4e9dl5gv0htsJvcBbJflchSvao=;
        b=unJtUp7pRLBUKbRCTTsbhkgJbB3Oll/b2C+fcfQhq3rKccVemaP9Kfh2aIyfG3HxMQ
         0Y713SeymL0lLvxGgn/ydsQcq8B+q5dib/jqdKCAFdw3/TPVH79CW8+OXjnKCA5imD/3
         IQiMBSxnwNQTNZBDH04yrUnGQfIqT8t4AV9EFmwgowPeWUdJo8XDcfEy6hF45K0Yfr7r
         uUfBSBfCMcLlZyt2KRcqg1yd/66hUxEuRYxd57WOejZwb/gCriiMomX0911e+srpAk3I
         lVVjdgyusTqbaShmeyavpjeSakv/ci0GeYi50ljmbYNs4dZ50fjON1nxvz5B5ePR251O
         5CGg==
X-Gm-Message-State: AOJu0Yxx5JMGNTcqMioEJQ8vKuU6OGNalP6hQh9pR5klbgTCWzu5Fu9L
	NNBq0khEFXN5H9Pa2y3qOfDiC9fYJ1kWmWhSNaVAULSSSQ+IIhzx
X-Google-Smtp-Source: AGHT+IHWaDOoLDGGoPDMlA1RKGm11L2vedehFpx1aK6iyPhGLpQTYtbLuCgVDvmQqSosUAwQb9mW2g==
X-Received: by 2002:a05:6358:6f18:b0:1b8:341d:36a1 with SMTP id e5c5f4694b2df-1c39de9e5d9mr450710955d.2.1729538929731;
        Mon, 21 Oct 2024 12:28:49 -0700 (PDT)
Received: from localhost.localdomain (mobile-130-126-255-54.near.illinois.edu. [130.126.255.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b165a8800csm201048085a.125.2024.10.21.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 12:28:49 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	dinghao.liu@zju.edu.cn,
	arnd@arndb.de,
	scott.bauer@intel.com,
	kbusch@kernel.org,
	heinzm@redhat.com,
	snitzer@redhat.com
Cc: linux-mtd@lists.infradead.org,
	zzjas98@gmail.com,
	chenyuan0y@gmail.com,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH v2] mtd: diskonchip: Cast an operand to uint64_t to prevent potential uint32_t overflow in inftl_partscan()
Date: Mon, 21 Oct 2024 14:27:54 -0500
Message-Id: <20241021192753.8582-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_122852_721061_14FE4755 
X-CRM114-Status: GOOD (  12.04  )
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

From: Zichen Xie <zichenxie0106@gmail.com>

This was found by a static analyzer.
There may be a potential integer overflow issue in
inftl_partscan(). parts[0].size is defined as "uint64_t"
while mtd->erasesize and ip->firstUnit are defined as 32-bit
unsigned integer. The result of the calculation will be limited
to 32 bits without correct casting.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
v2: correct "Fixes" tag.
---
 drivers/mtd/nand/raw/diskonchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 8db7fc424571..70d6c2250f32 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1098,7 +1098,7 @@ static inline int __init inftl_partscan(struct mtd_info *mtd, struct mtd_partiti
 		    (i == 0) && (ip->firstUnit > 0)) {
 			parts[0].name = " DiskOnChip IPL / Media Header partition";
 			parts[0].offset = 0;
-			parts[0].size = mtd->erasesize * ip->firstUnit;
+			parts[0].size = (uint64_t)mtd->erasesize * ip->firstUnit;
 			numparts = 1;
 		}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
