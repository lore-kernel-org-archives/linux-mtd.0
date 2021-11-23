Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZbujvqOFg/COZMiF3yX1HW8Dh4VP0yvo7dN9PkD8wtk=; b=YgvNhZRiywdLPv
	MW1cOMJLTjADjiTz+BOJTuGpHPum8WN6VDb7tzPm5qcJNQiUZn5cBYeUJ/ZKKPAVIDVZc6/SYcYy1
	jhIUlCSzRmjrQ/LVeMvW8gRYDu5O2rq5tzwEAQvp34JFrvZ5bvTb8X81zX7sZyI+VcoZpqMJNqP/Z
	KKHgmRgiQoyjzqPM5aQuDQboVJLgmJHO9cA+PUWaofno4u0biaG2ZT5sg2xUnRJwHkV3XYeugg71Z
	t9q8sTHL1JIQkmesnge/hhXv0JA4rfKL17RV92XOb7LHHJjDt1kcxTZN4p4oWTZZmyT7MuT3N97Wj
	d36+vf3OFhb/qkXyr98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpT9u-001ikM-NE; Tue, 23 Nov 2021 10:36:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpT9s-001ijo-OG
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 10:36:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE18C60F41;
 Tue, 23 Nov 2021 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637663775;
 bh=Q0qoBg6VUv5HTkBCmx18bC2s0i4LoP2nemDb3MvC+LA=;
 h=From:To:Cc:Subject:Date:From;
 b=ZIi543eIIWLnrSxnVVFUAQ7PUVi8zCOq0hl/MUchGAD1kJN06u3Td9u9jlg/BFBZk
 xJqof1RWuYIPD8AMb+93mkhRxgi6O/urULiViMpHJkBjpwtTaobytATwaxwilbE5Xx
 fInJfX3Ae7dTRFSmUx4Yy9MUwDWfiVpdeA7q3DEtORi7vre/HkRWVqnS90dmBdNa8j
 7VQLiqt8jZLDJTtLojp4A6pB0wuhrwImkIGiiPAyk3b/WN8az3js9BJeJgBdBiOY+b
 IhCx968aLbEIf/QQ/7/bQAG5JGYWrATHnMdLoBqOOyCQzM6/ZJTddHXSVSNs27BUA8
 QF3S4xzGdkV4w==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: kishon@ti.com, nm@ti.com, tony@atomide.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 0/4] mtd: nand: omap2: Switch to exec_ops, support AM64 SoC
Date: Tue, 23 Nov 2021 12:36:05 +0200
Message-Id: <20211123103609.14063-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_023616_829006_457A7F38 
X-CRM114-Status: UNSURE (   7.72  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series gets rid of the Legacy ops and switches to exec_ops framework.

Also add driver support for TI's AM64 SoC which contains a GPMC NAND controller.

cheers,
-roger

Roger Quadros (4):
  dt-bindings: mtd: ti,gpmc-nand: Add compatible for AM64 NAND
  mtd: nand: omap2: Allow build on K3 platforms
  mtd: nand: omap2: move to exec_op interface
  mtd: nand: omap2: Add support for NAND Controller on AM64 SoC

 .../devicetree/bindings/mtd/ti,gpmc-nand.yaml |   5 +-
 drivers/mtd/nand/raw/Kconfig                  |   2 +-
 drivers/mtd/nand/raw/omap2.c                  | 525 ++++++++----------
 3 files changed, 251 insertions(+), 281 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
