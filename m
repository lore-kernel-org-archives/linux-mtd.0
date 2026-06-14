Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14101CD98D6
	for <linux-mtd@archiver.kernel.org>; Sun, 14 Jun 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TBbeqQ7fgsGo+kMg84FwM3mnpYUVAsH20tXE1RgV328=; b=NqxYmAXA8iBNZJ
	N32H3Q7eK5+HWiyOtrlKcdZY/7ZnTjumT0Fbmc7V2/kERYeD4TLU+u0H/a1BqrTbuMGKLO3B1nOjz
	CyopJhi1xLGM1zqRYcSdZ06LD0o0SZgIU53Z5WjLoXT6EEjtnzr6fRF8h8zIiAo21GMzzhFIIOdQ6
	NXLh69nM3J1Sf7juIhUw93zFj2P22x8cOUIfhIGnA/0s7f8GRmnNekW6tLOvkBphY7ef04T5PMNff
	SZKW/GXGcbdM8E2GumDoQjIOtKz5I8G7ld/vq32OFmvhIV5jWd5fVbgyth4s/cXaIaUwr6VvN8ira
	l8IXkyOs6CTKSb3QmkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYfw2-0000000CokM-06ZO;
	Sun, 14 Jun 2026 08:11:14 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYfvx-0000000Cojx-2cf6
	for linux-mtd@lists.infradead.org;
	Sun, 14 Jun 2026 08:11:12 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E602A42470398;
	Sun, 14 Jun 2026 08:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=dBwUVwpF8UpikfXpB7S+S5Lp8Cw6O
	YyIpZSLG9xcbEw=; b=UbQUiuGSqbUGLgB2Xj+2boy9kjp5iw897D3qSOuDvPQvk
	UiN9fd45dsXXeFFrmBa/aYz9o8ZtWt3t0uNCm3nqDlDagC0Z3sQgeIvLwweYWb01
	vq2yTTC39RKvCEXSEcX4dt/7/5WoFbH52kOCSfCGeWVIZzgPXifHNN91q1WnSi29
	N+TKUluVWsMT8oWQ0CJdR5q8v1KL1OC5KIwQeh3dzdHY64+Y/cE5gGfXI7sXphVI
	WxWvGg6iT0W/5ct2zsOHYRRaQf4OIjhrvRv3AyPeAnNdshXBOs7iUlwNA1gyRnEu
	4x/1Kry7ZZsngevoQ+g2bx856F2Zv8lL8eUpjNY8w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1828wug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Jun 2026 08:10:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65E885E0026285;
	Sun, 14 Jun 2026 08:10:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erwna11kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 14 Jun 2026 08:10:56 +0000 (GMT)
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65E8AtO2037257;
	Sun, 14 Jun 2026 08:10:55 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4erwna11jp-1;
	Sun, 14 Jun 2026 08:10:55 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] mtd: virt_concat: fix use-after-free in mtd_virt_concat_destroy_joins()
Date: Sun, 14 Jun 2026 01:10:52 -0700
Message-ID: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606140079
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA4MCBTYWx0ZWRfX1qxXwMMO7i6C
 CRf3UNZcADoVeKRcKfS/b1pXl8F5Q93PZMFudSHA2U3sTJp9+WsCMv52WS2w6yRzIxAwoILi1qx
 Xj8uNYGUIW/Has3HQhCM8Vxn9iGqlmVKo0XA5rOvtn96OU/+6Rf2
X-Proofpoint-GUID: doz40zM_JbgHqJJDka8rBcJWYndIVSQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA4MCBTYWx0ZWRfX6P7pE3nGYj0M
 t7UrQKwv+96nP5aHYqTG4ewk96TS1BTRHqnD52wp6Qir9C9oTYxliLy7AsLt5ZDgq6dHtm7Pnf3
 iot/RCEhVjyC6DG3A55kYuSIVzQ1qyeTFoYO6sRR+i0s0PhEFv2atKfWGHLwVglgL9Pm2wBUe5V
 ouXRXLv853KWDk8I1elT6IJaHcuk04CynqUusOHkYKUyi0CLzIEgMQO+vlUu64vioxLDCTahF3y
 raw945mX6q9hSMiHXT41U7RKit+zuAg2W2hyYRCIPTuCG9RZNWdwAwpvz7DTcA7nn2ngCoS5TyL
 W5KMcZES/QQEmBJVwPjPs0VVPcxOnhbRXRH7p6OaNvbfVfl1k+huNON49flkP04mehQPIeJpNIm
 vdTHpa2MuYcpDyXwv9McF6o+uruTaQlYm3Ll8iqytyku6l359Pffwber3t+yv0u09RUC7VnbDCb
 dyfk31Rcs7oICyVtEtw==
X-Proofpoint-ORIG-GUID: doz40zM_JbgHqJJDka8rBcJWYndIVSQq
X-Authority-Analysis: v=2.4 cv=Rr/16imK c=1 sm=1 tr=0 ts=6a2e6211 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=v0qoSzXYcCiXLhW8FuoA:9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_011110_011805_B31C0A2B 
X-CRM114-Status: GOOD (  11.88  )
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

mtd_concat_destroy() frees item->concat so calling
mtd_virt_concat_put_mtd_devices(item->concat) leads to a use after free.

Fix this by moving mtd_virt_concat_put_mtd_devices() before
mtd_concat_destroy()

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is static analysis finding by Smatch, only compile tested.
---
 drivers/mtd/mtd_virt_concat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 37075ead0f33..a3fb96788e9d 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -75,8 +75,8 @@ void mtd_virt_concat_destroy_joins(void)
 		if (item->concat) {
 			mtd_device_unregister(mtd);
 			kfree(mtd->name);
-			mtd_concat_destroy(mtd);
 			mtd_virt_concat_put_mtd_devices(item->concat);
+			mtd_concat_destroy(mtd);
 		}
 	}
 }
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
