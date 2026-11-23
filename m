Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DF1606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q8DuQZld;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qobbTjv6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q58GMeaqKtgOoaqGr/OCscnNEbOmG6tvvbIAawNfRPA=; b=Q8DuQZldJmQdbDawJWIayUZfuR
	fo362SIBRrx+x6zEgq9FMTdZ6SA7ZTxlggy6liRIVJgsxOITQJ+CAghz4yYEaa/1gOkBsaBMgHG3L
	9iKhIDubz49acVDKy74lanR8BTTCa3/z+vWTJ+7Ssyom/4TIttsO9tC8RllAszbhxjETNOTT1dvvM
	s9UxTm6h1kSWA5oY9t6j7auuR2T42uIOO8bxglOWUia+f4qa3o4iwwhcgu96M+Rrh4A6IVW7/6J7n
	kFDcYSHyWdAch2EVoQ1X2LCWw/35SyDVmo6sHOn8l2hYAa6qYZNDCz0RiEIEQeHFMyQd3JUNbeLWw
	iLP7mOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwv-00000002L3r-1b5n;
	Mon, 23 Nov 2026 05:50:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMwr-00000002L2A-2H4T
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 05:50:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f03f3631b2so15273885ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 21:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795413041; x=1796017841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HR0Dd+TxnAvS5t/91qDunpc4NaqeZo8qOOp6rPSIZkU=;
        b=qobbTjv667xiUOWE5AE628KmyF4TvaT+tELbKfsxwlV8Enm7j5REkya//HxQuWzNbA
         zfCVk8Ap8dij1mMts7yEkf+lB8fD7XMznA8KIoz/hn80dl0EuTI9bY03aqGtf1jvSOme
         0nBojFqAg2II5PmlEwrRW40K6s29oaf0MfSNMAUXqqkvE2TGlRHIxhdfCcK/uLQjYgzM
         Y0s6LbMEn5DH4da9AKrAYhyvxHt7yeWr/EvP9lOWnreKPcVHhYZFwHmFHrfkaArpFa5j
         V7ks95FZ859qgcB+ycuE4385Gh1wwR7SQ38p8HOHUVpNg4MXXJn8+CM04Y8La0R0wWjD
         cjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795413041; x=1796017841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HR0Dd+TxnAvS5t/91qDunpc4NaqeZo8qOOp6rPSIZkU=;
        b=YaJEE8NBg0IgNOSIbj+xNtIEbQMz3BKlwqhAX/Deb8kHVRoyYIjHAJKIMBX1eKi7Gt
         MuRgtFz0zjZCVk6OdNt1cqA6WJCkeRJQ7E/NxFAYHRzB8sTGM9XfFXQnsKFtRoP0WglE
         Y2mnMnR8OpPUOhXMuthUVTlNqluWY+jBWLbmNM9fmdiYEThLg2J9VvrYX5V6EtEGxf5+
         9BPscgHxfCJtmbqTobcEJ3IUTzXFJP2gDQXngmrS2GTeNT+sCyzjzKMekCCQ8Uh28O3e
         ftestb6OwUaSOxy38eXizXGGvcB5wVMkdINSy10vDB7EsfuG2sRs9KBuWtsk45XCIYKB
         ezCw==
X-Gm-Message-State: APuU4Z9EWXRXJPgMK9UF/g0qUepXKtRiX5r/Z1iVhw8m4kASpleQE/ei
	C4ECN9YulLNM4Lf7Px81y7B3EnbBFs5hugqqHcR6XsCY4tJ2QliySDC3
X-Gm-Gg: AZFdTZfW2+pXbNAIAaYNmfcVCGx8/Uq+wSuuQ+Ujlvm7FS3Yu5szjRG57h8ZzBkkx1x
	3/oLkjJF37agwhhlQsEtiUuQ4XID5gHl1ut2sB4M04qPrUvU1wpRyNlDI9eUY6HOeLvkaYHrqR0
	J808GMYW/jITAz54lnk5G7mT7vFZAU9YGWlToFSRM/GGpjrhmv9D/fa3VfIT6yjwfH37d9DN6KI
	P6mh7CYBs2wdeOBbD/HrZfB/xsy7dHybp4oDbcWYkP/sn3X1iIAz2D+M6VDJW+V2lbz7/jb5TON
	MvR0TiMDs0+h0wSybNED0HIY4hPCRkOQVpQNz65VEMtot/2aduvLs7Ots4MzcL0Y9Je18Ax3+X3
	P6ZjaS4TjhKWJGS9kqOcgTyzMgfXno5uZRm5l9gAwHlqzM8hxqq1tNxCLQ/SWZ4Mw7YVrwsbhUn
	sSbuGZugOdJYWAE6x1k8YIyQsbBacyBCbgXN4feaU443vptCZRE35uF8vpP8eBDG9+R4pKQH7Rc
	Q4s6cZumExx1vIiWIF31usTjVoYg5hs6Ak04QMmvxiJTGhJieIq3hV90IhyrqF5uO0n3yIrUYF7
	syRfLjw2qcggwIhcSM/92yb2/SJzUg==
X-Received: by 2002:a17:902:fc84:b0:2f0:3c38:914f with SMTP id d9443c01a7336-2f03f2363aemr95111405ad.45.1795413040663;
        Sun, 22 Nov 2026 21:50:40 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b76sm46486325ad.50.2026.11.22.21.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:50:40 -0800 (PST)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH 3/3] mtd: rawnand: r852: bounce non-linear-map buffers
Date: Mon, 23 Nov 2026 13:50:20 +0800
Message-Id: <20261123055020.1995251-4-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123055020.1995251-1-ping.li@horizon.auto>
References: <20261123055020.1995251-1-ping.li@horizon.auto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_215042_259754_333CFCD0 
X-CRM114-Status: GOOD (  12.16  )
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

From: Ping Li <leeonion.muyu@gmail.com>

r852_do_dma() only bounces buffers that are not R852_DMA_LEN
aligned.  An aligned vmalloc'd buffer passes this check and gets
fed to dma_map_single(), which is only valid for linear-map
addresses.  Since the mtdchar MEMREAD/MEMWRITE ioctls allocate
their buffers with kvmalloc(), a heavily fragmented system can
already hand such a buffer to the reader.

Extend the bounce condition with a virt_addr_valid() check so
that non-linear-map buffers go through the existing internal
bounce buffer instead.

Fixes: 83208e106a8e8 ("mtdchar: use kvmalloc() for potentially large allocations")
Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..4dbfc053fb21 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -188,8 +188,8 @@ static void r852_do_dma(struct r852_device *dev, uint8_t *buf, int do_read)
 	  from device, for writes first fill the buffer  from memory*/
 	dev->dma_state = do_read ? DMA_INTERNAL : DMA_MEMORY;
 
-	/* if incoming buffer is not page aligned, we should do bounce */
-	if ((unsigned long)buf & (R852_DMA_LEN-1))
+	/* if incoming buffer is not usable for DMA, we should do bounce */
+	if (!virt_addr_valid(buf) || (unsigned long)buf & (R852_DMA_LEN - 1))
 		bounce = 1;
 
 	if (!bounce) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
