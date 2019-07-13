Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AD6C32751
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F20C20B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Myn6EEHz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="E09kqqS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F20C20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=BnUFaOP4/+jFvNBgP3Hp68KFfYydQs8dYaF8DT8VuiI=; b=Myn6EEHzLw2kUZ
	dP2scmikgbPXs1Hnrh/l9nfrK2fYiy0faNMsimc4Vaj5PLI30prlAWAcArA4xgPU+ZyfU5xBMRWXT
	/HWQIoy9blAkCcfZVv7oh7tu2Le/zOmUe16DM8Bjh7i5b7+KzWNakrN34pFOnVBk9YaR1HEfuuE2k
	gLdRwV1yObjUHRgCzlUtT1Zll/Mm0wUbVqOT7pSVWov8QXbOff8XOmnFUIt2sIyNrYuDycDY63fL4
	y7tpKKHrkGzcrClO1PmYPyHcI7njXBKMEHJyEHwCqaw4pdKFPVKkCm8EvkM5R0JEgg6SbGoLgi4I6
	twHwXN0xfZAOpYDMzw/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht0T2-0007ea-Jz; Thu, 01 Aug 2019 02:05:20 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht0Sy-0007eH-2O
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 02:05:18 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190801020512epoutp01e86bfe872232446444bafb86a8f5a527~2qj-7k9Gb2990229902epoutp01U
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 02:05:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190801020512epoutp01e86bfe872232446444bafb86a8f5a527~2qj-7k9Gb2990229902epoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564625112;
 bh=AeiPrZYCuXKuPLbLom6cnTr7q66l59Dm2R16nrhTyHY=;
 h=From:To:Subject:Date:References:From;
 b=E09kqqS+0v4+iU/HszZfBOP+7c5VauFPa3+uAaznTDvHnnfgdmkLxu0YpQcA8AkSW
 YrL9ar2W1WejqKk+WkWvf14O4zg21IySFiYRdvekboSwEWozJ6EOmhcraBVD+Tf4Lj
 cz3K6nSptY6ITbRk9w8FZD17DHHY39fjdBkkwg1Q=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190801020511epcas1p4b726dec94a84bc61ae67a6c5e208ae6f~2qj-SFc021720317203epcas1p4Q;
 Thu,  1 Aug 2019 02:05:11 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.159]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 45zYXQ2dShzMqYkk; Thu,  1 Aug
 2019 02:05:10 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 F4.76.04085.6D8424D5; Thu,  1 Aug 2019 11:05:10 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190801020509epcas1p155f87090273be705f1a9ae752c0bca5c~2qj9vVwpb0173601736epcas1p1M;
 Thu,  1 Aug 2019 02:05:09 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190801020509epsmtrp25dfd3e4b33a4d866b7e8378801611dd9~2qj9qIOJS1129611296epsmtrp2G;
 Thu,  1 Aug 2019 02:05:09 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-85-5d4248d6b535
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.3B.03638.5D8424D5; Thu,  1 Aug 2019 11:05:09 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190801020509epsmtip243456eefdccf12da163225f24b92ee92~2qj9hJs2q0926809268epsmtip2W;
 Thu,  1 Aug 2019 02:05:09 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v3 1/4] mtd: spi-nor: rename SR_TB to indicate the using bit
