Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E318DC6379F
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7245020857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 04:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3kTa2tze"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7245020857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yJw9yYO62FT12ePdf0J9VmUPXZaitCg206XTZ+nfu8o=; b=3kTa2tzenZF6SvzU7W8bfunSat
	YqYbHCisLE2VR0oCAUe7kkyfzqR0C9vcIwhDFnSykjG2EEXN3LdbWJH1ZmV5fcaWHW5OlhMG9gXzM
	kAP37eJvMEe8qTC2QR/POTPygfVc7+9DHXAgaY3SqH/JvVCvn9IIpOXnJ+CoXBy0fNMlSTuu6fnGE
	vcB+0SUKEZWrxxINWj1X/nOr93d06nG0ywScgpOk293j1jm5tt6yFAfA5Ekm/L50jbQF2J0lN+/FB
	hCUXqRUprw1PQSaB/C1Khqsdyu7TtK2PbTdlPuiFWla9V96i4WrfztiF24k2wGbzSWQOgyZUi1x6G
	CNo76t6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khPn8-0004mF-RW; Tue, 24 Nov 2020 04:18:58 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khPn5-0004jq-Et
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 04:18:56 +0000
IronPort-SDR: 4FVe0ELeKVeJSy6dCquVwmWT2pyWFf3QDkTlaFnKbLG3J/yKA/4FKnPCv2/K8CgDcVHp5rYKDm
 utCcXao/zfkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9814"; a="159655712"
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="159655712"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:18:49 -0800
IronPort-SDR: fmeGY2cnWG1z8RzqGKX08iy6zPdPpEkv/HnJTzeTE8KcdaWA22IeAEiJpi67Bf5fPjog1NkGjw
 P5kN+gd9gT4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,365,1599548400"; d="scan'208";a="343029822"
Received: from sgsxdev004.isng.phoenix.local (HELO localhost) ([10.226.81.179])
 by orsmga002.jf.intel.com with ESMTP; 23 Nov 2020 20:18:46 -0800
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: broonie@kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v9 0/5] spi: cadence-quadspi: Add QSPI controller support for
 Intel LGM SoC
Date: Tue, 24 Nov 2020 12:18:35 +0800
Message-Id: <20201124041840.31066-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_231855_644721_7320FAE3 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: cheol.yong.kim@intel.com, vigneshr@ti.com, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org, qi-ming.wu@intel.com, p.yadav@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add QSPI controller support for Intel LGM SoC. 

Patches to move move bindings over to
"Documentation/devicetree/bindings/spi/" directory and also added compatible
Support for Intel platform.

dt-bindings: spi: cadence-qspi: Add support for Intel lgm-qspi
(earlier patch mail thread and Ack-by)
link: "https://lore.kernel.org/lkml/5d6d1b85.1c69fb81.96938.0315@mx.google.com/"

Reference:
        https://lkml.org/lkml/2020/6/1/50
---
v9:
  - Vignesh review comments address and update
  - Retain the patchv4 move the binding documentation from mtd to spi
    directory.
  - Add intel's compatible string over the legacy documentation
  - Remove unused variable, CQSPI_SUPPORTS_MULTI_CHIPSELECT macro and check  
  - YAML convertion patch alone dropped
v8:
  - As Mark suggested to add the dt-bindings documentation patches
    end of the series , so dropped.
v7:
  - Rob's review comments address and fixed dt-schema warning
  - Pratyush review comments address and update
  - DAC bit reset to 0 and 1 (enable/disable)
  - tested QSI-NOR flash mx25l12805d on LGM soc, it's working after disable DAC
  - Linus suggested to use 'num-cs' prperty instead of 'num-chipselect'
v6:
  - Rob's review comments update
  - add compatible string in properly aligned
  - remove cadence-qspi extra comaptible string in example
v5:
  - Rob's review comments update
  - const with single compatible string kept
v4:
  - Rob's review comments update
  - remove '|' no formatting to preserve
  - child node attributes follows under 'properties' under '@[0-9a-f]+$'.
v3:
  - Pratyush review comments update
  - CQSPI_SUPPORTS_MULTI_CHIPSELECT macro used instead of cqspi->use_direct_mode
  - disable DAC support placed in end of controller_init
v2:
  - Rob's review comments update for dt-bindings
  - add 'oneOf' for compatible selection
  - drop un-neccessary descriptions
  - add the cdns,is-decoded-cs and cdns,rclk-en properties as schema
  - remove 'allOf' in not required place
  - add AdditionalProperties false
  - add minItems/maxItems for qspi reset attributes

resend-v1:
  - As per Mark's suggestion , reorder the patch series 1-3 driver
    support patches, series 4-6 dt-bindings patches.
v1:
  - initial version

Ramuthevar Vadivel Murugan (5):
  spi: cadence-quadspi: Add QSPI support for Intel LGM SoC
  spi: cadence-quadspi: Disable the DAC for Intel LGM SoC
  spi: cadence-quadspi: Add multi-chipselect support for Intel LGM SoC
  spi: Move cadence-quadspi.txt to Documentation/devicetree/bindings/spi
  dt-bindings: spi: cadence-qspi: Add support for Intel lgm-qspi

 .../bindings/{mtd => spi}/cadence-quadspi.txt      |  1 +
 drivers/spi/Kconfig                                |  2 +-
 drivers/spi/spi-cadence-quadspi.c                  | 24 ++++++++++++++++++----
 3 files changed, 22 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/{mtd => spi}/cadence-quadspi.txt (97%)

-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
