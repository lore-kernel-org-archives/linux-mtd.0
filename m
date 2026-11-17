Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF54606A33F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 21:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TjqE5s+8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LnRtsbDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DudC3vI8QuWARw26bCXnUDIe1zO3RAY213hwXJt7r1M=; b=TjqE5s+8+8PXKJPbex5VQ4G/eW
	lVTaJEKnQMKLfQGhRY92YlhDBW/gSXaNsz0WuFvrdt+aHUi+rf9xjlx7A+qbnlN4qF069l1LPOmW6
	IQ0ohALFI64crK2SVJOWVcpiFYfIeVNVGNvCJyziXLtPTGYZ+vFeyaSsfTtEszoNFORCJhSJ7/4jQ
	LXFmgd0sh2qAbVKOHp4/jmDLUTESb3x3jHbxrUHcegkEO2t9wA8Ef5eHGftRQP+hyYnOAaqzRuhOS
	/leHDc+r7HBvKaHX8f3Wc1gGsCC9SaOEngG2E8NZXLw9+rSqhqBsiJvyPWKFsjdu97kgZ43jjjyUm
	F/i8wVwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQw3-000000079GP-2Wun;
	Tue, 17 Nov 2026 21:41:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQvz-000000079Ep-36oh
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 21:41:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-490d59c3edaso96878f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951706; x=1795556506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzmjFOcyIIyhjknT+4ERxgpCmAjlA22Eb1QRiV9ePjY=;
        b=LnRtsbDI1gEY20sZWMVzoP3qqiSiP+n5QRhKKrLLX9fEAKCKDg1rS7MDtvEg5vIHaz
         5Z3Nn+EiHk7CthkX4Ag9pk3kxmJmYsUSgW0AAMDQCTkOssTdYqZ6WsxIS5O+raII3+4Z
         Hi5p2+5ED9PPeAKzD75yiZ1wsFqK0GDRlV52Cd6FP0VhXwWJNIpl2YtEYm9dXrnT1pnn
         Zv9Q/E8M+GmK1YklBFy4g4w3uHgXN5b3LC760nv1Ehu6dd4zxBJdRiifyLgGg1veyXs5
         h3fJTzRoWbz4GiNiXxsCZcHFujYzWdTiYbCkO9Njg0X1utpXN4tfxGJ9D4wdjdboUy2y
         qSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951706; x=1795556506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IzmjFOcyIIyhjknT+4ERxgpCmAjlA22Eb1QRiV9ePjY=;
        b=tQKxirpFVOeVdjTzj++TQMb2lGRgWlv4NRmtNZvgkGgF1IKcJ9HtjBQWdNxQKeZ9cq
         WCb3fJHF6h4S3WVhqv2z87qv/kc1HXMNeTS2LuSjtbxjgKdxUmrDqQV96lWKtgBCDer/
         ulOF8kjINLQEc5+IzLGJQF4KZFqkkMd+VcYlWIEsMhbAfz7jj+b9lb3R3fSDfYKI7dNt
         utf2JI65m6HI6jzGrpqzt2yy51XH5usl7q3iB6x4ObjFmOlHnaqVivKBVSx7hZqEflAH
         knBw46U2lS/vHuEFGJlkR93YwuYy4d6l08Hz2dI7OXacu97b7q1Y1d11LB26IaWCvyxX
         CFxA==
X-Gm-Message-State: APuU4Z/xOWxrVZGlyV9EeCuQxncw9KtV+EjlPMFkK3+gQzr8uLu9ZKJN
	gm+vEO1+dYJGXHmXY3MSVqCoeBXm4MM7TvkbqXaLMs6Asks1kahDS2ej
