Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79BC606A334
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/IWWsBn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=IZoPMmfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fPIZe+hfoDt+GbP4hge3zxqOq0Jw74jPJ8N9T3iHKLY=; b=2/IWWsBnWXkoLTPASXnGnKjdi/
	sdQpacX0WgHX2Ph+4WRMvwy7sFIW5JEBxhCFOUPOBHD1QKfncGPZCwwSOATz3rgsir3X0BfczyeHM
	SeWPuBjXdxZ/qT3ZDkPvzUP5VUIyY3nyFKNwsYeCcf0GdsIGUPBSEJC358Ei70gVxhvnq4ZU+U/Qf
	NLY66mf0WGSHKhKTdtNCuSDAdZegmHV8OyZ0ekksgWDlrqfQqMc84B4s318LwD7Xz5djUTkHnFWSZ
	ulSnOuwgZOR3Jnk4r72LZsmlBdwMavvGtHo4V+NQemPkS9gj+lh8RVPsQCgnEv7eSj53KbnyYkR8D
	gWQMaFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV5f-00000007VkA-1yxz;
	Wed, 18 Nov 2026 02:08:03 +0000
Received: from out28-52.mail.aliyun.com ([115.124.28.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTV5b-00000007Vj4-39pN
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 02:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794967672; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vUPmyTuUzWWeEug5UoL9wQXbXmMqziYU0ZCDFkqjrPs=;
	b=IZoPMmfuDcOzVv+EvVQTMZWBBL1DQ7+JkXimg7NIK+nKC1qzw/OBuc+fH9uPgyerDJVl6aMPPfhJXiDJpM9NiDuUiq6NP72omTsXt05bsmgohwVsSw2Fdxej2lkMQ4d6rIMSv8dSc1JqDitcECu91nCNkVO0ZcrXl2K+HZhwKME=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08588208|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0022107-0.000197108-0.997592;FP=13709710654647639744|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.k4NZxVQ_1794967671;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.k4NZxVQ_1794967671 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 10:07:51 +0800
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
Subject: [PATCH v3 1/2] mtd: rawnand: ingenic: validate BCH error index in jz4725b_correct()
Date: Wed, 18 Nov 2026 10:07:50 +0800
Message-ID: <20261118020751.1833498-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
References: <80f1ef9dd605d16df2add0a9dbdcdd5f9f508174.camel@crapouillou.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_180759_968456_8AD76F14 
X-CRM114-Status: GOOD (  14.70  )
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
Cc: stable@vger.kernel.org
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
---
v3: add Cc: stable and my Signed-off-by as the sender, matching
    the review comments on 2/2.

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
