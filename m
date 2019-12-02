Return-Path: <SRS0=YvPJ=ZY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E3EC432C0
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B38F620881
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2019 06:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cb3Bp6eD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ts7UFVw2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B38F620881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=Qi+Q4uPGvlWAFXsCmXI1NRfJuGDPYiwy3U9ywMS26O8=; b=Cb3Bp6eDyZeoyR
	C3fTqKx3zUt4ighbgvN987M6VGLrLn/T74znfLbu1Pyh62snboEgMEfA2oekFSVdeMSY3CM9H/39V
	9bc5BqXxECeCLKY5HoIk7alLtqqamf+Z6tp1lCAAYTWJLR4dG+3UUo85PmQJoQy53GS25xzwgJhXV
	4zvAY4XHIberUcpN+CfySjIkwWL9p8f4hfXTsQDTl4vKqVoUtIYw2B2gyMuwpsdu0CL4AuIh0PXrD
	LTtcDh4C/PPejvD3dJB7mUBkdsYkge/1OO5HoBxDSbfPwhOvpXQQkVgGQMm2xfO7I/EB5wsaJpgeT
	1/qcNtVK8FyyCfIlbVSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibfJF-00056r-3t; Mon, 02 Dec 2019 06:35:49 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibfIq-0004ii-La
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2019 06:35:27 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epoutp03506489d007384c764f6dc35b6ddaac8c~cel9ok6Hl0545905459epoutp03F
 for <linux-mtd@lists.infradead.org>; Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20191202063519epoutp03506489d007384c764f6dc35b6ddaac8c~cel9ok6Hl0545905459epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1575268519;
 bh=38pehDB71vaIUV+kPWt7SI5WfObn29d0/rlz9wIaVuQ=;
 h=From:To:Subject:Date:References:From;
 b=ts7UFVw2Um3Efqdmpp0TYF0LwWQ/BnsE6t1clTbtor8slcJsnMggRFtBDZXKNoWCD
 F+FolbCKA66/P2Uk6aPIwJmJl1N5P2op04RR63athw/qTA5g3MkMAjM6SU5aSP+x4b
 XKF2bj8PqS47+15PC4E1K67mHj/ZlW9/RBOtOvs0=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20191202063519epcas1p10cc0249cd4cf19adc19c30e4c082eb49~cel9JdyGI2428124281epcas1p1S;
 Mon,  2 Dec 2019 06:35:19 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 47RFjL2yY1zMqYkj; Mon,  2 Dec
 2019 06:35:18 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 A7.2B.51241.6A0B4ED5; Mon,  2 Dec 2019 15:35:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20191202063518epcas1p2ef94da5925a0381da565bb5c66610415~cel77BXul2852128521epcas1p2m;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191202063518epsmtrp2fcc08b5d471471fe97e0873dcc6c77c7~cel76aBEA1646216462epsmtrp2R;
 Mon,  2 Dec 2019 06:35:18 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-5e-5de4b0a6374d
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.79.10238.5A0B4ED5; Mon,  2 Dec 2019 15:35:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191202063517epsmtip2b64f641af969704b5f68da9f6efc9e77~cel7yfQ5E2970029700epsmtip2n;
 Mon,  2 Dec 2019 06:35:17 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: js07.lee@gmail.com, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 js07.lee@samsung.com
