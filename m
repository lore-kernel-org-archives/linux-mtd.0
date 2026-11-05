Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C769A606A326
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2SmOFPrn;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=ATE2wn4E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5bdbv26d8fjLBMnW+LOMQj01qNq5gam0Nf3MTdRHRw8=; b=2SmOFPrnF7ZLCcueLtL/4GjtwB
	JgkhLBahKTJ4Tlk71MvmCdEDt28ctJ3PU95LO94KlVM9dUjygiOObQHncWXbj5E0JI6kl20sgy1Ei
	UXH0raMBzJQAdUjtXLQySi3McGt4QjKD9pIg0jewD/tI2nZ7/Ehwwbd0gRCMUoi5ozyaLpU+MJygX
	aofv/Be44IuPlEurfB1/qkMR28k4JSfOG4rFyO8EwIL3ZsRoEtocDk9U2tpIG7SiHjFNtVCXgEsvU
	umqyBIJ2JHzJ8RIhINR1XlGbHN9np4BzYJahqZFTBBkg6+qMhPL3q5r29EvmfprbuH/+dH3LngiGd
	LfoDq7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOofv-00000007jZh-1pzB;
	Thu, 05 Nov 2026 04:02:07 +0000
Received: from out28-170.mail.aliyun.com ([115.124.28.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOofq-00000007jXl-3ZYW
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793851315; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=a04bwAD3CWa8jx8Sccj/WRN3FIlsMNLG3H8MqdlBKlw=;
	b=ATE2wn4EF/nTmyPmoncoQhIKGa1lllRdszaofbssQsZMJgRq12YsWVqSUXLQXmvWlw5xKBT4sQaoAjKz2aEUj0UlReiekhJpslMmZJcrbq2hnGB9oeR3hsDu898FtPMElKE99CKW3yD7oEkwleI3cmpkJnijtqmOmJYWuQ6Smy8=
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1582222|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0131348-0.000717347-0.986148;FP=13791973953732560476|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083099174;MF=zhugl3@xiaopeng.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.jxDoTG0_1793851314;
Received: from DESKTOP-UL5U09E.xiaopeng.local(mailfrom:zhugl3@xiaopeng.com fp:SMTPD_---.jxDoTG0_1793851314 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 12:01:54 +0800
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
Subject: [PATCH 2/2] mtd: rawnand: ingenic: validate BCH error index in jz4780_correct()
Date: Thu,  5 Nov 2026 12:01:53 +0800
Message-ID: <20261105040153.66597-2-zhugl3@xiaopeng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040153.66597-1-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_200205_555665_2B3B7C7E 
X-CRM114-Status: GOOD (  11.37  )
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

Reject the page with -EBADMSG when the reported index does not fit in
the data area.

Fixes: ae02ab00aa3c ("mtd: nand: jz4780: driver for NAND devices on JZ4780 SoCs")
Signed-off-by: Weibin Liu <liuwb@xiaopeng.com>
---

Verified with a userspace replica of the correction loop: with
params->size = 512, an index of 256 (first parity word) or at the
field maximum (0x7ff) flips bits past the data buffer (ASAN
heap-buffer-overflow); in-range indices keep correcting as before.

 drivers/mtd/nand/raw/ingenic/jz4780_bch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
index 12b5b0484fe9..204bc853c1b4 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4780_bch.c
@@ -216,6 +216,11 @@ static int jz4780_correct(struct ingenic_ecc *bch,
 						BCH_BHERR_MASK_SHIFT;
 			index = (reg & BCH_BHERR_INDEX_MASK) >>
 						BCH_BHERR_INDEX_SHIFT;
+			if ((index * 2) + 1 >= params->size) {
+				ret = -EBADMSG;
+				goto out;
+			}
+
 			buf[(index * 2) + 0] ^= mask;
 			buf[(index * 2) + 1] ^= mask >> 8;
 		}
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
