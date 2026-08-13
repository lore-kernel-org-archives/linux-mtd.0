Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5236EC5AD5A
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7lkSbgm978qqcWxlmVea5k7Iqw+7yIO1BYx41lh/JI=; b=0Z2oiAuRr7iZDZ
	XxwNMPydNH9zT19BLBUQKR75xVYMv6Jz7lRpxvSuZ4MBhGv0vfN4L95uGFwDuBGVVLheCDZf01/Ta
	9skqlatTffoTaxun95QebotsDJcuMS9S7J3UfW6227+KNCWQm28eJXNswm9l/SkUEQr8rX2I4vsV8
	+iKdyo/EwcPDE25g1V3eef8s8G9RPo2o69KGoFJx7MXITxsoFYzJogUM9Tdh7HFgHZZ7zykKuPouP
	og3XKNjVs+GrvCZ+XlHzdVrlMUhkEJupijCyBH02/h4dzgQlCYIP3Z3V8MAlJoMo/D2oLJJyx8Vd+
	jQ9zW2CxrGuKAgx9HLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJcJ-0000000HDVJ-3F1N;
	Thu, 13 Aug 2026 00:48:19 +0000
Received: from smtp14.infineon.com ([2a00:18f0:1e00:4::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuJcH-0000000HDUp-0PTR
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 00:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1786582097; x=1818118097;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R6eDoJuUqjO7B93TM77ZpwdMaruwSDmh13fro4UHuuk=;
  b=l8sJ40HwLvI4RNNVsobHXXDlYny2nzzpXyG48c3e9/QlJI+yzbSYPn3w
   mbdUplOuaMkrj0wSirb+EW0MvRj905H/rvdZxjJXIE8hlhgl9OY+zEDIv
   svvNJZDZDn+mNTjkA7Dkt2fpboC7CxU+RFuw3vYwMJASwRJl48z7DfUUP
   Y=;
X-CSE-ConnectionGUID: 8UjiVw4LSMOTbcGq7gewfA==
X-CSE-MsgGUID: g/5hcU0NQs2fUkiPGjMUkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="141758067"
X-IronPort-AV: E=Sophos;i="6.25,220,1779141600"; 
   d="scan'208";a="141758067"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:48:11 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 02:48:11 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 02:48:11 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 13 Aug 2026 02:48:11 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <mwalle@kernel.org>, <pratyush@kernel.org>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <stayer.opt1f@icloud.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
Thread-Topic: [PATCH] mtd: spi-nor: xmc: add locking to XM25QH128A
Thread-Index: AQHdKV0FcvBkgkHBk0qX9jKILf2F17abJ41w
Date: Thu, 13 Aug 2026 00:48:11 +0000
Message-ID: <ead6aa2a38c64ed78e6c9972a8dfc2fe@infineon.com>
References: <20260811064512.42520-1-mwalle@kernel.org>
In-Reply-To: <20260811064512.42520-1-mwalle@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_174817_451688_2B20D8EB 
X-CRM114-Status: GOOD (  15.05  )
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

> Add support for locking to the XM25QH128A part.
> 
> Reported-by: Takino <stayer.opt1f@icloud.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221825
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

> ---
> Hi Takino,
> 
> please test it and reply with a "Tested-by" tag. With your full name if
> you like. I didn't get that from the bug report.
> ---
>  drivers/mtd/spi-nor/xmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index d5a06054b0dd..d3b52eb93e2c 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -19,6 +19,7 @@ static const struct flash_info xmc_nor_parts[] = {
>                 .name = "XM25QH128A",
>                 .size = SZ_16M,
>                 .no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP | SPI_NOR_HAS_TB,
>         },
>  };
> 
> --
> 2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
