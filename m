Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D80C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Oct 2022 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWDlVHLBal+lRYhg+dsKAA7zoHThuiDztaaExTzslQ0=; b=BFpCr29IA6BROp
	6HSruzXXiXd/4T2Ow4DSmBOPaf7KdTxRthysSEP1DTOs+VNdugBQPJW29rXIa1GeiTldy+LU6T1wl
	UiK87X7n1/Z+rEHt+tjNvx+cKntYIQK8Dwt1b4UzakhOx4fEkZreK31eArUqqfUm6tkEiKzWUvfSn
	X5e7i5CeBFeJblT5aTspkrxFrNd7YxF9fmkWDLZuAxKUntbVDg6Zs+AYkire3iv5n7pjACnhQFvzN
	R07GWmrPnJa3eSTK2MgsXyiTHL6KprPIpHo38aUQk5NPNOeyKPepDUGIfyDoSNeXylumb41PZX90H
	Wy56tsv8tD3YjmtJ6Esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok7IQ-002oB4-Sj; Sun, 16 Oct 2022 17:19:30 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok7IK-002o90-Hj
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2022 17:19:26 +0000
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29GHJFkB021043;
	Sun, 16 Oct 2022 17:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=0oquvqOLgUg+VJQHiajJ6QdIvz2deOkOJUQc81tgIUs=;
 b=Eevu7pWloLPqp5oZn3mo9LBeBaLg82CsmX9CZK3XOA55EgLJECAA5WoW9BXeaKpHHFPu
 9FbH8r9r9Js9ZO1raiW6CVofwNmMdjciRsltTvx0FnyZ/0B3+gm1DKiLk5xFNEI/yPSK
 HRRSgewfBoAtcnCsioOmlA2eX5sUFrZZjZWZvtsaPRywi9sVHWpz/DvnwrCfH+pREwK/
 msttfG/y6mRjKbNLmrrWPhMK/L2cTRdbMuHZVaxb/NU7NUSwysOGIF5ZP8aV31aJEuxp
 eNwoi5n0+TwnFr+6JMTdUZJxn2K4sV2T3tfpUNRQLCN74VHx6hzr60moncQ2+IU0KSui xg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku990xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 16 Oct 2022 17:19:15 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 16 Oct 2022 10:19:07 -0700
Received: from pek-ywang12-d1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 16 Oct 2022 10:19:05 -0700
From: <yaliang.wang@windriver.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andy.yan@rock-chips.com>, <cyrille.pitchen@wedev4u.fr>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt
Date: Mon, 17 Oct 2022 01:19:00 +0800
Message-ID: <20221016171901.1483542-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1dddc60f-44fd-df65-f491-be8379fe2380@microchip.com>
References: <1dddc60f-44fd-df65-f491-be8379fe2380@microchip.com>
MIME-Version: 1.0
X-Proofpoint-GUID: pxAS3buvNuYBdn8smUk4Vp5_CjbYhNAI
X-Proofpoint-ORIG-GUID: pxAS3buvNuYBdn8smUk4Vp5_CjbYhNAI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-16_13,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=756 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210160106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_101924_770002_E400FF2F 
X-CRM114-Status: GOOD (  11.14  )
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

GD25Q256 'C' generation 'GD25Q256C' implements the JESD216 standards,
JESD216 doesn't define the QER field in BFPT, but the 'GD25Q256C'
does define QE bit in status register 1 bit 6, so we need to tweak
quad_enable to properly set the function.

'D' and 'E' generations implement the JESD216B standards, so parsing
the SFDP to set quad_enable function is enough for them.

As the default_init is deprecated, so the post_bfpt hook will be the
right place to do this tweak.

Changes since v1 [1]
 - Just tweak the quad_enable function when needed.

Yaliang Wang (1):
  mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt

 drivers/mtd/spi-nor/gigadevice.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
