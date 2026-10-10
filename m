Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80335CA9EBE
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=99yUk4upnE8qqXQO63CGdn89MCyW0l8oND+UYpbFabs=; b=iRTQNrsIndYLXA
	vzLa4lZ7WvSH1l0L6Y71s7owl3iZLbZIYhGckUcnfpRfPs982qN/yhLrBtx9eLG1KgX98V+skOWe7
	fmOnWdZ6W6Ymo0O+eSEv+iz1jus9l+jjUaMLO+Ff0R3K/0EEIkHXXXhr52NfpIy4+aP1owR0B6+qo
	C3G7iYQ90GEoDLDNLvQ1NBvjK+IXroXXGaD9CV6PIqQXDgQPbwvfFkcM5InfxGRv8fnAbbEkg8z1Y
	WqA62IwqvW7B2QDYjBKRcaHWWTMzsRPqnT9SVT1RG0GV0Sxm6b10tAQO5/t++I7phE1XmIUzPFWSh
	8mQueZ2Vyf4ZSkF1rTxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFald-00000008K7e-09VD;
	Sat, 10 Oct 2026 17:21:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFalX-00000008K5s-1BwW
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:21:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a168355946so3299945e9.0
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791652905; x=1792257705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qo+NIhwvOu1T9JxZoi9QpjQESvimOYlY1W66aeevIT8=;
        b=r8bmDXt7CLNwAVJB+yN4Uci1KKd90/4hXbnKbF8kd18puVBcdHzcDCYQRh/pL7/XH2
         tNg777mZ1GZJfrn7Q7lbXKYgPNdxH2EZEaW8DaQImg9RTI3qTykZp6A5LHwzrp1CseJw
         dHt4awpe5zKxw3KMHW7yQsHs4Oc/wpNYFLonaRRbmRwqR2SRjBssQ1BFH9wVPhzgJm5L
         /U/5EzvrgxRUvFJCJcN9Ml6AZauKNG+HxjPLuel6YmqAB17Sh8h0YUm1U4zCGJHY1Roe
         s09Ghi+sa6LtX7HwZLshZL/Bo5m6fCL2+3gTzxtxN92TFg+eEUrYXBlK6Um06z83xP20
         H8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652905; x=1792257705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qo+NIhwvOu1T9JxZoi9QpjQESvimOYlY1W66aeevIT8=;
        b=ZvJdvbECdEjWNN0aEHLsKgXKAezLtrv7WugT12BcngvDJ589o8UOUlCPoXLdfii3T3
         RNLL4keEs7/dxs14BVsGq6/wJyLGSod53SWtsmOOElAkDLCDfzIrT/ZrXRMHCe5W9Fnf
         WIt9E1EcKzqU1f98NrYkk8UOiShlkxl6xECMXCMYsxUfSvhnPJwI9xy/6xiRaKSLdeKO
         mkekE32wpRmEwHcX7lq5nf0XbDHYu8ibt7M0o/rU9/tHWwK2wLwHHZrwpO5TwnASTVan
         PZyQvAWUlfAkDvIh8hI1leLX88PBwOCp32MLY78noz+PAX3liQlWNqLhwqumsxdpdRIT
         F5xQ==
X-Gm-Message-State: AFq9FYJ4e2VPzDitGuYDeRiyVKgf5aq3La43htDVDO4+MT0Z9nZ7JNnd
	bCmVA5ATB+x4M9VlcCEDX4Sa8NXQPQuqevimAnJepH0FrdASnx/ssV/N
X-Gm-Gg: AYBFou1Hxg2o0Yqzux+hqOnqh3Bcvc3YG8jRxsKrVQB+Vxzyr3FDlROwlpNn/s0Cy1v
	roH2zv3rZzPs95QhN6yAuy/z0lYRTk+FadRM05XmV3f0R5lx1efLvp9IhZn4uZ031obUC9vwkBw
	G64mv8ibbIakZ4Ws+6mG6chdjlC0mTi1uekQJRA8LOY8etCC4zQ67aqNC4ZYDnYK/1sUGfEhdOu
	mJZ89Mo0U95+dHgldJ8da3S8ND9Z+w136HwjU9f+qq0TECm7Tjq80IyEuNLwf7hyzNkzADjPlOb
	OjsomGkWhbw63e3/K1fNyeCtcdw2iCLKaup+M1QOdiJAz+uGbN/JsVqzEIWGyCGG9Bp2+8k70mr
	Zn5h8ep+CSeoP4VvtJ0iROcdH0JMBag0qSH4S+SEWox2CezNM6htrEd9VsvDphJ2xxVNDQciYNe
	pe2xdt9Kj9hyb7rjhEY8dVSOP6PZZClfFUsHFIt+bc1U6Udvg6dIaV68kvv+EpTDdL9I4atm5SK
	hygNH+h9cM+vOGfAItlviSGse73/zsa5PsBjMk2MYhB/eTyrCNUSPdaVHxfZTBSrnaTOSC5tF4E
	RsH1xhXrijKwFDQA
X-Received: by 2002:a05:600c:609b:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a18e4ca1dcmr90132655e9.18.1791652905111;
        Sat, 10 Oct 2026 10:21:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm114159655e9.2.2026.10.10.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:21:44 -0700 (PDT)
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
Subject: [PATCH 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sat, 10 Oct 2026 17:21:40 +0000
Message-ID: <20261010172142.2138956-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010172142.2138956-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_102147_354565_804AC627 
X-CRM114-Status: GOOD (  16.51  )
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
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
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
