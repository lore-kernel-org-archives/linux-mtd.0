Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C85C04A95
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 17:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eqHjYB8RAwlwWBYP+GLs4LIjBTSbwWdn3MXnD0mKdR4=; b=zzPgi/H876cw7f
	RQ7s/Le/yrpMvM7SbybbU51276LD5RBVLQL5Z9GI4pZafjrgIOhW2HfONvcHUMjJahjhGXuk4arGV
	ZlqI08wd5NNe+pVbSyl86SYl94oVtI43KMBET5xtBx2v/Z+B2lql6v3Bnjrjleg+eDNoWG81wNQxo
	qHiZgAcZ2db/v8AMUj6gcpj3cxnP1Odh5acug6jvz0k2XTT4E7EaXyE+Rt9tzsbGBz60g7ZTP4aRi
	DjOIWrnCn6wYyd1wiclAowRiLlw8eiOATiMhGkY3eHrxX8Vov8Y7a6KbRmB1SRVrJb69vbyotuFp9
	T/oG6Ao0eYxwXmHcm7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m63-004NTe-1w;
	Wed, 08 Nov 2023 17:12:07 +0000
Received: from relmlor1.renesas.com ([210.160.252.171] helo=relmlie5.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0m5x-004NPE-2T
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 17:12:03 +0000
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="182203703"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2023 02:11:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.247])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 23204402E572;
	Thu,  9 Nov 2023 02:11:51 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Michael Walle <michael@walle.cc>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 0/4] Add set_iofv() callback
Date: Wed,  8 Nov 2023 17:11:45 +0000
Message-Id: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_091201_916094_E0ABA634 
X-CRM114-Status: UNSURE (   8.72  )
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

As per section 8.14 on the AT25QL128A hardware manual[1],
IO0..IO3 must be set to Hi-Z state for this flash for fast read quad IO.
Snippet from HW manual section 8.14:
The upper nibble of the Mode(M7-4) controls the length of the next FAST
Read Quad IO instruction through the inclusion or exclusion of the first
byte instruction code. The lower nibble bits of the Mode(M3-0) are don't
care. However, the IO pins must be high-impedance before the falling edge
of the first data out clock.

Add set_iofv() callback for configuring IO fixed values to control the
pin state.

[1]
https://www.renesas.com/eu/en/document/dst/at25ql128a-datasheet?r=1608586

Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230830145835.296690-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  spi: spi-mem: Add set_iofv() callback
  mtd: spi-nor: Add post_sfdp() callback
  memory: renesas-rpc-if: Add support for overriding IO fixed values
  spi: rpc-if: Add set_iofv() callback

 drivers/memory/renesas-rpc-if.c | 20 ++++++++++++++++++++
 drivers/mtd/spi-nor/core.c      | 20 ++++++++++++++++++++
 drivers/spi/spi-mem.c           | 20 ++++++++++++++++++++
 drivers/spi/spi-rpc-if.c        |  9 +++++++++
 include/linux/spi/spi-mem.h     |  4 ++++
 include/memory/renesas-rpc-if.h |  1 +
 6 files changed, 74 insertions(+)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
