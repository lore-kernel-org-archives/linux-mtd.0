Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7508CC19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8532087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCuzX7Yo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ozy4BI17"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8532087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=QKFDlZB5ogTBe2Kj6XV7a7XU+qc5A2nRIIysZy9jWyg=; b=VCuzX7Yo1N0Vvt
	q2IlVNOldvIaqnHOgSAycp20gNTw68YdNS07VAdv4rPe92n2vCYPhlNM6hjb+WCh2U9NtklngkzXQ
	6Zsu5XU+7tesOMY76Mnbeto7QJ6LqbTLF+6aJ3bfkl0kZb3FisH1b0TTWWvMYPflgJvTEQP25+3HR
	OzR8OAr6NNKX059mDW675KaMiWwJ6RkTJo1TT7E5Y7rlfqST36O/rWIk2qMlJhSLJG+Gqfg4Bb3eL
	Pod1yf7+yH5/DnzKhkG1Ct4y+7yHp1IhmU2+XqzJ/wjKBJdQWIaM1FIAfFRtCALIgC/IcGaWPrKit
	1impcgDqFjcEt0/8zHGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8HZ-0001ca-1v; Thu, 01 Aug 2019 10:26:01 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht8HP-0001Sn-Sx
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 10:25:53 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epoutp03309e589f96748b90b9599f1a5888c07e~2xZEd5fpD1104611046epoutp03F
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190801102547epoutp03309e589f96748b90b9599f1a5888c07e~2xZEd5fpD1104611046epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564655147;
 bh=nWm4g8f5rzF6BS1rIC/0wjXRERJwRwtqRkRbpQmoRn4=;
 h=From:To:Subject:Date:References:From;
 b=ozy4BI172Pnlc7dSsDNhrUzPm8M1cGBn0Pd0aBWVJ5bryS6GZ1BL20towhiCodp3r
 ilrB8IiAIfXybuPsJaW0R/We33mS2O6oFqL+fPN314woB8ck3il9wGdD6F9/U0Dy9q
 fxnbx8O2hEdxCgFDoG3XS1RClQn7a7W168k0eS70=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epcas1p4c46badf52918e7ea205bd0a6b984f093~2xZD6hFx_2675026750epcas1p4_;
 Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.162]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 45zmf20j57zMqYkV; Thu,  1 Aug
 2019 10:25:46 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 E3.66.04085.A2EB24D5; Thu,  1 Aug 2019 19:25:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epcas1p4e40553b44ec941ffa82c0f9bc6943c2c~2xZChtsAf0933609336epcas1p4k;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801102545epsmtrp191b0b063502f3e374c78ed2293aa7dc5~2xZCeP0Y72006620066epsmtrp1z;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-8a-5d42be2a3b15
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.0B.03706.92EB24D5; Thu,  1 Aug 2019 19:25:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epsmtip17bc76c97ef1b587d87be47e174097d1b~2xZCU4csu2161821618epsmtip1p;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v4 1/5] mtd: spi-nor: rename SR_TB to indicate the bit used
Date: Sat, 13 Jul 2019 23:59:34 +0900
Message-Id: <20190713145938.19203-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTURjHO7u7282aXW5WJyu0C0IOzV3n7CpZVhYXlFj6oSiWXfSySXtr
 d4r2joikNXX4obQsy2ltItVmsZlaWakUhVGSYabUl8o5yl4whtTmVerb7zz//3P+h+c8GEL4
 0WisyGjlLEZWT0oixHcfxSclynu3axQPvQjdXnEe0I+HOhDa7qxH6NlLARH94W0Qpe+Vt0np
 J93vEbre5wf0N0cmPWqvB5kRjK9xTMp4bsgZt6tKwngcp5h3M62AeXv5CFM7q2BqOl1Aje3X
 b9ZxbCFnieWMBabCIqM2g8zOy9+Rr0pVUIlUGr2JjDWyBi6DzMpRJ+4q0oceSMaWsPriUEnN
 8jyZtGWzxVRs5WJ1Jt6aQXLmQr2ZUpg38qyBLzZqNxaYDOmUQpGsCjkP6XXlP/+IzLNEaU/f
 HfQ0qFxWDRZjEE+BdYHn4jATuBdAnz++GkSEeBrAiVtvpILwC8DeX+qFhnePnYhg6gGwpWFQ
 LBy+A/hjMjDXIcHlcCToRsNCFP5JBKd6L6JhYTmeDUdmhkVhFuNxsLLcOZctw9Ogu2oSESJi
 YPutB3MREHdIoP+KRyQIWfCG1zvPy+GXgU6pwNHwc23lPPPQ57RLheYKAD9cd8wLShiY6gjd
 imEIHg9vdiUJ5fXQF2wCYUbwSBj4eQ4NWyAug2cqCcFCQv9EhVhgCIc+2lCBGWgfODs/Ow3s
 ftmE1oG1jf8CmgFwgZWcmTdoOZ4yq/7/GTeY2zR5mhf0v8jpAzgGyKWywaptGgJlS/gyQx+A
 GEJGyVpWbdUQskK27ChnMeVbivUc3wdUoenZkegVBabQ3hqt+ZQqWalU0impm1JVSnKV7OoM
 rSFwLWvlDnOcmbMs9ImwxdGnwcH+PdSZzrxjw+1lB07lPN2yYV/ksxOjrf6Yhmlb/4XXU1mf
 nyUQznsfq09K7iszK7650n+PL7HtXLQ1RVdmKk8zxL3a3errWt02fgczxKhcG554uJrrXWMd
 ubejWtJzJ5yjk3u/KmRrUpUN59b4Eq7Zho6XqmzBdU5Pbo+m+egXCSnmdSwlRyw8+xcYNzr0
 fwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsWy7bCSnK7mPqdYgw/tUharW6YzWhy5sJbZ
 YuLKycwWf+e8Y7J4dPM3q8XupmXsFkf33GO2mLzzDaPFxyUOFrcnTmZ04PLYOesuu8fmFVoe
 m1Z1snlsXlLvcefHUkaPm/MKPfr/Gnj0bVnFGMARxWWTkpqTWZZapG+XwJXR9PU/U8FfoYq9
 h7ayNjC28XcxcnJICJhI3DmykrmLkYtDSGA3o0Tvj18sEAkJiUc7vwDZHEC2sMThw8UQNR8Z
 Jd5Pn8QIUsMmoCVx4/cmVpCEiMAHJonLk06BNQsLeEvc+HGVCcRmEVCVaGtaCRbnFbCU2NT5
 mhligbzE6g0HmCcwci9gZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcYlqaOxgv
 L4k/xCjAwajEw6vQ4xgrxJpYVlyZe4hRgoNZSYR3sbh9rBBvSmJlVWpRfnxRaU5q8SFGaQ4W
 JXHep3nHIoUE0hNLUrNTUwtSi2CyTBycUg2MnrsDWX4sPcn0Y2l2pJH+R727/+Y9rN+8Mdeh
 4OCDqucNx1g0jhivlt345R6PQ7xS299Iq5J/Sqec9j5W3nkxokX1RdORF1NduhL28a+KCLx9
 QO318qxi9s0qZz5OOM4d1qviuObiElWPvnV7X+28emXj6WN/dp1qMZzw5/s9YblbZsnHrVjz
 riqxFGckGmoxFxUnAgAJqXcFLQIAAA==
X-CMS-MailID: 20190801102545epcas1p4e40553b44ec941ffa82c0f9bc6943c2c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801102545epcas1p4e40553b44ec941ffa82c0f9bc6943c2c
References: <CGME20190801102545epcas1p4e40553b44ec941ffa82c0f9bc6943c2c@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_032552_280998_E555A756 
X-CRM114-Status: GOOD (  18.26  )
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
To avoid ambiguity, rename SR_TB to indicate the bit used.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++-----
 include/linux/mtd/spi-nor.h   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c4f58944b482..612a6f0a87c3 100644
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
index 9f57cdfcc93d..06de3e6e8d4e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -126,7 +126,7 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
-#define SR_TB			BIT(5)	/* Top/Bottom protect */
+#define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
