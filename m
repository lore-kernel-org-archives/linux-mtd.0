Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB44DC44500
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JAi4y8dg8SaTU8ijdkmHx90xwy6677EVsQD9n8u0Vjs=; b=Od5pxOGCA6jtyr
	+xrVdkN1hVD4jFa+BTq1N3aq3IuCLtGdzIsfQ1Wk1ZDalCUNI8FSo/WxJyxF5LaqV+6E8qTOLTvzo
	wlsZ71IK3ZdJh7gm99Es3/guzGBJtA8pNib4uUjpVQMWTuRjeF4b4NW/69SqRgEIjMOHytiRoBMJO
	sw1cDi6E+8lho4u+94ZWIZjG2bLrlOBnHlMUp8LfJmtR1YPmCWkDG6PE6ET+JQ0Dnm56NgNCYzYVR
	VPdKmVxRtEhYtagyhvdUO9yE/d47NAfvsIh518TBvWEJn/HQW5rxs5idk6hZL74veZBCG7ibpU+hU
	IRD2WcCNqrkjb9QFw8UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmi-00000001nlQ-3P2W;
	Wed, 01 Jul 2026 12:11:20 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetmc-00000001njM-2Z91
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 12:11:19 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A7WJ83294604;
	Wed, 1 Jul 2026 05:10:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=eBD/xWm2Q
	CcbmcM3FX4cJZJYgeofplOLtfX12BGAL3I=; b=L08W4Ypz8TbU60935ELaT1+AF
	OSfOtj+ab4CI8z/QG64E2SCh80N7i/NHulJY2jOXmUjbUHarPTz4S0JJXjwBznhw
	ORtfNtzZvGS0gnvcJOU5W4QhAcRNBb4I0cXRPXcBjslHn6zy29qhnR41eZzToD1i
	iV+Eyic9HU6D4QFKLmeAHFU/ggwBGDqO3hp417t0cuUWxZ8HLcOVCoBseq5aQKiB
	P4y+bMSNBHVnD3rCiZMMfHQDszlO/DCIbkxem6ZOapgQQs4q7QqRIl9QZMS1Tdsk
	QQa0GLqBPO9T5JQcxNPWc+KdFv9NhKJ2ef5hdvZuezfaiEVK2rwoIJNUj9JUQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4f2e1gwexn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 01 Jul 2026 05:10:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 1 Jul 2026 05:10:45 -0700
Received: from pek-lpd-ccm6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 1 Jul 2026 05:10:43 -0700
From: Xue Lei <Xue.Lei@windriver.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <alexander.usyskin@intel.com>, <tomas.winkler@intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <Xue.Lei@windriver.com>
Subject: [PATCH] mtd: fix double free and WARN_ON in add_mtd_device() error paths
Date: Wed, 1 Jul 2026 20:10:42 +0800
Message-ID: <20260701121042.3333247-1-Xue.Lei@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: g0rs2pnDVcRSnH9GHSiJVlDid7sWI-_X
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfX/A2rRPFdA8XG
 cANFdr/A3i5ktysdbz2spzs645hwsPJX8ylHGLAjCD3OS9tgEJrgqBg1gij5JhmVmDBLIKTzjRf
 uAgOlIRkKbQ/mH7odATm0jUOm3T/zwMFqDh0vskMdzr0YS4bMYz8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEyOCBTYWx0ZWRfX8Bi3A5+oHn/O
 W6BlLaM6HygVahnv77ClbfHfcmpXIdRtVaXaDzwOl3SPfAnu7TPJXNN7D5XNqTCyJ6fzg7BpanW
 BJF+Ot3KvYk9Oel0sgByMtpSurDyFcGg5ZvA3pHaYyzs1w052A/XofnL2tXp9FTHXlJJUPZShG0
 CDELVZ85Rs0Y4sFUmzDw1bxLJYdtRVbCvB33OYI9zJWA6jLuwKGFLX8sE5ik9WsQskEoQxE0i9F
 piNMLn03/bfUQDJmhyNAxxRR4OYDQMyDyfLwZpJ7ay1Dbh2EdQVLiwD0bJGbWewhFOGP5vVEMxF
 FqXWM+WB4ig4/V2KAZjLAKganCCLKPXkcKZsR19Fx1EzKnE8JTaRVxKszwVUNT113PV4tkhC39O
 nOI6jkQ4tngoX9bPnBj7vDPoIb4zwoyxPAo0mCserjT4BttaGjkcmDhiG1yihEb8NF+UJWhxFE/
 WqC+qg22nypchq0PxwA==
