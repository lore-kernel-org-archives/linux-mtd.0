Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9152CC43334
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jun 2022 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d5vmlREl9ekpVoZAQCDTVGCeyKvOlGrniL+s9byvms0=; b=xqsefoo3/OIQWG
	DegO+uBViHskGuGV/RsNUsJrUMinrEv1pBDpN2RIv/GxkbJxTb+3Rm/10/NhSWu96jrlzkNf5pG2N
	aolsNJI55DZKkziJYWrevlmMU+OK7oY4BNogIhvkcxKpYKukAapGzbyT2rjn9puuqLW0+RWd4nqrV
	320IpSo24SwnkLk0cPqjpfvJEbXco/WhqaDdzI8+meG3f72tOWB2UaFqUOhjbUiss32MY21jV5dKU
	6JG2LJASWRGuAtyB8H1MtN+HSlsyMHu1ifCAX+Ie45TsBUTJdGAm3Cb7zu8VhjyyVq0c8GEecze3l
	VM9PETWAxdzUR/7rwrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4H8q-00DqfN-NG; Thu, 23 Jun 2022 07:20:40 +0000
Received: from smtpbg136.qq.com ([106.55.201.188] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4H8k-00DqUK-5C
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2022 07:20:39 +0000
X-QQ-mid: bizesmtp74t1655968799tlvgkose
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jun 2022 15:19:55 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000D00A0000000
X-QQ-FEAT: FXvDfBZI5O54OYnXrecCVFTjfd2yw1wv/8w/JeauM589qoxFHLEG5QLmtKit5
	IH4zjZ9Df5c+FraGG8wV9trEYDLf24JfNpes3CPFb2wpbn7Gg0nA7fJWQOit4c/cV/Rt7c8
	Nffm00OyR0Cydr1SQ0ol1kP7RqdvDRI/LPBNM+GNZtqpyStbvHHex2xjZ2bngsfTnAwm67U
	0x67yJDhlKcZ5lZ6/ZCN9d1BK4mf362mU3mvj08VLKQ74bRmnulFudOuL3CLeL/SevnPjJD
	HzP9YbJvp4SwbvR1NHpTDLxT1GCogBWxA5R1A+v2dT1mqxOnEayuA6DfHufHyEXK2riAeSz
	J7qVQ+C1iU9JRS0W852kjkUNPNaSw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH] mtd: ubi: drop unexpected word 'a' in comments
Date: Thu, 23 Jun 2022 15:19:53 +0800
Message-Id: <20220623071953.15054-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_002034_579685_58BFF3B1 
X-CRM114-Status: UNSURE (   9.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

there is an unexpected word 'a' in the comments that need to be dropped

file - drivers/mtd/ubi/vmt.c
line - 626,779

* Returns zero if volume is all right and a a negative error code if not.

changed to:

* Returns zero if volume is all right and a negative error code if not.

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/mtd/ubi/vmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 6ea95ade4ca6..8fcc0bdf0635 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -623,7 +623,7 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
  * @ubi: UBI device description object
  * @vol_id: volume ID
  *
- * Returns zero if volume is all right and a a negative error code if not.
+ * Returns zero if volume is all right and a negative error code if not.
  */
 static int self_check_volume(struct ubi_device *ubi, int vol_id)
 {
@@ -776,7 +776,7 @@ static int self_check_volume(struct ubi_device *ubi, int vol_id)
  * self_check_volumes - check information about all volumes.
  * @ubi: UBI device description object
  *
- * Returns zero if volumes are all right and a a negative error code if not.
+ * Returns zero if volumes are all right and a negative error code if not.
  */
 static int self_check_volumes(struct ubi_device *ubi)
 {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
