Return-Path: <SRS0=BLSt=JR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7B9C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DA560FEE
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Apr 2021 08:46:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DA560FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTVyYf6zWjDU4uNKLouGqjWecLTag8wWIKnz9xxivJM=; b=CPEwgcmX3SJskuwqMzi/bOuGfx
	gECkUhdNKeZtO3TBzRfEUx9SK8Cx73GHttTDpN5TF3CCfbD0VH498cjQuahuBgcUnb1D1Tm4NezIt
	clX1vo92jqtZP3dn8JSE5IjEH25G7mJWJ5YdwLTA92Fs4Hy+7PMiV7nuQ8ViNBpCYXc98hBXxj+Kd
	hfJ+4TKyfQkrvdNc0e/rYOFx2ScCiYzO83fmLorM8RrkMyIWHxqFJ0VgK5vTkGvxA6tX2KwZrb6v9
	H/2DtzZ5nIh6sxe7K/QYciPC9OF7hHEJ1PEUYLosNjv65lvRQAXTLlJoeHuPPmkZiJDOJ/ogjXs79
	VsB87pzg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYm0f-00Bcl3-3w; Tue, 20 Apr 2021 08:45:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYm0b-00Bcjj-V8
 for linux-mtd@desiato.infradead.org; Tue, 20 Apr 2021 08:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=lRi5+pXSkvGHuYVuTVlpgKCbheDLoFERK+hwvLGTTm4=; b=r4m4VyNqmdLAfBcAwO8o51SYJw
 kH/DWeo1TEuGRWYCSy+Gh0TqqeZy1zAPNagi9AD6FhyuPuq5GfLO0DNhAzVaKAPINaE79V/VGpOJK
 sIau0AAdFkI/KzZyaQlhVyqC+9ryBXcag34KXh1CbJpfr3JfIBuX4lxgPxArlwtNlGb3T8xa8Byup
 asEGXKOE+W+yD2GrOFa+B2TuFfxZ6QJ+fmirnl7YkMGvgQzI3Ud+8HrWsBalhF/qJ/6VV6qchAQ8D
 HwmyvOYS9srKB+jVUNjAVl1R/IGwLIVb+FnjSa3jZYn29sfsumyrKm2WxfS79OyIGjg6/rqRBDScW
 hsGEt1yw==;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYm0W-00BwAc-Js
 for linux-mtd@lists.infradead.org; Tue, 20 Apr 2021 08:45:24 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K8j6lp025053;
 Tue, 20 Apr 2021 08:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=lRi5+pXSkvGHuYVuTVlpgKCbheDLoFERK+hwvLGTTm4=;
 b=rPGDywR2n/XgUYKjKiZzArVQCXQq7aQte3E1qE3AiRrvViVCuX/9lJ7ApStjxoQWtK3X
 fAaxJEriwG9CBx99zm1I3agaBwpAS1BPkaiDkuTNyXOxjX7bqSkrOn8Z0/J1Z99rE9Or
 5rg8u49KnQkJmyyK1GVvlimhCFldSi+3Ek8GcynT+L50vQ+RkyyCRMgpisU6bT8AUnz6
 r5jN+lIdohK8WdXh/kHV4QyOASbvjYXTnVa2byr2LleY7UUUsvJXcPi8qt6sLjSwWlQI
 sqHHH8mb/lZgT4OVgDL0W5XPcnl/pe+iXZDu/Asmr06GLM2WS73j5+LXDm2G3y9/ei5O KQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37yqmnebth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 08:45:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13K8bScF008096;
 Tue, 20 Apr 2021 08:45:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809es9jrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 08:45:05 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13K8fX8q021403;
 Tue, 20 Apr 2021 08:45:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3809es9jq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 08:45:05 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13K8ixFD000725;
 Tue, 20 Apr 2021 08:45:00 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 20 Apr 2021 01:44:59 -0700
Date: Tue, 20 Apr 2021 11:44:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: silence static checker warning in
 nand_setup_interface()
Message-ID: <YH6Ugwz3gcga+q8X@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: FWLbufaOYH_RWGtVqbl2ylxaOcmejjKG
X-Proofpoint-GUID: FWLbufaOYH_RWGtVqbl2ylxaOcmejjKG
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9959
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_014520_770238_4AC515B6 
X-CRM114-Status: GOOD (  16.29  )
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

Smatch complains that the error code is not set on this error path:

    drivers/mtd/nand/raw/nand_base.c:842 nand_setup_interface()
    warn: missing error code 'ret'

But actually returning success is intentional because the NAND chip will
still work in mode 0.  This patch adds a "ret = 0;" assignment to make
the intent more clear and to silence the static checker warning.  It
doesn't affect the compiled code because GCC optimises the assignment
away.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/nand_base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index fb072c444495..e29e5b3d31bf 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -880,6 +880,7 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
 	if (tmode_param[0] != chip->best_interface_config->timings.mode) {
 		pr_warn("timing mode %d not acknowledged by the NAND chip\n",
 			chip->best_interface_config->timings.mode);
+		ret = 0;
 		goto err_reset_chip;
 	}
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
