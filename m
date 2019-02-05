Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE7C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 09:07:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB71B2075B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 09:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BocYhuby"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB71B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LHbo+wdBJywY168Etc9FB95mP5ib2w9JSB931z22VMI=; b=BocYhuby4Zvf0Z
	73y+MV5B5mj8nwxeilIQ+ZIqgLTRkWrBAVtRcn8v6iJdzi8GrBaXQhWFt9kvxtIndBXFQYc1PGj82
	wtbnscyCxamgiM7zNe6vDuaJm9AOMws6p6hDLosMmM4GGWp1/OcB7DUltwK0kVxoeRivU9oZuciR9
	ecbNIOKJzYxvU5rtnJVsbC3twSCeFpYi1ZfgV+dcpao3/DXU6L3gxDQk5QeUwHhRE7AzIcbB4KWqc
	9+qTMfVwsj2uL5ZZPjavf98p62XxYsB8H3xOdqFP3fC7dQyAu0OVxfAOs2wFsx7ZmBRmJltxJpNZP
	t46p34T6VuzMg0tTMKfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqwhW-00016g-Fd; Tue, 05 Feb 2019 09:07:30 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqwhT-00015o-KE
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 09:07:29 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x15975aJ071160
 for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2019 04:07:23 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qf73y19bt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2019 04:07:13 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <aneesh.kumar@linux.ibm.com>;
 Tue, 5 Feb 2019 09:06:03 -0000
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 5 Feb 2019 09:06:01 -0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1595x1V29819076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Feb 2019 09:05:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B153DC6059;
 Tue,  5 Feb 2019 09:05:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BC18C605A;
 Tue,  5 Feb 2019 09:05:58 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.55.126])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 Feb 2019 09:05:57 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Alban Bedel <albeu@free.fr>
Subject: [PATCH] drivers/mtd: Fix device registration error
Date: Tue,  5 Feb 2019 14:35:47 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19020509-0020-0000-0000-00000EB65A12
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010539; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000279; SDB=6.01156606; UDB=6.00603323; IPR=6.00937095; 
 MB=3.00025443; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-05 09:06:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19020509-0021-0000-0000-000064AEE667
Message-Id: <20190205090547.8418-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-05_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902050072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_010727_773447_3DAF67EB 
X-CRM114-Status: GOOD (  19.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This change helps me to get multiple mtd device registered. Without this
I get

sysfs: cannot create duplicate filename '/bus/nvmem/devices/flash0'
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.0.0-rc2-00557-g1ef20ef21f22 #13
Call Trace:
[c0000000b38e3220] [c000000000b58fe4] dump_stack+0xe8/0x164 (unreliable)
[c0000000b38e3270] [c0000000004cf074] sysfs_warn_dup+0x84/0xb0
[c0000000b38e32f0] [c0000000004cf6c4] sysfs_do_create_link_sd.isra.0+0x114/0x150
[c0000000b38e3340] [c000000000726a84] bus_add_device+0x94/0x1e0
[c0000000b38e33c0] [c0000000007218f0] device_add+0x4d0/0x830
[c0000000b38e3480] [c0000000009d54a8] nvmem_register.part.2+0x1c8/0xb30
[c0000000b38e3560] [c000000000834530] mtd_nvmem_add+0x90/0x120
[c0000000b38e3650] [c000000000835bc8] add_mtd_device+0x198/0x4e0
[c0000000b38e36f0] [c00000000083619c] mtd_device_parse_register+0x11c/0x280
[c0000000b38e3780] [c000000000840830] powernv_flash_probe+0x180/0x250
[c0000000b38e3820] [c00000000072c120] platform_drv_probe+0x60/0xf0
[c0000000b38e38a0] [c0000000007283c8] really_probe+0x138/0x4d0
[c0000000b38e3930] [c000000000728acc] driver_probe_device+0x13c/0x1b0
[c0000000b38e39b0] [c000000000728c7c] __driver_attach+0x13c/0x1c0
[c0000000b38e3a30] [c000000000725130] bus_for_each_dev+0xa0/0x120
[c0000000b38e3a90] [c000000000727b2c] driver_attach+0x2c/0x40
[c0000000b38e3ab0] [c0000000007270f8] bus_add_driver+0x228/0x360
[c0000000b38e3b40] [c00000000072a2e0] driver_register+0x90/0x1a0
[c0000000b38e3bb0] [c00000000072c020] __platform_driver_register+0x50/0x70
[c0000000b38e3bd0] [c00000000105c984] powernv_flash_driver_init+0x24/0x38
[c0000000b38e3bf0] [c000000000010904] do_one_initcall+0x84/0x464
[c0000000b38e3cd0] [c000000001004548] kernel_init_freeable+0x530/0x634
[c0000000b38e3db0] [c000000000011154] kernel_init+0x1c/0x168
[c0000000b38e3e20] [c00000000000bed4] ret_from_kernel_thread+0x5c/0x68
mtd mtd1: Failed to register NVMEM device

With the change we now have

/sys/bus/nvmem/devices# ls -al
total 0
drwxr-xr-x 2 root root 0 Feb  5 12:21 .
drwxr-xr-x 4 root root 0 Feb  5 12:21 ..
lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash0 -> ../../../devices/platform/ibm,opal:flash@0/mtd/mtd0/flash0
lrwxrwxrwx 1 root root 0 Feb  5 12:21 flash1 -> ../../../devices/platform/ibm,opal:flash@1/mtd/mtd1/flash1

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 drivers/mtd/mtdcore.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 999b705769a8..90035da3423c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -503,10 +503,11 @@ static int mtd_nvmem_reg_read(void *priv, unsigned int offset,
 	return retlen == bytes ? 0 : -EIO;
 }
 
-static int mtd_nvmem_add(struct mtd_info *mtd)
+static int mtd_nvmem_add(struct mtd_info *mtd, int i)
 {
 	struct nvmem_config config = {};
 
+	config.id = i;
 	config.dev = &mtd->dev;
 	config.name = mtd->name;
 	config.owner = THIS_MODULE;
@@ -616,7 +617,7 @@ int add_mtd_device(struct mtd_info *mtd)
 		goto fail_added;
 
 	/* Add the nvmem provider */
-	error = mtd_nvmem_add(mtd);
+	error = mtd_nvmem_add(mtd, i);
 	if (error)
 		goto fail_nvmem_add;
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
