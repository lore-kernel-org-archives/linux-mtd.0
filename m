Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C24FC47080
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328C661186
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328C661186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ar38L4btk6niw84Yh/zAYqqwdRlmV7CS4h0uTdfj1Us=; b=nxJvzzjwPZ6wdf
	9J+SH4iUky1VRhFgmMsNBbtsIY9pe/knViw9g6gvavDYvIMMzX1AKvr4j4d05bkiboteQNcWkNNSv
	LgisTNQ4mBul9+r1johD/0/ji2tgDSqj3m48aJTfvPbbz21p5ojGh4nUy4WLyMuaIhGkVZqGP/KLD
	sKT0uEUh362nMh+eLTyKpNgHqnISXGkkNrS9C8Vcwf45v8ITu+T+HYS79gM9MRlnpecLWj72cfC+3
	18UX4k8yp1PgL7QTkWo4mK4rnu5Y3rBe45U4cHQ0Fl+ooDNzI4xKuDSgqCJ+CkhXZ5wWCglVDh78w
	EJNfcDJk9Ux3Q078RjTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnw8N-00Ea8n-4O; Tue, 01 Jun 2021 04:36:07 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnw8G-00Ea7D-3V
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 04:36:02 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B90C982E9B;
 Tue,  1 Jun 2021 06:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622522153;
 bh=kfecTcZ55k+F78gu75sr1/SnMlo5gwjDU5bO0qrbXRo=;
 h=From:To:Cc:Subject:Date:From;
 b=DhXVroVpP7Lrs5C6ee+sfFkfLpZXoE58uNccqzaHcvHByTd66iqnzAtAdhnO1UJpz
 p9vTDGcCeHebjBNxDEEGJlWIN6UHKxVvbCt68artTtqtBkdsn6myRXTAQlCbL8plg4
 oQiPknJmWhEkkv5hetNz2ZnHhTUrYn5ChHvpXPFQk/OR2ETi7PveinGsWrA1empXBT
 o+bTLvIJdAbUZ9vJP+zIo8ZYwS2EebKR0+Xm6hXeydG5CAgwJqXy7e6tojPEM+ml37
 4+FRkG+tbcVuQv+v2GZtDI7TiABEqxImNzw+WkOIw5WdAHHEFKEXW2gk9HeXveN0Gg
 V9vslnNkYl6Ig==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 3221C184CCD;
 Tue,  1 Jun 2021 06:35:48 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 0BF1C1A8BB4; Tue,  1 Jun 2021 06:35:48 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] mtd: devices: add support for microchip 48l640 EERAM
Date: Tue,  1 Jun 2021 06:35:44 +0200
Message-Id: <20210601043546.1345704-1-hs@denx.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_213600_318576_8514304A 
X-CRM114-Status: GOOD (  11.93  )
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
