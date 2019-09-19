Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 611C2C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB6420678
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 19:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/7Tge9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB6420678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1VGsGTZw84FSsqV/y5gHbsKdpLMg/B/38DDQN92e1A=; b=X/7Tge9RydaCgg
	61St0QzCcKHhr5x6ePNVY2lgfH6pKAxQ18JqEa4oVxciPMR3s34GENbclt0sQKH+d6nWHvVWSCXNG
	n7YkYgjatRsppONzfQvyH4cq6yPHC64eMHaJOFIBxZ/6KIWICAt1JiQ0k+bX0TOiM1JoLHpuft0kL
	wtbxH6Asjr8UakXnMNxoL7V5TcJ1bew3G8JDaHO+mWjtFhsOcaxIM/n026bId1VW2Q3Kk1cq08HjV
	E25HIHy5xCodRsGl6nawjzW1uVJ/vTds6Rrx926BxL1QUqLpAezrpPELNbOMoRGxZ5+YRrp5GzoPF
	aj2pv2wTI0VYogSEeTdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iB2Uo-0006NB-Pp; Thu, 19 Sep 2019 19:53:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iB2Ai-0002gA-Cf; Thu, 19 Sep 2019 19:32:58 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 26558240006;
 Thu, 19 Sep 2019 19:32:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 32/40] mtd: nand: Let on-die ECC engines be retrieved from
 the NAND core
Date: Thu, 19 Sep 2019 21:31:32 +0200
Message-Id: <20190919193141.7865-33-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919193141.7865-1-miquel.raynal@bootlin.com>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_123257_105987_4F894D49 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Before making use of the ECC engines, we must retrieve them. Add the
necessary boilerplate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/ecc.c   | 6 ++++++
 include/linux/mtd/nand.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
index da3aa2379b94..4f869d33213d 100644
--- a/drivers/mtd/nand/ecc.c
+++ b/drivers/mtd/nand/ecc.c
@@ -500,6 +500,12 @@ struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand)
 }
 EXPORT_SYMBOL(nand_ecc_get_sw_engine);
 
+struct nand_ecc_engine *nand_ecc_get_ondie_engine(struct nand_device *nand)
+{
+	return nand->ecc.ondie_engine;
+}
+EXPORT_SYMBOL(nand_ecc_get_ondie_engine);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("Generic ECC engine");
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index b410ef778e52..b25d17ef9714 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -273,6 +273,7 @@ int nand_ecc_finish_io_req(struct nand_device *nand,
 			   struct nand_page_io_req *req, void *oobbuf);
 bool nand_ecc_correction_is_enough(struct nand_device *nand);
 struct nand_ecc_engine *nand_ecc_get_sw_engine(struct nand_device *nand);
+struct nand_ecc_engine *nand_ecc_get_ondie_engine(struct nand_device *nand);
 
 /**
  * struct nand_ecc - High-level ECC object
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
