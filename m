Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26B08C433E4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:59:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6CBC2064C
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 15:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="by1fwPf4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7TBrz82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6CBC2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=im/MkwaZHYRNP7mCVQbACSCEVw1/4R/c4132PDAkZIY=; b=by1fwPf4j97Vg1gv0y7VMErAvl
	aLVn23HSlZDINID+2CPKww51qvI9w2ZgyFn1tpawjdgRvcOnNwrxK3NJkOvLhv7jZ6b27AJglICgo
	3luJaO2XLh72piWtYUKriqHrlZbf/KItotaUZ4Rt+fN1AkO9K8oYOaXIodUy1wdGBq6nCWi0SDuRk
	K/KbjG7c2uPmQl1wkn5pXRmSZvscW/92w8FhgRJwaYmBaHvn+SoXOcjiXCqOBp3V0rdKtQ1/ug8LU
	PBTK4TgyZxUA2/YKvn5R5hMQ2mL/lYC/r1Kzvb2rIPSdWMr5j/BzA3gvB7ert5CB6zHfVh1lhbFi8
	sZSg1exQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz05p-0000Dy-JO; Fri, 24 Jul 2020 15:58:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz05n-0000DE-3l
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 15:58:39 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 541A22064C;
 Fri, 24 Jul 2020 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595606318;
 bh=QJs6vpHpyZQjCIgvhgDF5S37Cf/01U0IZI6OQETb4XQ=;
 h=From:To:Cc:Subject:Date:From;
 b=s7TBrz82uhjo4sQcyRNsZLhBfeTLvfqrHy/sjlDHsH+WffGke2E2siSwMU7YC2o+m
 5PwJj34nZnAj2Sv/SZ/IVsrq3UfPhyQD9dXfwDxxn8budWjDnThlL0+26vOEuhhsf2
 +7xdt1TU6gMQ/b8KcE6NuX2sq9SwmL8jbpmhqb7M=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add linux-mips mailing list to JZ47xx entries
Date: Fri, 24 Jul 2020 17:58:16 +0200
Message-Id: <20200724155816.8125-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_115839_243229_D03A452F 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The entries for JZ47xx SoCs and its drivers lacked MIPS mailing list.
Only MTD NAND driver pointed linux-mtd.  Add linux-mips so the relevant
patches will get attention of MIPS developers.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cba0ed77775b..f41fc775a3c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8543,17 +8543,20 @@ F:	samples/bpf/ibumad_user.c
 
 INGENIC JZ4780 DMA Driver
 M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	drivers/dma/dma-jz4780.c
 
 INGENIC JZ4780 NAND DRIVER
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mtd@lists.infradead.org
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	drivers/mtd/nand/raw/ingenic/
 
 INGENIC JZ47xx SoCs
 M:	Paul Cercueil <paul@crapouillou.net>
+L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	arch/mips/boot/dts/ingenic/
 F:	arch/mips/include/asm/mach-jz4740/
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
