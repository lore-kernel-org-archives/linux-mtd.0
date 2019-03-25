Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A535C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBFB20870
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 09:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E+DkpcFX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oudiTICJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBFB20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gCMTmqcXRKzu6v8+gp7yOJAiBh/zOL3qlS6+eVKnMh8=; b=E+DkpcFXKKDw+D
	YUAdpaLTTJdLLXcaK/IJ76EofSRKIAMa1fk+700NzREt2pXmNbkSS8Mn7y+Tr3FFGgvpXBqBElOSH
	RSbvnCrdnRe1+v2Ikxaw6tBFU0QdBxFgsXondHHTTdcz8Uvwuxfluk1Q870Q+lQlDkGrkRCTrnan6
	4VVam/AT1fDY585qAadaIqi3wUmZZajPKJya5DbuGAD9jo0MwxKOSgXnqvCFpmvhaILY3eJoC85Rz
	RCY7p99IHHOp8VV5urX32OZyQWFAyJ4W2OITAyiPpmgiY7zxafTBax1jxfkGH/PY2c50IsYdtt4aG
	T9E22W3hzEx7+ud/o6LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MDU-0004Zg-V9; Mon, 25 Mar 2019 09:48:28 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MDO-0004YY-VQ
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2019 09:48:26 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2P9mBtb013481;
 Mon, 25 Mar 2019 04:48:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553507291;
 bh=28Peh/jxho5OJxt0QTnKzgP2PiaE22m6eGhTdEuyud0=;
 h=From:To:CC:Subject:Date;
 b=oudiTICJCDndvb8PBP2iKqClrc1305ySH7r/XknhOhP8WnoF3LohTZkuok0vmvvw/
 aWRKZN2d9VFIGFABYfoAE+iXSmXhsHh6bZRoh43XJrIJ2df1ZNF6xMMoY23Jq62RRk
 cwwVNyD+H2RApCubcwGuf1hfsgK3BqEMAT+2kaWI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2P9mBRI022187
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Mar 2019 04:48:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 25
 Mar 2019 04:48:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Mon, 25 Mar 2019 04:48:11 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2P9m7mF004811;
 Mon, 25 Mar 2019 04:48:08 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] MAINTAINERS: Add myself as co-maintainer for MTD
Date: Mon, 25 Mar 2019 15:18:46 +0530
Message-ID: <20190325094846.30709-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_024823_052640_492C872B 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have been contributing and reviewing MTD patches for a while now and
would like to add myself as co-maintainer for MTD to help maintain
CFI and SPI NOR parts of the subsystem.
Hopefully, this will help in taking some load off current maintainers.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3453f397ad87..d950fa01d829 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10014,6 +10014,7 @@ M:	Brian Norris <computersforpeace@gmail.com>
 M:	Boris Brezillon <bbrezillon@kernel.org>
 M:	Marek Vasut <marek.vasut@gmail.com>
 M:	Richard Weinberger <richard@nod.at>
+M:	Vignesh Raghavendra <vigneshr@ti.com>
 L:	linux-mtd@lists.infradead.org
 W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