Date: Sat, 13 Jul 2019 16:15:38 +0900
Message-Id: <20190713071541.22090-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUhUURTHu75ZnkMTt6flwYKmB0EK6ozj6DOyvXiQmRgRBMP0cK6ONJvz
 xqi+ZCGVltVgGy1SZLllmVtOi8pkpRTlB1ssDS1Rk7RFisq2mXlGffudc/5/zp97D00xY/JI
 OsfuJi67YGUVKlnTnajYmKf8CqO2sSiMqy44gbj2rhqK81SWUNzPM+Mh3OueSTl3c88lJXf3
 1iuKK/G+Q9zHsmXcS08JWqbivaf6lHx9RTRfV1Wo4OvLdvG9Xy8ivqc0lz/8U8sfaqhC6fRm
 62ILEczEpSH2TIc5x56dwq7dYFppMiRqdTG6ZC6J1dgFG0lhV6Wmx6zJsfoDspptgjXP30oX
 RJGNW7LY5chzE43FIbpTWOI0W506rTNWFGxinj07NtNhW6TTauMNfuUWq2Wo85PM2Ry+ffjJ
 SVk+KsVFKJQGnACeBw1UEVLRDG5G0OjtVUrFJwQDIy/lUvEFQWtrE/XXMjzoUQSYwbcRjHZG
 SKIJBMV7KoIDBY6G55N1QXc4HgmBsZbT8sAgDKfC4OWHQZEML4Dv5SXKAKtxMuzu7p3aMA+q
 a9uCoQCXKSD/2sGpwSroqSye4jAYvd+glDgSJsZvKyQWwVvpUUrmAgSvy8umRHoYH6vxm2ma
 wlFw9Uac1J4P3smzKMAUngHjnw/KAxLAati/l5EkLLzrL5BJDND1plguMQ/fOqUIDDbCjb5+
 dATNPfVvwTmEqtBs4hRt2UTUOQ3/f00dCp5adHIzuvco1Ycwjdjp6o7C5UZGLmwTd9h8CGiK
 DVdfiFhqZNRmYcdO4nKYXHlWIvqQwf96HipyVqbDf7h2t0lniNfr9VxCYlKiQc9GqM9/5YwM
 zhbcZCshTuL66wuhQyPz0eoO1YFM+a8HuQ3T92ZZRa5yU//EtPW3Poyse3sso/t36TOT+cW0
 x91pR8XPK7Oez9nlIF0fjG19bfPiBgbPqUZ9ns0hP5iMjRUj9RkzSP9pd1L9cM11JvnK8bTG
 XwuRo/ahr2PWe35oaNDeDhl4ZovrbXx84b4wjVZ1+EsTY8GsTLQIumjKJQp/AJhOo5eAAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWy7bCSvO5VD6dYg6dPjS1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSvj2clPLAU7RCqe
 X53B0sA4T6CLkZNDQsBE4vmTiWxdjFwcQgK7GSX+/V/HDJGQkHi08wtLFyMHkC0scfhwMUhY
 SOAjo8SlCW4gNpuAlsSN35tYQXpFBD4wSVyedIoFJCEs4CPxZM0ZNhCbRUBV4tfyyewgNq+A
 pUTjlTtQ8+UlVm84wDyBkXsBI8MqRsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzgANPS
 2sF44kT8IUYBDkYlHt4TnY6xQqyJZcWVuYcYJTiYlUR4F4vbxwrxpiRWVqUW5ccXleakFh9i
 lOZgURLnlc8/FikkkJ5YkpqdmlqQWgSTZeLglGpgrD7/0+bsskM1r4XqWLqfTWbh4pq8St3o
 +uH6Dcsi9ybvnW5Unpqg5XeZZcdChc4DzjM0Qn6qJHunZ+W0H54teVXvz/ttBbon5rQsurYm
 ev/6/OjtstyzrKXXhVmqSYQ+859o85VX1NuRKXOT39H7v+vfzVmaGL1u0vfj1/S0nRxKP4vI
 77wdrcRSnJFoqMVcVJwIAEUcNgAsAgAA
X-CMS-MailID: 20190801020509epcas1p155f87090273be705f1a9ae752c0bca5c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801020509epcas1p155f87090273be705f1a9ae752c0bca5c
References: <CGME20190801020509epcas1p155f87090273be705f1a9ae752c0bca5c@epcas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_190516_518155_B3E5223B 
X-CRM114-Status: GOOD (  21.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Each vendor uses a different bits for SR_TB of flash.
To avoid misunderstandings, rename SR_TB to indicate the using bit.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++-----
 include/linux/mtd/spi-nor.h   |  6 +++++-
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..9ea03f4d943a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1099,7 +1099,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1229,13 +1229,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB;
+		status_new |= SR_TB_BIT5;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1311,14 +1311,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB) | val;
+	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB;
+		status_new |= SR_TB_BIT5;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3d360b0ee3d..f8bbc98432ff 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -126,8 +126,12 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
-#define SR_TB			BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
+/* Used for STM and Micron flashes */
+#define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+/* Used for Winbond and GigaDevice flashes */
+#define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
+
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
 #define SR_P_ERR		BIT(6)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
