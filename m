Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B454AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 15:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DCLRG/GPHZaQYIAA5TmfUBLjBU9DYKYlmrw3KuCepfg=; b=w5JC+z1UCKNtxl
	f+rFsyT3Je3mNRr6rfgidMJxGD9LhBA/jjHd7dRntZeQCLrQXMACCiiTp8IbmIG3BDLt83iTXkXoo
	kRTNYmdT/Hlj/376GWaj9CR1jYqgKj9eRq9+7StmkslWhZMiTlI5whLBmCeiniXEb91b/aXr30a1U
	5lzxz2rgmVI428lJH3YXewmVicekh/R7zwruENmytB92Je+JRcxGp02pkOjM7vPQ3xIQn7ZsMeppA
	MY+DVu/Ggsb2GwdWEf0j2jV4zkbnVhrNxSbkMvFMFsti75A0/qVa1Kq142kNfnZfvak8Y1IIgtSG+
	bz0fJ7krTi5Ay81DdpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSQc-00G7hz-7P; Mon, 18 Jul 2022 15:12:58 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSQa-00G7dK-5y
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 15:12:57 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26IFCmkp090786;
	Mon, 18 Jul 2022 10:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658157168;
	bh=VG8f/acBJAyK9kbXYs6a9nr3t+nEI09J3pQcpkEC7yc=;
	h=From:To:CC:Subject:Date;
	b=bOEATYHbZja4HUZV04J9+qfYvy39/wkmgeJeCAsMzjWWl0cx2RjYtuJTfSiEwWg8G
	 vLKOolIjxjLFYak1h1pWucI1pGTL4qSM/l7+Asm/ZJDvTvLyzp1zq0fz/QNUh42pga
	 DVyyAibzsC2tGxunNd9xF0RG9bjfj+//fEgG1jlg=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26IFCmRI023058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Jul 2022 10:12:48 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Jul 2022 10:12:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Jul 2022 10:12:47 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26IFChlw027105;
	Mon, 18 Jul 2022 10:12:44 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
        Miquel
 Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "open list:SPI NOR SUBSYSTEM"
	<linux-mtd@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Use my kernel.org email
Date: Mon, 18 Jul 2022 20:42:43 +0530
Message-ID: <20220718151243.1149442-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_081256_399144_5229CBFF 
X-CRM114-Status: GOOD (  10.01  )
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

Use the kernel.org email I have for reviewing patches.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe5daf141501..282b34eae750 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18827,7 +18827,7 @@ F:	drivers/pinctrl/spear/
 
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@microchip.com>
-M:	Pratyush Yadav <p.yadav@ti.com>
+M:	Pratyush Yadav <pratyush@kernel.org>
 R:	Michael Walle <michael@walle.cc>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
