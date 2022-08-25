Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D1CC28D13
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 06:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VKBkffmK0Ctxd2cfTZhHEHpjwscyYw4Tfisopp1qogY=; b=emHwvYckesH8Ht
	kT0gz0x4nD8xK5li1yBU2fA/yf2XwFVYhHTjclDV43wrWls+B9/zwq1U4hTa6vtWMMw9ZuMXCTTOc
	JkJN6RgoQFxnThRdgANg8ogcAs42OyF5dnKnYTDhYJCdKS3xPHzvxrGHFy5D/4cZdpxS/3iZHrv44
	j90tfGrn+RLsiB94KVNmm5XS7wfjoreygCEMtDz7BaONifkgLHW2+O5XaEI7YGXf0FWQGjqSCfL43
	2O7B8UHYFauk7xGWi0w9EPnMaiLBL5Gp8dngLomjxY03ePxij1hkhX9X9nN9FPvFOb6t2fmVIQS/b
	NTCFvETa2nkEULmlHd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR5yb-007jFO-3G; Thu, 25 Aug 2022 06:04:25 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR5yV-007jA1-Iu
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 06:04:21 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P5vOCC004173;
	Wed, 24 Aug 2022 23:04:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=faTEiM2JXFLbZRmgbMJeeabYaB8qDwx444+BAMfW2UI=;
 b=VdGhr0kEfk1QLU455brEhATO6uISCYAVTmeKypcNjG/e/MqYo6PEyXW4jzp/Sqpr5NlZ
 jkzrHTgVCjFQiXodJIgjB3xItr1iVOnxH5Wu40XubWhJjZWHPfKKpeQ6L8f5A5LeT2B0
 4F9wQNhPi41qW5tV006mRH2A5dGL7c9Z8FkKA/IznJnOUsYhIsa7XqChEEnDTdwp0qBR
 yKu6PXYIoHigKt/ueO8eyxQIMSlPq+Z7eI3DKwuIUyafcihnKRa/YFn0paXyD089M//G
 0t7+ZsP177ZLW9SexdlrklFpjKs0C943NdUmGRMEJ7qXOGrHhW5HGhwrLCN10cnCpNj0 4g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j53rvhf0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 24 Aug 2022 23:04:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 24 Aug 2022 23:04:10 -0700
Received: from otp-azaharia-l2.corp.ad.wrs.com (128.224.78.230) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 24 Aug 2022 23:04:08 -0700
From: Adrian Zaharia <Adrian.Zaharia@windriver.com>
To: <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <jani.nurminen@windriver.com>, <adrian.zaharia@windriver.com>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH 0/1] mtd: mtdpart: Fix cosmetic print
Date: Thu, 25 Aug 2022 09:04:06 +0300
Message-ID: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: yXX5wKaTX_POmSS2U_h6-5Z60LOu4GHN
X-Proofpoint-ORIG-GUID: yXX5wKaTX_POmSS2U_h6-5Z60LOu4GHN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=579 mlxscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_230419_728295_590A7E73 
X-CRM114-Status: GOOD (  12.80  )
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

The print of the MTD partitions during boot are off-by-one for the size.
This patch fixes this issue and shows the real last offset.

Jani Nurminen (1):
  mtd: mtdpart: Fix cosmetic print

 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)


base-commit: 072e51356cd5a4a1c12c1020bc054c99b98333df
-- 
2.37.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
