Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C841C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/UHB0CHqpGZzlGQ4de/HbgKs/rHtvKsjpLt0dsLDr9o=; b=xczkHAvRzgNH7n
	kdKh9kyQOFyzN1Cen94qPl1RSoRgoyyfLj9LLzfmYARg1+QBInePAK3X50XG1FWVuRlcoqsRGn8jp
	nnGgNRZRJa7EBOQ3xOTPek0vWujLc+H5wR6zzzWVaxKmiW1/rlhjBR6Tz30B4TTee7OSTA8wCocgL
	RWTWjMaS6XB4Tgn9uoFW0YctdXXN36N+gBYiH9QLlyRBtBCVMBPB2U+/aVBIm6dFy1GhzMGPNiXWO
	QQepBNEgJ0FrcCPtNv/jRJTBWOk8Mz7ERy89OKtrRn9na//JVN0NN0EHAmoqXKvxtqrcE9WMgpyRO
	YOBIEWC0GWJmP/bSf4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrlR-000kOi-Uz; Tue, 14 Feb 2023 09:38:18 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrlP-000kMp-4y
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 09:38:17 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E8Nwip029770;
	Tue, 14 Feb 2023 09:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=abN3WeABrZKVtxO1m8F3An7TfDTw3na3P2oNLuQ0iD0=;
 b=bMDprgcBQxdcyi2GIA5mnSGE5QDvyaLEK5kBkClQn9Vu97DqG85NwKJ5NS5Gyu5+/oHF
 n+w8O9XuzI3JZ0uGT6XDB/yjqlWl02chc96ujYmXV3hYcNx8RC+hCS+n2CjHHmVH/IOY
 RfACQB4uP3s4ew15KfzopJGaIIYqg9i9EcF4BZaVz/j44P7R0uizLsUY1s//axcgxBPI
 R/dqZ27jYuNd+ACGpYb8PzL3yKgdr+5n5H9HhngC08OMDTzJfCMKovqrpWd4x0JyQn8z
 /wrJpJ43ZG4qS/AB+2LHh/4Q5+IfuzH7JpYSgNkmnnzzRyNmx74Cu6fOwNA9TzaHi6i4 PQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtcvmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 09:38:07 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 31E8hXUI018473;
	Tue, 14 Feb 2023 09:38:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3np1f5sdjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 09:38:07 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31E9YwXd016428;
	Tue, 14 Feb 2023 09:38:06 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3np1f5sdgy-1;
	Tue, 14 Feb 2023 09:38:06 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: 
Cc: harshit.m.mogalapalli@gmail.com, error27@gmail.com, hch@lst.de,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH linux-next] ubi: block: Fix a possible use-after-free bug in ubiblock_create()
Date: Tue, 14 Feb 2023 01:38:01 -0800
Message-Id: <20230214093801.1267044-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302140082
X-Proofpoint-GUID: tf3NqCX4zp4U7_Z1qCxZJXI7tqDbV-L-
X-Proofpoint-ORIG-GUID: tf3NqCX4zp4U7_Z1qCxZJXI7tqDbV-L-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_013815_625479_17BFCA09 
X-CRM114-Status: GOOD (  14.48  )
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

Smatch warns:
	drivers/mtd/ubi/block.c:438 ubiblock_create()
	warn: '&dev->list' not removed from list

'dev' is freed in 'out_free_dev:, but it is still on the list.

To fix this, delete the list item before freeing.

Fixes: 91cc8fbcc8c7 ("ubi: block: set BLK_MQ_F_BLOCKING")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Found by static analysis(smatch). Only Compile tested.
---
 drivers/mtd/ubi/block.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index f5d036203fe7..763704c8d05c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -429,6 +429,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 	return 0;
 
 out_remove_minor:
+	list_del(&dev->list);
 	idr_remove(&ubiblock_minor_idr, gd->first_minor);
 out_cleanup_disk:
 	put_disk(dev->gd);
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
