Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46464C43334
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jun 2022 19:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzO96C6MtHjIfrV6nRrunK8lSoEz3M+wKnE2tA7uY+Q=; b=X3f8JezZ0htUfJ
	zwNFckW9O2qrnrM3ZDcPWaB7yZF+CHLw67OOkThb2xgmYeCrNq4hQ+e8hJLgX/lDAwKmaXRTHFfB8
	4xoDcJr05KclGWqZKXAOvkl7qY7qJ2hfymQBr4b8ZSI1PszFh0z6bYzh+SPnP73NBPRcQUqXRl3Gr
	coZivFVHeoDD3u+Exu9TVg08P1P+DtErcCRPGDgF5R9fzjSOFmFflloaBpx1B/o4+ganseo85Q+jK
	MvhZfBJCj+RityAfEJe1zIN15PkS1Q3TKiW6Dbf92WtCrvakU1ku2MJTrDVjqA4U4ZeqGTWN/3IwW
	ajKBnN7QbZ8PdmpeQFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzk6w-009Vyf-2S; Fri, 10 Jun 2022 19:15:58 +0000
Received: from alln-iport-8.cisco.com ([173.37.142.95])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzk6s-009Vxu-DZ
	for linux-mtd@lists.infradead.org; Fri, 10 Jun 2022 19:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2055; q=dns/txt; s=iport;
  t=1654888554; x=1656098154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u72bLTf2B+c8SBz+AstWagpFwrtX94lEUqCSNIL9kHo=;
  b=Zl2OQqSOHZUeCQP7VmWdK7GFqD/29WAFdwXMgIAqlHPmuR0H1efi8SRZ
   5FLkIJwrYIIyZrtpKXdTb3vTGNeVzMZAl/Ziz6mg8SoEW1lJz/PluwN5P
   zlqXmoDwh6ZqMeWm+j2bwNsL24HLlGLnm+BRT23xRI8kK4uJPnzJlzGqq
   s=;
X-IronPort-AV: E=Sophos;i="5.91,291,1647302400"; 
   d="scan'208";a="886185543"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 10 Jun 2022 19:15:49 +0000
Received: from sjc-ads-3421.cisco.com (sjc-ads-3421.cisco.com [171.68.249.119])
	by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTP id 25AJFmaB012979;
	Fri, 10 Jun 2022 19:15:48 GMT
From: Oleksandr Ocheretnyi <oocheret@cisco.com>
To: mika.westerberg@linux.intel.com, tudor.ambarus@microchip.com,
        miquel.raynal@bootlin.com, p.yadav@ti.com, michael@walle.cc,
        richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
        linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Cc: mauro.lima@eclypsium.com, lee.jones@linaro.org,
        linux-kernel@vger.kernel.org, oocheret@cisco.com,
        xe-linux-external@cisco.com
Subject: [PATCH] mtd: spi-nor: handle unsupported FSR opcodes properly
Date: Fri, 10 Jun 2022 12:15:48 -0700
Message-Id: <20220610191548.3626218-1-oocheret@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <YmZUCIE/ND82BlNh@lahna>
References: <YmZUCIE/ND82BlNh@lahna>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 171.68.249.119, sjc-ads-3421.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_121554_670419_9A8D4800 
X-CRM114-Status: GOOD (  12.20  )
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

Commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q* entries")
and following one 8f93826 ("mtd: spi-nor: micron-st: convert USE_FSR
to a manufacturer flag") enables SPINOR_OP_RDFSR opcode handling ability,
however some controller drivers still cannot handle it properly in
the micron_st_nor_ready() call what breaks some mtd callbacks with
next error logs:

mtdblock: erase of region [address1, size1] on "BIOS" failed
mtdblock: erase of region [address2, size2] on "BIOS" failed

Just skip subsequent processing of the SPINOR_OP_RDFSR opcode's results
because of -ENOTSUPP return value of the micron_st_nor_read_fsr()
if there is no proper handling of that opcode as it's been before
commit 094d3b9 ("mtd: spi-nor: Add USE_FSR flag for n25q* entries")

Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
---
 drivers/mtd/spi-nor/micron-st.c | 6 +++++-
 drivers/spi/spi-intel.c         | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index a96f74e0f568..507e675d81e0 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -399,8 +399,12 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 		return sr_ready;
 
 	ret = micron_st_nor_read_fsr(nor, nor->bouncebuf);
-	if (ret)
+	if (ret < 0) {
+		/* Check if read FSR is supported. If not, skip it. */
+		if (ret == -ENOTSUPP)
+			return sr_ready;
 		return ret;
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
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
