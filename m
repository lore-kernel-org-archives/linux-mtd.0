Return-Path: <SRS0=pV2g=VP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89D8C76191
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 14:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA002173E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jul 2019 14:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tv4DFg0L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S7yNsI2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA002173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HZeNuGj2Dk+ndjjA4X/5uPMOjLNfQsXyWwkc9ACSnkw=; b=Tv4DFg0LvDdKFO
	W9Of3rEF7RA0mczcZPzGpMxV8uzCeD5P9jyYTfD0EEhHsrHBF0Jf6ulubl5AAe+eCndzAyF1/Eb2K
	TkmKEW3KcbvwfQ7gVj6VYe8dm7fiWCq+1kOVeUUjFNz8G3B/PKj58evgb6l0LG7akNR6zkdgu82dl
	NVWKtr8uBjy6gDHBjY+FYp6tPBL1Wsx2AKczH4DZFKZdhWzQCxfmU2T5ZA7CKzsGcM2aXyGTi6Cj7
	IIpcDLJHZmXO1C7nbRoL56pmdRyol2nEEKd5VlGxJdCnn+496pmPEI3h7tGi92xXVLhmTcEc0ZewC
	9QXBaeGJf4gyhMPEtfUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ho73N-0003EM-C8; Thu, 18 Jul 2019 14:06:37 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ho73J-0003AE-6W; Thu, 18 Jul 2019 14:06:34 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03C8AC2955;
 Thu, 18 Jul 2019 14:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1563458792; bh=v6UNc6lWngEqHMHQcuaMIXOAFhJfAEwqk3fGKGKinmU=;
 h=From:To:Cc:Subject:Date:From;
 b=S7yNsI2y/yubF+7p6A5F42g8p26e4OA1Y6mToIn0s9lyhL+ZYuHj29AYohiRQy/Wk
 eMiOHJyS4CNd2aRbrsEPkV6XTd7+w6dqRXp0IR8pSTAeYkthcGFWTpCCiGrK/gCWp6
 t61HtxsINfAtnBS3al6jieXscvGSl0b1di+Nt7JMdtOFDEDxlzvFYPLTNS2G+kupT4
 RyKK/m+QFidkp/gweb7hsznweWgme9gm6+AEafPDH6BI9myVlbDxMVF6jSDiJRDulN
 j80wqrQIoeQroLsjfk4GOI2EpqlmaM3Dc7D+imJZIS0qWrS7QaWvZZa6Db8o4o5hex
 uZwdvlB8zlxlg==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9CB84A0057;
 Thu, 18 Jul 2019 14:06:27 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2] mtd: spi-nor: add support for sst26wf016b memory IC
Date: Thu, 18 Jul 2019 17:06:23 +0300
Message-Id: <20190718140623.20862-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190718_070633_290916_0B396CAE 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-snps-arc@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This commit adds support for the SST sst26wf016b flash memory IC.
This IC was tested with  "snps,dw-apb-ssi" SPI controller.
We don't test dual/quad reads however sst26wf016b flash's datasheet
advertises both dual and quad reads (and support of corresponding
commands)

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1->v2:
 * drop sst26wf032 support as untested
 * add note about SPI controller used and dual/quad reads to commit
   message.

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..0beed856bad8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1945,6 +1945,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
