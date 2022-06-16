Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76394C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 12:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WGDm3pRL4RlRr6CyqQfFNibh0hdhAWA4tYj5zeFlDAM=; b=lZ9du8vgGvJzK0
	GJUXuzDBq7bX3u6dNV6pCpwF9raEdF7/6q+TSnF+tlwj3Fdt9K46JMkYSYRGH89l6wPKiGYlTFKFu
	M6Lvo9FSe2ZanVALfOUFV9XzfPv2R0edAzWfPgM/mTPUE9R/GHc04yBGnCjCBiPrud7hC/KhyMRuW
	263hAuduQgY7gFdfJkra0K+QqEDW0xGlCrOLwK/Qt6ADSUgH7vzNfhRYCl/yCb2R0MdMIH5EeJcml
	5a1oTbYkJsfVCZ0qUevQrrBYl2bGNXu+y+wmVq+MwCnMf2oH3eEFhqoz/cSmApNBcmKg9r7yLk4Lh
	SXVImu762IR7cyV3/huA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oOx-002Gdh-CT; Thu, 16 Jun 2022 12:15:07 +0000
Received: from alln-iport-7.cisco.com ([173.37.142.94])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oOi-002GV2-Pd
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 12:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2777; q=dns/txt; s=iport;
  t=1655381692; x=1656591292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=utAeUQ7pAkd42bz7uEkmhVg3HUntGqQ92mWa3gY3aqc=;
  b=YtDcKLSZCB9QnWRttus1/vxcdj+JcTGjkzKta9EHbCTW86LvVubKcOUV
   VYXNjkAmD/4lM+Fegn6D7EA4Mv/7TQbQS9o9AqozRUuaF6tMThjHrhdfF
   L07KdUgni/Z2NLPYP8OAGgPDgjCTxIUwcCakOAhVa+4FOnfInPebyBqwQ
   E=;
X-IronPort-AV: E=Sophos;i="5.91,305,1647302400"; 
   d="scan'208";a="871309368"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 16 Jun 2022 12:14:47 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTP id 25GCEk4r029590;
	Thu, 16 Jun 2022 12:14:46 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: mika.westerberg@linux.intel.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, p.yadav@ti.com, michael@walle.cc,
        richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: mauro.lima@eclypsium.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, oocheret@cisco.com,
        xe-linux-external@cisco.com
Subject: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Date: Thu, 16 Jun 2022 05:14:45 -0700
Message-Id: <20220616121446.293408-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <YqsHcL5NPcZ4De77@lahna>
References: <YqsHcL5NPcZ4De77@lahna>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_051452_951051_4347A560 
X-CRM114-Status: GOOD (  15.18  )
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

Originally commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q*
entries") and following one 8f93826 ("mtd: spi-nor: micron-st: convert
USE_FSR to a manufacturer flag") enabled SPINOR_OP_RDFSR opcode handling
ability, however some controller drivers still cannot handle it properly
in the micron_st_nor_ready() call what breaks some mtd callbacks with
next error logs:

mtdblock: erase of region [address1, size1] on "BIOS" failed
mtdblock: erase of region [address2, size2] on "BIOS" failed

The Intel SPI controller does not support low level operations, like
reading the flag status register (FSR). It only exposes a set of high
level operations for software to use. For this reason check the return
value of micron_st_nor_read_fsr() and if the operation was not
supported, use the status register value only. This allows the chip to
work even when attached to Intel SPI controller (there are such systems
out there).

Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
Link: https://lore.kernel.org/lkml/YmZUCIE%2FND82BlNh@lahna/
---
 PATCH v2 updates PATCH v1 taking into account changes from
 https://lore.kernel.org/linux-mtd/20220506105158.43613-1-mika.westerberg@linux.intel.com
 to check -EOPNOTSUPP value from micron_st_nor_read_fsr() as well.

 drivers/mtd/spi-nor/micron-st.c | 12 ++++++++++--
 drivers/spi/spi-intel.c         |  3 ++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index a96f74e0f568..fd52e8feea44 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -399,8 +399,16 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 		return sr_ready;
 
 	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
-	if (ret)
-		return ret;
+	if (ret < 0) {
+		/*
+		 * Some controllers, such as Intel SPI, do not support low
+		 * level operations such as reading the flag status
+		 * register. They only expose small amount of high level
+		 * operations to the software. If this is the case we use
+		 * only the status register value.
+		 */
+		return (ret == -ENOTSUPP || ret == -EOPNOTSUPP) ? sr_ready : ret;
+	}
 
 	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
 		if (nor->bouncebuf[0] & FSR_E_ERR)
diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 50f42983b950..f0313a718d1b 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -352,7 +352,8 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
 		val |= HSFSTS_CTL_FCYCLE_RDSR;
 		break;
 	default:
-		return -EINVAL;
+		dev_dbg(ispi->dev, "%#x not supported\n", opcode);
+		return -ENOTSUPP;
 	}
 
 	if (len > INTEL_SPI_FIFO_SZ)
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
