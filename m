Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE4CA9EBE
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKqt6bbHDsBoF1hrNS8lnyMS38S4I6AirHXGCPkspuE=; b=xKOhJ0Tod1AjO4
	YpAX9N/dEVIdp0J7vyvysS6NJKN7X2EGCtfhTvWzpL7W9gfHcRXcPCL66gGi7LbEweGGRhq1/lZ/r
	LSnfjA61DiUKUaHRRhjhtpG/z9xDjsJPbovfNN7GQbsoSAGgv74zJW+SNtrIjqOnlckkEZbvokNhJ
	/tT2jD+9722JgjXpccNwocuZ5YOnvAqEg/uvaAxp1yJUa1JxuKeRzFnrnLS5nyJaW+hRERv9e6rYF
	jOwtRQ3C8FlZKp8wxpdKUavkKGEPH3HCFWy6Gf+tzMm3zwSGWq2hP2S2GqK/p5EZn+WhCNbvdssjW
	v5Wdc5nHaQIx18Ij2AZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV5-00000008MQs-2Etk;
	Sat, 10 Oct 2026 18:08:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbV2-00000008MPi-2yix
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:08:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48c6f764f82so171440f8f.0
        for <linux-mtd@lists.infradead.org>; Sat, 10 Oct 2026 11:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655727; x=1792260527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=fWylbQpunOp8fOIvz6N4p2cU+HVzlyA2q1Dw+qY32QvOzsOIyRxmXE74xPxEzSJinw
         LCxrEr9svcfyO7kS8PxJ1Qd6TOpaNM48CtIrZ4YyJ626066I/FqzDmISrsoWvDBCx8Kx
         XRW3JTnkNEDv4nEu9FIF9UeCqYvZvYAD/FaQ2j3W977H2xNIgPAUKL8iNKXarZ63CPFy
         uvX5E8eCEHsNF93GGoVTsduJ532fwQUgJYEgpahWoXOUCLtElx2RSphxcLVdKOaZaF2p
         KhaKwQ8OiY/55z+TKRkbV+2wmsaLZ5ktXjOUb2iqVMtdKi+UYyortwVc9XKa2rYZyHy9
         9jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655727; x=1792260527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcqIx5ZHTyVbwnT9JsODmu7/jC4GQuUPl3/Y3jt0FjA=;
        b=xItB87yZXs3x7evC3kyNF4VIw/iJ3vX959mcDNBrYF/1jJmeO1id2CkU6YOYPpCsG9
         T4h+zKQasvmUJ841OCqDHnsgmV7TLy0pw5fgPTAc9Ax6NyMaUsHREz/ShLVpflrRk+4P
         NQByNjIjNLCl/hifh13aMiQ9mHzX3nWVS5QHWtmsqhFEyi8UjwAaVevXf2CtM7C5xAVA
         MV8VAAzpNXnygQmRZGeD4YwN2NRqkhZnoykWBNO/BorTHSBfSEGF3sBcgL64hEhKN55r
         CC1PpIqp5YAIWJd3DGBYq1kUx5m26ttTJpnaUV8w0WL8Df50PWb1B0LuCyQqUx7X6EBo
         AiMg==
X-Gm-Message-State: AFq9FYJJ/wq8SAg/CpMB8y6uoVDyJ3qhIOJ85HynFpDvLU4YnOQ2ljDG
	zisnKLPpM9yBXltg0ye6OzXZC8SofVTLmaRg8QzKTgnM4r23sOnwjAnt
X-Gm-Gg: AYBFou28RQwPmMOQd9KOqO6A0F5UVCtL1iWXkIbtIQSXy0Hs9ZUndS8c43oR6ESrA1H
	Jx0RLa48TZnW6gVRq+QmPIKn7okYoCiN3lQZ3V9IEb7J4iuwswEXuooZO428zX74mzcGFWRJa/+
	mZhsHE8+k4tHB9WU/HEj1BXEWJOn8pOJQBQiMbqvtCB1F+dLY2IKB/iX/bCwqHPZgA623FXdRD2
	0pa9PYRkuTbjjUJq44sWK+PvWNaOE56QjaSUowDT1XXiiaSSbaIVKyRVnO6Z6HMxw8YAbY0eGcP
	PkO5bHFRg5xZj1a3psq1GHjhwg0J+btsUAcLKmWjl/0jR8TRqiMt0NoZ76th9jtQ1Bn3cpRmitU
	5ns2erV7oGDi9HXqhd6CVW5pVpRHv7mMg7BBgEMEtGOU0iQQ2amf5S+WyrXxnKALaAtUhV8lSaM
	OJqfPnsCj3lyK+xvjHnXYS9PF5hFuwKjAGPH4XMI4BpXpEg/wkhzYpS1a2ZJ3p7dA6pjG0+Z4Pj
	eHo3lWHUIBNKew11dXzDXNpszlqUj+wb68ykCgYrzFDnQJV2cAMNrlYy1Mjn7i8I+PeDCGxkpO1
	lgOUmU7zbRzQd1YO
X-Received: by 2002:a05:6000:46c7:b0:488:7dc6:4e9 with SMTP id ffacd0b85a97d-48dbaadd40bmr6536672f8f.10.1791655726559;
        Sat, 10 Oct 2026 11:08:46 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:45 -0700 (PDT)
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
Subject: [PATCH v2 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sat, 10 Oct 2026 18:08:38 +0000
Message-ID: <20261010180840.2152492-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_110848_787546_DCFC8A68 
X-CRM114-Status: GOOD (  16.19  )
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
