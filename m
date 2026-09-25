Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C932FC9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kr3jVG8p6QWeTr/ddUpb90TqUp67Zu/uom/9uXnNmao=; b=HJ+lI0Y9nPKuAq
	1n3fK6cFs3Se1InMIL8f2NXOFoJWYgXwxNbqeGNIZFclp8qsjmY1XGz0jpZEdwNppY/UYgBZcQMBz
	Zlrpsc5hXGlNbqrQ38BQMxiCy8UribvYRCXFigUMcw75lZ2WVOABjMsUBIKDnH8uzCvm4e4gyTg+y
	Kl13P26K1mbz+Er/rBvwtecY3W02vNRY9z0EetQXs0/5R8atqZz96v0y/WTRRKbjnlfO5P7AK2C94
	eC6VqyMyorWUrcxN6ltNBuaANKmviXGGUgdXlUmPby+6bU18DVN9YxkTHD0ILb1dq0Ee3/j4KcfyB
	fjvFWBliI6LWrI0l8wLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5T6-0000000DNMX-22NA;
	Fri, 25 Sep 2026 12:56:00 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5T2-0000000DNLY-31UX
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 12:55:58 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OLMmIA1513496;
	Fri, 25 Sep 2026 12:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=mUg5BDojxXm0bkgUyXGo25cg/QJGZ
	Pwsw9qxyTyKxI0=; b=GGyrdl0fLi8eBX+apkslI+PMm/sGujIfUSNHu4y5Me3Lt
	kPrPPt57Zwm3JpZRBJh1vp8zMdIme1ILgZLYvEBJWgCo0z+Dj/ilEESb3msrVR8Z
	tjhhNYH2BI9tCZZT4es1mKdAi5Y76hT9S6DuS6vJQCrS1KE+MnWQ+DSmym1Y12Sg
	/fR0VQEDh6kxFmHQVK2PhXLslNVtgk9dwMatZz6nRr1eqtzc1yyjJKIgjQY5wKJq
	LNb93KAD9FJAZkDfZYhU7uapKvj0b8iSMRBN8zSRpn2j82sOKbFuQPOQ86ePSecM
	uFMQt2Mdf9HS5KrjKdluJdAgfY/SnhaZT2XaKt5pQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk2d98bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 12:55:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68PCo1L3039573;
	Fri, 25 Sep 2026 12:55:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gtegq8x7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2026 12:55:49 +0000 (GMT)
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68PCtntT014933;
	Fri, 25 Sep 2026 12:55:49 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4gtegq8x79-1;
	Fri, 25 Sep 2026 12:55:49 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        harshit.m.mogalapalli@oracle.com, stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: virt-concat: unlink concat node before freeing it
Date: Fri, 25 Sep 2026 05:55:44 -0700
Message-ID: <20260925125546.1020149-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609250051
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX3yqLDIWnizZF
 EYIfwhFc0+HB8X7VD+v4+2Q0wh5D5Ht4tyBk+DaLLBYZZHQ0qQyueS/EFYOQWXhh3hwLOCVXMnd
 BNcMUdctElbZLWfHPUceELO9RVGth24xQYJfxxuTyGfv2ziOgT2OBTkwh1xYGKvfJFRfKD3P0o7
 IRGWZVOTI8Yz3SqOsPMqiGImZEBbweofr3GDVbSOBn7Xth2ef+BTRj5Yh3Sb36dMjC9e8W8RMj3
 I5IZMRSiIc4/rBBxBpeXIYCJ/2X77jwuDJ0lOGyjUKT4MQS1CNiA83+R9wwpik4C53cDQiizs13
 uULYgHcesMLeOt/NHJBMTakjH+BbW+FUKJhCDanuf85YJhw2/27gk3EQu71HmRhPzoPkztczOjy
 YstZbfjvRa0JVAC5wjY0ZrRiE7mx5HtHKW7LEdDP+z3D4hoKXdkAgCm3FC93jrS9OcMpJeIMBpG
 +MJYqbmElvq6RGQK5ZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX84TUhippg9QL
 RIu4lL2Xw2BwHAVxl9SSnacY3rNt6l4Ltbz7MFIJnfNjmIw7TLYMgBQivq/S8GNXVtY8H7ScNy9
 6axXp4fNm2X8iFc7qCTEJmAHP0a+V1zLdSQbEvLXyhZFQdxwX/vs
X-Proofpoint-ORIG-GUID: LaPCtExoA6xX3mkGIaMqK18F9FP7nmBu
X-Authority-Analysis: v=2.4 cv=f+Ddl+yM c=1 sm=1 tr=0 ts=6ab66f56 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=sl9Z5FRMRRGf1EUxCFUA:9
X-Proofpoint-GUID: LaPCtExoA6xX3mkGIaMqK18F9FP7nmBu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_055556_979652_D1B0623D 
X-CRM114-Status: GOOD (  10.88  )
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

mtd_virt_concat_create_item() links each new mtd_virt_concat_node to
concat_node_list. mtd_virt_concat_destroy() later frees the node after
destroying its concatenated MTD device, but fails to unlink it. A later
list traversal dereferences the freed node, causing a use-after-free.

Remove the node from concat_node_list before freeing it.

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6, smatch
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Was performing static analysis with smatch and found this.
---
 drivers/mtd/mtd_virt_concat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 25cf33fe1ec1..1443f0e4c7cb 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -130,6 +130,7 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 			mtd_concat_destroy(&concat->mtd);
 		}
 
+		list_del(&item->head);
 		for (idx = 0; idx < item->count; idx++)
 			of_node_put(item->nodes[idx]);
 
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
