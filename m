Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5E6C19776
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2025 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RJKoNL3QVAK5pj8ikDckJUI3QN/5DxbTe334Wut7Swk=; b=ILtubU7en077HU
	W6hiYSrMeAMMDO/2fXHhZiGpeFpK9xdzI6Pc5QU0Tsj/mdu668L6Gf1M6ZM9VlpZW2C1oef/7cJ0Y
	k3N+8a5ASIDBbpqLhWPKBGPQRDITo1pdgC8nScLEj9Z6BLzG/qdrBWwXy5gCMQMr0fL2HZlD6UOdQ
	HYGAS9mbdHTy7J/Ktt2MYTnbc6hAh+Plbj29UZ9KlGrq9zJFc/twM7AYFc4CnfcrDeadeYaitfqtb
	j08KvyvnyvhXxBjhXtbRp0Mhfc7qASbVyRIM0f6wWkWIrI/MRJL2oVTSorfZgd2xybIYDwJ7QENOr
	gb2OkBoPV7YE4F6QeQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0vY-0000000BAGn-2SKa;
	Fri, 28 Feb 2025 14:01:20 +0000
Received: from esa.hc1631-21.eu.iphmx.com ([23.90.123.40])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0vV-0000000BAFl-0RMF
	for linux-mtd@lists.infradead.org;
	Fri, 28 Feb 2025 14:01:19 +0000
X-CSE-ConnectionGUID: fV9XRE9jT4ao1WpTIzyzUQ==
X-CSE-MsgGUID: XgI67qL5SQCkAnSvmzAnrg==
Authentication-Results: ob1.hc1631-21.eu.iphmx.com; dkim=pass (signature verified) header.i=@thalesgroup.com
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="28464659"
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="28464659"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=thalesgroup.com; i=@thalesgroup.com; s=bbmfo20230504;
  t=1740751271;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=dXsFjKJ4dHMrigl6gtdveesn751CbT/XATwwz+IkqNY=;
  b=J9q8PklSfo5po0jzJmhVlw8KXnp5ibbo+9FDwLJEgmhTGdj9trwIEBt0
   X58JwEKeCHnn2l/OqgmEFKh7tmWILuK4htL5/DRmTRJk6blGEzh2A2uTY
   LsiTrhNFiAHF6v7jC6O2k7jNK40czQVL4c6D/+/m6VQf+CRelQDA8MFT+
   GA4M+jn8yNpBDaJ2ti1JvOgb3ZGQSMkPD5vKNzbXQPa9Wu4HUA+lXa729
   9Ny1tG6fHpQ7STXZpaxAYouRYI8f/u3Nk8mreK5+/M5bWjoJJjlEtZznI
   DIyx0mf2YrOOmhGYqQdW20BxR7x1HWnA3S/RC38ZuwQreYJA5yOiWeENZ
   Q==;
X-CSE-ConnectionGUID: VnjYvPy9Szi1zx75X96R8g==
X-CSE-MsgGUID: vK0xASFMSmyQd6+WdY4WhA==
X-CSE-ConnectionGUID: o5J0DluUTtSP6XjxAY9VgA==
X-CSE-MsgGUID: aavQEhezQUq9Uz6O7W+4Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="42505789"
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42505789"
From: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>, LENAIN Simon
	<simon.lenain@thalesgroup.com>, RENAULT Xavier
	<xavier.renault@thalesgroup.com>
Subject: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Topic: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
Thread-Index: AQHbiejmrpjq/9QuH0uaX3lViTPuDg==
Date: Fri, 28 Feb 2025 14:01:08 +0000
Message-ID: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-endpointsecurity-0xde81-ev: v:7.9.19.508, d:out, a:y, w:t, t:15,
 sv:1740727901, ts:1740751268
x-ms-exchange-nodisclaimer: 0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060117_971022_DAEB354B 
X-CRM114-Status: UNSURE (   5.71  )
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

Infineon CY15V104QSN is 4Mbit serial SPI F-RAM device.

Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
Acked-by: Simon Lenain <simon.lenain@thalesgroup.com>
---
 drivers/mtd/spi-nor/spansion.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e742..32f8892d7afe 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -922,6 +922,12 @@ static const struct flash_info spansion_nor_parts[] = {
 		.size = SZ_512K,
 		.sector_size = SZ_512K,
 		.flags = SPI_NOR_NO_ERASE,
+	}, {
+		.id = SNOR_ID(0x50, 0x51, 0x80, 0x06, 0x00, 0x00),
+		.name = "cy15v104qsn",
+		.size = SZ_512K,
+		.sector_size = SZ_512K,
+		.flags = SPI_NOR_NO_ERASE,
 	}, {
 		.id = SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
 		.name = "s25hl512t",
-- 
2.19.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
