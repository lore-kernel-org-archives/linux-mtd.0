Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373D606A326
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4hWy4CwL;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ZcjlZh42
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HlLmmHRjSvmemqijf6uXdefq5lQvtDeuQpW7I5yeXX0=; b=4hWy4CwLAFwi3wG9NN5ElDuBdg
	cfCPJjJdncxi/uLwNhHQtkC1YTLDWFUz0gENCqY/yPZo50UAPgMxSPgJoet3i9xsgFKdE/OAW6LXv
	tEgtH8ghrtnsPDbbplvs7vh+xejvP4e0C0QcDPEU3845LUDvXrcfVgB3AdsTaOxPdvsdMU3yF6eNE
	2yFLgz2VUWA/NKP9YptgCg3lH3SRJtNm7e30yrTjXEQ9TD5xKSTyqM7rmy2oYha8Cse2zSCnhzIsA
	gWlkJXqVYsoF7ZoLSmJjK9mcmZv//6T67IrOVIxgNa1S5NTd+8DsAwrWqBrfMhxPTL0NTn+pdkyca
	9TU50FpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOp1I-00000007ldL-0FKT;
	Thu, 05 Nov 2026 04:24:12 +0000
Received: from out28-100.mail.aliyun.com ([115.124.28.100])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOp1F-00000007lc5-3NGa
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793852646; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Tqg0mNDgtVX0/7x/JTynwxPqPSZjuIwiBYY1AOgSyRQ=;
	b=ZcjlZh42CxKZH1HtCOhKfUPSkZdI1KOfrwsyiRTTdGzzloYd+cDRiUS7WRIeMdizaFp8oM8SxEjM22s9K0y+K8sqgC0YfLdhP4KpuUpGDffXap9G/n0ehFDxDqf246k11mPD51XYpCnPq8tbINYU7ms1I2q0KOBkwUeEO8PvZ+Y=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1131425|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0022107-0.000197108-0.997592;FP=13709712853670911552|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxGRs2q_1793852645;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxGRs2q_1793852645 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:24:05 +0800
From: Guanglei Zhu <zhugl3@xiaopeng.com>
To: Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhugl3@xiaopeng.com,
	Weibin Liu <liuwb@xiaopeng.com>
Subject: [PATCH v2 1/2] mtd: rawnand: ingenic: validate BCH error index in jz4725b_correct()
Date: Thu,  5 Nov 2026 12:24:04 +0800
Message-ID: <20261105042405.71352-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040153.66597-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_202410_433972_016602FD 
X-CRM114-Status: GOOD (  14.98  )
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
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Weibin Liu <liuwb@xiaopeng.com>

The JZ4725B BCH controller reports each corrected bit error as an
index into the codeword it was asked to decode, in the INDEX0/INDEX1
fields of the BCH_BHERR registers. These fields are 13 bits wide, but
nothing in jz4725b_correct() checks the reported index against the
size of the data buffer being corrected:

    buf[(bit >> 3)] ^= BIT(bit & 0x7);

With data or ECC coming from an untrusted flash, the decoder can
report an index that points past the end of the data buffer, and the
above statement then flips a bit outside the buffer.

Skip the correction when the reported index does not point into
the data area.  A bitflip in the parity bytes does not affect the
data, so rejecting the page for it would fail reads that are
perfectly correctable, and an index beyond the codeword has no
buffer to update in the first place.

Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
Changes in v2: skip the correction for an index that does not point
into the data area instead of failing the page with -EBADMSG.  A
correctable bitflip in the ECC bytes leaves the data valid, and the
early exit also dropped the error entries that followed it.  This
matches how jz4740_ecc_correct() treats its indexes.

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 4099 (parity area) followed by a
data-area index of 100 in the same BHERR register is now corrected
(v1 returned -EBADMSG and left the data error unfixed), the field
maximum (0x1fff) produces no write outside the buffer, and in-range
indexes keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 2d0e0a2192ae..9b1c3d4e5f6a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -259,6 +259,10 @@ static int jz4725b_correct(struct ingenic_ecc *bch,
 			bit = (reg & BCH_BHERR_INDEX0_MASK) >> BCH_BHERR_INDEX0_SHIFT;
 		}
 
+		/* Skip indexes outside the data area. */
+		if (bit >= params->size * 8)
+			continue;
+
 		buf[(bit >> 3)] ^= BIT(bit & 0x7);
 	}
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
