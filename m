Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60698606A326
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XzVsK95z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Js7z9zQn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NHUApRJskKr+3eT/rWm+agP4b1b34f72vetJWrkbXL0=; b=XzVsK95zIdZoTDz8Cq76KmmcUg
	oth/2zIMxjkR/Zzl0Fw+DkpfUVKEtvkVrU7kq1kj5kmWWmPG7rO8usGGFFm7KNrSAHq+U/KN1jEPQ
	TdYTujOljH8IKfQmaSZAgRUj6KNZKMVd+NtEHjIH82SZYjH7aS4D08ckEtCCd19+CT+455rfa8Bv1
	P+nvgx+Lcx+/aHVy8iugdWJjK64zuNhHarVhCCebZI+QgfevSsj+1OTiu+m9SuioZ+B66Eopln9vJ
	xGaMv9zbjjaxxtIDUFNhq0+GObtsrH1kaFT4JHFgQPHLZ/hht09vv5y/dxBFJWwH95lmaV4ZId0MG
	fzRciP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgix-00000005PJW-2Kq4;
	Tue, 24 Nov 2026 02:57:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVgit-00000005PI7-1qK1
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 02:57:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f0621eec70so24002825ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2026 18:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795489054; x=1796093854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+uZoQjS1BIMRWiRpM7snGk69h3ThnDcheT6OPJs5xc=;
        b=Js7z9zQnUkIAmQ5XyrtN51/e29G88jKCZUBO1XX9ro6ZJN60FLZTIoT9wKFUVGLkk2
         1N09n/8VXBt4JZL9lBvQpMMGZWTBy25H6YzcadDG6E3zQaSIOCAePADRlB5fh6KV5Ab8
         TmwfRGjUFOpOwHOmIi5FaDvxnaTVP1ao0r0/sDD4FV96ZoPxeiheGceMagTi7KC0jgtU
         tkYwYz2Gyhog9z3t9BRgro6NgXjrSw2ppt8rabvlCy5m9YKNvkjFQXhjC7wyzn8DTzYg
         h3PMAkT6YRIOmy1Pbuo+AC5ZAUZ+NR3HjowfLdxujsFw2V8svzHYeA1z8uyLd/cL8I7F
         0ZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489054; x=1796093854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H+uZoQjS1BIMRWiRpM7snGk69h3ThnDcheT6OPJs5xc=;
        b=MZqNcnyjPqMSSQa1dyWhx8F5Oqw9G9pb+UHTM/oAiGzcjzoJSkkLQ1XS5+tRXlThoN
         qNR/yBfzbQzS9yN6H7I7vu9X3EQZbpaUMYhQs0ZmWdbCwJtu1hPA3euf9C0hbdpFH3N1
         KvVic/QcL0lfKj+m0NlOIAysqjRwaZCZGi/lYfJGrDX1/dHgQG3e648KA6aa+cCPrKOz
         6o/JSpmygxsEDiN3xLV5LLKQS06ujNwAyDSFB1WDmI8AvGYcFZXeaapdhlBDYhzlJSXY
         cLqsuFhR24w9dos3XRqQRm2itS3tpiqIpyns1Ee0glWKBgORQEFckJpVg85yyJGDJqig
         5a6A==
X-Gm-Message-State: APuU4Z9eDaCRFwGiwoFZR2YPK4KROZl2LDOHaI4ua0STS9HT+8bGlQMl
	tjSSpRBPriU9qFin3S/URL3Pl3w9lhT3gakDdjZoqf9np0e9PooY9d5Z
X-Gm-Gg: AZFdTZf8rJ2Wj1KeJaARqZs1EkdHlSK9p4NQLpDj0If3WHPAHjOeuN2i+dWYysKgrB9
	xNJzvooer5PLfwIkYs3Gn4H8tGKkfctxlo0upJL27/UOtxFK29ku1iZpR9rrFUlVtQ6slb/2SeF
	NWJBmFG31bskpIK2o8xGHSQzx7eUItH5pbpvcJMdDwed7Y7xtWkcPrwJeA3zAwTpnDLw8vvfrnm
	iMDtR2OwTSI/lwmm4pgsYfUE2LWO9RFrSoJ2bszE+V6v6HEsNjEJqQJZ/Y1wff8lxdYhzdlCpIj
	vihE/FkQLiD6K1gndAWUnc5wuVj148uVBfGnOxCm9FYD8XxsiJWF+ckrsUe/UM7CWXZWbRpjQJV
	6WeZ/slsWcX55P16zDsogHqyE+q8yafp8Zvf+X01s+DQrwwY0LHBA6AUGLIzsS+fFik0GRQBe5/
	9rPgJ9Jk5gNP6pqOEWDCxC78oUYhDVxUii9I+CVLL88T+hWJJM73QH8H2ahARfeVEQ+2U164Br6
	J3edkt25LOmtplVXFljJOXOMOVIRUrwKB/FM/0oKpIUOGHTMDPPU7E+C3M6jBEFi7tPtFPVQbXx
	8ZqGaE2yJE0aCzdJ0+hPGGg0F/5NomE8TZ2vpDJ2lzLWyPVAO9GIWJc=
X-Received: by 2002:a17:902:f642:b0:2ef:da10:bea3 with SMTP id d9443c01a7336-2f03f1cf4c1mr135650875ad.11.1795489049823;
        Mon, 23 Nov 2026 18:57:29 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84294sm60823275ad.9.2026.11.23.18.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:57:29 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [RFC PATCH v2 1/2] mtd: core: add per-device bounce buffer allocation helper
