Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6752EC25B07
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cv46ELDSKmnO353yVy9op/dYUspli4vc4OV5jHSShGw=; b=QQH25BpfpzQhx7
	n/Yr6bcmvkg8IwggD47NFmm7SiMWvKCKciYJ51AZEwUnR8P5qWHJ5sAMMlqehhvaWtst46A8gBm9w
	mMoJEBpjuQLgBURzZExTfvw5TSlGJOf+ygDGtIMhcMdY8aimBhjq5KQRdf9K+TpIhIvP5cR/uBqZp
	mRzkP4dHhEi2KUQjZ4RCNvMaP59AcBDwp/NXK0tGkVVSix4ubAMVGY5t1Yn+hLmNdlYYHU3g9EEiZ
	OF9kw6SzU1MDjGbOwnrPvwTCszFW9hiNMOUqqt0XmDe6ixixrGgLy5BK9MGJzyEqqAAzICoysDMEU
	L8imvCRssbx5zRxbPcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlki-00C0Qp-Nh; Wed, 10 Aug 2022 13:28:04 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlkf-00C0Op-No
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:28:03 +0000
X-QQ-mid: bizesmtp88t1660138071tm7fbmh1
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:27:50 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: YHTLUubWl26igChFXzRkm64UDKpjaoOCHUIjXC277Z+iI0dvZuzPe9dE5tUrX
	N3kqbzrnzvJKRKdJRbeDjz24k0gJZ37cLkU0jZ2PbeAjSRHHu72HT5wGDSpdAEZf5tUFCmh
	bVbPV+3Gu/zZxwSq05ns4+i165ggmIRlSAC+epOGmnShx3Hg67BUOkkJ3jgvVe0ck0Bz7/t
	6AwrhQ+WJwuRajvoINmr4oYOiE/VcyRMSLaz7OeP16mp5aXo3PaBTAFcrmuaU2urAQxgbty
	9Sq02EE7/W4T+LQgl5H55ktOpCBXY7/bb+0P2jCrb9v054jol1YxEmFb36Oz9ZCdQKM9NlW
	OlvZz7HNMSPLsPY4rSyjRCLS8mq+CQ3h+6VqUQQt0n4HjbHniGQbGgxaK6PjA==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] nand/raw: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:27:33 +0800
Message-Id: <20220810132733.63767-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_062802_138142_3CE523B7 
X-CRM114-Status: GOOD (  11.15  )
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

 Delete the redundant word 'and'.
 Delete the redundant word 'is'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 2 +-
 drivers/mtd/nand/raw/sm_common.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3e98e3c255bf..b9377d6c3c89 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -375,7 +375,7 @@ static int nand_davinci_correct_4bit(struct nand_chip *chip, u_char *data,
 
 /* An ECC layout for using 4-bit ECC with small-page flash, storing
  * ten ECC bytes plus the manufacturer's bad block marker byte, and
- * and not overlapping the default BBT markers.
+ * not overlapping the default BBT markers.
  */
 static int hwecc4_ooblayout_small_ecc(struct mtd_info *mtd, int section,
 				      struct mtd_oob_region *oobregion)
diff --git a/drivers/mtd/nand/raw/sm_common.c b/drivers/mtd/nand/raw/sm_common.c
index ba24cb36d0b9..b2b42dd1a2de 100644
--- a/drivers/mtd/nand/raw/sm_common.c
+++ b/drivers/mtd/nand/raw/sm_common.c
@@ -52,7 +52,7 @@ static const struct mtd_ooblayout_ops oob_sm_ops = {
 	.free = oob_sm_ooblayout_free,
 };
 
-/* NOTE: This layout is is not compatabable with SmartMedia, */
+/* NOTE: This layout is not compatabable with SmartMedia, */
 /* because the 256 byte devices have page depenent oob layout */
 /* However it does preserve the bad block markers */
 /* If you use smftl, it will bypass this and work correctly */
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
