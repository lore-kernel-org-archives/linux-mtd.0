Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AC4C9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKNTG4rB68kxx6QnqbqRcOD9/BTqPK03ZpXnhxehN4A=; b=DuXcmYzQ0kSJnj
	2E9KTnCiN8E7wFbPArzLD5XzVIUnhT0Kkp/deecV2F381/rwp42GGMXzqTR8v8gRi++fuSRNBWp8O
	VMKxgzZ9G54SknCC/GPJX4hnpUHgLy2YCV7Sx1i+GK5n7blJFSr7w1x2wDGD3XSkf1PtKid49ekv2
	+WsrCnQvRh2k5a70nVEiHa4GgBDM7jKNon0KBeIjVIl7jcOx/pjrb2q+2a/FEcBbnOkgobRfKR9tx
	EhejMwRxZ4Rl7vhPj2Ny2HYg5C4cBFb6RfY8HpGtsj0U7pl9hF37XKu+kT3swp6OIAYIo4noO12WV
	/o8x7Bbw2LR6MdKh0Oig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qlz-0000000CD1c-1wUF;
	Thu, 24 Sep 2026 21:14:31 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qlv-0000000CCzn-2Uph
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 21:14:29 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OKN0Vw2048300;
	Thu, 24 Sep 2026 21:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Od8uxzFRcXn1dKpqU0OqpahPidb7/
	qjJpGL+wca7Ewc=; b=ANDDhvCUKHFCQfrKPhvRVYRMyLmzfBvwW7DDJwyz7iKac
	oZjC8uITxkljlY/I/0Kilnir5B93Jg1pecr3ZeuTpcSw5/35N3y/TwCAMRHpMvYQ
	0o3qRh++LyHw7iruhGeP5CZ7fuhiZAxYW5yzVZleqifNaSxbaoGJFSl0PQwOPdXS
	J7VFFwYmX4XlO77okcKkB2AlJHDXErrsAAqi0TKVhahv30QYtAaDO/fPbV6EQITM
	kkyFeHJ1d+Q5p3HItrBy9yP8cwuOoGtceh6O1gT7OB1fNz1aiIvLCge0UAWJui0K
	DmtjzLuwioiGCakLYuSLR+/+yC4wGQbCm/ZWC7B8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk1qggwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 21:14:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68OL5RfL015582;
	Thu, 24 Sep 2026 21:14:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4guf11wcb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 21:14:15 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68OLEF9X038867;
	Thu, 24 Sep 2026 21:14:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4guf11wcax-1;
	Thu, 24 Sep 2026 21:14:15 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        harshit.m.mogalapalli@oracle.com,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] mtd: concat: use container_of_const() in CONCAT()
Date: Thu, 24 Sep 2026 14:14:11 -0700
Message-ID: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609240086
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXypevihtfVMZa
 06jAWhQxyf89229zVhBNU/XivNr3VdERq+QR+H5qydBMxeohcpwVr9YlM9cZA5b/mZmecdUkA0e
 sMzzeyIKEZoqgZoYp7VJMBfX6VVItueo/+ysZEZjzT91VXTC84SP
X-Proofpoint-ORIG-GUID: UWOImZUVJdpuO9Z13whXJXXYakAk3_Eu
X-Proofpoint-GUID: UWOImZUVJdpuO9Z13whXJXXYakAk3_Eu
X-Authority-Analysis: v=2.4 cv=LIzz05W9 c=1 sm=1 tr=0 ts=6ab592a9 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=P-IC7800AAAA:8 a=yPCof4ZbAAAA:8
 a=qdRr1Xr1hLVJPj8QfBgA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX/RYitdufrGa/
 Rdhj2soTuBl9uMdo0cYEy55sIFlyhl5i3YMgNN8EIpFux0d7kG9hB2PO4f5jQB8od9A9eZRRIpt
 UjzSFh1ByBKAtzst41Az4k0/82qHmfrAZcV6qssPGF9VmTSUxj0r6syUKiFN7XqOfpWlSWFNzMy
 3j6l4xOKZ6ykQKoBrDjGaT8LypMUZc1PbjjMy4208Pb6Xe+zImkTWK3F0bIQlAA79kfxYWMw+kA
 gCR41A39oco2ZTpkeCcKsi48tIYH528bRmem/eL//QFNCGCElXDIxh0iEECp23c7SAvrkGK2QGb
 xgCZ5nDHUZaZAd25eRzLOTsyU8kP4nJJRpLpTJdUkdELyHDYO5Y6PFn6MWPaIHmpED+n/GTdYW7
 zJYboHQ1/SJlqNLATvVwf/zQBvD8IqlsercrvSVkfQnnFPMzBo7GWz9PapGg98QioPx/Qgdx5Iw
 AzOqOFSARkjSOPd9VcqOqae890zGmQLQRfPJc/Lc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_141428_066296_3FE5DBE7 
X-CRM114-Status: GOOD (  14.50  )
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

CONCAT() currently recovers the enclosing struct mtd_concat by casting
its embedded struct mtd_info pointer. This assumes mtd remains the first
member of the structure.

Use container_of_const() with the named member to make the relationship
explicit and preserve any const qualifier.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/mtd/mtdconcat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d54d309c30a0..354cc71cd722 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -31,7 +31,7 @@
  * Given a pointer to the MTD object in the mtd_concat structure,
  * we can retrieve the pointer to that structure with this macro.
  */
-#define CONCAT(x)  ((struct mtd_concat *)(x))
+#define CONCAT(x)  container_of_const(x, struct mtd_concat, mtd)
 
 /*
  * MTD methods which look up the relevant subdevice, translate the
-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
