Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4ADAC282C5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 06:41:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B91D720854
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 06:41:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGFy+fit";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="g6aGIRLh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B91D720854
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0D8FmoXVm/C6BqBLTkmvR34dOwPAozIi5dGBu+2jvbA=; b=MGFy+fitWpJAe4
	sjeKGirzRP1Kv3KvP1JemhzHdriPoNzdp/ZL7kO/j80f8eq+wegSnLuLjnlLtfpzp7169Gxcst2RM
	1NGE5ifnCHL0kfY/u6Q9sxvlWpTaWlvu2SPX6nnNNfgSG7mUrc+8quXq3Uv+DbcbnslN8ZHR6O3zU
	BlaOApfJXm+0sKevqkeKH4r+ezaN6y0OVOmoZuZsGEDaudWL6uf+WBECdoo3L23hNCjrLvb2BXW4R
	T9fdFlKEuw59LWvix/hp8U412FV9XtYa467TIJbYcZNxjXhoPgB74IMH2mrI8a7KBVg0aYu5qNxvn
	QxWjVxvzNI+AugSszaeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glpkA-0004M0-7y; Tue, 22 Jan 2019 06:41:06 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glpk4-0004Jt-0E
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 06:41:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0M6etBH069756;
 Tue, 22 Jan 2019 00:40:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1548139255;
 bh=DMQ7Uwy/wf4VvaKl/LJ40u2j8kzqJifQG3nDMdCys7M=;
 h=From:To:CC:Subject:Date;
 b=g6aGIRLhbhWP9ah+ssK2Grq9WnyVMR945P6vFZ3LBaEE24McW2UFEJlY+8aAa6zEt
 dYiJnxB7NWoIDSDAmyUm4qn/29xsUvj3pG/vrMYy2XGGjDmaTKdunvQ/9zd9nOuioF
 n0xZflCFbT+WPtbOxYcMaZZqzy8D3pBjS1sv+Wh8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0M6et76116913
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Jan 2019 00:40:55 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10; Tue, 22
 Jan 2019 00:40:55 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend Transport;
 Tue, 22 Jan 2019 00:40:55 -0600
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0M6eqrr019930;
 Tue, 22 Jan 2019 00:40:53 -0600
From: Vignesh R <vigneshr@ti.com>
To: Boris Brezillon <bbrezillon@kernel.org>, <Tudor.Ambarus@microchip.com>
Subject: [PATCH v4 0/2] cadence-quadspi: Add Octal mode support
Date: Tue, 22 Jan 2019 12:11:35 +0530
Message-ID: <20190122064137.17114-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_224100_273404_056F463A 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: devicetree@vger.kernel.org, Vignesh R <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series adds support for OSPI version of Cadence QSPI controller IP.
Tested with AM654 EVM with MT35x512 Octal flash

Changes:
v4:
Fix comments on v3 by Tudor.
Rebase on top latest linux-next(all dependencies are now part of -next)

v3:
Rebase on top of v7 of Yogesh's series[1]

v2:
spi-nor core patches dropped, are now part of Yogesh's series [1]
Declare Octal mode capability based on compatible.

Vignesh R (2):
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../bindings/mtd/cadence-quadspi.txt          |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c         | 53 ++++++++++++++-----
 2 files changed, 42 insertions(+), 12 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
