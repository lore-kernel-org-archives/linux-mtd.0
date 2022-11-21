Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4411C43217
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 14:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1jbZVWfVsS26lS6anR5q6Nwu/qECw6HAfjDeHTG4AU=; b=h9Si8PkZhIT4p9
	bMv87JW6dg105vj2qRpxkjioacji1AIg8e1C0+jt/jALSGyjRhThi+cp8y5cIZ8R7cEmoxUZq27WZ
	NorHZEtfMfFiSrv+X2BhXVbOTzD8DmmMt/7I2dln13GZjwUmViUrYk8fvlOYiQSeyGN2mXRIFqly0
	ZzdgfvzlFkloQ9dSjbsgzUUcQASqD1zqlJuFxv+8nyXn327OMLTI+GFqt7412TgIwxfFY4yPpY4u8
	QxkfUDbWymsBWg11/CwxF70lSDKXujPvXNujbEvGIKqz9E0CYJeM1MQiR8sMC04ld4SkwfTuyLVZf
	WabUhm/I+pvITuXlSROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7ta-00EacV-Pn; Mon, 21 Nov 2022 14:35:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7tU-00EaLR-Pz
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 14:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669041332; x=1700577332;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81q/NWq8iLH9tF/aVF7hETErH6QjCfNUwmfq2TDAUcY=;
  b=cI2BUc6OQfUPLeDzvoIS1Mi+nJ2HwHH/7YbiH50vwLrthb3BsrTcKgqa
   gs6hFqbe9rvbs4HIV4e5NZhB/p8sk525f0IjKus0FY/qzv+k+rdA/psGG
   pRHgkA4xLgJetv1hWW4Q/fR2n1W58U1XK4VOUFjSvjNkzz2NN6lyWD4r1
   2NW0KouVmNG/yrPXnDeDSzwxFVAmk+qFkHu8cuTk++jEP2EK6rANRASI+
   EqijkWY1RsLQvwxYykg4ruK/ipIgk9BLeLApcoWJJxiY63y5vqsT8S+cP
   HeM0Le76IJ9MJyiJ7olflykACCKaKN2QWMtWPmDC3FRW4w3i4u9Kk/mX0
   A==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="187957811"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 07:32:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 07:32:12 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 07:32:10 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <pratyush@kernel.org>, <michael@walle.cc>, <yaliang.wang@windriver.com>,
	<richard@nod.at>, <cyrille.pitchen@wedev4u.fr>, <vigneshr@ti.com>,
	<andy.yan@rock-chips.com>, <miquel.raynal@bootlin.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/1] mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt
Date: Mon, 21 Nov 2022 16:32:07 +0200
Message-ID: <166904099810.93917.2481343672925708577.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221016171901.1483542-1-yaliang.wang@windriver.com>
References: <1dddc60f-44fd-df65-f491-be8379fe2380@microchip.com> <20221016171901.1483542-1-yaliang.wang@windriver.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_063532_943642_6A722E85 
X-CRM114-Status: UNSURE (   7.29  )
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

On Mon, 17 Oct 2022 01:19:00 +0800, yaliang.wang@windriver.com wrote:
> GD25Q256 'C' generation 'GD25Q256C' implements the JESD216 standards,
> JESD216 doesn't define the QER field in BFPT, but the 'GD25Q256C'
> does define QE bit in status register 1 bit 6, so we need to tweak
> quad_enable to properly set the function.
> 
> 'D' and 'E' generations implement the JESD216B standards, so parsing
> the SFDP to set quad_enable function is enough for them.
> 
> [...]

Updated comment in gd25q256_post_bfpt and applied to spi-nor/next, thanks!

[1/1] mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt
      https://git.kernel.org/mtd/c/4dc49062a7e9

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
