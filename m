Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1782CC433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:31:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D235D6124C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D235D6124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SVimIC7mlL70ZKo+MTxLLqESh7TEhn49drduM0XZT0Q=; b=JTFQjtqLO5ZrOF7a/qqaWvjR2
	/HiBBIAphp+Hg2qCef0O/pScymSVVC6q7bOKYvy4uvil/rT6sj0VkTd766cbsxq/26DcC7RS3rlU+
	tVLRQXQ0PkISiQUCD5GpqK/7xm2RqM5RLgaxzuLIEvXcA/1HfbBR9YLLlO7DmH1BFrmzCT8a2n9zK
	2baGl1qYbkdyqN4fw56FkrzdZHPJdnOSHQWHKfkqZOQCRIFyy/wfh2JipItlP2wWkPGTyVUNx+Tjp
	XsnxvdfUSb7EbAH6ULOGVF2HqdrFN7rv21j41QpI9fXifrT6hsRkipV6OiDdHcD8VWqpUR7ziVALf
	l5cavhopw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljQxc-004m39-Vx; Wed, 19 May 2021 18:30:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuH-004lNu-HV
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=2KZRC/1nlzbXfmAJgp4auRs6totc7Qcm7BtUlJDeH2U=; b=YHPvPH7jXeLnXIue8BpO1O7k2b
 2akvjlCsBMhdQkF7xr6C4LDer1N5wm9hpVt9HNmeNPjL0rnC3iGxKrWCGswvzDmZccxpK2Wkxxa4E
 uPTXt+kl5YCN3zwPdzJEuHhjbhQc2YhkkJt5QWRd0sn0QVzKgroHPdAtU341AhBs0GtpopbJYEFvd
 6UdjaMG2BTB7FjG9ldB6I+CE9I+qf3IAUuveoc9pHUzQ7e9JB7h7W37Y53MM/Nv9ZnZacJxaAeJvz
 kveGDG7ywsSkGr/mAcCfWkah0iix6cWq2aAJ3piDuZIukNj430zBC+YclqSmvfdhEpUzannDLdPVJ
 q9JRmZww==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuF-00Fh7J-1Z
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20CDCC0013;
 Wed, 19 May 2021 18:26:51 +0000 (UTC)
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
Subject: [PATCH v20 07/19] dt-binding: memory: pl353-smc: Fix the NAND
 controller node in the example
Date: Wed, 19 May 2021 20:26:24 +0200
Message-Id: <20210519182636.1110080-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112655_238848_1CE84720 
X-CRM114-Status: GOOD (  11.50  )
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

To be fully valid, the NAND controller node in the example should be
named nand-controller instead of flash, should be at the address @0,0
instead of @e1000000 and should have a couple of #address-cells and

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index f67715d95852..1335b94291ad 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -34,8 +34,10 @@ Example:
 			  0x1 0x0 0xe2000000 0x2000000 /* SRAM/NOR CS0 region */
 			  0x2 0x0 0xe4000000 0x2000000>; /* SRAM/NOR CS1 region */
 
-		nand_0: flash@e1000000 {
+		nand0: nand-controller@0,0 {
 			compatible = "arm,pl353-nand-r2p1";
 			reg = <0 0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
 		};
 	};
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
