Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3748CC282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:33:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCAE20869
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 08:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRFSZaPl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d5W2pZ9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCAE20869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dGuV2h0A4phGX1TmAXx1Fa7xvlkPuGK4PUSfbZG5NUw=; b=VRFSZaPlXUsENN
	DczN1C4TH6BljgJajWiQP6vRXpH9Mtxj1QJbUY3xWAstsc19zBl5nsaKtkdFqlmiykpHs9mnh9cQj
	SH8sisKCsR8YVvl4efNRE99JOiKOTTVdgUF8JVbYbyTUUzQvMVSi2zlGAkrDCq15EtuFSizRl/lE8
	T53EyZd4HG8+LCitrUhr3vpCBg6Q+VwO1GBdb7PsTJaZe1biWygigIyjn4J5uXzJy3UrXBXQSjJG2
	ZObtwZSmc1y7JTlR88yAFhb8H2F+5kBe1cNQlnZ7ieuvtQXYKeYSzd23q9p+kyx1hijWueVn3gg4H
	v7A5yWKOPeYUeO0ZiISg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpUGS-0001z9-1D; Fri, 01 Feb 2019 08:33:32 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpUEK-00085z-VY; Fri, 01 Feb 2019 08:32:10 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x118TLxS069482;
 Fri, 1 Feb 2019 08:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=DN6YjrqGD9WGGIq5sK+IVn2gG382L07u55L+DF6Grwc=;
 b=d5W2pZ9G95Xw8fAa83VQmLYH6Sv9bDAnwydw70F1Onnj7JbqqruV0UtCK5kb4DqjAltI
 5Vz7wvmcMcDeDQxOgWFEuRDYWgDxHjllTPyidxkpizxlLmgFo8idmalEy7LSXTqgWK4p
 0RTdqNULGYnnWpj5v3X6uibt7rLp7Dx+l/LRFBvLimgzTwgOsR0iW4NgWkv8XPaad8NX
 PSzokeGg1oztcnGU5Pr6cTFp3p/ABJt+utYhRGCtdlVS5/9DRb9yc1ACnbomur60LUhD
 0M6KGJuGTXEJn7oWiJPF53ypk1BBO0DaZbkKM8kel3eHJ5KDUeTyeebsOcqY1+PKdK+I Sg== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
 by userp2130.oracle.com with ESMTP id 2q8eyuw637-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Feb 2019 08:31:06 +0000
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x118V5vB021126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Feb 2019 08:31:05 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x118V5YP016104;
 Fri, 1 Feb 2019 08:31:05 GMT
Received: from kadam (/197.157.0.29) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 01 Feb 2019 00:31:04 -0800
Date: Fri, 1 Feb 2019 11:30:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Liang Yang <liang.yang@amlogic.com>
Subject: [PATCH 3/3] mtd: rawnand: meson: remove unnecessary condition in
 meson_nfc_select_chip()
Message-ID: <20190201083053.GE8459@kadam>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9153
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902010064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190201_003122_177633_88BCC49B 
X-CRM114-Status: GOOD (  15.96  )
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

If chip is negative then we return at the very start of the function.
Removing the check lets us pull everything in one indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 0d93d0b9c1af..105d12103ca6 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -234,23 +234,19 @@ static void meson_nfc_select_chip(struct nand_chip *nand, int chip)
 	nfc->timing.tadl = meson_chip->tadl;
 	nfc->timing.tbers_max = meson_chip->tbers_max;
 
-	if (chip >= 0) {
-		if (nfc->clk_rate != meson_chip->clk_rate) {
-			ret = clk_set_rate(nfc->device_clk,
-					   meson_chip->clk_rate);
-			if (ret) {
-				dev_err(nfc->dev, "failed to set clock rate\n");
-				return;
-			}
-			nfc->clk_rate = meson_chip->clk_rate;
-		}
-		if (nfc->bus_timing != meson_chip->bus_timing) {
-			value = (NFC_CLK_CYCLE - 1)
-				| (meson_chip->bus_timing << 5);
-			writel(value, nfc->reg_base + NFC_REG_CFG);
-			writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
-			nfc->bus_timing =  meson_chip->bus_timing;
+	if (nfc->clk_rate != meson_chip->clk_rate) {
+		ret = clk_set_rate(nfc->device_clk, meson_chip->clk_rate);
+		if (ret) {
+			dev_err(nfc->dev, "failed to set clock rate\n");
+			return;
 		}
+		nfc->clk_rate = meson_chip->clk_rate;
+	}
+	if (nfc->bus_timing != meson_chip->bus_timing) {
+		value = (NFC_CLK_CYCLE - 1) | (meson_chip->bus_timing << 5);
+		writel(value, nfc->reg_base + NFC_REG_CFG);
+		writel((1 << 31), nfc->reg_base + NFC_REG_CMD);
+		nfc->bus_timing =  meson_chip->bus_timing;
 	}
 }
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
