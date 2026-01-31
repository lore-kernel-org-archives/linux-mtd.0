Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A78D61037
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jan 2026 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d/2xc5xtsjMWxrWmQa4acK7omOYbak2LM/iAriL2l5o=; b=bqSFXbzRwNf1sc
	CpW+PQbHKiqRuVvmrm8V+dLHLlAJymCKpYmRwysJ6C16+lq4vctPQE/qCArea63bxszLXf/ErMnPM
	fQ9ydOhByXMz+cwMad/e8Ay5sWhpM8RSfB0er8M8UR2HibeuXfoT3Ipws0LkyaHkc5dKJjV5X6RNS
	Yc1f/0LJnyXiQGuWeHM9X8JE5rSFOFOu0lItFUB/m2Ep/Amq2pChrsyGVIkYjXaC43l11Jkkcz77c
	CAW6PcRc9CI+Qnii5TZxulDdMbXmvT+JtN0fnyBSZCAmHsZX7Z1A+s6LB/RGdSd9mHtYxhNEAUQvC
	DvNuMS/3mYlgoMvVjxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmEjn-00000002qwV-2JXu;
	Sat, 31 Jan 2026 17:26:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmEji-00000002qwA-2DwK
	for linux-mtd@lists.infradead.org;
	Sat, 31 Jan 2026 17:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48BED41ACB;
	Sat, 31 Jan 2026 17:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688EEC4CEF1;
	Sat, 31 Jan 2026 17:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769880377;
	bh=lL2KpW+5gB6aNpRTESTk9jPO2YC6wPsXm8d7yK5Jj18=;
	h=From:To:Cc:Subject:Date:From;
	b=NVeIufvSICOnM+jMbsW8QKlexpX1UkuaFssed1due4sdc1ETuQYs1szA/hX5fgeJU
	 ZgLlaCoRcN2akffcRil9db/7eXFipFdJ7QO3Hh80GnwnPoTUidA0A5JWsTQzJuVrsO
	 GFSxxZWffMTE3VyUWiyDwDxcLR2ssz0pG8K/5qYlz8NUlFeAqhjrY6mkMWLwHdon37
	 XM+UiijsonYAEjnc83Dp/bBuOxp1lDB/DX7RL0Kx46AaEFfuKF7NdxQyRndilKe9wS
	 tUlH9Sg/O2fjOFdmhZnaIFkVT/Zprr3N4p0cqo4o8LZbu54N++wABb8T9c8sqE7ohE
	 +1BqBnx49mAwA==
From: Dinh Nguyen <dinguyen@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: dinguyen@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
Date: Sat, 31 Jan 2026 11:26:11 -0600
Message-ID: <20260131172611.28807-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_092618_607483_CC0F1F30 
X-CRM114-Status: UNSURE (   6.86  )
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

From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>

The Cadence HP NAND Flash Controller on supports DMA transactions through
a coherent interconnect. In previous generations SoC (Stratix10 and Agilex)
the interconnect was non-coherent, hence there is no need for dma-coherent
property to be presence. In Agilex 5, the architecture has changed. It
introduced a coherent interconnect that supports cache-coherent DMA.

Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
index 73dc69cee4d8..367257a227b1 100644
--- a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
@@ -40,6 +40,8 @@ properties:
   dmas:
     maxItems: 1
 
+  dma-coherent: true
+
   iommus:
     maxItems: 1
 
-- 
2.42.0.411.g813d9a9188


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
