Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0175C433FE
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Mar 2022 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gdu6CcG5j9TsFCjy/NZJfZkMjoMsqBONQcna25oFP3I=; b=kaVvFBzDbXfWz0
	8gQ2AbB3fUJplvOicDfec1Uxq8R1/qzercZcsf7BcKoGlKTOk5LcOU9rOH54ZcN9INv7YplDDkVwQ
	8FyPfptJSeF2GpuOhAcwJXOsTwBW5g1aSwk018L/HlhBzJICjSfAx535XQ0ddYJPZEz0569q7dZ9W
	HLva03YSE/Djr14sByt+g7XUudcJvxxS4EpUJUbawSGPrNh9hYgI14RWQXqM+oUFTO1+LL66QlCDt
	VUvwAnhezW52Q9avngOw66gmrzB6Ppais6EBOUPcT8i/Q7WiAV1nTgR5Q7duJeYhSndmh31zH+KAg
	hSKdO4R7xmphRs9LnaRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1SV-003yLU-EF; Sat, 26 Mar 2022 08:07:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1SS-003yL5-KY
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2022 08:07:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F56660AEA;
 Sat, 26 Mar 2022 08:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFBBC340ED;
 Sat, 26 Mar 2022 08:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648282055;
 bh=uWGwd/TjDTtlET6TIDYKpJUWHawper8Pz2sEe19Tmgs=;
 h=From:To:Cc:Subject:Date:From;
 b=pMgOR81y2anBnhQydUKl5DlHqFosPv6ALnXZqsYZVd0cx/AXsuZ3wMJR+UEBUW9YG
 uW9ibeLIhjFTDNA58IJBH/xumKiiZH37n+Z8xLkgkTLOF75hY7kH/C3e4k79KJ/BAz
 XeLKkMEsxQbC8BGERMRpGtXZjoZOzpGt6RV/l/ziCNH5PmGZ3VCC2uYBitAbY2aSob
 O1FifVFClrMx03G/LuJR/8wb2MO7IsSbV562zXS487b8GE4yAdmHjRuOZeUPwjBBuF
 JyMzjVCMVxcWbr1HCI0CbqPjdxmNcqlRcJ2Kw/UjT6YG3G7TSTZyiBBAeSuQkJSF4y
 mQbeh0IBlHpqQ==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: krzk@kernel.org, richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v3 0/3] mtd: rawnand: omap_elm: convert DT binding to yaml
Date: Sat, 26 Mar 2022 10:07:23 +0200
Message-Id: <20220326080726.30372-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_010736_761879_8A89B8B0 
X-CRM114-Status: GOOD (  10.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series converts omap_elm DT bindings to yaml and adds
support for ELM on AM64 SoC.

Changelog:
v3
- use 'enum' for compatible specifier. Get rid of 'items'.

v2
- explain hwmod usage deprecated in commit log
- fix example node name to 'ecc'
- remove 'items' for single compatible specifier

cheers,
-roger

Roger Quadros (3):
  dt-bindings: mtd: ti,elm: Convert to yaml
  dt-bindings: mtd: ti,elm: Add support for AM64 ELM
  mtd: rawnand: omap_elm: Add compatible for AM64 ELM

 Documentation/devicetree/bindings/mtd/elm.txt | 16 -----
 .../devicetree/bindings/mtd/ti,elm.yaml       | 72 +++++++++++++++++++
 drivers/mtd/nand/raw/omap_elm.c               |  1 +
 3 files changed, 73 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
