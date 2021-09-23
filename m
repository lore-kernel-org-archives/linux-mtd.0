Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40A3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF34F60EE2
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 19:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF34F60EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QAp01jBcA+EHx9vK7pFN8app53A86PZAfEtsEKW/Vio=; b=zIXlsT6pfh8obM
	2CAyQWCU1OgVa2z7LgLfQBvPj1MyNjIxoaOKG5ksIsOXuvhslM1boiHMuqPmN4PZVAbW9AZZNEQcI
	o4ZqQWaN2mgqgvIxqHWA/t/RydvoAFvjyAtM1Eka9r7MSyu62U/Z0yf8fREJ+rGGUb/8xOBJ2nTkH
	Dbwb0vYAo0D50bBIES/MOGX/mXddoeCHj/mx52KGH28Y/+8d4RM1Vz56O1PeWFodmMAD+3S2nErF/
	i3cxfvYTOt9RJ4WmkyFWN6+OaRiVqEytfgdTbZPOPYHAS+epVSR5ve/N8pK/DTa5jyMqXDz3395+B
	U0OrcLmkv8mfPFThX6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTU78-00CRrf-By; Thu, 23 Sep 2021 19:10:34 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTU75-00CRrG-P5
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 19:10:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18NJAUT2012502;
 Thu, 23 Sep 2021 14:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632424230;
 bh=zubgOhvYt3kRD8V9aXMUQ5+bNfhGbwJuJ3zX+oDpLuI=;
 h=From:To:CC:Subject:Date;
 b=w/BwgMyHFDaSPiXugZArYYBx+e1WHxn9e+K49gG6W1+Fu0azZvZnvsOEhaFjU56ve
 4A3ABzNds+qjJ2NDXNOIs08+Ii2nwSyoLSSQaQ+394D8eBPEJlPKpy8ODmo0YfhZ7s
 8akrSeG3nLf7aMBJv1yEbYH0FHw2WfBfyzCyzK2g=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18NJAUDk061962
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 23 Sep 2021 14:10:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 14:10:30 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Sep 2021 14:10:30 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18NJARXk011208;
 Thu, 23 Sep 2021 14:10:28 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: <linux-kernel@vger.kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Michael Walle <michael@walle.cc>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: Add spi-nor device tree binding under SPI NOR
 maintainers
Date: Fri, 24 Sep 2021 00:40:26 +0530
Message-ID: <20210923191026.19184-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_121031_899003_3AA002CB 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

The binding is for the SPI NOR subsystem so the patches should be sent
to its maintainers. Currently the patches get sent to Rob Herring and
MTD maintainers who might not always have the full picture.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2bfdb06fe2b3..d64912d7e9f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17745,6 +17745,7 @@ W:	http://www.linux-mtd.infradead.org/
 Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
 C:	irc://irc.oftc.net/mtd
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
+F:	Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
 F:	drivers/mtd/spi-nor/
 F:	include/linux/mtd/spi-nor.h
 
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
