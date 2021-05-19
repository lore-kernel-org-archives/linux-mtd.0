Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4D4C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:34:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0F961244
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 18:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F0F961244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nwa29vr4tsGBk+HMtJKjsqTCX5W6x/pImprnVajIlGs=; b=j3E49/b4vr3tTRVUyjpzbsYKk
	gbX82Qb+I4RF8N3Lg7Cif68tb1UcWTf73GLskHIp2lej9HLCQhbGVm6f7QmtExp+uw5UvOHYR6zT5
	aAbsFUuOu8LKX67Lth5Xy3ILOUQhKXi691NhPx6ZuCVjm/7BWXyIXgmUWGtcTmb5gCDMN+SnJ1l9W
	kssse1kQVw7YBmQ/XXmnUHdJW0WabATonyzdvDSL/nk79ku33u3DgDmf8CPXI417PR9FF1YZyXkc0
	BYjILjmfcK0Bj1rcSO+nSIMn8CpGSH7mym5NOy48G/LSTYxz0l0bpNKdKCwRu8WtUqXlmWsKlWbTp
	wGPeHfLVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljR0c-004mOX-Ph; Wed, 19 May 2021 18:33:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuK-004lOB-GF
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jhEOTvL3V9Nbjw9w+1jc2vZScI1EeBvAk8amsPDh7Ls=; b=IaOt9GNUrR/D4hhCWrudmT0vb4
 r1bvmRaFULorqqkLllv0E0kpnxGKFfQRPRCne7UNCAIgrBosp0A0m+f0fROM19kUPlO4vTZQXM4tg
 fPhTtUonvV5xv6JXoeIamtsyOXf1up2tPFHp7JN6msOgtjZjaDUi5h4LcyktvtjyGusBygQdqmheO
 CmlvkgjBjfFG9JsIwJQSn26TS1ipIaIYbw45TmAeDd5VUGkOn9YIjwELY+6DMI/SLHG09/tPYDLFA
 o9WhD3UxccvCb9UsFNM18WwkOacQZLtqFjXwhIoOBDhFpg/iz0sUnVltXb6tYjsk1gn+6wxaiwJuG
 PuJKhOVA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuH-00Fh7n-Vz
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:26:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5BF4AC000F;
 Wed, 19 May 2021 18:26:55 +0000 (UTC)
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
Subject: [PATCH v20 09/19] dt-binding: memory: pl353-smc: Detail the main reg
 property content
Date: Wed, 19 May 2021 20:26:26 +0200
Message-Id: <20210519182636.1110080-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112658_185320_22C5A615 
X-CRM114-Status: UNSURE (   9.99  )
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

Describe the two reg entries: the first one will receive the
subcontroller configuration, the second one is for the regular cycles on
the memory bus (eg. CMD, ADDR, DATA for a NAND device).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/memory-controllers/pl353-smc.txt        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
index 9d220d4cb39d..d388bb87365f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -6,6 +6,8 @@ of memory interfaces: NAND and memory mapped interfaces (such as SRAM or NOR).
 Required properties:
 - compatible		: Should be "arm,pl353-smc-r2p1", "arm,primecell".
 - reg			: Controller registers map and length.
+			  First entry is for the configuration registers,
+			  second entry covers the memory bus transfers.
 - clock-names		: List of input clock names - "memclk", "apb_pclk"
 			  (See clock bindings for details).
 - clocks		: Clock phandles (see clock bindings for details).
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
