Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F9A606A328
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eTos2VCu;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=iX8nO7Ws
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w3XxyoD5kVrJxY7p6NP3SvGBg7YC+oYsEXYEqt8nofc=; b=eTos2VCueWdfHosx5heHZidFeQ
	ELELiV9rzMG6y67WpxEyWXYy6c1m6SIw+V8wv2CvRk2ZNESiqKOxZkEk4FjfOVQ6f5oOvnZ6WKsWM
	QZeFRyayGMiGyO0c3VkScl6UYz1N0vQFlXPwQUihUwXSjlwmIQpTYSTXuO12HRUNCxzM6LUhB9KSo
	J77OuOBdKKZj5kUY+UJP8F+sz9BOvvxvH0CRch4Qh8GUfHKnqbnxgJnhJGCQnZa7/fcV55igQEc8E
	gWfZbjlS4oHJ9unM32M3NIQqPEc5WRzydKn4IjgpcWM76Zya8Wkll6023raf3uE+aih3+PTl/ePHo
	Ux/sPm+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOofv-00000007jZc-1UTU;
	Thu, 05 Nov 2026 04:02:07 +0000
Received: from out28-195.mail.aliyun.com ([115.124.28.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOofq-00000007jXc-3bJ9
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793851315; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=LW2nxoDQfkvtC3DewNXRVRw+G95NHkM+AwCYQizL5w4=;
	b=iX8nO7WsyjODahMlied+uZigvKy0o19nRtN/n3MguSEf/PK+KrsFzTZ8LdMAJmu0XeHBvsftOTHdt9fcZ/j27eg4lVXN0isjjqtPF7uPxbzXdRzGORJAAk9I04911t1OPtTmh/lJU39UcyE6KpF7HpYviKBXqRvOs8niDu6wtWA=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1151963|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0112819-0.000850659-0.987867;FP=13710838753577918036|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxDoTFC_1793851313;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxDoTFC_1793851313 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:01:53 +0800
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
Subject: [PATCH 1/2] mtd: rawnand: ingenic: validate BCH error index in jz4725b_correct()
Date: Thu,  5 Nov 2026 12:01:52 +0800
Message-ID: <20261105040153.66597-1-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_200205_437256_8F6B3D08 
X-CRM114-Status: GOOD (  12.26  )
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
report an index that points past the end of the data buffer, either
into the parity area of the codeword or beyond it entirely, and the
above statement then flips a bit outside the buffer.

Reject the page with -EBADMSG when the reported index does not fit
in the data area.

Fixes: 3e6ac2ad90b3 ("mtd: rawnand: ingenic: Add support for the JZ4725B")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---

Verified with a userspace replica of the correction loop: with
params->size = 512, an index pointing into the parity area (bit =
4099) or at the field maximum (0x1fff) flips bits past the data
buffer (ASAN heap-buffer-overflow); in-range indices keep
correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4725b_bch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
index 2d0e0a2192ae..727f135f381e 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4725b_bch.c
@@ -259,6 +259,11 @@ static int jz4725b_correct(struct ingenic_ecc *bch,
 			bit = (reg & BCH_BHERR_INDEX0_MASK) >> BCH_BHERR_INDEX0_SHIFT;
 		}
 
+		if (bit >= params->size * 8) {
+			ret = -EBADMSG;
+			goto out;
+		}
+
 		buf[(bit >> 3)] ^= BIT(bit & 0x7);
 	}
 
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
