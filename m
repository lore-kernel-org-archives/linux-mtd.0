Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803C7C021B6
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdOPNK0vpYUwVRYzBlutZEJwTYN/NHLDEMNehzDR8ks=; b=UcLKMscrfx7n/Y
	WkpNuehJcNkEIHMI38SJflQgU6HMnQ7OoyyVIgunXPtGIwd+wHmUP9quc8cB7rHtgTUbYzh1k1If6
	JCUNFNsZCup3lWVnOnQLUXWjU3KKDsJDLR1BM2vpj4eAa5bumn5vzWPbyNoT3yN1UjtFcwF8SUgpp
	iBdmz+joG8pHckYjYewlhoEu/K1fOail2H8H9m4Srr0Qv1qxq2y4UEJmt1Vs+DR3uhKGLuzQljitS
	rV0aK4iUBFGuy1KSCvm4TkLHFpqZRH886uL+uQiKb8vLK6XK/LFTyQLkF/h2esFBNOWDsTsI0JZk1
	hIrWONewTCmYSoBAxHtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTkY-00000005lel-3TGg;
	Fri, 21 Feb 2025 14:11:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSgV-00000005Xbn-39YW
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:03:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6IYHq018868;
	Fri, 21 Feb 2025 13:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Q9qz3ZZdoCTR7XNck0p4FMWguo74EqG/wO/FOpmnuA=; b=Xx+pZRdnAp2LVSgV
	CoFPMlTIj6Ajqn8dgmuN++Pj/UUnZY5QhY35b/F4eLgFsFyndQrmr6Q/XtZU6j81
	nwBvNsxIMiIT9zuaXujzuha6irHDvR8JQi91YYZpYjPS7vMSLtSgCUmhPJpgTojZ
	SihrwsUWsi+Li/9nDL+M8IrpVsPGg5cL/zrFefccd/5sgHQdnCzjsCUu1E37KKjJ
	LvvNZ6BBKe9+mDhm8/2RyksgNeFwVdO0k2248vU01eYDO7iHQus+cU0NYDSWJIBa
	SWT6FRzB8bKJKYIgCKQI/w86ajbsm+E5Uteb/ANM1SMNG9DpYqV/GH4b15VmTvCf
	kellyw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xm3rhaag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:43 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LD2gur028017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 13:02:42 GMT
Received: from hu-zijuhu-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 05:02:41 -0800
From: Zijun Hu <quic_zijuhu@quicinc.com>
Date: Fri, 21 Feb 2025 05:02:22 -0800
Subject: [PATCH *-next 17/18] dma-mapping: Remove needless return in five
 void APIs
MIME-Version: 1.0
Message-ID: <20250221-rmv_return-v1-17-cc8dff275827@quicinc.com>
References: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
In-Reply-To: <20250221-rmv_return-v1-0-cc8dff275827@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon
	<will@kernel.org>,
        Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Nick Piggin <npiggin@gmail.com>,
        Peter Zijlstra
	<peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S.
 Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Danilo Krummrich" <dakr@kernel.org>,
        Eric Dumazet <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Jamal
 Hadi Salim" <jhs@mojatatu.com>,
        Cong Wang <xiyou.wangcong@gmail.com>, Jiri
 Pirko <jiri@resnulli.us>,
        Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky
	<leon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz
 Golaszewski" <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
        Thomas Graf
	<tgraf@suug.ch>, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski
	<m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "Miquel
 Raynal" <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
CC: Zijun Hu <zijun_hu@icloud.com>, <linux-arch@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-wireless@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-mtd@lists.infradead.org>,
        Zijun Hu
	<quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IV7B4yMbMqYcwBNPpAuc_lo8ao45zX7c
X-Proofpoint-GUID: IV7B4yMbMqYcwBNPpAuc_lo8ao45zX7c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=750 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_050315_908995_42B8D7F1 
X-CRM114-Status: GOOD (  13.26  )
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

Remove needless 'return' in the following void APIs:

 dma_unmap_single_attrs()
 dma_sync_single_range_for_cpu()
 dma_sync_single_range_for_device()
 dma_free_coherent()
 dma_free_wc()

Since both the API and callee involved are void functions.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 include/linux/dma-mapping.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index b79925b1c433..a5de6ecaace3 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -388,21 +388,21 @@ static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 static inline void dma_unmap_single_attrs(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	return dma_unmap_page_attrs(dev, addr, size, dir, attrs);
+	dma_unmap_page_attrs(dev, addr, size, dir, attrs);
 }
 
 static inline void dma_sync_single_range_for_cpu(struct device *dev,
 		dma_addr_t addr, unsigned long offset, size_t size,
 		enum dma_data_direction dir)
 {
-	return dma_sync_single_for_cpu(dev, addr + offset, size, dir);
+	dma_sync_single_for_cpu(dev, addr + offset, size, dir);
 }
 
 static inline void dma_sync_single_range_for_device(struct device *dev,
 		dma_addr_t addr, unsigned long offset, size_t size,
 		enum dma_data_direction dir)
 {
-	return dma_sync_single_for_device(dev, addr + offset, size, dir);
+	dma_sync_single_for_device(dev, addr + offset, size, dir);
 }
 
 /**
@@ -478,7 +478,7 @@ static inline void *dma_alloc_coherent(struct device *dev, size_t size,
 static inline void dma_free_coherent(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_handle)
 {
-	return dma_free_attrs(dev, size, cpu_addr, dma_handle, 0);
+	dma_free_attrs(dev, size, cpu_addr, dma_handle, 0);
 }
 
 
@@ -606,8 +606,8 @@ static inline void *dma_alloc_wc(struct device *dev, size_t size,
 static inline void dma_free_wc(struct device *dev, size_t size,
 			       void *cpu_addr, dma_addr_t dma_addr)
 {
-	return dma_free_attrs(dev, size, cpu_addr, dma_addr,
-			      DMA_ATTR_WRITE_COMBINE);
+	dma_free_attrs(dev, size, cpu_addr, dma_addr,
+		       DMA_ATTR_WRITE_COMBINE);
 }
 
 static inline int dma_mmap_wc(struct device *dev,

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
