Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D9606A880
	for <linux-mtd@archiver.kernel.org>; Sat, 14 Nov 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QuJd0PxE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=simonwunderlich.de header.i=@simonwunderlich.de header.a=rsa-sha256 header.s=09092022 header.b=xRtSw/oz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vhpk50d0tv1EloE1S3HqRUnJx99imRRoCE3BN8lu4E8=; b=QuJd0PxEfgjvZCMNydOsncVcjP
	INGxB3w6Vp1e++CJmn1RUZZqUiVruTy+fFXTTenq4GWBPiizz5/XXHWN6Jm2EIBEkmjxb25sTUFtC
	aPbeWFvDY2HpR2pFwMRVivvd37zFrx+J/6a8PoKcUViX2xSuG74rUcAZXd6Kj5VCObzqGnR407R70
	aiNEGL8ur1BV8o2g3j9RkqiEvvpfFqu39RtLuuyXJJfnl4EsTqoYXZ93bd54oJDPFGxqDgnRXXHeS
	Q9BjYIkYKIeFqeDB66rZ9L0ASnanKurHOqBkG3ZZ55gqll4ODZ7X2zfBW2X6TnxvpEqwlASnxW8lf
	y+1ktOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeK-0000000Fj9G-2l76;
	Sat, 14 Nov 2026 10:06:20 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAeF-0000000Fj7W-43hB
	for linux-mtd@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:17 +0000
Received: from kero.packetmixer.de (unknown [IPv6:2a02:3037:6ed:dd6c:838:344b:3152:2d5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with UTF8SMTPSA id 80B38FA1B2;
	Sat, 14 Nov 2026 11:06:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simonwunderlich.de;
	s=09092022; t=1794650773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB65L63jLZH3QuI+gpMXKfarOmkNShyBiyJScYwhoZ8=;
	b=xRtSw/ozCGXktIBENlYkLQc5BU1GXzczQ5x3obvG1QEOsaE+M97nZ9cocwlrC8ZLJ1DOUo
	Qo35I80lo1fwJRWdEm23zZhe1R7KSrnwjWYAh+dT6MPZLA+BsRzxvoZgX/6BpLPOQVJVxh
	wu684ClqOiES46t3bMjOO0HyMARKz7oeGB4Ciua1Ab/QYPdppHmBgOCNsoY3oJZOe5147K
	VtKgH02yl74DIlo+EA994NvwX7KO1SHi3kznIIqi3Hsg3TOJQ98XPDgDYxO+XPoOTwX4XX
	7vl7S4bk+li2XgFc0Fnt/USInldG0mMg1oP6BTLRFR1jOkkfAkjOkUvPkkFlFA==
From: Simon Wunderlich <sw@simonwunderlich.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Aleksander Jan Bajkowski <olek2@wp.pl>,
	John Crispin <john@phrozen.org>,
	Sebastien Decourriere <sebtx452@gmail.com>,
	Yangtao Li <frank.li@vivo.com>,
	linux-kernel@vger.kernel.org,
	Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH 3/5] mips: lantiq: xway: sysctrl: export ltq_ebu_membase
Date: Sat, 14 Nov 2026 11:06:05 +0100
Message-ID: <20261114100608.3432120-4-sw@simonwunderlich.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114100608.3432120-1-sw@simonwunderlich.de>
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020616_430274_0BBB6753 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The lantiq-flash driver, which can be built as a module, is about to
read an EBU register with ltq_ebu_r32(), which uses ltq_ebu_membase.
Export it like ebu_lock, so that the module still links.

Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 arch/mips/lantiq/xway/sysctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index dd187726e3b2..90902ca3f83a 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -149,6 +149,7 @@ static u32 pmu_clk_cr_b[] = {
 static void __iomem *pmu_membase;
 void __iomem *ltq_cgu_membase;
 void __iomem *ltq_ebu_membase;
+EXPORT_SYMBOL_GPL(ltq_ebu_membase);
 
 static u32 ifccr = CGU_IFCCR;
 static u32 pcicr = CGU_PCICR;
-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
