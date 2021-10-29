Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A90C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:31:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91A360F02
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 19:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B91A360F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9web5Fy2C+IW4R9byiJ1lwyLgPwlQf+iF4r7R4inQHs=; b=DFA/GO4TJzq64a
	iOkrdPddsVdoQW0M1gzHvrGbllIp8LSZuWMMQeHuhaGT+7UBm+DwfP7sGwVN67cb+nAcW6goLoee2
	KRRADQlue6r7FqBUNcBWGF7ZDyRbxTN1bAMGhsdTYkz1jCqsQeE5kglQ3yuwCGUYdVKHyYEdi4EoS
	ugo44R/ZgEBxv75Ok3kdKucI480YKp90DOA3sC7f6a2xWs4wDNCClLj8dtlVIy/Fzsq0dwegxNQnc
	SCzwUdwMnmsHFX7FciC2DrVgaF4JzteqB9txFLqGIPMd8hkDkSCBbCvFQ3l6wIlHCt5ajIsN7dB7S
	XgP0xGJxH6GEtyiYKTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXZw-00C02A-5E; Fri, 29 Oct 2021 19:30:16 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgWMM-00Bjls-Ho
 for linux-mtd@lists.infradead.org; Fri, 29 Oct 2021 18:12:12 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19TIC2VI031128;
 Fri, 29 Oct 2021 13:12:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635531122;
 bh=19GbBem9jeIQ4D5bkhcvucCh+EoGqCisgJH4//ccSJA=;
 h=From:To:CC:Subject:Date;
 b=n9SOgMGB/msg0Fa5jIb6t63HxXmfkFxPapjq/P6kYlpQAxNrmKoXaNxvTUSdECmFc
 OuiYr5Q9ojIw2L+ebu4oV8ywFxGPlFz913Q+qsW6eEcMIFIZHOs9lzpeIL4734kO4p
 zTczUSAGGU3kipxDcgdIhVcw6YtqB1MRxxCTNw7s=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19TIC2xm005075
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Oct 2021 13:12:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Oct 2021 13:12:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Oct 2021 13:12:01 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19TIBwdE056434;
 Fri, 29 Oct 2021 13:11:59 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Add myself as the SPI NOR co-maintainer
Date: Fri, 29 Oct 2021 23:41:57 +0530
Message-ID: <20211029181157.20623-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_111210_722018_6D339D50 
X-CRM114-Status: GOOD (  10.97  )
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

I have been reviewing patches and contributing for over a year. I would
like to help maintain the subsystem as well.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afb997643b8f..b44e062f05d3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17907,8 +17907,8 @@ F:	drivers/pinctrl/spear/
 
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
+M:	Pratyush Yadav <p.yadav@ti.com>
 R:	Michael Walle <michael@walle.cc>
-R:	Pratyush Yadav <p.yadav@ti.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 W:	http://www.linux-mtd.infradead.org/
-- 
2.33.1.835.ge9e5ba39a7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
