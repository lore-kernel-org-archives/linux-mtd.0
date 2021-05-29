Return-Path: <SRS0=Jc64=KY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA464C4708E
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7072661205
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7072661205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eoK2DPTGqTM/n7rGa2kTSpyGk9qU+lmzi1O3nGZ+ks4=; b=P00kH5fUrK2MSD
	aELYMrdIp43VmDex0OMVcmhL7XXCUr+WYhBodxpiq7ZS5/rMXz/Xn1Six1WW9vM/xfpjQXVzvi0x6
	l7+EsPgpkah2ATU9kpu7c51nY+/HMi1EWXK+3pCTlJkvnJFRP9WgDhnpXcsh1ja/QueH5Nf4K+0zS
	5aZkoqEyEiT9pm5zf2xx7NKC2m6SJTCYqBsQ0y6Pi98jm+UDnrZL1bDsPQ6szYNzNSc/bETbqP3EK
	C8n4mxyZJWzu05CRuKwTLE1cDT7X0tMyTTL+r8zJW1xCey1/fCB3kGkfwwyWqxeiY+MuwCnud7dDb
	XoviBqQ4Bxm37e35367g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmwCC-004kyM-IG; Sat, 29 May 2021 10:27:56 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmwC9-004kx9-TY
 for linux-mtd@lists.infradead.org; Sat, 29 May 2021 10:27:55 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 4657B81DB3;
 Sat, 29 May 2021 12:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622284071;
 bh=0K5fa1pym+uYrWwUk5lMIEsPkX2k9QBt+qQSNfxfW38=;
 h=From:To:Cc:Subject:Date:From;
 b=RrW18t4VvQTy0JjXYACnplPZS2rx/sQTks26E/GTcVX/K1fArWqL8b9gdk7Va44Bw
 uOZafJCqsqUhAre4ehB1GA87ZFnfVNb522v3N8bvsZC24LeEI4d41IPnVnuTnR3c7u
 qbQ+SOyYzlKCf18IEMrYjY6etfB3T047BVAWMGLtA6YV2ZdWbyKy1CpmQ4bKiQxVG/
 +GDA38eSVgDWX+TmCjYXJYEJ8o99jvcyO2XokvYg2fAGQETHtjgnxa95C5/69b3RnZ
 DjKsQ6NnwBqnrzV7+kDJVCu0g5zhVQpNIyWKWcjY56c+n1yvqfA57O1synD8Ck41pX
 L5uGaGes8LZBQ==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 91283182BA2;
 Sat, 29 May 2021 12:27:46 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 6B0D31A8BC4; Sat, 29 May 2021 12:27:46 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mtd: devices: add support for microchip 48l640 EERAM
Date: Sat, 29 May 2021 12:27:42 +0200
Message-Id: <20210529102744.1251220-1-hs@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_032754_127254_C9C45487 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
 drivers/mtd/devices/mchp48l640.c              | 374 ++++++++++++++++++
 4 files changed, 426 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
 create mode 100644 drivers/mtd/devices/mchp48l640.c

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
