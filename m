Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6219C28D13
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 06:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtX/OpF79tPIvRBK9oT9vTOi2wTfYcl0Co3zAKMGPrA=; b=l4LJCdwQdfgvds
	xphiyb4BQkM/VQ5+LNKeGmRZ5xLbxTtLloM/5uH5LRSvikUfzLpWcIOBqzJsqkrGuo6meSFRIf68e
	BmpVhgIpEXwKhzwxOi/Uq1fFNLAeVBKfxy+uc7bNb/8L7QNjN41ii/GuQ+PX9BFoDsH7yb6KEFn3V
	VIFIZgCsNzk/mAmBxWcGCffw4neHmBnlsSPQujYMOSMcWKyWblp3rQGmW9gZ1ifkItOEZaOuOcbil
	b0lUdha80Zobwy6g7np7yQQ+TW3WTH2TrB5BMvdxG6CWFyMSBsOKAF0SQ82kM3P/jZzZQFaRyy8rg
	dZgTzER3ZFQPnKC0b4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR5yq-007jKg-68; Thu, 25 Aug 2022 06:04:40 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR5yV-007jA0-JA
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 06:04:21 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P60AUR011000;
	Wed, 24 Aug 2022 23:04:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=X9RNAuRl48yKaT3FZoepRQ1FjmBaxmqyZCz8sO6VjWs=;
 b=CQ/qfPU+0h5ddUlGDmeqyHjQ/quRKmF9eO4mnzYTdMSGBe0VDGMAgApI/EOzGAT269H2
 IbrUU29uQhNsJBNfTuat0VQjydR18zLLVVlVVgxtEls1/sWy1GcRieAj/VJJHxLoL2Pc
 S2dJsyxDRgH2FAQ7xfugBIXZiIURo5hxjb0aDw1vGfHIBDlD7/lMOtheofRTbtXIzbxG
 6/dY91glVBekz9it01iJKBykUBW1LK3ZfOmXofNYXjCNYliRCL+OyWvCLdSKJM+FZEg3
 4nzjoN1VBIz/N31vXjpdZ9s+ycuh5uf60MsI87XekvNpE4Hux9V65eXjxqU97yoSy4FT sA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvhf0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 24 Aug 2022 23:04:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Aug 2022 23:04:13 -0700
Received: from otp-azaharia-l2.corp.ad.wrs.com (128.224.78.230) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 24 Aug 2022 23:04:11 -0700
From: Adrian Zaharia <Adrian.Zaharia@windriver.com>
To: <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <jani.nurminen@windriver.com>, <adrian.zaharia@windriver.com>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH 1/1] mtd: mtdpart: Fix cosmetic print
Date: Thu, 25 Aug 2022 09:04:07 +0300
Message-ID: <20220825060407.335475-2-Adrian.Zaharia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
References: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 8ZGl-Ddu7gZ63T_cH1hE1rLUZ2vFDtif
X-Proofpoint-ORIG-GUID: 8ZGl-Ddu7gZ63T_cH1hE1rLUZ2vFDtif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=824 mlxscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_230419_735940_E9FB7442 
X-CRM114-Status: GOOD (  16.22  )
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

From: Jani Nurminen <jani.nurminen@windriver.com>

The print of the MTD partitions during boot are off-by-one for the size.
Fix this and show the real last offset.

Fixes: 3d6f657ced2b ("mtd: mtdpart: Fix cosmetic print")
Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d442fa94c872..fab10e6d4171 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -118,7 +118,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		child->part.size = parent_size - child->part.offset;
 
 	printk(KERN_NOTICE "0x%012llx-0x%012llx : \"%s\"\n",
-	       child->part.offset, child->part.offset + child->part.size,
+	       child->part.offset, child->part.offset + child->part.size - 1,
 	       child->name);
 
 	/* let's do some sanity checks */
-- 
2.37.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
