Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A91C3F6B0
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2RiEpcMRrgBxaMk7D0ne8xj14XZW4SKHSEXhyHXzl1k=; b=oMq+NYuw6s1+Ia
	QpIIiJ7WqAyAEXR9SLKqvugcINEU7wL9cS5UNy9Vj54/8esbgmCZeey5G4j+SSFRcSsALmDnfNdlB
	MVP0RG6yuf//iQYPc2mSBIn8EyoBpLvVBtdNpyDus2LTNgCB2wai6gnG+tEteIl4gjN+1V7CPiDB0
	Oiv8Ds01XRaYqzd9WHwHgm5PI2ZClspOcoKTrD5EFkZbAg9WeXo0kF8z0N+fCa6Y/pa8E1fUQHSws
	4ZMqukylSD1HdlkVz0dsZ3ngZQc0+w5Kkhw8S4Yhgt49Z9Mj5E+rkubk04jlvKfZu29yZogBwKOec
	Iptp4DDWpparSWj8igzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlgq-00BzA7-8N; Wed, 10 Aug 2022 13:24:04 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlgm-00Bz8n-S0
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:24:02 +0000
X-QQ-mid: bizesmtp66t1660137360tf54vmum
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:15:58 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: LE7C6P2vL8QZH5ItXYgHmvuuc9aXQB6IzMwJ1o6d6XtQDUTIsgCVAGd0sWqqY
	kBi7hCCyXSuzihUSlyYfywBFQVnadK4M6CBKeRyZOr1+sg57sNa65+WUCYRcVQFFZLk2kpH
	MKWDeO7hv6l3U/vegQfSx12Pfq912pXuBM66DmMue6ZEuzdi0VI6snucDQgjqg4mAceLTJn
	6vouAnpK9hte7ZgNg5yQVjqX78vRDKtOKZvbobsG+8U20+72BEzpNttrFrMJYTrKxbX6b91
	Rs3liy3qTGZ7FYpaAez4K/bcp1yuhT0PoArrNWa6w/jGl8MdsovlyudhusrkXLmCWyNTS3K
	IJNjB+dYI2uXplmrcDyfNYeR8MYsEt62EjJgv03
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] drivers/mtd: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:15:39 +0800
Message-Id: <20220810131539.51108-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_062401_218581_C22C3BFA 
X-CRM114-Status: UNSURE (   9.38  )
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
index 6b48397c750c..1709f7f6bf6f 100644
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
