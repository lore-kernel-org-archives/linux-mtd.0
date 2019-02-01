Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2CAC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB3B220869
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMXbaMAh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SvZlCHlY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB3B220869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j5MGubgkiTxws87F6qW+1WC/9LOBfiejkli+xBlZduE=; b=LMXbaMAhULIuxr
	FKENCpe/madIesky1MFqiXWFT1dyjumfvBTB+ZzJ3ej9pd3ey71CvwTmuW1vcf6NJLIjpWwF9Jjq5
	XovGRIcSHYYimapC5kodIx3EMWWQDe+oUhAGnVbyUU/lMc/wc9PNTJwNDqHRUKXhUjKqh2v7Ywnm4
	FVnZqo9c5k9lGoYg5Wp9mrVBd3QbLScx0SpjcNqvFPojLKiCmBgHceGc0X5WNi4BxyinkOVoOJLTw
	CoFvIj5wL3Oh/wKXiJDdJlmz4/xf/tTK8ZtdZcUHdEP9ca+tZ+qrWxMFmFj642hgu3XqD7x8Uiek7
	AFGKGC0P6wJgvLnAK+fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUD2-0005jX-51; Fri, 01 Feb 2019 08:30:00 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUCy-0005j5-S1; Fri, 01 Feb 2019 08:29:58 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x118TIAG012377;
 Fri, 1 Feb 2019 08:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=plq37cZSpTau/SpWlOV3RG9OD/Q93HdOlf0gJx+xkPo=;
 b=SvZlCHlYqmFIV+kKne8Cd74CV//mtCm2LK3bgWXsZ2EoHFN9fHYMi6RBHlCsU+PWbCi3
 +s1ff+Ku3kb+ycu4V4/xeUJozxkJjHfelHh3AK4LVfFh2K2VnfQy8Eew6hpDRczKT1bq
 gTYzq6QiyfbQ+4Elni6ndeXJMbWC9XvoM7iC2X1X1JBiKpS9q0dPFM14JNrdX+zkVFvO
 qTok1zu6NhS9ONlxz/ZFOA3iDXczZZjskS3fdbqnSN7iY+S845BWamuW5V4fvV4qZMY1
 piPsL36ujbWhhSG+7r60NzLSerI0DXYQHpHWlmJgyCbWoHkjbzINvlbBza6ME+ak/1u/ 5g== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
 by aserp2130.oracle.com with ESMTP id 2q8d2enc19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Feb 2019 08:29:41 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x118TZIY014193
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Feb 2019 08:29:35 GMT
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x118TX1J009720;
 Fri, 1 Feb 2019 08:29:34 GMT
Received: from kadam (/197.157.0.29) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 Feb 2019 00:29:33 -0800
Date: Fri, 1 Feb 2019 11:29:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: [PATCH 1/3] mtd: rawnand: meson: Fix a limit test in
 meson_nfc_select_chip()
Message-ID: <20190201082922.GC8459@kadam>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9153
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=998 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902010064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_002956_988467_8CA0708E 
X-CRM114-Status: GOOD (  16.61  )
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

This test is off by one because the > should be >= and it's also testing
against the wrong limit.  The MAX_CE_NUM is the maximum size that
meson_chip->sels[] is allowed to be but meson_chip->nsels is the actual
size.

Fixes: 2d570b34b41a ("mtd: rawnand: meson: add support for Amlogic NAND flash controller ")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index e858d58d97b0..94c90be7e1e0 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -225,7 +225,7 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
 	int ret, value;
 
-	if (chip < 0 || WARN_ON_ONCE(chip > MAX_CE_NUM))
+	if (chip < 0 || WARN_ON_ONCE(chip >= meson_chip->nsels))
 		return;
 
 	nfc->param.chip_select = meson_chip->sels[chip] ? NAND_CE1 : NAND_CE0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
