Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9293DCA0EE3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bp/RrqsYAGyenvyv7CuqgV3k3t/TxiEcFzHylczEN+8=; b=mPxPlPlCtxNeaN
	iz1bUTMpgqvVQpl+TQr4tCIN4HCoQhB8kQ3fDMPFH82icJtQvu0X1W8GToE094lJY9aN7FglKhVpE
	gfetFABj5NRQCryIA1LofvtDBz2OG1Gnq//2FwZEc5nceSJZ5lFH1NXPuM0gDr3sGgpXrE69Kp50x
	tqkfr0M87dO2AhAXOiYnqeAOQ7xlJCKO+UVK9UkxB8CbKRxB1urpEaVsJZcVltL58kydSUsD8C8uD
	ueG+/pMzjnzQlbdWfhvg4E+CmV1TkE6mLaVnFPf+ZkbM95s9lUuRhzEnQ35WfaWpebhYmvP4cG3ma
	xoxeIx7XTmUzBTk+ryFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulad3-00000009DLZ-40lb;
	Mon, 11 Aug 2025 22:04:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGq-00000008w0C-2iDM
	for linux-mtd@bombadil.infradead.org;
	Mon, 11 Aug 2025 19:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GnCw4UgjQY0VUHwgVnP6axN/oo0k5HxGKufTviylG+k=; b=DymJemOsyHWqEzXIFx8ENnIMuF
	a3VGcHE3h4/NM/ek+st75LY/IJrt/tBPclBXVBLRRDqNbCyGXImsH/kDgtFPmZO/dmFyrlTX2gQDv
	m3T08DrYAaLsWhRYBu4grDDBaN1Y+1itSnNx2ANq7W22FHNdn8Bl8Nl+8RzbIi9v6T/xKObBG9dg2
	LsVgF1mANqLIWjbvbcs72755kOGDPuSe9ftV66hvh+0zNdGfFY07WEO82A35pQ3FdxN5zVRHPexXR
	IONhK58gdsyrVjvS28wCMx6HNphrxo88BSCOxVfiROGeft5DZgtGE5eLg3JaBgD9A3wR3XI3tOln/
	aXjjcs/Q==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYGk-0000000FUsI-3hPB
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 19:33:22 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BJX6Mr1609373;
	Mon, 11 Aug 2025 14:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754940786;
	bh=GnCw4UgjQY0VUHwgVnP6axN/oo0k5HxGKufTviylG+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nBVmKFv3COW40w1KPfoV2SJsPzFsOb8qPz5uKlRCJUU2uD/aFYKiRJkcxPNTpxIuo
	 +K/RlK/2ejMNduU7cukySSup6Q4KhyvtfuGM9vj+iqLU7C05o8TyX3ZjPbnlNaO8YO
	 2NYp02GbwziBPx9LEIhAG3MB8Kw5Rv4zD+b+jp3s=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BJX6t22910817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 14:33:06 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 14:33:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 14:33:06 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BJWq1p3690681;
	Mon, 11 Aug 2025 14:33:02 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <broonie@kernel.org>, <tudor.ambarus@linaro.org>,
        <pratyush@kernel.org>, <mwalle@kernel.org>, <p-mantena@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <s-k6@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <praneeth@ti.com>
Subject: [RFC PATCH 02/10] spi: spi-mem: Define spi_mem_tuning_params and spi_mem_get_tuning_params()
Date: Tue, 12 Aug 2025 01:02:11 +0530
Message-ID: <20250811193219.731851-3-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811193219.731851-1-s-k6@ti.com>
References: <20250811193219.731851-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_203320_628897_961807A7 
X-CRM114-Status: GOOD (  12.56  )
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

Define a structure 'spi_mem_tuning_params' to store the PHY tuning
pattern and size of the pattern. Also, define a function
'spi_mem_get_tuning_params' to retrieve the information from SPI
controller.
This is required as different SPI controller may have different
stress or attack pattern of different length that needs to be read in
order to tune the controller correctly. In absence of such callback,
spi-mem clients can use static tables on the flashes like SFDP or NAND
param page values.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-mem.c       | 11 +++++++++++
 include/linux/spi/spi-mem.h | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 6c254291ee23..cfee5288fc81 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -570,6 +570,17 @@ int spi_mem_execute_tuning(struct spi_mem *mem, const struct spi_mem_op *op)
 }
 EXPORT_SYMBOL_GPL(spi_mem_execute_tuning);
 
+int spi_mem_get_tuning_params(struct spi_mem *mem, struct spi_mem_tuning_params *tuning_params)
+{
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	if (!ctlr->mem_ops || !ctlr->mem_ops->get_tuning_params)
+		return -EOPNOTSUPP;
+
+	return ctlr->mem_ops->get_tuning_params(mem, tuning_params);
+}
+EXPORT_SYMBOL_GPL(spi_mem_get_tuning_params);
+
 /**
  * spi_mem_adjust_op_freq() - Adjust the frequency of a SPI mem operation to
  *			      match controller, PCB and chip limitations
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 639fee61251c..f0e96cd4a6d4 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -238,6 +238,16 @@ struct spi_mem_dirmap_desc {
 	void *priv;
 };
 
+/**
+ * struct spi_mem_tuning_params - describes the Tuning parameters
+ * @pattern_ptr: pointer to the tuning pattern
+ * @pattern_size: size of the tuning pattern
+ */
+struct spi_mem_tuning_params {
+	u8 *pattern_ptr;
+	unsigned int pattern_size;
+};
+
 /**
  * struct spi_mem - describes a SPI memory device
  * @spi: the underlying SPI device
@@ -352,6 +362,8 @@ struct spi_controller_mem_ops {
 			   unsigned long timeout_ms);
 	int (*execute_tuning)(struct spi_mem *mem,
 			      const struct spi_mem_op *op);
+	int (*get_tuning_params)(struct spi_mem *mem,
+				 struct spi_mem_tuning_params *tuning_params);
 };
 
 /**
@@ -434,6 +446,8 @@ int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 int spi_mem_execute_tuning(struct spi_mem *mem, const struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);
+int spi_mem_get_tuning_params(struct spi_mem *mem,
+			      struct spi_mem_tuning_params *tuning_params);
 
 bool spi_mem_supports_op(struct spi_mem *mem,
 			 const struct spi_mem_op *op);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