X-Gm-Gg: AZFdTZdOV6aB0Ne6A3E943IgKw3rgYENnyHTQQNpYZrHlK07dP3xYRWfpphdtIgq6tP
	p1nzSgEe18t0xB3pMSDVxGW27DdYccEOWA/+9eyD30Co6R/QCNozwmAaLqRj2g3hqXFF3qidZ2N
	VSXxMMV2TlJazQmjl5bHLB+ymruNXbuA+gL3xOqG5CoUBQ0uhuSRP/OmjMKxTCjzZgAbRM3vHRN
	BIo5kMMe1wrfKUofQtCe1GrnMun2cau1zye1TH8KqZxfZ3moQYWoru1VwxXThqlp53TTFYJrYBE
	oYCzoIRfcWNeEc8uBuBH3apUqSNeneRh5XaDlFdwnG6vM4njqwOUBhYhijnRTjm/RXNuYFtE529
	TpxRCr5L9nDMGPt6qG38JsOc6Hn8fJl0fF0zUeeeihdcmVGL3uYhb107gO2ZkHyuPZLyoEMUbnb
	zEO0UKS/U2r+qdwGJZyjrWnSDI5tSaFzv7xid8KfajBedCpXKJXv68SMn33z2sM5k/WivHk1sGl
	t4W18nK+ay9U1cdWn0NmzzUPHQp4dPqxxTWWEsABYJIJBHKKMl0L9mEzOXWwDR6BteZo7LibsHl
	sa5g1FddJ0tXhNgrjePS/hmhV7hekP5OmJWs9uSizFk5FxnYNm7lqo6RSuFaYgnsLhW7sPqLOd8
	GfiP0I9ViGbUMFSFktRr7P8QuH5W+KV1HDS4D9vPsLEQIyzM=
X-Received: by 2002:a05:6000:41c2:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-4a36609c994mr8636932f8f.0.1794951705772;
        Tue, 17 Nov 2026 13:41:45 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:44 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 1/4] mtd: maps: only point() maps read through the simple accessors
Date: Tue, 17 Nov 2026 21:41:38 +0000
Message-ID: <20261117214141.3826637-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134148_029586_78B65477 
X-CRM114-Status: GOOD (  20.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
- the cobalt PCI driver's flash map (drivers/media/pci/cobalt/
  cobalt-flash.c) reads at an offset inside a PCI BAR while leaving
  phys 0;
- the Octeon bootbus flash map takes octeon_bootbus_sem in its
  accessors, which a pointed read on an Intel NOR skips.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. lpddr, map_ram and map_rom enable
point() on the same terms (map_rom unconditionally). Add
map_is_simple(), true when the map reads through the simple accessors
(always true without CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors
are inline), and require it in all four before enabling point(). Maps
with custom accessors fall back to copying through them; on big-endian
IXP4xx, where pointed reads happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v4: also gate lpddr, map_ram and map_rom, which point() on the same
    terms; those three are compile-tested only. Rebased onto
    v7.4-rc1; the Assisted-by tag is dropped (an LLM helped write
    this series).
v3: Assisted-by in the documented form.
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/chips/map_ram.c         |  4 ++--
 drivers/mtd/chips/map_rom.c         |  6 ++++--
 drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 6 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e5805ee..42fb042 100644
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
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 2dde70e..77c912f 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -74,8 +74,8 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
-	/* Disable direct access when NO_XIP is set */
-	if (map->phys != NO_XIP) {
+	/* Disable direct access when NO_XIP is set or the map has its own accessors */
+	if (map->phys != NO_XIP && map_is_simple(map)) {
 		mtd->_point = mapram_point;
 		mtd->_unpoint = mapram_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index dbc34e8..65daa14 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -54,8 +54,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->_point = maprom_point;
-	mtd->_unpoint = maprom_unpoint;
+	if (map_is_simple(map)) {
+		mtd->_point = maprom_point;
+		mtd->_unpoint = maprom_unpoint;
+	}
 	mtd->_read = maprom_read;
 	mtd->_write = maprom_write;
 	mtd->_sync = maprom_nop;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index a4167ee..23f0550 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -57,7 +57,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->_writev = lpddr_writev;
 	mtd->_lock = lpddr_lock;
 	mtd->_unlock = lpddr_unlock;
-	if (map_is_linear(map)) {
+	if (map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index b005493..5991794 100644
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
