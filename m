Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7371EC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 04:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U7u0s5obKZ7mw3uSQvO/hGosT8tY43P0S/FpT5EScps=; b=R9ekR9TME9jJpj
	8pPyPZQmyJDckBkLRNjWdK7mm9u+Fc0vpVeKvSbaYhEilkdOZH2YhRMRQsZjF0HHsTLiUraieag/m
	Wdfpen1M2rKivW8PZVbyv/n66NsXjxfg+zQljevkgqj24uqFPqY3iYOZraYljVbSkyQVHyo7Fxn6q
	75CC9dxtNbROajIm1duW7iHQcRsvFWhtPV9dQ+7/ZFOzYc/e+B+LaootZv7235M8jZ//aD5bErzR1
	5pHDEeDwDOfkSMIcjzjhnLcDegwg0pwZyuzy33RrAuHU/C/lXH8iLk4PhTSQkO2fKMB6CSxPaTOJv
	f3/sn0WVEVgywmvJVJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvM-0041PI-Hi; Thu, 28 Jul 2022 04:15:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuvJ-0041Lx-BX
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 04:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658981697; x=1690517697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UIwrwWLYQtgE8tUtNpL9riE1222z7u5bHuWp61zlaSQ=;
  b=Izcit8HW5UOD/9emkYUqyFcfF89uPcSyG1Y5+XzV3ZsDNlI5bntDbgpO
   Jq4XR//F7Of1O0eNK2g/cmhPaFaUVQnKK+TYjZOTdUpS1alUO0GW9UoPv
   j8kApF4QRO2VDOQN7quEewgY7yUMmMPRhy2z8AZc0dN91l/cayZZd8toy
   LxM8eUnoQ5ccVPLf7tU3B3FPCONB0jm/5rB7YX+LzLSrrgk2yIMRBC6hN
   bR22JNjCxAfv43gPKmf4QJcb3BWsv8iVkc9KqgolVuWbzQ9vq95HGOU5W
   /+g01U1NseA1V1C4v/Ej3ZlD96rtVCcMhuGGnYM5zb29m5yyQ5NVupNz2
   w==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="173928631"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 21:14:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 21:14:55 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 21:14:52 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: spi-nor: manufacturers: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
Date: Thu, 28 Jul 2022 07:14:49 +0300
Message-ID: <20220728041451.85559-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_211457_422592_2A441251 
X-CRM114-Status: UNSURE (   6.89  )
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

We track in the core the internal address mode of the flash. Stop using
hardcoded values for the number of bytes of address and use
nor->addr_nbytes and nor->params->addr_mode_nbytes instead.

I don't have those flashes to test the changes, so I'll need some
Tested-by tags.

Tudor Ambarus (2):
  mtd: spi-nor: spansion: Replace hardcoded values for
    addr_nbytes/addr_mode_nbytes
  mtd: spi-nor: micron-st.c: Replace hardcoded values for
    addr_nbytes/addr_mode_nbytes

 drivers/mtd/spi-nor/micron-st.c | 10 +++++++---
 drivers/mtd/spi-nor/spansion.c  | 16 +++++++++++-----
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
