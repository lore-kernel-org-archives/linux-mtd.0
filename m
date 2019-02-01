Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9499C282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931DA20869
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iVQuyv71";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="wuY/+Gn4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931DA20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uuM6hgLRgvGxvT9umF87KIrCPHh1/RvO2TdxV94sZCk=; b=iVQuyv71LHl1FE
	yeYtPttvyts4gkse2ENbxhbkGbH1mq6W3SNZEWuMP5mJFS6198uMXEGSkSYPAA8Rv1E5emQwj6xDM
	Ja+JZCQBLxti5Vz9HkEi52MArDDZBDSSlMEFNhThYR46yxTgK4W0N76WpnFURBXttuXn/Mx6KZETq
	bIJlR84Hq+5V4uQRdY4i2MChayhYvLDlpyvbeRv8QQwp5MIAL3t4VyQsf0vUPNVrU/kSPDeoHuuD4
	oXG/FZIOrP2NhPkqK2IbTZqI3TSfaRnhmITJ5JtOcduYsUFI/KiuxO8ciqemiZXrioaMk1NvNcfNs
	E1oCkyFjjaQjq7iDPoKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUFG-0000hq-0X; Fri, 01 Feb 2019 08:32:18 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUDd-0007Jz-9V; Fri, 01 Feb 2019 08:30:43 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x118T9OI012326;
 Fri, 1 Feb 2019 08:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=HCum4K7ZUvsoHUvCAzo1KmFyr6s8MzfLBOatROUJGak=;
 b=wuY/+Gn4DLdSNdyZT192+3ax0oX2zUCj4SET9UFfCubIQBfpHXX9uZO5vjq0wwTW+hVY
 iQNufPC6J/2R8lQTSqp+KQquayltFKXIKPjYvNOi7R3lSTQ9shqidEKDvFr44jMnC/tx
 9MOPco9SgusU6ykIrnGcb5M3oSZQWFF3BVrX3Ns9+zWalnrF2J4r+XTRHGRyOlmhvTqO
 U+KHwF2QYVXmMoF+PL3mif7Tge1wsePUvVL57ofP4z6mVvXRoMXtxe0SsQKy2kzA/C4x
 ZgptqGogdEsjGCSobxY6Nv1ZIdcGrQ3zXy31Jp+TbawpB1Yec1cbLeyOrVNTlpeO9r0Q tg== 
Received: from userv0021.oracle.com (userv0021.oracle.com [156.151.31.71])
 by aserp2130.oracle.com with ESMTP id 2q8d2enc5s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Feb 2019 08:30:26 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x118UKsq017133
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Feb 2019 08:30:20 GMT
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x118UJEA015750;
 Fri, 1 Feb 2019 08:30:19 GMT
Received: from kadam (/197.157.0.29) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 Feb 2019 00:30:18 -0800
Date: Fri, 1 Feb 2019 11:30:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: [PATCH 2/3] mtd: rawnand: meson: fix a loop in meson_nand_bch_mode()
Message-ID: <20190201083009.GD8459@kadam>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9153
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=676 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902010064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_003038_021302_82C5274D 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There is a sizeof() vs ARRAY_SIZE() bug here.  We want the number of
elements in the array, not the number of bytes.  It means we potentially
read beyond the end of the array.

Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 94c90be7e1e0..0d93d0b9c1af 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -1143,7 +1143,7 @@ static int meson_nand_bch_mode(struct nand_chip *nand)
 	if (nand->ecc.strength > 60 || nand->ecc.strength < 8)
 		return -EINVAL;
 
-	for (i = 0; i < sizeof(meson_ecc); i++) {
+	for (i = 0; i < ARRAY_SIZE(meson_ecc); i++) {
 		if (meson_ecc[i].strength == nand->ecc.strength) {
 			meson_chip->bch_mode = meson_ecc[i].bch;
 			return 0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
