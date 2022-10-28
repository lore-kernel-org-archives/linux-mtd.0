Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F541ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Oct 2022 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xuSaQqnL58d43J8Fasnpza4rBzl/9dNYiI33vt23yB0=; b=g1JNI2guH/IeXC
	ccZp6Hv/SFkdpHcehTHM/S9zm2yBUMDYzi1Nf2OtymL7Zye/wE9MxjmRe58/cKQx/xEtNgeHx5c2i
	3emH6DWIb1h2vU0OeDu6+Qe/bNquAoFWqInpcVXUMZUko8O406PHFC1dEA6TGJirIEO7mbtLmguxg
	6oWhOhymwTGjGCAo/a7OG8eA3bkBij4JiOYJRS9d3gh+A7GqukrvgKKxO3+SRw6IHtNOTNOpKFES/
	4lGBPqtdUq/QRxRRYznErCtg1JnHfldCElAPFFaFcCzC75NDggEi6xs40hDWTFLq8L5nRO7H+um3M
	UWPimv+yZNpqcoLeNntQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPbZ-00HPP4-Nx; Fri, 28 Oct 2022 13:41:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooPbW-00HPMT-7G
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2022 13:41:00 +0000
X-QQ-mid: bizesmtp62t1666964444tg65c2f4
Received: from localhost.localdomain ( [182.148.13.81])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Oct 2022 21:40:42 +0800 (CST)
X-QQ-SSF: 01000000000000F0J000000A0000000
X-QQ-FEAT: +e7paLVVZUnbgx/ACZMyiBePvRE/WiYvFsnGVOPH7K6Hz+evUztgSSUOpqx49
	+5dTHojD52dA6cQY8Y16agXXyhEO9UB68MBB1X1tmpocImzp9r/PXlVbnRiTRWKL34/TVzW
	od9I09GkYYA4PgG/moVZDEKSikIejP0+t4EiECo1TRt5SMIT4g4uIzJwAWwIE8bno7X2mmb
	NaA7Y0tg9PT1YXRPFExIdNhQZ3b2ivA7pzoY0NXw7X6fGYVaCQ7dvMo/IncbNvdxSYQWjX0
	Pp04OqLYwxJrpYCQheoXu/S5CmjpvCPkuUV7D5yuD3H08J8ACuMOP/cOxfqvpIQh7l6Xy7Z
	Lbjl/XT4Ed4Mb6rbEQY/18ens+/2IcUQV0JBnoJ1vswcBaI7RXbIqnlLIcGAcThIRaSzujk
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] mtd: inftlcore: fix repeated words in comments
Date: Fri, 28 Oct 2022 21:40:36 +0800
Message-Id: <20221028134036.63000-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_064058_599601_4E985376 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Delete the redundant word 'it'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/inftlcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 58ca1c21ebe6..9739387cff8c 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -356,7 +356,7 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, unsigned thisVUC, unsigned
 	 * Newest unit in chain now contains data from _all_ older units.
 	 * So go through and erase each unit in chain, oldest first. (This
 	 * is important, by doing oldest first if we crash/reboot then it
-	 * it is relatively simple to clean up the mess).
+	 * is relatively simple to clean up the mess).
 	 */
 	pr_debug("INFTL: want to erase virtual chain %d\n", thisVUC);
 
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
