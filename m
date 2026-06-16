Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC12CD98CF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zQ+W9H6zx+aFvRne4PNozjB7oE1USh2yd6ofXL84nUk=; b=pdgHPlRSLf4WqO
	Y/UYiyOsa5Wcxz57WugSycLqEcJxDZVojEqc/BQJ3eVo9xPyWIJ0huv3+sztfE+dTaUXGP/Ol5flM
	2/4Tsi2TtQyMamIzM9O4wcF7Zo2kQ8sMjCO4Dblgz75wojs8jjht2mCDWlQCkgcEMx5JJMSknvYpU
	fDdHAoF7cJqSP4SxcB5jVmZ1ZsIJmekts9TNMvmv1smqylq+QV9BPF5hJdloey4SUiyz1lHwNtg4u
	fYX/UXug9fhy2gA+KmHrB+TvXB0lXBELfxdm+Yk70an2l6dD84SMpBoRLPgLsZ9j6DLU8NH1MPyQU
	11Qtry6XlEwA3xhrR9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQos-0000000FaXl-3LcR;
	Tue, 16 Jun 2026 10:14:58 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQop-0000000FaXM-216e
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 10:14:57 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FKGMeo1349670;
	Tue, 16 Jun 2026 10:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=NDZ/rNAyyiQztJHXv1jXH/dgpJCxA
	0grh9rlj860HiU=; b=eroxbPzqEiFUuwHPbjsRZJ80Hfzrmd8WJptwMYnZERr6t
	sB7dvzVyOjhBEwoFl23cbBwG42G+ufm09yvfqzh3QGQxAOx+VjsrCiRjpJDn3QzP
	van1+ALTzfduWhwC603ayEooqSlEp25AsIyYZoqXOdOoMunhW0tVDWrYYiPBojLh
	Oo5X65wB6AY1J3EZwh9SeA9+VPZPrOuTqhdk6/jcp8WPq8wxjlCmdgsCNtKNrmuO
	JGiTV+ZMqxcoWbueGp1Zg302KCC2f+vrN9k1HGsljEJKGq7FTRanpzI+ijWkrqGd
	RPoIVJVX6LXnpOygGSSFLh5PyhKR+GlSa3XVL9nqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1acc62f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 10:14:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65GAD9MI017054;
	Tue, 16 Jun 2026 10:14:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4etq679av2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 10:14:44 +0000 (GMT)
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65GAEhUc021963;
	Tue, 16 Jun 2026 10:14:43 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4etq679aup-1;
	Tue, 16 Jun 2026 10:14:43 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] mtd: virt_concat: fix use-after-free in mtd_virt_concat_destroy()
Date: Tue, 16 Jun 2026 03:14:39 -0700
Message-ID: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606160103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMyBTYWx0ZWRfX3G+bETHaEmfM
 ZmNeyMKvsbk8lLdwyh6X1GQK6nh1Zl8z5fX8sv8QdY3wqqUblLsQ30pX3ErRjo3oSFDAUWNIOsw
 PKlNxS2iuX8dJrwf75gAZEi1LpWZucLiXcT6eZv7XpCitD5yWQjlL0LmIY7azXvhTayVtAuSjeK
 eWtyhdSHMGLlDmVMJBndcjwWSH6XCTJqpozi0MOCMSp1qrWeMlkRbjLBAcElOQspD5yEP9yifdC
 SBF/xSMhuhSk++bPWzjcVi0x1aJ/YFWKnWJUfOXHJBdVeFgf2G+aKPYLkHG4xzknVtamcV0xmV2
 3OtQBNrtDi5sTUlT7FYk0xUG5iXSeL529toZTCfQFA/piXC0Pw20IzZrB4GdrVjrsL8HEyGzkg8
 AymUSH/ubeQmXahQn8U3yDQ5/Y+m57S2KQn7OY8g0pi0OdInVoa1dOjDhTaYCVjytU/tjrOCqw0
 Fy6HijH+dJbPC8DlCFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMyBTYWx0ZWRfX5S1cS4IG8QRG
 ZCNYH/johDAAXa25pWiHVL50RYLzp59egxgcKf91CRXGKNivMyT6VF6AXhc5edNiTgcSrr4l+OL
 NjukKWoxLPsPo7VBHiQpKtWjcV4T/AZNzlPRMAMQiGSv2yxIGtPs
X-Proofpoint-ORIG-GUID: lQaW7GYi0jxgZ1WDebdFVYXrAkF9fXwj
X-Proofpoint-GUID: lQaW7GYi0jxgZ1WDebdFVYXrAkF9fXwj
X-Authority-Analysis: v=2.4 cv=IqQutr/g c=1 sm=1 tr=0 ts=6a312215 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=gnUwlkPgrbXfXN16ycUA:9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_031455_912076_480EA4A5 
X-CRM114-Status: GOOD (  11.75  )
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
mtd_virt_concat_put_mtd_devices(item->concat) after that leads to a
use-after-free.

Fix it by moving mtd_virt_concat_put_mtd_devices() before
mtd_concat_destroy().

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/mtd/mtd_virt_concat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index a3fb96788e9d..c872a8827718 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -126,8 +126,8 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 		if (concat->mtd.name) {
 			del_mtd_device(&concat->mtd);
 			kfree(concat->mtd.name);
-			mtd_concat_destroy(&concat->mtd);
 			mtd_virt_concat_put_mtd_devices(item->concat);
+			mtd_concat_destroy(&concat->mtd);
 		}
 
 		for (idx = 0; idx < item->count; idx++)
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
