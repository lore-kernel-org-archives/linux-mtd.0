Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A5CA9ECC
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2026 06:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vUnVaWsZI7H04FF4uccNC3sWHgaFUafKx01tSOlCHHI=; b=YKu6v00YrVCaL0
	WVeBUDN7LQjDcWjuSO86+FIb93TXCZzIyI+YBZf78+QrR6wpHEaC5djUOET+Dh+O8+2KzUHqsX26Y
	SrPSZ9+sC91+Nk+X0BiVv9jOFE/uYzegajmc0Q+gfEty1O+laZ1xhIUzcx3ipqWt08WEz427ujbPW
	7uGNK3MeXInal+xPRKmbHe/WkCozqxKg7zzvzQZEFv5GW90nSSzpSZiEBYFDZkvraj5UOeV7rVT02
	VisGWzLIKsajvwefuIjdUlRWqvIZDdzee9c0oi2iEdugxgPCp8h+cqS0apqpDkL9/iJQ5frGvh8RD
	KtmuAJKETq2GYfbqsVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3c-00000008lR7-3Gs0;
	Sun, 11 Oct 2026 06:29:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFn3Y-00000008lPE-2NNV
	for linux-mtd@lists.infradead.org;
	Sun, 11 Oct 2026 06:29:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a16c399641so9475005e9.2
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=WqBb7NRw2IAs7JgWLfK8YTeLbepFMiI/8jk1AXFz5UhUoFWiiT+jC0Z3zxAm7thf75
         iTuGDeega6Vc3xI6kkYnOUPAR53uSffzF3bKUTvdvmTk8HtTSobh8q0L/jfBi5YTFu1F
         eBMqxfwfdsaPVJAY9PHu2zzLfGuRc0sHitr/w26cJO1+Oo/nsWIa6xu7xC2XishGRpe4
         A65hVuVkSkiO3Ze2ohiZ5d4k7sTkCSbAvR29aOgkZFpfmTKNYZ1lThZzp87GUZ5INObG
         BYz7yfE8ThBbXJFzTYkUXhnrnWffFIuqBFqj8iS0xoh8AblfAGbi+Dz/dFGIJzcs5hL6
         yOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=fzmwpXKWgSeIWHTalxM0Zvwwn3MM5hE8bdkQJaSMqzgM2bT3O8Lq3qPE9hUfTcUi+1
         Gi+WlrEmqGCSGOCQmaHp0N6JJhTrRnVTW74L9cy/JBRdUfHERaxaE0Wjv750PtF7X/Vm
         xeTnOFPNM53NYANWWUp2HJKNOZAQHV8cNkf6T8ELBbnY46ClR2pbdZkkhkkicGxE6LYV
         cgbii61NsY04pj2EKFnkaWQRKpBmsW1OIbyreo5F8mPAfVi5+wAbbs/N2IthY8xN2pDt
         9vuZhnzONZmyYXtl3h2SRIl3T5NErgdtIKUwSD13QgD6w5YC4e+ADAhpswAhCxSdQcO1
         duQQ==
X-Gm-Message-State: AFq9FYJ54ZM+sru0ncqrSJbnHC6mj5b95a93avT+A3TFa6Y/C/AbBQ3o
	9ntLAA/7lA7mUoq3GeUTbE2D0tIpEl6va2PojGlSMXLJVvoHbb5qRoEn
X-Gm-Gg: AYBFou2/uLR5suBA5CX/ok8R44CkTh0SG2u6ttijqX6hahXfeBqWz5XbGm9Y7WzaHkO
	Cwhh5b1pmyRx+KhAQ/DbwWqsgrUI7bzDLSkN6s3nDpviJPKexnokdm1uhQAeMs3mDqe7dYW5iDf
	0vDzv+z2DsJunQWJeLThDWuN+Z5c+sQhvglGMoS3ug3fZUnsyn8J7ODeHf3+qlXs6hzLYCDw/4P
	hiyh1JFa8+iQTUcjT9PpsMGTDypuAkVZbbR+3LY2IMkEkB1FhRMXQVwiiR04nLx0PEFzVvtMCa7
	Y7QxFabVxbZfaPljIOXaRLYQcuZkcnoJkm8z96E7rVLMhkboa7LPdl5BdxeVtNbDUy+C2jaVKoe
	0UELFfdtEBbyyH7wc8DOM2mc00gd30ULu2rK1UKByT8HBDusjbO3Zee6e729sPEQOfKler04g06
	0hVNkIwRroG6cfZPbGBHxNAvcLU6iltQQ8IfE8hnsI2ZMTpSg35lmBYuYLKv+CjszcT47JfUB5I
	xc6lTYnsu1ksfjiXB18fq0bQm1asoyVVm3P2yVrHmXTGXAwB04IDikf8eVGJ6sAJM0y8/5ECecO
	RNFiX8VyEjDVNuzR
X-Received: by 2002:a05:600c:34d0:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a18e47aceamr119132065e9.7.1791700150312;
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sun, 11 Oct 2026 06:29:06 +0000
Message-ID: <20261011062908.2365879-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_232912_635255_07284669 
X-CRM114-Status: GOOD (  15.81  )
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

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- cobalt-flash reads at an offset inside a PCI BAR while leaving phys 0.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. Add map_is_simple(), true when the map
reads through the simple accessors (always true without
CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors are inline), and
require it before enabling point(). Maps with custom accessors fall
back to copying through them; on big-endian IXP4xx, where pointed reads
happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v3: Assisted-by in the documented form.
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a..3f3364c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9..ccf1dbf 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2a..ebee3fe 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
