Return-Path: <SRS0=7p5O=AF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F65C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 13:30:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56D620738
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jun 2020 13:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VFol4ZIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CaulDa6B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56D620738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oZrBVpJFA6AdxBmKMb+g+CDIiL6reg2Hh/bPsnpZgAM=; b=VFol4ZIhSjsoLW0Bn0ALWXlIZa
	u8PtnzNRnNagDm/DWRqpuUKOdq0xtVx7R35sPlin4w28cu0473gc4/tl1K8BEqbRuIKbf70s4pLkD
	r5gt/Pyj6h1wPUXi0dP/9yF0STAjdoviuaEYlBEXR3JXKttdF/nWy9FhjK8naJQ3WWLyCfaCb+Uzi
	1c9Sih3CeMcTIEVeppTYu34x7aMJt1IB6hHCZDkoPSwYnWR1YDYav4xf+u5rXICUz41a5Z/C/5Usz
	+hSETsiiP3xzoO7cQ2gORH0CJANbfJgaMCDJ8Re/vlR9T80ed9ViW8Gko1X0YeTDaLpOx0et8gGT0
	9/wgEaRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo5So-00081n-Qe; Wed, 24 Jun 2020 13:29:18 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo5Sf-0007yq-A8
 for linux-mtd@lists.infradead.org; Wed, 24 Jun 2020 13:29:10 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODQZlF097807;
 Wed, 24 Jun 2020 13:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=p4ox0G9tfn5BkyOURp1tMeS4J12nEb+dLm6PqLBmaz0=;
 b=CaulDa6B4qhSB3acd1yoZckNMKQA+tTyJkax8rEes4b+LhgVFc5M3JUQE7H0fjfnk7Ld
 7MIy82qBCxBCSkSPSqK2QUXmBnsFm6hU1WPMsfiEhKsAGy/dPYO6Hj2p4FGdML/kUAnw
 WbG2HzNMsOyDsho870NgN3WQxBSXvM7yA6AJ6GeKrMys/3Q9dbOGn6vqa6UFQ4lSrCJZ
 5zHMObRIoz5ZheIxpWlu15glb50aHrvqmw1qhBzHw1WJvnyMcTwmb61PtUFBgcZrAsQ5
 EQsf6wVHLEGYf/zwdPJeHA2nh7wsTQ4Sk7YTNgNglP2CLGSK3yycz4/aG0CgauPvnxEI zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 31uut5jue8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 13:28:55 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05ODOCcd083287;
 Wed, 24 Jun 2020 13:26:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 31uur7cese-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 13:26:55 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05ODQlML010340;
 Wed, 24 Jun 2020 13:26:48 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 24 Jun 2020 13:26:47 +0000
Date: Wed, 24 Jun 2020 16:26:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] mtd: rawnand: ingenic: cleanup ARRAY_SIZE() vs sizeof() use
Message-ID: <20200624132640.GC9972@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9661
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1011
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 cotscore=-2147483648 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006240097
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ARRAY_SIZE() is the number of elements but we want to use sizeof()
here for the number of bytes.  Fortunately, they are the same thing
because it's an array of u8 so this has no effect on runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/ingenic/jz4740_ecc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
index 13fea645c7f0..54e377754a6c 100644
--- a/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
+++ b/drivers/mtd/nand/raw/ingenic/jz4740_ecc.c
@@ -90,8 +90,8 @@ static int jz4740_ecc_calculate(struct ingenic_ecc *ecc,
 	 * If the written data is completely 0xff, we also want to write 0xff as
 	 * ECC, otherwise we will get in trouble when doing subpage writes.
 	 */
-	if (memcmp(ecc_code, empty_block_ecc, ARRAY_SIZE(empty_block_ecc)) == 0)
-		memset(ecc_code, 0xff, ARRAY_SIZE(empty_block_ecc));
+	if (memcmp(ecc_code, empty_block_ecc, sizeof(empty_block_ecc)) == 0)
+		memset(ecc_code, 0xff, sizeof(empty_block_ecc));
 
 	return 0;
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
