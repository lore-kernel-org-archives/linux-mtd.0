Return-Path: <SRS0=WaUJ=JL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37684C43460
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 05:58:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F07610E8
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 05:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F07610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yhba95461HARJhDlURHOed7h8ruqQqFtqzPTYH6yJcE=; b=BYCeujRj00/43Dpac8cZhZLk/t
	H2Y7LoH69ocWsF2x4L2RKLsshHW8XKZvkU2QINw2MCYiny8xhMJQjhJpxMeUI0L2WW3OFWZ3me7ff
	o+DNthVfdrzcQkqefEajefaabESFYvHX3IBQnon8nI2+S5azyVmZ7ZCKxUJYXefNt00v9V/+PcNx3
	9Z+dKnLoIYX1/d+1jMqs99ljbcOdiIO/JGASTL2qM4/goZRU0J22d9vvNuwl6H6R9UJekUfxH54xd
	HUc/9YRo5aEohQdqmN72bCTOZWG/XgJnKzX4dcm6AHv1xmGT60vLvanIPZKyRGhaSWajkmrnWRjVu
	BZlm+Fog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYWP-00Bb15-R3; Wed, 14 Apr 2021 05:57:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYWL-00Bb0i-IB
 for linux-mtd@desiato.infradead.org; Wed, 14 Apr 2021 05:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=P/i1vmHNJnjFbfOoldRB68MAgV3STMB5j+k2o9a8Suk=; b=EMNqM5DliMz0Qffp4ebbrFPZ90
 tbK7GjytCy7fBky1nWyetwYSQvthDmrSF1viH+qM57PPzlv6kUZhUHQlhOU+uRzzILndxnmcMq+5T
 HJxIVZxdNybmBpRyEc6eV99hvdeVgJQMv8ncNmY9Y0q+jm6lglbxmnKeVkhagDrvR/Wat6LopjSQ7
 t/qdUWLIKJV/9qpinVNAYN1dw4JUN6MJRex3Vtg8Z6TgVnh+0zIpIYOM6p9qH8jvAhguXEHua1Adg
 yuqHUR75nvntDIR47GoOHzptxOEdFd1RhbQm5+IChsr7TIccHavrGa2JT3BCpoWIdSl4HjBQ3zufX
 HrmhgKMQ==;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYWJ-007Veq-5B
 for linux-mtd@lists.infradead.org; Wed, 14 Apr 2021 05:57:00 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5sZoh110755;
 Wed, 14 Apr 2021 05:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=P/i1vmHNJnjFbfOoldRB68MAgV3STMB5j+k2o9a8Suk=;
 b=QVb8laRID4mbAeilrue4sdNdmU4Zl8xBvYMs3NXRac6+RMyUyI9WUeP82gyu4BQUS177
 SQnDd79xDBu1AgzdZ/pHBL5q0yPeEzSel91UFXRb2OTX/y5/Qsoc8Dr1ajuVFryb3Yw3
 Q6+uoTGRdS1MUl3BGHDeLX46AbyFadKmqdSqEyIkmOUvkABdyg6LHINgp7HME9Qeq4wC
 Cgv7I8m3/ska3u7lcTzelDSdmrvmWwRbxpx8RSqfG5/2ICY6zwZIc4Iq7X1N0og12b7S
 fU8MepCS5JCy94as/pPByLiFZNaeKZAI17ZUWa/nNuLh5JWRB+34lpISPruGOidnN46d 9A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37u3ymh4rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:56:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5uVjd077636;
 Wed, 14 Apr 2021 05:56:45 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 37unkqj5su-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:56:45 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13E5ueng003657;
 Wed, 14 Apr 2021 05:56:40 GMT
Received: from mwanda (/10.175.166.128)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 14 Apr 2021 05:56:40 +0000
Date: Wed, 14 Apr 2021 08:56:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: fix an error code in nand_setup_interface()
Message-ID: <YHaEEYg2DUFwnxSo@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140041
X-Proofpoint-GUID: r7lz9uowWJzlA_c7QnSMVcENprQihhwG
X-Proofpoint-ORIG-GUID: r7lz9uowWJzlA_c7QnSMVcENprQihhwG
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225659_305510_524D4590 
X-CRM114-Status: GOOD (  14.73  )
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

We should return an error code if the timing mode is not acknowledged
by the NAND chip.

Fixes: 415ae78ffb5d ("mtd: rawnand: check ONFI timings have been acked by the chip")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/mtd/nand/raw/nand_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index fb072c444495..d83c0503f96f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -880,6 +880,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	if (tmode_param[0] != chip->best_interface_config->timings.mode) {
 		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
 			chip->best_interface_config->timings.mode);
+		ret = -EINVAL;
 		goto err_reset_chip;
 	}
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
