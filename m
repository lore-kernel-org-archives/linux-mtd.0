Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D1DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 13:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ATHcMTouxhQTZgkSjkZSEly8reTm/RWBgyK8aigsAjc=; b=dXTpT+sucLTxAl
	skR8QqMql6nAnLScxdQ0jzoBxjO1K5A8SyU6Ifj2ShK618W4vx+lBHq4K+I/hzVqF6uHRIq6YapQM
	OmMBmoP+M+oqiEhBpGW9m8rYtZyYdjIc79wB5UgyxyobzfTV7hvrv3YCbGu+vQTDDoULPbc7H1+h0
	OQelRdJMGORCC1/f6NCCgpPpQOaLsISVYTi0BTkWUW88rKycDLEZeq71OeF+DaOAR3BjnmL7gQPh0
	cOuBNMF6AUFzVEvFFVsrUhLK5+P9kKVozKtrnjbIIiRrvpoqbCBFJddQoDDL6jAl+eDXh0Tb6xSgY
	DEKo9mjb4cocYQzAYQwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzf1v-006v2f-VF; Tue, 21 Dec 2021 13:18:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzf1s-006v1Y-Nw
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 13:18:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2E36B816A6;
 Tue, 21 Dec 2021 13:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D14CC36AE2;
 Tue, 21 Dec 2021 13:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640092685;
 bh=vo8HYA91fJrNzKCM3e/ChCv+UtZgf7w0ko3Vww763Ok=;
 h=From:To:Cc:Subject:Date:From;
 b=d1CD9eLSgsDY50iyZueLU7GJUc+oyul+BlDojq++kIC5nePz8yx/g72Tw1UNGVG+B
 uxFXucfCbEFxUh5o64+06pnL9DDe44Aphmahc+B+x2cLrFvBic87y7162RD9FQqF3q
 hQ6gulHE4ezkvJ72FoT+b1p4AmBf0XnWuYiznsved4kf0SbEvyQMERVgwVOJ8zSHzU
 lF7Etk6upTqlgqHi4ucMv3pJPYPfv/ANoDnq+pMSuzwjLNG4/2ez4c6vdM+wAPjket
 y2GuRLk0RwSBTNY9IBYFTqWm7cv/3Ifo2fIxCHhkK01R1lBp936KTxaFtRMdHWEpz9
 UI6FDxmWDobiA==
From: Roger Quadros <rogerq@kernel.org>
To: krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com
Cc: robh@kernel.org, kishon@ti.com, nm@ti.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v4 0/4] memory: omap-gpmc: Add AM64 SoC support
Date: Tue, 21 Dec 2021 15:17:53 +0200
Message-Id: <20211221131757.2030-1-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_051808_997607_A8185F2A 
X-CRM114-Status: GOOD (  11.38  )
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

TI's AM64 SoC contains one GPMC module. Add driver support for it.

cheers,
-roger

Changelog:
v4
- move compatible match table to header file so it can be used by
GPMC driver even when NAND driver is not enabled or as a module.
GPMC driver is always enabled as built-in.
- Select OMAP_GPMC driver from MTD_NAND_OMAP2 driver config as
OMAP_GPMC is not essential for ARCH_K3 boot.

v3
- use compatible match table for checking for NAND controller node in
GPMC driver.

v2
- update DT binding doc to make reg-names and power-domains property
required only for specific SoC.

Roger Quadros (4):
  dt-bindings: memory-controllers: ti,gpmc: Add compatible for AM64
  memory: omap-gpmc: Add support for GPMC on AM64 SoC
  memory: omap-gpmc: Use a compatible match table when checking for NAND
    controller
  mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3

 .../bindings/memory-controllers/ti,gpmc.yaml  | 23 +++++++++-
 drivers/memory/omap-gpmc.c                    | 46 ++++++++++++++-----
 drivers/mtd/nand/raw/Kconfig                  |  1 +
 drivers/mtd/nand/raw/omap2.c                  |  5 +-
 include/linux/platform_data/mtd-nand-omap2.h  |  9 +++-
 5 files changed, 67 insertions(+), 17 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
