Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC3EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 07:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t9VNWpDcssp9fvL5R+QeZU3r+9qvLUsQqgYMJ6/WYlg=; b=bXZ5z59bxF3dFV
	9b31zFqq08zy9EtV/kcvdmwRtbb4A7kTPyJYOSc05LUlqjGI/F608aVDEEnA8R86C2+5ni5/s4+4c
	0UvyWN6WSKOOwbnOfYZc9/ZkPe3ukwcKH7frVKllAI3rI2MCu8oI2eAYjFBKgo8LeCBKxK9jqZPLB
	qkpSSZTrDqc3h+ENNW8A3TOkOBWH/UP1wVyazg9lzHFmjhW59mD5sel9oagZbdtA7EDjgN+sOSHRo
	h+ZJhuxtZO/R2bt+9+PrYZNsn+TkC4P1Po29HTMFKmz5iT8znqL+D+e/AZ0vnzg2zOal0xcygZHw6
	jxuvflzzfHo5OU7QV2cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okgzu-003oBa-92; Tue, 18 Oct 2022 07:26:46 +0000
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okgwR-003mK2-3N
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 07:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1666077792; x=1697613792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cSf294mhQbfJuFOuymgNqAtYKIJ2klCDJAg6UwS+qAE=;
  b=S4meZ6+KkE3eL7N3HZZshnzESGaTEjS76vin5uLAVst5MYPdsl0b1s8S
   oWwQ+7ThZeBN+YxxwMVz6Q+FdQ+HVPyOFHfkq6AJP4qrkumHn/ABuN3Rb
   5ShMETO70Om23SVsblm5eFteK9Tnb85qWeIXnUPEdyo9/1vDZhAJ1n2Qa
   k=;
X-IronPort-AV: E=Sophos;i="5.95,193,1661817600"; 
   d="scan'208";a="141337025"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-1c3c2014.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 07:23:00 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
	by email-inbound-relay-iad-1d-1c3c2014.us-east-1.amazon.com (Postfix) with ESMTPS id 3002DE0240;
	Tue, 18 Oct 2022 07:22:56 +0000 (UTC)
Received: from EX19D013UWB002.ant.amazon.com (10.13.138.21) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Tue, 18 Oct 2022 07:22:56 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX19D013UWB002.ant.amazon.com (10.13.138.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Tue, 18 Oct 2022 07:22:56 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP
 Server id 15.0.1497.42 via Frontend Transport; Tue, 18 Oct 2022 07:22:55
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 4A2534B6F; Tue, 18 Oct 2022 07:22:54 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <talel@amazon.com>, <jonnyc@amazon.com>, <hhhawa@amazon.com>,
	<hanochu@amazon.com>, <farbere@amazon.com>, <itamark@amazon.com>,
	<shellykz@amazon.com>, <amitlavi@amazon.com>, <dkl@amazon.com>
Subject: [PATCH] mtd: spi-nor: micron-st: Enable locking for n25q256ax1
Date: Tue, 18 Oct 2022 07:22:54 +0000
Message-ID: <20221018072254.21606-1-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_002311_220212_AC956DD7 
X-CRM114-Status: GOOD (  10.24  )
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

n25q256ax1 [1] uses the 4 bit Block Protection scheme and supports
Top/Bottom protection via the BP and TB bits of the Status Register.
BP3 is located in bit 6 of the Status Register.
Tested on n25q256ax1.

[1] https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_256mb_3v.pdf

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3c9681a3f7a3..7cf5fbb28f99 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -206,6 +206,8 @@ static const struct flash_info st_nor_parts[] = {
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ)
 		MFR_FLAGS(USE_FSR)
 	},
-- 
2.37.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
