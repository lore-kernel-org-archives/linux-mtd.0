Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE0C5DF82
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 05:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNtAGLASujoyPHy7rBeh73Be2F9kC5pPU/fnduljyyQ=; b=AtBQdEipC1rP88
	bjUVBv9GU84Khcc++F4hrPvv6eqs8/vsHXy1SIqwrJ2kqhlGg63T22WC2+iWHb96T0FN85eyg+efc
	S4Ntsoi2DqtcBxD7FvN+HtYDmN1Ai7UadouSS6O+wYTUInwN3kEiqfoHxeGvijoB1VGCzz+Y1eUhW
	mwZjhDjWJg72plQq8nkGTvdpzVGl686bPgN6xGL2+QsFxjLf5dx9jzsAwkG78DxWvRg5KSAK4drel
	68tDxPcBBJPIdj9oegosUxcXByIjPEyeK9B0er3NFhUO4OjySYa0A/YSDHq/E+SEadmSHfLz2Syvq
	dlvBjeQiR+NxKNgjVfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmm-0000000AtKA-2sf2;
	Thu, 20 Aug 2026 05:57:56 +0000
Received: from smtp2.infineon.com ([2a00:18f0:1e00:4::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwvmk-0000000AtHW-0BbT;
	Thu, 20 Aug 2026 05:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205474; x=1818741474;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dal/F5zZKg3SwPFB3iSmdSiiTJ6MM+edl5Snp947p2E=;
  b=LIHhOE+X1zW5jKiu4G3xAWWuifOCRFizGtKL2m+5EQGxlwNRLO51kgLR
   eOrWWIv2Co2LQ7CI3TGQTHW7If6QDA3HYY3HNWLwz/oG09H4vxg7DaB8F
   M5dOkEA0sZ5hfjrS23yCrkO1fWN+AWjeIOjKZz6H/dyv9hzLmeUd9fy2o
   4=;
X-CSE-ConnectionGUID: aCAruB/LS0mYuCfy6i39vw==
X-CSE-MsgGUID: MT8cv8FSSz+GIoMFeJnL6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173544264"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173544264"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:57:52 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:51 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:51 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:57:51 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure to
 a C header
Thread-Topic: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure to
 a C header
Thread-Index: AQHdKzc5S3N7+d5VvEWXzZZn39xq07ameygw
Date: Thu, 20 Aug 2026 05:57:51 +0000
Message-ID: <c21838d45aed4ed99364646db69958f3@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_225754_400375_0BDE19C5 
X-CRM114-Status: UNSURE (   7.52  )
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

> The sfdp_header structure is currently defined in sfdp.c, whereas the
> sfdp_parameter_header structure is defined in sfdp.h. In order to ease
> the reuse of this structure outside of the sfdp.c file, move this
> structure to the sfdp C header (.h).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
