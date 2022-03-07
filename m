Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D70C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V5wxjPKZT1g2nvzpp6c92D3uy+N55qLf2wOtzAS0yMg=; b=rv/tK0/dWsLmuU
	wRheG8CGyyG1HBslCKD3ibYPkEMhgKtItv4gv0AA8IONRqo8NmoQ1sjcM9XlRpCJQ5+acK73gOYSv
	6Eq9Bt7s0eYnRj5quzGwlH2CsWLnmGaTOTE9glIYQsWKamn4f8pNjc+rRCXfkMwQrru656pkEh6qK
	ov/qAsKkvt3tJWO5PANEgbpQtoeh2Q+7lN3PYPo+7cY/5KI9inctg+4f3JpSuuru8ofpirvmq4q9J
	nvfKqyKajJX/Gc+L8W+ktfxSgQyYOw0eMPQT1XfInj00XcHz2zUybJE3IhguKXnXZMCG+DMVglQN2
	6pw1SR7E4qgqp2jo4NIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRCeA-0003ke-ME; Mon, 07 Mar 2022 12:39:31 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRCSE-00Ha2l-7s
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 12:27:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3895:ecac:cede:7a48])
 by albert.telenet-ops.be with bizsmtp
 id 3QT42700N31zFQa06QT4aT; Mon, 07 Mar 2022 13:27:05 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRCS8-0032zO-8V; Mon, 07 Mar 2022 13:27:04 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1nRCS7-002L4P-Cg; Mon, 07 Mar 2022 13:27:03 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mtd: hyperbus: HBMC_AM654 should depend on ARCH_K3
Date: Mon,  7 Mar 2022 13:27:02 +0100
Message-Id: <9fd6b975adba710158f28aa603cf87a6d189a418.1646655894.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_042710_483840_3FB124F7 
X-CRM114-Status: GOOD (  11.81  )
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

The AM65x HyperBus controller is only present on Texas Instruments AM65x
SoCs.  Hence add a dependency on ARCH_K3, to prevent asking the user
about this driver when configuring a kernel without support for the
Texas Instruments Inc. K3 multicore SoC architecture.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mtd/hyperbus/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/Kconfig b/drivers/mtd/hyperbus/Kconfig
index 46c7e407e3780ae8..30ffc4c16e4d3e57 100644
--- a/drivers/mtd/hyperbus/Kconfig
+++ b/drivers/mtd/hyperbus/Kconfig
@@ -15,7 +15,7 @@ if MTD_HYPERBUS
 
 config HBMC_AM654
 	tristate "HyperBus controller driver for AM65x SoC"
-	depends on ARM64 || COMPILE_TEST
+	depends on ARCH_K3 || COMPILE_TEST
 	select MULTIPLEXER
 	imply MUX_MMIO
 	help
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
