Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3436C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:59:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6924E6109F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6924E6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=peFC/+dJlx5pGW1wPS3UARXGH25bDFRopP8JKbj0EIk=; b=YIvl+24+XymFPTOVHvoCoP6mn
	Ei9RyXa5QsZ2Gh4oa2IbotxWLG2YGzG7DAzqpbAjY+pUx5gR8T/RZLkg63HR+6EM83M37OyOH6r9P
	wEUcYJ6OZQniipBL3KK7PuoTAAydPpYiKyIktXLFcKuEiWE6+sfsCo3EyfH+efcpVFb+mh6/599dX
	N0bfcEEeIgEbmDL1VZxIuoHFs6ksxDo7AyRvh4MmBC3nAEQzUrV/uS1QmYGnwRnf/y4qxKeRhWcDL
	7ZI7k6n3+1d6JpTEJoN9DJptjMtzxKZq0+n/+9UPkqxESZ0NJJK7Bmr9cNkNWera+3PR7ehAX+p6/
	DXg3jRj0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljROU-004omx-5i; Wed, 19 May 2021 18:58:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuW-004lPb-Er
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=hA+IQjaltnzujCxyw9yr6ihAwu1BdjlVta8SFsB/F6A=; b=UWLWY/yycYLxY/rMltHep/I4xZ
 UXEUuLNaYbtzIgeRrQRDfx1irlCBlPjiVOqgMb+6ES9P6XsSALVpRH2hD7FxXGCwVc7muTCOCOC6c
 GHVoTpODohORzQJN+BGpqDZFbfu9xPf3XuKQUX+GTn19yLOnbjf21DjjoUVDkwlRczFG437rdDV5s
 vYWzUmGdmjCc612CueLO8MTFTTVE6lpZyT74oHyNO0NNN5gaRm7v7JJDNVrFUs2E5VK1+KLd1spv1
 fvgz81l1Em4SsoSCejZGBPckiN95x1JTnEYVHo1HFkxrw/XRhhIvmCxwSDdzSHb4wXyqAB+eyogJe
 fmp1bXLQ==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuT-00Fh9j-Vb
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 65816C0008;
 Wed, 19 May 2021 18:27:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 17/19] MAINTAINERS: Add PL353 NAND controller entry
Date: Wed, 19 May 2021 20:26:34 +0200
Message-Id: <20210519182636.1110080-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112710_170940_A8385665 
X-CRM114-Status: UNSURE (   8.85  )
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

Add myself and Naga from Xilinx responsible of this driver.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b4315b76645a..a36fb919e913 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1452,6 +1452,14 @@ S:	Odd Fixes
 F:	drivers/amba/
 F:	include/linux/amba/bus.h
 
+ARM PRIMECELL PL35X NAND CONTROLLER DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
+M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
+F:	drivers/mtd/nand/raw/pl35x-nand-controller.c
+
 ARM PRIMECELL PL35X SMC DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com@bootlin.com>
 M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
