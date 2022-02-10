Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EEBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 02:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jpRsSDzXoaFGW9ah6zf+4YU4/+f8WBmflJhU4rQU6Ms=; b=P2S/obTkld12Tl
	CBkUaLwe3czrpUd94Pro6v0TlTJDOBI3h7kKFXRwGpLXtWtHLTdk5T5PknoWNwNm9UQoIEcSP7NDi
	vpb2uMqs+4+2XDTqLaCToes3cemZvhG7kPphIXLxxngGY4l2i86ZdnlzcYKvzvcMhHW2zvHlKPNAD
	/+M7eIzKcB4s1Kvl1ufcfQUmpH+f2PscIOC6CbVJI+cUPxnnDKYonRpPoeT6Rmw8WlpS/wgKSd3Et
	HreJY6C4Pw5+BT5xOngpSTqgxuq6nBhPOTLRiyPUiRWCxqFzBTPAE2Vxy+jkaxtqFmGwznPSTVQKK
	VmlCw+xooQL/H9o1u17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzHJ-002Hy6-70; Thu, 10 Feb 2022 02:33:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzHG-002Hxn-15
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 02:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644460425; x=1675996425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dYsIVK1AfB36+8GaquEQ87fKf8oN7bkQ3uKk1U5DdBc=;
 b=UEGBRDq7a2Fp+Sy6meD4khLET6qFGgdvcx9fdjjsT1DQzOYskuYVYKD1
 aXvjaI1WNn5WCUnT90pC7+CTpgkAxk1x+SpC8A8UuFzCA7wePViFv6D/d
 pdUFjE1iSnIQVw8xGDFgSzdfRQqqjOTFg1FVqcS15PjWw10F6ayt15bxV
 eQogCGHTKVaBFgWmubiHdU7TRh3m8Ll0lGoSNfcoVTc5W4I/Ch2NWjRPe
 qJyDYx/0kais4RqLmOh5m/FgRSJYog+tojMIe5LMxBmLuwnsY7Pj0SE5H
 ijZalxt/RYu5x9bcRkzdcd80NbhHFA9/hpejblUAI6jJ9Fz/qRsR1d6ba Q==;
IronPort-SDR: GXFH9gi5i94h/9Gu9Wc/AM0kkABlz6qgRkg37NfI7iVocwyWBAfeJPOCQNikIMUz/WF/Q/IQSl
 Nmfeggjj8OavE0umqWzTWe3ZcOzys7fdGB1tAR81WhgMjtyihyHns2xPfv/vJS7lHTzZj81AhO
 DN23UlXRaP8a7ZnkRRDC1OLAZ47c9fXWq/pcDiS59P160JxgBzy4mQfZd6Krv1m0PZKlYF/I47
 rN2jGkENGDCQJQ82soSIuNylqWsI0GZQnCUjYAsDVcgp1MtNpixbHY8Y3vSkO8OzSYjNxR3qnp
 GhNNikxiaZZyjCLCgv9JEKjw
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="153075474"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 19:33:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 19:33:41 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 19:33:37 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <Bacem.Daassi@infineon.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Subject: [PATCH 0/3] mtd: spi-nor: Rework Octal DTR enable methods
Date: Thu, 10 Feb 2022 04:33:31 +0200
Message-ID: <20220210023334.408926-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_183346_143850_7C89EB0A 
X-CRM114-Status: UNSURE (   4.97  )
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

There are manufacturers that use registers indexed by address. Some of
them support "read/write any register" opcodes. Provide core methods that
can be used by all manufacturers.
Update the Octal DTR enable manufacturer methods: introduce templates for
register operations, use the introduced core helpers.

The series depends on:
https://lore.kernel.org/lkml/20220209133656.374903-1-tudor.ambarus@microchip.com/

Tudor Ambarus (3):
  mtd: spi-nor: core: Add helpers to read/write any register
  mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
  mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()

 drivers/mtd/spi-nor/core.c      |  41 ++++++++++
 drivers/mtd/spi-nor/core.h      |   4 +
 drivers/mtd/spi-nor/micron-st.c | 105 +++++++++++++------------
 drivers/mtd/spi-nor/spansion.c  | 135 +++++++++++++++++---------------
 4 files changed, 172 insertions(+), 113 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
