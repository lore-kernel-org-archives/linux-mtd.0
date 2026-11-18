Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881F606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nJPPNWfm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=oFs0q61Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P3xRlvnzm42W906QiRsNBAe/4D9JImZ7un6W0zeskzw=; b=nJPPNWfmIvYwvhnhimlLNyWJR3
	GRlib2gpuG64PNTiUQ2/3u7PhxtZuLkFSB+5qphpWjKw1tzjx/2KsB/kO81tcVVkB2eiFl6gWCb2i
	zA7QEw2Rr5d2CR/mOCuxUxrNHR6mM2jOwXIS1YiMf9/JKTbPwRYJn9Ncx6FJO3JwAzJeJXX4OTri1
	4m4Hu236sMY/8zT7ipK+5rLSslEXxGW+een9M+u56Nwv181acP2lHjsDZBXJwwybR/AxOg2MAilYj
	Xh5LVFr8qe34kVXyFD/VQP3sBFEDszzjmB4GyBYEpoXUXUfEQArUBBgwntdU5KYHhtE05hRz/bw8J
	KpeWpTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV5f-00000007VkF-2Khi;
	Wed, 18 Nov 2026 02:08:03 +0000
Received: from out28-145.mail.aliyun.com ([115.124.28.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV5b-00000007Vj5-1Hr1
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 02:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794967673; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=4sCen6N7/ej1iTjZeKlmK1FSRs7B5KNsHG5+ndEgEmo=;
	b=oFs0q61QcYkaR0CEmCDarxl4xbFqxDY0kj8yih305qRtHIK9K6NRvgB849b4N9tKxNpO9HZncIb4/7MZBYH7A7rYPP/PXs8gdYiark8jvQL74PfwVyCBF7AGB/TnFmKT6XEYc83qVf+zJWDN1YqUX80zpc4iGTZ7rI6LzUl739g=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1074903|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00566328-0.000578767-0.993758;FP=13790843656047517396|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034254;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k4NZxW7_1794967672;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.k4NZxW7_1794967672 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 10:07:52 +0800
From: Guanglei Zhu <zhugl3@xiaopeng.com>
To: paul@crapouillou.net,
	harveyhuntnexus@gmail.com,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liuwb@xiaopeng.com,
	zhugl3@xiaopeng.com,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] mtd: rawnand: ingenic: validate BCH error index in jz4780_correct()
Date: Wed, 18 Nov 2026 10:07:51 +0800
Message-ID: <20261118020751.1833498-2-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118020751.1833498-1-zhugl3@xiaopeng.com>
References: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
 <20261118020751.1833498-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_180759_805980_F6A3F960 
X-CRM114-Status: GOOD (  12.41  )
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

The JZ4780 BCH controller reports each corrected bit error as a byte
pair index, in the INDEX field of the BCH_BHERR registers. The field
is 11 bits wide, but nothing in jz4780_correct() checks the reported
index against the size of the data buffer being corrected:

    buf[(index * 2) + 0] ^= mask;
    buf[(index * 2) + 1] ^= mask >> 8;

With data or ECC coming from an untrusted flash, the decoder can
report an index that points past the end of the data buffer, and the
above statements then flip bits outside the buffer.

Skip the correction when the reported index does not point into
the data area.  A bitflip in the parity bytes does not affect the
data, so rejecting the page for it would fail reads that are
perfectly correctable, and an index beyond the codeword has no
buffer to update in the first place.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Cc: stable@vger.kernel.org
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
v3: add Cc: stable, my Signed-off-by as the sender, and Paul's
    Reviewed-by, per review.

Changes in v2: skip the correction for an index that does not point
into the data area instead of failing the page with -EBADMSG.  A
correctable bitflip in the ECC bytes leaves the data valid, and the
early exit also dropped the error entries that followed it.  This
matches how jz4740_ecc_correct() treats its indexes.

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 256 (first parity word) or at the
field maximum (0x7ff) produces no write outside the data buffer,
and in-range indexes keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 12b5b0484fe9..3a4c5d6e7f8a 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -216,6 +216,10 @@ static int jz4780_correct(struct ingenic_ecc *bch,
 						BCH_BHERR_MASK_SHIFT;
 			index = (reg & BCH_BHERR_INDEX_MASK) >>
 						BCH_BHERR_INDEX_SHIFT;
+			/* Skip indexes outside the data area. */
+			if ((index * 2) + 1 >= params->size)
+				continue;
+
 			buf[(index * 2) + 0] ^= mask;
 			buf[(index * 2) + 1] ^= mask >> 8;
 		}
-- 
2.50.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
