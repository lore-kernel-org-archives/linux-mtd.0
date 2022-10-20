Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8834C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6pSSFd26QEi6VYnG6BPytWpp/rlmakIcqvUlkZCJqE=; b=iGL6cNtxFQT82Q
	7+JjB1A2A0Ld5vRw2y7TpBeZ1qNmZNzv25klyVDdXKM3ej6QFQ9PbX62FDnq4L5XXdWmytAMFXAsi
	qIrM5NgDIxtPlMquw6gSaGadQ0wptGz7tPtAsHanoH07ysZHWStd7fgeLafWYeifMFA0jm+NEWN2h
	vksJb26ZO4tgyPHoryFz66jbSE1TlTsB/MQDxzXkcCclUgzHCSmOCdUzD47QvDdcqZhFIqevlQXyd
	B4pgHByExe9I58LkJN29nhZy7HiISeHp0+djy8L7PqiwuxuUmvL//tOYW8DmMZDi/zzA8bFh4G1ZA
	fb5B+7BNmRAilgYh+gGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRv0-00D0eG-5n; Thu, 20 Oct 2022 09:32:50 +0000
Received: from smtp-fw-9103.amazon.com ([207.171.188.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRjn-00Cs4K-DG
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2022 09:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1666257675; x=1697793675;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gUzH+1qdyWGYtFXjCxZ0XI1LQRnYPZ2F7W0BfgT0mUQ=;
  b=hd7WHDVcQoiahhCKhqGxOvYbe8X29AL1kGn2d1m8vSTpqoT0iw/Y4SF9
   eVaseVWP8Yz9djs6Yknxiay4L0T1Lm4PcFXptTs+UB7RT37CjCLANHa87
   ZrdlQayrTAZQzxGD31zTCdu2+sbOUjqNwRhC7WLbJUiDTylLSRWJdnDmN
   w=;
X-IronPort-AV: E=Sophos;i="5.95,198,1661817600"; 
   d="scan'208";a="1065876450"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-iad-1e-90d70b14.us-east-1.amazon.com) ([10.25.36.214])
  by smtp-border-fw-9103.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 09:21:03 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1e-90d70b14.us-east-1.amazon.com (Postfix) with ESMTPS id AA9B9C4680;
	Thu, 20 Oct 2022 09:21:00 +0000 (UTC)
Received: from EX19D013UWB004.ant.amazon.com (10.13.138.62) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 20 Oct 2022 09:21:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX19D013UWB004.ant.amazon.com (10.13.138.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.15; Thu, 20 Oct 2022 09:20:59 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP
 Server id 15.0.1497.42 via Frontend Transport; Thu, 20 Oct 2022 09:20:58
 +0000
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id BF3FC4B99; Thu, 20 Oct 2022 09:20:58 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <talel@amazon.com>, <jonnyc@amazon.com>, <hhhawa@amazon.com>,
	<hanochu@amazon.com>, <farbere@amazon.com>, <itamark@amazon.com>,
	<shellykz@amazon.com>, <amitlavi@amazon.com>, <dkl@amazon.com>
Subject: [PATCH v3 1/1] mtd: spi-nor: micron-st: Enable locking for mt25qu256a
Date: Thu, 20 Oct 2022 09:20:58 +0000
Message-ID: <20221020092058.33844-1-farbere@amazon.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_022115_518061_5532A420 
X-CRM114-Status: GOOD (  10.76  )
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

mt25qu256a [1] uses the 4 bit Block Protection scheme and supports
Top/Bottom protection via the BP and TB bits of the Status Register.
BP3 is located in bit 6 of the Status Register.
Tested on MT25QU256ABA8ESF-0SIT.

[1] https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf

Signed-off-by: Eliav Farber <farbere@amazon.com>
Link: https://lore.kernel.org/lkml/20221019071631.15191-1-farbere@amazon.com
---
xxd -p /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff84000102800000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520fbffffffff0f29eb276b
273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
03d4ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
ffffffffffffffffffe7ffff21dcffff

md5sum /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
5ea738216f68c9f98987bb3725699a32  /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

cat /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
20bb19104400

cat /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mt25qu256a

cat /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
st

v3 --> v2:
- Minimize change only to mt25qu256a which it was tested on.

v2 --> v1:
- Enable locking also for mt25qu256a.
- Dump the SFDP tables.

 drivers/mtd/spi-nor/micron-st.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 3c9681a3f7a3..53ff41534977 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -201,6 +201,8 @@ static const struct flash_info st_nor_parts[] = {
 		MFR_FLAGS(USE_FSR)
 	},
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512)
+		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
+		      SPI_NOR_BP3_SR_BIT6)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		MFR_FLAGS(USE_FSR)
-- 
2.37.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
