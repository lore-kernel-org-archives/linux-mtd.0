Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA67C43612
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:07:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCBF2086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 01:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FWCRnsst";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="LBB25re8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCBF2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8UF2hmFMTjT8PQCoJFZw+VP2NA3uyrEra0MSKB1A6cs=; b=FWC
	RnsstAJfHlg9rMJyv28TP/VphW0nGoRRbCzp1Xr7Nhxg09rRpD9C0I1OOGTO+5jQDc8lNUNtdElLp
	6RejvjMVtHIKoxWjNL2o9yzQ+ejus82fk5y8nR44W3MZEkj+obWqrEXiENQySe/4iD9Jezepw4IQn
	W4vA/n4zVcVWSu8VD/oKiZs1Tkb/Z57XL45tdHth+tXB69UIQjP0BxkhmdFQrFr2yWdIjb9F0iRS/
	Lzjy4mVtwBxOSY/dsVR6tPIZCPuT16d2L2A5TNuTCiLZSI3P8J/hgN3qM9gW44ufp8ngcdmHLk8LI
	VVDf0amyk0kC9Xl/lh9iBnMmw9pF2IA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkIcg-0006t3-0O; Fri, 18 Jan 2019 01:07:02 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkIcd-0006ro-9j
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 01:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1547773608; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XkFGTck7gvRx9HDUa+mp6ZYQi5+zkGojqrDNp5DwBA8=;
 b=LBB25re8p1wwRvrmIVbXYDfref05JGqKyrdwTqxwagAgX9eQ4q72Wnt9kGP3GG1+dt0IKl
 NBeT/XJWgVH18ZTDaJ/hOCB3fHN1QW93FnvCIp/8U2DU63fWda4afzSUDMhACXkfUSdB+l
 SrRBGF6mi/SpZG0VFhIvujQyNC0dSfE=
From: Paul Cercueil <paul@crapouillou.net>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: [PATCH 1/8] MIPS: DTS: CI20: Set BCH clock to 200 MHz
Date: Thu, 17 Jan 2019 22:06:27 -0300
Message-Id: <20190118010634.27399-1-paul@crapouillou.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_170659_523339_9DB3DA8C 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This is currently done inside the jz4780-bch driver, but it really
should be done here instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 50cff3cbcc6d..aa892ec54d0a 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -111,6 +111,9 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&pins_nemc>;
 
+		assigned-clocks = <&cgu JZ4780_CLK_BCH>;
+		assigned-clock-rates = <200000000>;
+
 		nand@1 {
 			reg = <1>;
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
