Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51956FA372C
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 07:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F2620820
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 07:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q45TDqrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26F2620820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4raPivCcqkWXWwVHHQprtrF+lm4tP7pFaT2Y4PnyJ3E=; b=Q45
	TDqrg/LflIghrGnhS9EuFBnLUIA+/uKeXj5hvMzj7IgWSb1jnGZT2W/Hci6vSvLbtHyg5z8QcNwIb
	bUdJt+vXZKJgl+JVHX2gPOZIQ2lPQQ3owt1zgU+zI1sbRGeO2cOLPRuLgocxgM9u679sEZLU9imk3
	fwQODUthOtcYkixrIfk+kyZweof8ZQECEz6oF21McU4f6xF0q95idcXTGre4ctXtdyQSRpjCSoyQi
	NXgxGuaWobuG2nkNoTfrafDUJuya6AzvUKndhWyR8ZN1S71dorGgZrNmIzujfR0WZVypuupmS0u5O
	kCR69L5bpbNPYux+9FA0Nbvzu7NkufQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL050-0003fR-IE; Thu, 17 Oct 2019 07:20:14 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL04v-0003AD-Q0
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 07:20:11 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Oct 2019 00:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,306,1566889200"; d="scan'208";a="200304826"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga006.jf.intel.com with ESMTP; 17 Oct 2019 00:20:04 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/2] mtd: spi-nor: cadence-quadspi: Disable the DAC and
 Autopoll for Intel LGM SoC
Date: Thu, 17 Oct 2019 15:19:58 +0800
Message-Id: <20191017072000.48860-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_002009_892775_357AA194 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, vigneshr@ti.com, boris.brezillon@free-electrons.com,
 richard@nod.at, qi-ming.wu@intel.com, linux-kernel@vger.kernel.org,
 david.oberhollenzer@sigma-star.at, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com, andriy.shevchenko@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Intel Lightning Mountain SoCs QSPI controller do not use auto-poll
and Direct Access Controller (DAC).

Thanks vignesh for your time to review the patch.
The following comments are addressed..
changes from v3:
- commit messages are updated in both the patches
- moved cqspi_disable_auto_poll() in cqspi_controller_init()
- moved the check <if (ddata && (ddata->quirks & CQSPI_DISABLE_DAC_MODE))> in cqspi_setup_flash()
- introduced cqspi->auto_poll variable instead of f_pdata->use_direct_mode for auto_poll patch 
  
Ramuthevar Vadivel Murugan (2):
  mtd: spi-nor: cadence-quadspi: Disable the DAC for Intel LGM SoC
  - This patch adds a quirk to disable the Direct Access Controller
    for data transfer instead it uses indirect data transfer.    	

  mtd: spi-nor: cadence-quadspi: Disable the auto-poll for Intel LGM SoC
  - This patch disables auto polling when direct access mode is disabled

 drivers/mtd/spi-nor/Kconfig           |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c | 55 +++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 7 deletions(-)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