Subject: [PATCH 1/3] mtd: spi-nor: Rename SR_TB to indicate the bit used
Date: Mon,  2 Dec 2019 15:35:05 +0900
Message-Id: <20191202063507.21311-1-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGeb2721WcXabWSYTWrTAtdXNOZ2gYiiwSNPpLcayLXqa0j8vu
 NA0iURMRE8WQsiyTpaREpiJ+pJWimcmsIEqxMDUamSuT/GhqzV2j/vud932e87yc9xCYZAgP
 IHKMFsZspPWU0EvQNRQcFtrUNq+R1ZeDavOmw0M1O+nEVX1FTSLV8KMPmGrJGh+Pq3vq3ovU
 HdZL6um1u0hd2dmCUgXp+thshs5izFLGmGnKyjHq4qhTZ7QJWmWUTB4qj1FFU1IjbWDiqMTk
 1NCkHL0rlpLm0fpc11EqzXFU+PFYsynXwkizTZwljmLYLD0rl7FhHG3gco26sEyT4ZhcJotQ
 upRn9dnWy04h2+6bP1BjxQtRx65y5EkAGQlvbq0KypEXISG7ETTZHDhf/EBQu9GK8cUKAlvR
 vMdfy+hWv2ibJWQ/grLhw7xoGcF475T7QkiGwDtnu7uVH3kHwa3XvNuXVENj8U+0zQLyEKxW
 NLoNYjIG6iq7MT5hH7S2PXFHA/kJh9EF+050Itgbm0U8+8KXZ507HADLjn4hzxz03KsW8eYS
 BLPN1h2RAhyL911dCQIjg+FBbzh/vB96nPXuB2GkDzh+VuDbEiDFUFYq4SUUfJ0pEfAM8HLu
 Cs6zGrZmZoT8JDQw/ntIWIUC6/4FNCDUgnYzLGfQMZycVf7/Ne3IvUAhMd1oxJY8iEgCUd5i
 mX1OI8HpPK7AMIiAwCg/8Vvqo0YizqILLjBmk9acq2e4QaR0Ta8aC/DPNLnW0WjRypURCoVC
 FRkVHaVUUHvExNorjYTU0RbmHMOwjPmvz4PwDChEzc4l76RvK0WJ4rxfDXTfWLjtYG3KQJIq
 r//81Hiaz+ug54s+kz6nu06quZSmwlLNAdsCyjiSnmG/eqLYsbhW3xu7cXHMP/3p41HvhzUV
 FeuBnetB7az0aNrYbYybPrWJf97qypyY0Gj36vIF9mssVTUSmFCX/8JffuPp9ycR1ykBl03L
 QzAzR/8BNNE6pVYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAJMWRmVeSWpSXmKPExsWy7bCSvO7SDU9iDVbvt7b4O+cdk8Wjm79Z
 LXY3LWO3OLrnHrPFxyUODqweO2fdZffYvKTe486PpYwefVtWMQawRHHZpKTmZJalFunbJXBl
 LGn9zVawSbhi3+QlrA2Mm/m7GDk5JARMJE7828vexcjFISSwm1Hiy+kpjBAJCYlHO7+wdDFy
 ANnCEocPF0PUfGSUaL3Zyw5SwyagJXHj9yZWkISIwFJGiStXPoA1Cwt4SCxq/gpmswioSnzv
 WQTWwCtgKTGrbwczxAJ5idUbDjBPYORewMiwilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/
 dxMjOBy0NHcwXl4Sf4hRgINRiYe349XjWCHWxLLiytxDjBIczEoivNeVHsYK8aYkVlalFuXH
 F5XmpBYfYpTmYFES532adyxSSCA9sSQ1OzW1ILUIJsvEwSnVwLjiEc/PRaHbt/KJXPt0KrF7
 3Q5eUScunXvqW6/rseRcDbn86UTtsX9zJx142W2ietFeYealxMsSNRX3QiYc8RTedYBB1uHD
 8zZdxzXmi75N2z1bTZZVj/3JhrS7f2SmCaap/LE84fKawSPsZ/mjD/P5cg+z34s59VGTnW+p
 xc2SvA1FdaZMdr+VWIozEg21mIuKEwGe6uP+AwIAAA==
X-CMS-MailID: 20191202063518epcas1p2ef94da5925a0381da565bb5c66610415
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191202063518epcas1p2ef94da5925a0381da565bb5c66610415
References: <CGME20191202063518epcas1p2ef94da5925a0381da565bb5c66610415@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_223525_068633_9328DF1E 
X-CRM114-Status: GOOD (  15.68  )
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

Each vendor uses different bits for SR_TB of flash.
To avoid ambiguity, rename SR_TB to indicate the bit used.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++-----
 include/linux/mtd/spi-nor.h   |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 8d4d721fd7f4..7dea5734f085 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1771,7 +1771,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1903,13 +1903,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1987,14 +1987,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
index 5a4623fc586b..5124c306f60b 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -128,7 +128,8 @@
 #define SR_BP0			BIT(2)	/* Block protect 0 */
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
-#define SR_TB			BIT(5)	/* Top/Bottom protect */
+#define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
