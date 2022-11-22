Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C114CC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0tVyBSU29hXK2TEVjmXaLH40Sq6VZyR3a71TKPk5mQ=; b=5BwZpjpbvBvAcR
	a2Vp6lZOiR68SK9zToP/m5mOATfAkcpXVUxTS/UYxHtG+NoEzpPq3Z5CAGEK15AdeVaDKvUC98cLv
	cKgRjXUo/RYHXptXin7kj+2hj7aSsucDWODi/2SH4sQGddTjyzeXRXwRlUfEGdLPcGtbN7xU67QQb
	NT970phBUbBcaUfMfl11EB6abLVYGvmNKDxpJgV5U99knn1AeWTogjjwYW/SOToZDuULeaTMm+s1D
	rYtl4NfaqTElbm6RbWOzhC9ry8z0YotMXHNVktkS9+kys18haKB33GHN/E5Qg52htiINx/91J3Iyq
	fllfvQyUipTvCw67h0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQUr-007oJo-67; Tue, 22 Nov 2022 10:27:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQTs-007neF-1Q
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 10:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669112780; x=1700648780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=recIsswHDOyLzIEBSJ9pGwngd2wlATVE6OR9nm9abPo=;
  b=WL7786c6MV/QSwb63lNhS+FilHLA77i+ZMQVvasd0MJ9i038/UtqHgxy
   vj1ovh00IZ1Ah8VCUcC+sRHU79ZactuYfsypj4OdxCfCAZ1R62nSyUDQu
   PLEYFwHY5X5/iuqwVXUSi2aNYzm5Ba8EWABiUGHdmhjLJMpwJrVDeaPnF
   PRshWWbLHCu4ZGYMAyB23pnRll9wz7pzauGeg1yZ00OnUzOoO1ZPvlBC1
   0yTUJd/5MYUzrFEPL8WI+ajfveh/uOBrVdo4vsGs2o4ooSjk30R/x95Gx
   /LzQcB8YxGQqWIPwM4dnJXMA3q7B8dVA10YAt02x2DUJxoqacWiWG9Kj8
   g==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="184647678"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 03:26:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 03:26:12 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Tue, 22 Nov 2022 03:26:09 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Sudip Mukherjee <sudip.mukherjee@sifive.com>, Pratyush Yadav
	<pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, "Richard
 Weinberger" <richard@nod.at>, Michael Walle <michael@walle.cc>, Miquel Raynal
	<miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <ben.dooks@sifive.com>,
	<william.salmon@sifive.com>, <jude.onyenegecha@sifive.com>,
	<adnan.chowdhury@sifive.com>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <greentime.hu@sifive.com>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
Date: Tue, 22 Nov 2022 12:26:06 +0200
Message-ID: <166909836606.156581.1226064412350775051.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_022620_173150_E3EDD18C 
X-CRM114-Status: UNSURE (   8.90  )
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

On Tue, 20 Sep 2022 19:48:07 +0100, Sudip Mukherjee wrote:
> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
> initialization of the flash parameters and init them when parsing SFDP.
> 
> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
> After this patch, it parses the SFDP information and still uses the
> same opcodes.
> 
> [...]


Applied to spi-nor/next, thanks!

[1/2] mtd: spi-nor: issi: is25wp256: Init flash based on SFDP
      https://git.kernel.org/mtd/c/a30f53d8bc0fi
[tudor.ambarus@microchip.com: set sector_size and n_sectors to zero]

[2/2] mtd: spi-nor: add SFDP fixups for Quad Page Program
      https://git.kernel.org/mtd/c/1799cd8540b6
[tudor.ambarus@microchip.com: move pp setting in spi_nor_init_default_params]

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
