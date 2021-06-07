Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A753CC4743D
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 03:41:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7304760C3E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 03:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7304760C3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1iY/3JWYNwgz5rUGqHPmaFzxXdo5YSZy4uZmHYrfqtE=; b=MelcQA/tMpSGxk
	yk8M5NmHB4dQfqwu4FJSz09xerD2xx034DJJo3CeREzpxnL6pesrcMfrI/U/r5ohBeMGypYtxKLC2
	Y6nizsNs/05aqay4HQCWPhMqf6dJam9S67MarCtvl9tsQHlE2voMsCPxs2oZ3Eeb+nMYuJD2qLuLb
	h15PNoHzARBZPt6Lkzfr+AU8Ur9mvH+jN68X4c5np8aMevR7aEFP0rJukCjoTsgrZDj2HUjhABsJD
	apIySslQcTmOJcver491R2EKFGsB0V/MKO1OVvrP+CkYIxTSJXlZQRP8FrltXwdQ21HSoijNfa2ZU
	7DM3zDVSO6Y9ciXMZYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq66q-001OO2-Oi; Mon, 07 Jun 2021 03:39:28 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq66l-001ON5-BS
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 03:39:27 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0DCE582CCA;
 Mon,  7 Jun 2021 05:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623037159;
 bh=eEUdIRxkR7iHc1ypAa8pccRVV0eD/Zq2w05n+e3iZ+g=;
 h=From:To:Cc:Subject:Date:From;
 b=W+qz1A/PcWvbW09hG0PT71NJAU2bsR3TjWgJ/dneuauYoKZ6+aZ7JFJum5KsQQ4tR
 QwbNCDyHvCrYwcanLxzJNaEDUHsCQsCXBqZoo/+ISK0yqO6psb8U20koG18pt9r0oA
 zY53heJD5GnLEf4XqClJJQhUqDSLiPQs4UkJN1304m91Cmt/1xJQAFnlqBxuRwXvPl
 JfNkTP5atFSvYpchp27bGVrEHFCdQ9zA0YqYjGvKm3qILL/QtbMZke7j6b95qe/inc
 CgWjbnoXHuvA6ca5z2/fa6Qu6oc+HoTSwC3osAnY6XCGIlCTeiqlW+mDy3fPcnW7vh
 ZMg//oveUL+fA==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id AF5B01826B5;
 Mon,  7 Jun 2021 05:39:12 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 850991A8BB0; Mon,  7 Jun 2021 05:39:12 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] mtd: devices: add support for microchip 48l640 EERAM
Date: Mon,  7 Jun 2021 05:39:07 +0200
Message-Id: <20210607033909.1424605-1-hs@denx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_203923_572161_48E052E6 
X-CRM114-Status: GOOD (  12.19  )
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


add support for microchip 48l640 eeram connected via
SPI. Patch 1 introduces devicetree documentation
and patch 2 the driver.

Any comments to driver?

Changes in v4:
- work in comments from Rob:
  - change title to
    Microchip 48l640 (and similar) serial EERAM bindings
  - rename spi-eeram to eeram
- Add Reviewed-by tag from Rob

Changes in v3:
Add Fabio to cc
drop dev_dbg() in mchp48l640_read() as not really needed to
fix warning which kernel test robot found for
config: arc-allyesconfig (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
add Reported-by: kernel test robot <lkp@intel.com>
add Fabio to cc

Changes in v2:
as Rob helped, fix warnings from running command
'make DT_CHECKER_FLAGS=-m dt_binding_check'
- fix build warnings
- add Fabios Tested-by

Heiko Schocher (2):
  mtd: devices: add devicetree documentation for microchip 48l640
  mtd: devices: add support for microchip 48l640 EERAM

 .../bindings/mtd/microchip,mchp48l640.yaml    |  45 +++
 drivers/mtd/devices/Kconfig                   |   6 +
 drivers/mtd/devices/Makefile                  |   1 +
 drivers/mtd/devices/mchp48l640.c              | 373 ++++++++++++++++++
 4 files changed, 425 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
 create mode 100644 drivers/mtd/devices/mchp48l640.c

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
