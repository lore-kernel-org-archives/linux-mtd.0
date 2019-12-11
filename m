Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D30C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB6E20836
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T9lQpAbF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="abIzf/VH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AB6E20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=efNQ0+AABKPDqdD0J+X5iHyknE0jockSXB2rJ8IWAZU=; b=T9l
	QpAbFat7PytxS9aOxJUVHuONHSeVX6zfYfcfTRQQBHv+UUh5RzryAeJqQ619o/tMw6vmXtViFMPtm
	zUMpw9BSNPX5gqgkNDSATqRn38iaUVJm/oMeQrwXPhHlIBVjvSJUurGfPLUSyerqio+U7Cy8W8dpT
	KQsEQZXXHZsF5C1WlAxhsyRKdMpk26xIYK/XY+nFGEs9bXdGHUoaA940bA4H4soGRFsCHzUL8fUSq
	QBzBYAUEYhiQ3aAg9mYd0zoKTAAHGx6poyvzc2O6AKZNgcl8x2Fw3OuoLwilriSSSvWUNjhKfc4GM
	/5UJxRK4G0y37OaQib2Ov17KkwuPGtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieupF-00053x-Ub; Wed, 11 Dec 2019 05:46:17 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieuoz-0004tS-Qb
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 05:46:03 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id xBB5jdVa019523;
 Wed, 11 Dec 2019 14:45:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xBB5jdVa019523
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576043141;
 bh=UxDx8RnuQhkTN8+zyVJvCjCQ3hY035WRmN5rhX+qiCg=;
 h=From:To:Cc:Subject:Date:From;
 b=abIzf/VHWf80xkCNM9Nq9l7bCTZhTmzvAGgpyGNxWkKxeNhSUY0HzAoJS1K5AHGZx
 qcghRfQPNCejAohtVrKvGe/1q2hkoB7P1vRWONc2sa3mkdinujSyiHWkpZaoDcHVT2
 zLPKf8piCsaFj9Z/2bobrErHtgQrZf7eTZhphVaG76AjykCd1sXuqDV4q+Y4tejqhZ
 wZfufdLfCb6ZEkfRpHSeyvPdwg4bWncJdnoa0uyZE0hiubTf/osHL2jjna/WnDaNk1
 nEwqKSCGynuEPXml7xxwpm/HF52oewbK7/qwron40H4rYnyHkUjYBlZuDcRXj5UonQ
 V6RaKNL1cLNvQ==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] dt-binding: mtd: denali_dt: document reset property
Date: Wed, 11 Dec 2019 14:45:37 +0900
Message-Id: <20191211054538.8283-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_214602_090290_FA135870 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Ley Foon Tan <ley.foon.tan@intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Rutland <mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

According to the Denali NAND Flash Memory Controller User's Guide,
this IP has two reset signals.

  rst_n:     reset most of FFs in the controller core
  reg_rst_n: reset all FFs in the register interface, and in the
             initialization sequencer

This commit specifies those reset signals.

It is possible to control them separately from the IP point of view
although they might be often tied up together in actual SoC integration.

At least for the upstream platforms, Altera/Intel SOCFPGA and Socionext
UniPhier, the reset controller seems to provide only 1-bit control for
the NAND controller. If it is the case, the resets property should
reference to the same phandles for "nand" and "reg" resets, like this:

    resets = <&nand_rst>, <&nand_rst>;
    reset-names = "nand", "reg";

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Split into two patches

 Documentation/devicetree/bindings/mtd/denali-nand.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b32aed1db46d..98916a84bbf6 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -14,6 +14,11 @@ Required properties:
     interface clock, and the ECC circuit clock.
   - clock-names: should contain "nand", "nand_x", "ecc"
 
+Optional properties:
+  - resets: may contain phandles to the controller core reset, the register
+    reset
+  - reset-names: may contain "nand", "reg"
+
 Sub-nodes:
   Sub-nodes represent available NAND chips.
 
@@ -46,6 +51,8 @@ nand: nand@ff900000 {
 	reg-names = "nand_data", "denali_reg";
 	clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 	clock-names = "nand", "nand_x", "ecc";
+	resets = <&nand_rst>, <&nand_reg_rst>;
+	reset-names = "nand", "reg";
 	interrupts = <0 144 4>;
 
 	nand@0 {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
