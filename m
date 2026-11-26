Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFED606A339
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 08:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oyyEO8wg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tlrAtiEn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tQIqugi9x6MFMNZHK/gjSpyhV/pZkL96kc/UVM/KCzw=; b=oyyEO8wgq7mtHhS43Y/uxMmXqW
	D8RIZSCWLkp407XQuisb5KF+a0AnAB7YR9V8fk/FM31qqiGfLHiDcV509cOt8ugLR9HGdeOnXIrdO
	cdI1nw2AxHtPqcSYcDOz6UEx9PvgoVhNSxcrDc0B1oAPLc8MCbXLj+saqXo9KTR7MpAN2Io2DbzFp
	Wz+eeLuK/bqNIGXRyPBxO9C0ZWavF7MdDuvUptmcoE/gK/5kbCKWLifLVXz2wWD4MJAnfKI1pH3ej
	k4wGzLSElBaLX/UeebsIJ3u/CV58uP/3HiPt5PyROzhw/4sOsdICaRlqM8UHFZoZGEMqeUo+zInYS
	pUFgf+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJz-0000000CT5o-2a83;
	Thu, 26 Nov 2026 08:59:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVJv-0000000CT3g-3HEo
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 08:59:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4a42b34e930so5883862f8f.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683550; x=1796288350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=tlrAtiEnmY5ywAcOXDUzxChXwieermaTfw9jVPNGQrl0CbESCE8udFivtbymOcWUkL
         pTyMpfl1tp31I+rMrocjAF9avhnv0z3ZhxDqwLCTUGRvOlSaAa+38MQOnDsAuxuiqGbW
         qEm3f2WplcqmlqX4+9s2/KZ9BIIUCtXs5B+onEI5rb7jc1rkzTM4FcEZQjKLiCuj9kaH
         CP5BGv9+2BqPDtSb9iWdpkKHwVOjRSJey6kSq/oun1bfr+48gwNtsTWAi2LmqHe7nt6t
         WeyBr9nq7Vi2m54VsoYB4C1lmI876sslX7haqwMsg1DYuaMi53P06yPgjhyeGzU3QNHU
         0KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683550; x=1796288350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=qCXHzbRRFaBj7QAiHBUlFpNswO+qPveLlWXOfd7UH3IB/68ZB9vu+iapOI053YLSxE
         fLqlokGosfVl+/Fes2VRS1gpkfYn5V0HvSD3Viy+zOgwtB7eX0vNTMvsfB2vg5Kh1j9k
         e68Y9Ck1cNPJMaqpahwamo7AAU1H7Rw3ka0GMbNjH9IoLSgWdjubIUuB2dHlQA+0CBKD
         a20dGO3vDE/7pYVGaHH/pJoxv8UT5R8ySu5TvD9qRm4CEXT498iSzpeONsayDnC5tQ3h
         yQpVQcKzdeVU5C9V8b7AVYlfUOzk70cjckpzJHLo2RWWFh/ApJ1jg+Orlrb8xER01Tip
         j3uQ==
X-Gm-Message-State: APuU4Z909vTwmwU49jcRNJuXxBhvDlrcMGnhzXhbOT8Ww5ESmoAhqD2/
	FoeOhbq02Na+Qe6TQnr1QPzC5kD0KaHaiuALave73q9HoqTz3Ielq+XtQirJWs8g0b4=
X-Gm-Gg: AZFdTZd6LD3d8mpuDfdcO3xT40rqR4dUbVPSqFFZGVhDOmbk6p2BndL/4T0vy1YFiya
	k40GaY/PhZVCWbmyH51ArTbgN+i7rTiiRZxHQTS0jD8Bo7fVTCOC/C6iA5HQU8uBHQaVPZpvi2a
	/5OnY2pgOlChRzzBiexiAw+WHsITQv1QYqaaFuO1NO6KtAgl8qUBm/u109YLH8aHnGIN+I+RNll
	Ack7CmQ3Q8h1ukx3kaqpfYHpVZBp3CZWsZEAkICTYk6JMahiIDWeSticuhz/G5ACjXzh6h0Mmvq
	sR+AivczoIxWqQnWaNrtT9Kt5LTdquhNQBZEyHtOQb2f6n2PCrs74oS7cx7qRZRSM0sHeWSSD+v
	xvCFDqp73JNewWh7qRKJomyT0WzhIRGm64hGff2WXFRgc8ZpOYZ+zFwDG7FLDQml+EdHhxtO6a8
	MhsO++DKcNjV5USdltLWM7wJXIwjApzP0MW3KXYJ1cHMVPxzbMkmzt1IPPofDOUCykOQPqXPBuw
	CDjYxxBdgCHqvxE+rBPrUdLCjF/yRjri5AEn2XUrBcy+iKdEjkCYmft/QPT1PQ/w07ts36IhjRu
	WZn+gh2YcwSUwu5kcafPfOrPwrvDJJSUs1tE+dCbs7UL+FpJ4kOJjg==
X-Received: by 2002:a05:6000:4812:b0:4a9:1b17:4f34 with SMTP id ffacd0b85a97d-4abb57f7036mr36892313f8f.50.1795683549791;
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
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
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 1/4] mtd: maps: only point() maps read through the simple accessors
Date: Thu, 26 Nov 2026 08:59:03 +0000
Message-ID: <20261126085906.814373-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_005912_276728_7065B98C 
X-CRM114-Status: GOOD (  19.49  )
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
v5: no change.
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
index e5805eebe..42fb0427a 100644
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
index 2dde70e74..77c912f1c 100644
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
index dbc34e886..65daa1454 100644
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
index a4167ee5e..23f05500e 100644
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
index b0054933c..59917949b 100644
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
index 75b0b2abc..ebee3fe1d 100644
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