X-Proofpoint-GUID: g0rs2pnDVcRSnH9GHSiJVlDid7sWI-_X
X-Authority-Analysis: v=2.4 cv=GsByPE1C c=1 sm=1 tr=0 ts=6a4503c6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=edf1wS77AAAA:8 a=hSkVLCK3AAAA:8 a=t7CeM3EgAAAA:8
 a=NqEcDHnFNoGX-Q4A7H8A:9 a=DcSpbTIhAlouE1Uv7lRv:22 a=cQPPKAXgyycSBL8etih5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_051114_695707_B807A2CA 
X-CRM114-Status: GOOD (  16.98  )
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

When device_register() or mtd_nvmem_add() fails inside
add_mtd_device() for a partition, the error handling triggers
mtd_release() via put_device() or device_unregister(). mtd_release()
calls release_mtd_partition() which frees the mtd_info structure.
However, callers such as mtd_add_partition() and add_mtd_partitions()
also call free_partition() in their error paths, resulting in a double
free.

Additionally, release_mtd_partition() hits WARN_ON(!list_empty(
&mtd->part.node)) because the partition node is still linked in the
parent's partitions list when the release callback fires from the
add_mtd_device() error path.

Fix this by overriding dev->type and dev->release before put_device()
in the error paths, so that device_release() invokes a no-op function
instead of mtd_release(). For the mtd_nvmem_add() failure case,
device_unregister() is replaced with device_del() to separate the
device removal from the final kobject reference drop, allowing the
override to take effect before put_device() is called.

The callers' error paths (list_del + free_partition) remain the sole
owners of mtd_info lifetime on add_mtd_device() failure, which is the
expected contract.

The normal partition teardown path is not affected: del_mtd_device()
goes through kref_put() -> mtd_device_release() -> device_unregister()
with dev->type still set to &mtd_devtype, so mtd_release() ->
release_mtd_partition() continues to work correctly for the regular
removal case.

Reported-by: syzbot+e9c76b56dc05023b8117@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e9c76b56dc05023b8117
Fixes: 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
Signed-off-by: Xue Lei <Xue.Lei@windriver.com>
---
 drivers/mtd/mtdcore.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 576537774628..16629382a787 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -105,6 +105,15 @@ static void mtd_release(struct device *dev)
 	device_destroy(&mtd_class, index + 1);
 }
 
+/*
+ * No-op device release used in add_mtd_device() error paths.
+ * Prevents mtd_release() from being called via device_release(),
+ * which would free the mtd_info that the caller still manages.
+ */
+static void mtd_dev_release_nop(struct device *dev)
+{
+}
+
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
@@ -799,10 +808,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
 	error = device_register(&mtd->dev);
-	if (error) {
-		put_device(&mtd->dev);
+	if (error)
 		goto fail_added;
-	}
 
 	/* Add the nvmem provider */
 	error = mtd_nvmem_add(mtd);
@@ -840,8 +847,16 @@ int add_mtd_device(struct mtd_info *mtd)
 	return 0;
 
 fail_nvmem_add:
-	device_unregister(&mtd->dev);
+	device_del(&mtd->dev);
 fail_added:
+	/*
+	 * Clear type and set nop release to prevent mtd_release() ->
+	 * release_mtd_partition() -> free_partition() from freeing mtd.
+	 * The caller handles cleanup on failure.
+	 */
+	mtd->dev.type = NULL;
+	mtd->dev.release = mtd_dev_release_nop;
+	put_device(&mtd->dev);
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
 	idr_remove(&mtd_idr, i);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
