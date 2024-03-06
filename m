Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6925C54E49
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 05:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FdXC5CyJJico5RC/OhqNoVlixQr8y33kdhaARiN3T3c=; b=GapbyiKP6ch+Jx
	GtDtrHaRXHwGUAZItox8zj3SBg6x/UEL3YTBW9UQD9SPBzJRpG8DRtJY0OwrKo9iN6iTuAR+KnP9/
	/WTCQUjzs6PwWJH1fHEqMZ4qmEAG4ZT5JRrgJd716J6xertUrKov5pdadYGte94UinA69CpHNb6NT
	3h74hwc2nzydl7e3jyTxvPNdZp0d74KL353ww+10XnEtNR6MVq7xGhpa0FfftOJtt3bjZcRsXjOUY
	QaYVgp4EDnVmRBGgXVbS/6zMKPHjvkzkH9zotFKQN7f10fBR+TCttdDjkU8Gz/+QldP1HHT0tjHZe
	0/91/v+Pea/IVMepswVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhjSk-0000000GKeh-2xGx;
	Wed, 06 Mar 2024 05:05:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhjSi-0000000GKe8-2Uor
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 05:05:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4264CDSk016800;
	Wed, 6 Mar 2024 05:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=TZFSjoc
	FQ8GlWHSdGzVQA4UjzLLsomxvn7+e+QIxL5w=; b=gak8e1pNHaA3ZZ4F19RGR9x
	28ASvK82W2kXMOdlTozjKIoAwBTFdbm64jBKmiOHlnKZO1ubLFAygbjAKISborLY
	AOEyOi9R5jjAL1J89OqJRm0ZDlsNTnHzuFlVA7xmWZJMfL+w2qiwIvevjvlTLOSK
	mhRRjn8lTFMQwNNdZqYvXK5v09gyO53bSD/y9/AfcV5xm4pmlydit10ctvuLpwXg
	RMiHjXmotL/VDdh0/YGnk4oIEZUHKLq957ET3zHHUDtUXNX93+izTurv0CNA+SEs
	2lV2ATtFDn9jlZvKb0kKuU4psxqY2yN87sISVfCggyLwpFTQ5LkNrGpW1bx7Nwg=
	=
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wp07w2drf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 05:05:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42654xZ1024858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 05:04:59 GMT
Received: from 3b9e253d05fa.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Mar 2024 21:04:57 -0800
From: Weimin Xie <quic_weimxie@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: fix out-of-bounds issue in inftl_add_mtd() and nftl_add_mtd()
Date: Wed, 6 Mar 2024 05:04:50 +0000
Message-ID: <20240306050450.1429675-1-quic_weimxie@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X_aESGEvCL8L3yErI1q6J3zqBQ57WCbk
X-Proofpoint-GUID: X_aESGEvCL8L3yErI1q6J3zqBQ57WCbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_02,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_210504_806397_044EA8F3 
X-CRM114-Status: GOOD (  14.07  )
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

when the length of mtd->name is less than 10, it will hit out-of-bounds
issue.

OOB log of nftl_add_mtd():
[    3.918811][    T1] Creating 44 MTD partitions on "1c98000.nand":
[    3.918916][    T1] 0x000000000000-0x000000400000 : "sbl"
[    3.922087][    T1] ==================================================================
[    3.922163][    T1] BUG: KASAN: slab-out-of-bounds in bcmp+0x44/0xe0
[    3.922263][    T1] Read of size 8 at addr ffffff8003590d00 by task swapper/0/1
[    3.922384][    T1] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.15.123-debug-g63e58e33b056-dirty #1
[    3.922484][    T1] Hardware name: XXX
[    3.922557][    T1] Call trace:
[    3.922611][    T1]  dump_backtrace+0x0/0x404
[    3.922699][    T1]  show_stack+0x30/0x44
[    3.922781][    T1]  dump_stack_lvl+0x90/0xb0
[    3.922875][    T1]  print_address_description+0x78/0x38c
[    3.922978][    T1]  kasan_report+0x184/0x1fc
[    3.923071][    T1]  kasan_check_range+0x278/0x2b8
[    3.923167][    T1]  __asan_loadN+0x44/0x54
[    3.923264][    T1]  bcmp+0x44/0xe0
[    3.923342][    T1]  nftl_add_mtd+0xb0/0x384
[    3.923441][    T1]  blktrans_notify_add+0x6c/0xb4
[    3.923538][    T1]  add_mtd_device+0x8f0/0xaec
[    3.923626][    T1]  add_mtd_partitions+0x148/0x330
[    3.923721][    T1]  mtd_device_parse_register+0x66c/0x860
[    3.923813][    T1]  msm_nand_probe+0xf74/0x107c
[    3.923897][    T1]  platform_probe+0x108/0x168

OOB log of inftl_add_mtd():
[    3.918811][    T1] Creating 44 MTD partitions on "1c98000.nand":
[    3.918028][    T1] 0x000000000000-0x000000400000 : "sbl"
[    3.921215][    T1] ==================================================================
[    3.921288][    T1] BUG: KASAN: slab-out-of-bounds in bcmp+0x44/0xe0
[    3.921386][    T1] Read of size 8 at addr ffffff8003593100 by task swapper/0/1
[    3.921509][    T1] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.15.123-debug-g63e58e33b056 #1
[    3.921606][    T1] Hardware name: XXX
[    3.921675][    T1] Call trace:
[    3.921728][    T1]  dump_backtrace+0x0/0x404
[    3.921821][    T1]  show_stack+0x30/0x44
[    3.921904][    T1]  dump_stack_lvl+0x90/0xb0
[    3.921999][    T1]  print_address_description+0x78/0x38c
[    3.922102][    T1]  kasan_report+0x184/0x1fc
[    3.922195][    T1]  kasan_check_range+0x278/0x2b8
[    3.922290][    T1]  __asan_loadN+0x44/0x54
[    3.922388][    T1]  bcmp+0x44/0xe0
[    3.922466][    T1]  inftl_add_mtd+0xb0/0x3a8
[    3.922568][    T1]  blktrans_notify_add+0x6c/0xb4
[    3.922665][    T1]  add_mtd_device+0x8f0/0xaec
[    3.922752][    T1]  add_mtd_partitions+0x148/0x330
[    3.922847][    T1]  mtd_device_parse_register+0x66c/0x860
[    3.922940][    T1]  msm_nand_probe+0xf74/0x107c
[    3.923024][    T1]  platform_probe+0x108/0x168

Signed-off-by: Weimin Xie <quic_weimxie@quicinc.com>
---
 drivers/mtd/inftlcore.c | 2 +-
 drivers/mtd/nftlcore.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 9739387cff8c..37484d914bd0 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -40,7 +40,7 @@ static void inftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (!mtd_type_is_nand(mtd) || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
-	if (memcmp(mtd->name, "DiskOnChip", 10))
+	if (strncmp(mtd->name, "DiskOnChip", 10))
 		return;
 
 	if (!mtd->_block_isbad) {
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 64d319e959b2..599b84548086 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -40,7 +40,7 @@ static void nftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	if (!mtd_type_is_nand(mtd) || mtd->size > UINT_MAX)
 		return;
 	/* OK, this is moderately ugly.  But probably safe.  Alternatives? */
-	if (memcmp(mtd->name, "DiskOnChip", 10))
+	if (strncmp(mtd->name, "DiskOnChip", 10))
 		return;
 
 	pr_debug("NFTL: add_mtd for %s\n", mtd->name);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
