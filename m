Return-Path: <SRS0=FqwB=PN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB746C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F366105A
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Oct 2021 20:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6F366105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V2fdFVlh++CkgBwsDbo/fGFdOMN8SqcqIXC80wRILRw=; b=BrKH1GOVLbDRt5
	bnxhslJgZmABiVxDs/AiOZo8Z7qc3rAZRwrmcLekTUsxjOE9xvqtL61EuSBn20IInKfJy1sPNcjyE
	0YF7EcYJSbCeuvPB7ZRJEioiZihFWYCHTB1pVcMtwwHz/KwDOAHRHZEJ98r41FDxX4/4mxjuVveM+
	c8Eta+Os2zegIcDiyQzCNkxDTBwaagpP9zZrGbDGj9XBsOsgJ+dQPBOwKEX0DiY5MSTEdcM2reXDD
	qv/0OFVb5IL7z+Mkja4CBM/8zQfjInPmLHqvyfjZa64Zs64YidYyOzEmBcpcvfCxWUqCDRSOiwRF6
	ckcGwXwlQ3CMHJ3NhEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf71T-00016H-8x; Mon, 25 Oct 2021 20:56:47 +0000
Received: from relmlor2.renesas.com ([210.160.252.172]
 helo=relmlie6.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf71P-00014n-Uh
 for linux-mtd@lists.infradead.org; Mon, 25 Oct 2021 20:56:45 +0000
X-IronPort-AV: E=Sophos;i="5.87,181,1631545200"; d="scan'208";a="98385682"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie6.idc.renesas.com with ESMTP; 26 Oct 2021 05:56:39 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8AD4441003BB;
 Tue, 26 Oct 2021 05:56:35 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/7] Add SPI Multi I/O Bus Controller support for RZ/G2L
Date: Mon, 25 Oct 2021 21:56:24 +0100
Message-Id: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_135644_159796_C36086F2 
X-CRM114-Status: GOOD (  11.55  )
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

Hi All,

This patch series adds a couple of fixes for rpc-if driver and
adds support for RZ/G2L SoC, where the SPI Multi I/O Bus Controller
is identical to the RPC-IF block found on R-Car Gen3 SoC's.

Cheers,
Prabhakar

Changes for v2:
* Rebased the patches on linux-next
* Split patch 5 from v1
* Included RB tags
* Fixed review comments pointed by Wolfram

v1:
https://patchwork.kernel.org/project/linux-renesas-soc/cover/
20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Lad Prabhakar (7):
  dt-bindings: memory: renesas,rpc-if: Add support for the R9A07G044
  dt-bindings: memory: renesas,rpc-if: Add optional interrupts property
  spi: spi-rpc-if: Check return value of rpcif_sw_init()
  mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
  memory: renesas-rpc-if: Return error in case devm_ioremap_resource()
    fails
  memory: renesas-rpc-if: Drop usage of RPCIF_DIRMAP_SIZE macro
  memory: renesas-rpc-if: Add support for RZ/G2L

 .../memory-controllers/renesas,rpc-if.yaml    | 54 +++++++++----
 drivers/memory/renesas-rpc-if.c               | 80 +++++++++++++++----
 drivers/mtd/hyperbus/rpc-if.c                 |  8 +-
 drivers/spi/spi-rpc-if.c                      |  8 +-
 include/memory/renesas-rpc-if.h               |  8 +-
 5 files changed, 124 insertions(+), 34 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
