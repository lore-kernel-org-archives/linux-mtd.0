Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6927FD767DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Dec 2025 11:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8+JJaQchtM1d9DbTTkh14Ie6I7kREVz+LZyfYNWvpQ=; b=AznTLMRbF+PUG4
	IZLQzHpiQaIXwVdHjjr/LUq6O9FVKW43+zMxzmGnVdV2TR+v9pla3MfqpK2snaFJ99Gt8TlkMVkm+
	IpQtJKK0fnVnsQ8uEE5AtHVbqSo+Tw0w1hG1WU5M/SKRBn+Cm6Zrg022Caofyhbws2L/wIKxuvz9Y
	QQfm7UAOLHi3A9w0bv0VwRTXB5E64HdkvLN4xw9XlrzX3fGJwefnL5Xo3yBi0KT/IqofbtChHFh1G
	mTtifr3UY6MPvUZGnqWa4uJ/jBKCmjjh39o0Pk0ItojVEIr39+XPuFwnHZSruO5ZuUaAgcNrmGVLF
	E7DTYPwozuaGyhSw8tCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYMt-0000000AAl4-01U4;
	Fri, 19 Dec 2025 11:09:55 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYMp-0000000AAkQ-1bGL
	for linux-mtd@lists.infradead.org;
	Fri, 19 Dec 2025 11:09:53 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3EBaw2931656;
	Fri, 19 Dec 2025 11:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Z5HMKPntlD2SfcnRohdRi1f6esz4a
	dsfhsvf5J6I6ek=; b=coAB7WjSJYXmQWZKBR/Mxr6XQ8WLAAi99mlyPpC9mkEjX
	HYolW3hq+a6Mlu2INDLaic0pW313j3xNuzWWRC8kHQBd2TnRXGCzwQhi3n68WzQw
	gnjCO5l8XBAwPF/pDlznbmiTDxILsfczlqFZLDsedf9zrzm7MgP5e8sSpv3D2fIb
	8poCxSOvVbzK4ScM9yQQ1dsHijUqL7kDI88rhslIVEKED07QiC5gMvKJLtY8jygO
	jnTcewzUEEC/wc4WZbPL5UVukODn7Qumu8oi/prWyQjNlQ35Hamy4cCdp/bwjrfr
	fVRY88FXCakcUo25j3J2YUmwqIXvRadD5wwxpQSVg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r288xk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 11:09:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ9YxmR014131;
	Fri, 19 Dec 2025 11:09:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qthsthq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Dec 2025 11:09:39 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BJB9cZZ040076;
	Fri, 19 Dec 2025 11:09:39 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4b4qthstgy-1;
	Fri, 19 Dec 2025 11:09:38 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com,
        linux-mtd@lists.infradead.org
Cc: alok.a.tiwarilinux@gmail.com, alok.a.tiwari@oracle.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: cadence: Fix return type of CDMA send-and-wait helper
Date: Fri, 19 Dec 2025 03:09:30 -0800
Message-ID: <20251219110935.2430225-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512190092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5MSBTYWx0ZWRfX8mAMCG43T9gQ
 kqPAPPHmKNRgvQ/rHPcHcVenfU4KsMNDUV7spCNCdbT5e5BcSFKzFjlLd72FSCjQLTkws0dK4Ki
 737mAtqIq6SV30wLdGGefQBn9NhINMHfD69SNgDiRi3okmEY92wik2HA9jeKEKbi7P3072IwiEK
 rrRdkDl1suePCO+55bK2/9YiUSuHldscOYG/hOprj1tFHF3ZKcjs9Y3R0cAiWIbsrIkByw5SwyG
 YzFfhFc4eoI7B5dia3Jab5kjymZhgYXD0EQHsKwy2uwy+8gNxmkhOT36F3rGVG/SpUBigsJUbJX
 NAtevtNd1eeAuqIlj60fFbignyBqyHmA5T7ymk09tpdKiQnxquJAikBjvvKovhkTRJAXEpWFSs7
 FLJrZZ/0lO243aJY0jDP88G4Sy5Q903MGSrNN7d/RnGVUfz2C2r6kwMIVLSJG1xgX1b6UH2EFwE
 mX10pM23FulL80azMOvwXa6Z3NnbDP3UW33kosQg=
X-Proofpoint-GUID: sc93O-L2-7TES9Nz1Dt3LoTepODVLq7e
X-Authority-Analysis: v=2.4 cv=H/nWAuYi c=1 sm=1 tr=0 ts=69453274 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=JvUewqv4KwnGT4yJBGEA:9 cc=ntf awl=host:12109
X-Proofpoint-ORIG-GUID: sc93O-L2-7TES9Nz1Dt3LoTepODVLq7e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_030951_869234_1B8EA152 
X-CRM114-Status: GOOD (  12.39  )
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

cadence_nand_cdma_send_and_wait() propagates negative errno values
from cadence_nand_cdma_send(), returns -ETIMEDOUT on failure and -EIO
when the CDMA engine reports a command failure.

However, it is declared as u32, causing error codes to wrap.
Change the return type to int to correctly propagate errors.

Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 5f037753f78c..99135ec23010 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1066,7 +1066,7 @@ static int cadence_nand_cdma_send(struct cdns_nand_ctrl *cdns_ctrl,
 }
 
 /* Send SDMA command and wait for finish. */
-static u32
+static int
 cadence_nand_cdma_send_and_wait(struct cdns_nand_ctrl *cdns_ctrl,
 				u8 thread)
 {
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