Date: Tue, 24 Nov 2026 10:57:21 +0800
Message-Id: <20261124025722.1476247-2-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124025722.1476247-1-leeonion.muyu@gmail.com>
References: <20261119090055.1255028-1-ping.li@horizon.auto>
 <20261124025722.1476247-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_185735_526010_ABEA7B65 
X-CRM114-Status: GOOD (  19.54  )
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

Introduce mtd->allows_vmalloc_bufs and two helpers for the callers:

  - mtd_alloc_buf(): by default buffers come from
    mtd_kmalloc_up_to(), which gracefully reduces the size under
    fragmentation so that drivers never receive a buffer which is
    not DMA-able.  Drivers that only memcpy() the buffer, or which
    bounce it internally, may set the flag in their probe to get
    kvmalloc()'s vmalloc fallback instead, so the requested size is
    kept even when the buddy allocator is too fragmented to serve a
    contiguous block; this avoids degrading large transfers into
    many small ones.  The size reduction is intentionally not kept
    as a last resort for those devices: an allocation failure is
    reported to userspace rather than silently shrinking the
    buffer, so that the declared contract cannot be quietly broken.
  - mtd_free_buf(): the matching release, kvfree() based.

The flag defaults to false (zero-initialized) and partitions
inherit it from their master, so a driver which does not opt in
-- on the master or any partition -- keeps today's behaviour and
can never unexpectedly receive a non-DMA-able buffer.

No functional change yet; mtdchar is converted in the following
patch.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/mtdcore.c   | 44 +++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdpart.c   |  1 +
 include/linux/mtd/mtd.h | 16 +++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b170c3144ca8f..83365c0fbf063 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2566,6 +2566,50 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size)
 }
 EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
+/**
+ * mtd_alloc_buf - allocate a bounce buffer for an MTD device
+ * @mtd: the MTD device the buffer will be used for
+ * @size: requested size, updated to the size actually allocated
+ *
+ * By default (see mtd->allows_vmalloc_bufs) buffers come from
+ * mtd_kmalloc_up_to(), which gracefully reduces the size under
+ * fragmentation so that drivers never receive a buffer which is not
+ * DMA-able.
+ *
+ * Drivers that declared themselves vmalloc-safe (they only memcpy()
+ * the buffer or bounce it internally) get kvmalloc()'s fallback
+ * instead, so the requested size is kept even when the buddy
+ * allocator is too fragmented to serve a contiguous block; this
+ * avoids degrading large transfers into many small ones.  The size
+ * reduction is intentionally NOT kept as a last resort for those
+ * devices: an allocation failure is reported to userspace rather
+ * than silently shrinking the buffer, so that the declared contract
+ * cannot be quietly broken.
+ *
+ * Buffers must be released with mtd_free_buf().
+ *
+ * Returns a pointer to the allocated buffer on success; otherwise, NULL.
+ */
+void *mtd_alloc_buf(const struct mtd_info *mtd, size_t *size)
+{
+	if (!mtd->allows_vmalloc_bufs)
+		return mtd_kmalloc_up_to(mtd, size);
+
+	*size = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+	return kvmalloc(*size, GFP_KERNEL);
+}
+EXPORT_SYMBOL_GPL(mtd_alloc_buf);
+
+/**
+ * mtd_free_buf - release a buffer allocated with mtd_alloc_buf()
+ * @buf: buffer returned by mtd_alloc_buf()
+ */
+void mtd_free_buf(void *buf)
+{
+	kvfree(buf);
+}
+EXPORT_SYMBOL_GPL(mtd_free_buf);
+
 #ifdef CONFIG_PROC_FS
 
 /*====================================================================*/
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e0..9c245ad421a55 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -75,6 +75,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	child->oobsize = parent->oobsize;
 	child->oobavail = parent->oobavail;
 	child->subpage_sft = parent->subpage_sft;
+	child->allows_vmalloc_bufs = parent->allows_vmalloc_bufs;
 
 	child->name = name;
 	child->owner = parent->owner;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e8300..4296d255c15d8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -368,6 +368,20 @@ struct mtd_info {
 	 */
 	bool oops_panic_write;
 
+	/*
+	 * Low-level drivers that only memcpy() the data buffers received
+	 * from the MTD layer, or which handle non-linear-map buffers
+	 * themselves (internal bounce), may set this to receive vmalloc'd
+	 * buffers, keeping the requested size intact even under heavy
+	 * memory fragmentation.
+	 *
+	 * Defaults to false: buffers always come from
+	 * mtd_kmalloc_up_to(), which gracefully shrinks the size under
+	 * fragmentation, so drivers never unexpectedly receive a buffer
+	 * that is not DMA-able.
+	 */
+	bool allows_vmalloc_bufs;
+
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	/* ECC status information */
@@ -699,6 +713,8 @@ struct mtd_notifier {
 extern void register_mtd_user (struct mtd_notifier *new);
 extern int unregister_mtd_user (struct mtd_notifier *old);
 void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
+void *mtd_alloc_buf(const struct mtd_info *mtd, size_t *size);
+void mtd_free_buf(void *buf);
 
 static inline int mtd_is_bitflip(int err) {
 	return err == -EUCLEAN;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
