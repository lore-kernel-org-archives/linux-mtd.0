Return-Path: <SRS0=RMHD=KJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F09C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 14:28:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910A061406
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 14:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 910A061406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RmgzlDHbw8TyyLOyKU1WY2X+RG9MSs23O2LOjOmQ75s=; b=hRSih+MHT6zVmWRomuNx4XKzZw
	PEe7xgHbPU+IkPINT7HmLPsC6cny0YupMp60mXjN/ba2s4I0QUjnH72U8V0FnpcLIIAwkjMMLcJue
	lejm2b2K6aeFP0687JE8tl2/IfBr4vvbINzLB/h+t/bIjlpQf3YRI0tCqVyzxdYC29l/w216Fag7X
	IULrJUXpmR6wRvqtCK2TGkl49c+dZEcU83BfBE4HqiyxkQLpBDKunWFsLbq9P3ETCHdZOBAgBs/SS
	0XzHPOUWSA0vsniSNZKOpyXierJ/pQ5KvfrMe67AvNGurGfUpo5pL8MGy8snM9abI4RBf4hpALErb
	D9t7yDjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhYn2-008HVr-Ji; Fri, 14 May 2021 14:27:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYn1-008HVi-3n
 for linux-mtd@desiato.infradead.org; Fri, 14 May 2021 14:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xoGMcMduUxbkEKICEOxnEMCQqvsCuv5m2wxRFwEknrE=; b=n+GWlMJPdVTO3l/YM3WzQQP/24
 1jnrWPcHirmHLQQWLJE1mkkQ14S80eKyYkKTfozkgSlpA4614eZXqu3H0dxFcAJ2e+bsuXOIgiGCB
 nFjWbrlVyMrmsnPDVHG0SQMYgtYNF2ONerF1O8da0KbnyquzqpiMFT9mlZuwhhWE3Ufd7t0N2ZecZ
 kafjBjKsGKsn9oS/Nj0Zc1sYjC9xKT2NV/nvu/GF5wP4g9KfIB90qnpAaXTqmaJUK3DAGIYDA6azc
 39tn7XLBafQDmmNu+53y7rr/RNV43WaexcyrWjM8N8Ygpp1gbxN0r2Bgb5wKdAy23nUt6BlkGs1ob
 HEYpAXwQ==;
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhYmy-00C2Zm-FS
 for linux-mtd@lists.infradead.org; Fri, 14 May 2021 14:27:41 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOQTp126175;
 Fri, 14 May 2021 14:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=xoGMcMduUxbkEKICEOxnEMCQqvsCuv5m2wxRFwEknrE=;
 b=jB75CIxTXHKAV9h/I3HrdNMhgAZmhafRKC75P7KZaYz33tRV85ASBFWEmJqSiZTeGwxW
 v+oW1Qyhcu9W4LZvxTJMVU41g7/xCZW567tp46LnQguXhzTCfklwBXLXoPvWV4LqRY5C
 AeGxS8bCh9esgJPSSrRVKcNVMdUOtr5Fj37t0qPznq8aYhex1smbNJqbNk4Dm2oFlkrR
 +jbhyheXA6eLFNwQSwjb6TL52tUOPP5M9wNSOyzDDjPstAA8LjxJilbIzQQ9rbrdKlFd
 uvoX+LctnIZC5G8jK+/WBc11JvmPY2TycgyiLikLQ81+GEyTK/WYTtXidIGvLa3aBfWi Zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 38gpndcg67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:27:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14EEOsVD167793;
 Fri, 14 May 2021 14:27:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38gppecqpn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:27:30 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14EERUlk194103;
 Fri, 14 May 2021 14:27:30 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 38gppecqmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 14:27:30 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14EERMX1000849;
 Fri, 14 May 2021 14:27:24 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 14 May 2021 14:27:21 +0000
Date: Fri, 14 May 2021 17:27:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: core: Potential NULL dereference in mtd_otp_size()
Message-ID: <YJ6Iw3iNvGycAWV6@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: iXhTkydWML_4O-1CgPpjGH9HkquPLdT3
X-Proofpoint-GUID: iXhTkydWML_4O-1CgPpjGH9HkquPLdT3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_072740_671473_E48F536B 
X-CRM114-Status: GOOD (  14.36  )
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

If kmalloc() fails then it could lead to a NULL dereference.  Check and
return -ENOMEM on error.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/mtdcore.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ae261661eea..9624ad1b999c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -779,12 +779,16 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 {
-	struct otp_info *info = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	struct otp_info *info;
 	ssize_t size = 0;
 	unsigned int i;
 	size_t retlen;
 	int ret;
 
+	info = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
 	if (is_user)
 		ret = mtd_get_user_prot_info(mtd, PAGE_SIZE, &retlen, info);
 	else
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
