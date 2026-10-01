Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34102CA5FC5
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2026 07:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bIlFxROFDoYoGxGyp3Ptqbxunb6GbF1MGMVv4oHDb4=; b=qsx+RMa/IQVOi4
	GZnRZWVK1e/sR2i0kog4JDFiHeCGaslsJqRChNFi481F1wFs94xSqWlcvwh6euR+fmJB0b2vy4im2
	WbLZ5p0yN6jc9Vg76ZtrW3uBcQ9uO/gYSKWVey4FVo/msy4lpnVfU09u6+5pH2/kcv/aLo9peKTz4
	u+k1DOXAaVjis7rckkrUhPgRZ5siKkpM+M7vwhV+H2oIeNetBBJEvCUURMG+d0KQKITlAMAaWTza5
	yrowiO/Sj6ME44Ew2062jzXmep+kB4nxMdy66FrBvUyVNCm1ApuIIgLO9ObY0xLlcesGCUqEe+V3O
	RDP8IDCVWWfLWIyxhHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB4o-00000007ynx-2zFT;
	Thu, 01 Oct 2026 07:19:34 +0000
Received: from smtp2.infineon.com ([217.10.52.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCB4l-00000007ydC-1bvD
	for linux-mtd@lists.infradead.org;
	Thu, 01 Oct 2026 07:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1790839172; x=1822375172;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TKk4lc4Q3kYR4kAtmczq94ezuNcvwhYm99HvFo8Uum4=;
  b=Fmw5pRp+G/QHFwyTp0maaNJjg+YVW1xXE6T0tah54iJQ016qKbUMCz+s
   s6I35KgosiI9aTAmZgW4MAoDia7Avp1as3k71bTy+sSNuwjuIo2Hcv8rU
   XAKZaMh+VEksFbbbDfTJxcFgZFlLekXsKqCTAbYuaoQLNBBpHmoHEwKRi
   0=;
X-CSE-ConnectionGUID: uJQWZ39CRjasYsp0znpwEA==
X-CSE-MsgGUID: jfOoUmy9R967uTBymAgnNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="181704038"
X-IronPort-AV: E=Sophos;i="6.27,134,1787004000"; 
   d="scan'208";a="181704038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 09:17:25 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 09:17:24 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 09:17:24 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.049; Thu, 1 Oct 2026 09:17:24 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <marex@nabladev.com>, <linux-mtd@lists.infradead.org>
CC: <chengminglin@mxic.com.tw>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <richard@nod.at>,
	<vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Thread-Topic: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Thread-Index: AQHdTI+RbslWC8yeRU+6uOH9/L7Fh7boPlmw
Date: Thu, 1 Oct 2026 07:17:23 +0000
Message-ID: <9bdd8b02469042ffa71851fd2641708e@infineon.com>
References: <20260925014517.174496-1-marex@nabladev.com>
In-Reply-To: <20260925014517.174496-1-marex@nabladev.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_001931_752632_A3C08F9D 
X-CRM114-Status: GOOD (  16.02  )
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

Hi Marek,

> The MX25L51245G part has the same 4-BP locking mechanism as MX25L12805D.
> Describe the locking support.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> ---

Can you test locking as described in [1] and provide test log?

>  drivers/mtd/spi-nor/macronix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index b3fdb4b2fa1ca..4de1b490b16b6 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -165,6 +165,7 @@ static const struct flash_info macronix_nor_parts[] = {
>         }, {
>                 /* MX25L51245G, MX25L51273G, MX66L51235F */
>                 .id = SNOR_ID(0xc2, 0x20, 0x1a),
> +               .flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,

According to datasheets [2][3][4], those chips have TB bit in Configuration
Register bit-3 and the bit is OTP. The existing HAS_TB and HAS_TB_SR_BIT6
flags don't work as they expect non-OTP bit in Status Register.
Just supporting top area protection (TB==0) would be fine with me, but in
that case, fixup should check TB and activate locking only when TB==0.

Thanks,
Takahiro

>         }, {
>                 /* MX66L1G45G */
>                 .id = SNOR_ID(0xc2, 0x20, 0x1b),
> --
> 2.53.0

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
[2] https://www.macronix.com/Lists/Datasheet/Attachments/8381/MX25L51245G,%203V,%20512Mb,%20v1.3.pdf
[3] https://www.mxic.com.tw/Lists/Datasheet/Attachments/9176/MX25L51273G,%203V,%20512Mb,%20v1.7.pdf
[4] https://www.macronix.com/Lists/Datasheet/Attachments/8657/MX66L51235F,%203V,%20512Mb,%20v1.1.pdf


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
