Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF82606A326
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SrhGP5OW;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Y30G1+xh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b7l7WaKn4WKIJuL6yxhJq3en58/L+HJrf1OAffBlhgo=; b=SrhGP5OWhmkNltKkRsSkV6Y2GB
	UWtd35vtelygrKJ9Z8vAA6iiKoVeEAifjrnr2R+kTnG8zG3+oJtYYLLf+gaCyd3unxacNwyHjKSS2
	QV+hLA02dPQ2ftj6AIQ3HhNAXPUQCt6GHPCDMntOhP8KXxpKuX1jRFKv4GKa9jb0v9B50ghLzvDpn
	g4sZgE40jkpBB0ZPJ21rcDhZi4Bo8Nys7eOwfCc1bBAL9mftCvC22sJFUm0drAzHo2aTFtksDpBzn
	yc9mSJiuG05DYtJfaxKajm/ZiWuNVa9IM5GejqvgCHSG7JrceXoCndOBlyJsWPDOiAPbYt5X1cLkJ
	l32dxOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOp1J-00000007ldn-0rWy;
	Thu, 05 Nov 2026 04:24:13 +0000
Received: from out28-219.mail.aliyun.com ([115.124.28.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOp1G-00000007lcI-1k69
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793852647; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=n0Vzpk2EZXCbyFbAz1f5biSJVSpGee9cNxpBryGeFZk=;
	b=Y30G1+xhNvYBGVc8iXd/deOvE+e+v9FH8m6mcp7j1rQDpWhHyiOTnBMrhlSn4FlsxtSLaEBQcRXDvEmg+pKVwaNHjz9OvAIQ5kdT/6Fm3Q0ncniP7jYCvXcrxKjTp2K8zdu+42zS9wYCJL3kNW1C0hgj2n+ya4sgzF5tmo6pt5M=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1897756|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00566328-0.000578767-0.993758;FP=13214382902636795604|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxGRs3X_1793852646;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxGRs3X_1793852646 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:24:06 +0800
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
Subject: [PATCH v2 2/2] mtd: rawnand: ingenic: validate BCH error index in jz4780_correct()
Date: Thu,  5 Nov 2026 12:24:05 +0800
Message-ID: <20261105042405.71352-2-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105042405.71352-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
 <20261105042405.71352-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_202410_628880_8B7E25D9 
X-CRM114-Status: GOOD (  13.13  )
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
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---
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
