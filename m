Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A293EC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0xIY0L2pITLNYxIIh6qE/vTDyqeEiX28DUZYRYK5YU=; b=da30YlaaheXblT
	C436M1ieadanH7ESdzSR8FTbFLsa2a8/NUSk8K87Dxip7g8CTtNIOmhBc9V7X88PbWCiKCs83oyRt
	5g/DN9NUQ5sI0aUmDZV8/k+ejkZwhJ7gXEjxyHy4OnDFlGfaICo3tpBx6TAdjQQRXtW3Df9hPK1ne
	LzNDX0Ou2sz/oq9dZtsaG0kK/aKqX9dtxdRnoZmDEnlN6an6DmLYSbPN1V2kFuRzWL2KsyNxX9rIf
	6gCIVvYG8CwYK1b8rAhSA28eqFw1m9QmFaC1IhGWbhuub0Jm4y90JlCKY8XLox11jjbSxQi5i3MgD
	OmhBuD4211gtpfGIlPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YR0-00G2h5-8g; Wed, 15 Jun 2022 19:12:10 +0000
Received: from alln-iport-4.cisco.com ([173.37.142.91])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1YQv-00G2fl-Et
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 19:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2629; q=dns/txt; s=iport;
  t=1655320326; x=1656529926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vnvt0MqP5LNDaqxR7L6ZH2qCRCr8hhIb7hMFw1y0Sp0=;
  b=NM6P90VdhP9+J4/vhbVU/q+MGjpmV/2eEw1fkCSB5e5ZsBqyb76e9q6K
   qedDhjfZxBxiAr6JJZQbbUPCaM2Iz0p8w9ydauMPPQMzfSZoLxxm6tYle
   NxtYN/iUPRD4q3Kdj+d802GZ7UkCxr0n9FnEO4uZkUrjBUTlWom7nNXh7
   U=;
X-IronPort-AV: E=Sophos;i="5.91,302,1647302400"; 
   d="scan'208";a="862238780"
Received: from alln-core-2.cisco.com ([173.36.13.135])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jun 2022 19:11:55 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by alln-core-2.cisco.com (8.15.2/8.15.2) with ESMTP id 25FJBrvQ017942;
	Wed, 15 Jun 2022 19:11:54 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: mika.westerberg@linux.intel.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, p.yadav@ti.com, michael@walle.cc,
        richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: mauro.lima@eclypsium.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, oocheret@cisco.com,
        xe-linux-external@cisco.com
Subject: [PATCH v2] mtd: spi-nor: handle unsupported FSR opcodes properly
Date: Wed, 15 Jun 2022 12:11:53 -0700
Message-Id: <20220615191153.3017939-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
References: <6A852B9E-D84C-4F80-9C17-62BFBB98CC8A@walle.cc>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: alln-core-2.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_121206_468079_C15013A6 
X-CRM114-Status: GOOD (  15.45  )
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

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
Link: https://lore.kernel.org/lkml/YmZUCIE%2FND82BlNh@lahna/
---
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
index 50f42983b950..2659c8337937 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -352,7 +352,8 @@ static int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len)
 		val |= HSFSTS_CTL_FCYCLE_RDSR;
 		break;
 	default:
-		return -EINVAL;
+		dev_dbg(ispi->dev, "%#x not supported\n", opcode);
+		return -EOPNOTSUPP;
 	}
 
 	if (len > INTEL_SPI_FIFO_SZ)
-- 
2.26.2.Cisco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
