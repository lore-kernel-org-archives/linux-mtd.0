Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E26C5AC67
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Aug 2026 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEq56XMBmdObtjJX0jifG3/9p4Rq0lBCNiJx2NaQaiI=; b=OXZ4ElYq/WCaZc
	294LjDQE3BLkI1GHZ12KGr2AvQtP9nF51iUABcR5lJbAjmS08ZX7PEBId+oTERiZ3SSWQrV/cI0E7
	LdPiiZDQWJDm7ydDbKHcbYGI5EIT9U52cPLdoiOk+1XLvsNu3cojNNgM/TC7Zl+k1a4aRqpQMIhJL
	WEKIsl9E77DhS9TAsMx5jLMN1vLvajpPQ2P3dUJi8c+pIAy6nXKp9B2c50x0qE+kf/Da/jfFEWYBN
	q2ullFhS8yhnUXL+r4fTU1O8uLlJ1wa0VA4zK0zD7Yw3d7nPYm/J3deL+fOZ4inYsKK9SyBj2sVpJ
	PKAHSA8JLkuWyI5VC1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwQ4-00000005fGS-3aTM;
	Thu, 06 Aug 2026 11:37:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwQ1-00000005fFo-2Eqt
	for linux-mtd@lists.infradead.org;
	Thu, 06 Aug 2026 11:37:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc891373e0so25512695ad.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2026 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786016269; x=1786621069; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ac2Di20naM1kK1rDBYOEASSwXxtiN9foNYcj9gl/wyc=;
        b=V6rqdMhLPTZKo5F2j6Al5fA5G9QjxC8oqp+Z3YsRKC5ZAjzLUEiJm/0Qwzki/KnB9O
         0h3XTcRtO0DORSqUXgfEA6ekwQFzgaLIJEO5ccKtle/uPotkBmLeN3CDQQpt7S52o52y
         WiuEzZclmTWCfrRoHClbwzXNvQnXOSOq7CYJTsYNxwyFNmfZOBBLQlTvOZOKj9W5PG4Y
         lu6+lc8Tlc3E0TNKVsz4vU4GMCWLg3kJMWF6aOk6s0gloBV2CbO3rCM1w4gpnEu37TiS
         NQB4CsWMn40ocHvZTajUbAsLgCAsIcvD7SplIHmh2EpMdZ5wtk8aiYW0Epx02P3zs7l/
         izfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016269; x=1786621069;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ac2Di20naM1kK1rDBYOEASSwXxtiN9foNYcj9gl/wyc=;
        b=Dt+ie5FTZm0t8YcXkRCrbO2aIZQpFFXps2U7MvfMiW7mYxfty7LefeH3FfHOjlT+au
         l3lp1PR7lh7ScV9S3nOhc4NnefRzpa/gpxqirfv7JFqvMOEtbTwpSVaWkm9j6HKBmJg5
         jPNZZ52TS8UCbvKPIDtLFwaSgjOzq6kwzJ9SAKsVG69TTXE06b69dWWHP1JhK5/CpO01
         JUHHePrUO3UbIqyS9UTFKjGAvAo0ByMREeKyeUNgroyg/rZdcr8oHyBwS2S0OvVRhYdN
         WRtApF0Viq6N9IxCPjILhofBVSWTSCmUc8FnBCOzH7+LwCJqA0E8LwSa4y2CRH6ywRB/
         /0rA==
X-Forwarded-Encrypted: i=1; AHgh+RpFRgzBZuEBYfhh1EnLOaXcfO9ttYvjSERac9JlQkGzEjSrC4Qb1sh5Y+eHocJiMVJBK+Jd5YM56Es=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEPBXehhNlr2wgYGO5XMATaa9cE+M1Xc2ahingb9i0fykghtOQ
	EtVHbzGhDtxSjNzM2UDauwDxbHf9RzCgRjfvrv7KAvrWCe8ZmowDLGxk
X-Gm-Gg: AR+sD10vM1ndVtCW1+ukdiAVwu7qEPCIhugY6MGugRL1pghaKzgQtY5d2xl8OEMnMk8
	lrf6R5znAw2Lh9qcPKQB05FK1IAETWEJCO2JfAnRz1uxqRNMy1SeErJW6kVqr17WTMB1I/1Ubax
	pwAhyFEqiiBVNR5DntqTCVFg9hiza5V7NkEuN0JRpVDX7h40sbHNAO9+x021caZ8+nUdb+jMLoB
	3nryxw3YRfQPW619ac0cevubMVgBcXpTLoMXmdhkvRD6afuS4Q0M3IF095aKT52EnSV28g3f3qQ
	0baDIzF1diVGBALi5WK3gZzcfGmdB49XAWAlGQ5C2v2vwI0QyeZHOGJDmzhatgrudZofPKb7KJ1
	ed1sRqxWeljH1PzFPz3x9G6paw8bUSAJ8fPdjaus6yPRYXnUoFiDLPuxQ6KUESMsXi3i1xXSqM5
	tTwDnh9Rip0o7lgC3kKss9AozCTrvUoH37QkGUxew7NPVAGobOGUxUVA==
X-Received: by 2002:a17:90b:4b87:b0:38e:7a05:9c0a with SMTP id 98e67ed59e1d1-3903c5c0fedmr12125722a91.18.1786016268630;
        Thu, 06 Aug 2026 04:37:48 -0700 (PDT)
Received: from SC-GAME.lan ([104.28.222.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm30561332eec.0.2026.08.06.04.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:37:47 -0700 (PDT)
From: Chen Minqiang <ptpt52@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Minqiang <ptpt52@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: allow force unlocking via DT property
Date: Thu,  6 Aug 2026 19:37:33 +0800
Message-Id: <20260806113733.31042-1-ptpt52@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2026-08-05171214.2934-1-ptpt52@gmail.com>
References: <2026-08-05171214.2934-1-ptpt52@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_043749_586686_41BB90D1 
X-CRM114-Status: GOOD (  12.20  )
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

Some SPI NOR flash chips (such as generic or unlisted chips used in vendor
devices like Tenda AX12L Pro) have Block Protection (BP) bits set in the
Status Register by bootloaders or factory settings, locking flash blocks.

Because vendors frequently switch between various generic SPI NOR flash
chips ("Flash Lottery"), it is impractical to upstream explicit chip ID
flags (SNOR_F_HAS_LOCK) for every possible generic chip variant.

This patch introduces support for the "linux,force-sr-unlock" Device Tree
property:
1. In spi_nor_init_flags(), set the SNOR_F_HAS_LOCK flag on the flash
   instance if "linux,force-sr-unlock" is present in the flash DT node. This
   allows spi_nor_late_init_params() to automatically populate default
   locking_ops without altering swp.c.
2. In spi_nor_init(), trigger spi_nor_try_unlock_all() if "linux,force-sr-unlock"
   is set, invoking Linux kernel's native spi_nor_unlock() mechanism.

Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
---
v1 -> v2:
- Set SNOR_F_HAS_LOCK in spi_nor_init_flags() when "linux,force-sr-unlock"
  is present in DT, allowing spi_nor_late_init_params() to set default
  locking_ops automatically without modifying swp.c.
---
 drivers/mtd/spi-nor/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..9aa2aaa10c38 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2956,6 +2956,9 @@ static void spi_nor_init_flags(struct spi_nor *nor)
 	if (of_property_read_bool(np, "no-wp"))
 		nor->flags |= SNOR_F_NO_WP;
 
+	if (of_property_read_bool(np, "linux,force-sr-unlock"))
+		nor->flags |= SNOR_F_HAS_LOCK;
+
 	if (flags & SPI_NOR_SWP_IS_VOLATILE)
 		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
 
@@ -3332,7 +3335,8 @@ static int spi_nor_init(struct spi_nor *nor)
 	spi_nor_cache_sr_lock_bits(nor, NULL);
 	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE) ||
 	    (IS_ENABLED(CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE) &&
-	     nor->flags & SNOR_F_SWP_IS_VOLATILE)) {
+	     nor->flags & SNOR_F_SWP_IS_VOLATILE) ||
+	    of_property_read_bool(spi_nor_get_flash_node(nor), "linux,force-sr-unlock")) {
 		spi_nor_try_unlock_all(nor);
 	}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
