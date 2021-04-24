Return-Path: <SRS0=xDMw=JV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9727C433ED
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:09:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9303B6124B
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9303B6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUfQVUGheVxg/0vP+n2F8HczWepViSm75CB3ALadsww=; b=gM2ZsudHqOaNAwUr153r9VWqBO
	foWOsNPMP2JI6sBibJSRllgdu3i3dWBApIXVZYDuYCrJh0/PqvFishSXlKbQX2wo2IMgweaHbHoPb
	Ie/X4N6aWTTdhczi5hFvcO8N9qE+ZTGgSr2NMr/8zPlIpUx6q52U3f1OPJaRgf5NR4pYWReFCoJw+
	4GeGoXx/IPEqTwQiE1M62+kUArMLqkLjtwjgt0vRnui/Id8nFyDD7JcA/TWp/mJoR/MBNvL7g/cEU
	sCqoeyozN04jp/+jk5AlbjJQAO5Ye/ESFwRmWCO7T/3BxaAz1O3R7177ZEe/pYtQxJ3Blq30RoWSG
	IOCMnanQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laG9Q-003hAZ-4F; Sat, 24 Apr 2021 11:08:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7B-003gzf-6n
 for linux-mtd@desiato.infradead.org; Sat, 24 Apr 2021 11:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rZ+I/irwn/OCLHsOVLfWBRlbXKmaiZIgFDgdHK7w49o=; b=YYuL3SoVNmKCB/wD+qrkp77gZA
 hSv97T16eJorwuVocPkYdcuFFfZddLKFSMv5jfaDuce+vq0ej0WqadH7AYwT3WukOC8g4hG6BLsf5
 GQfz/XBN75V0cf6Gb7m8WkqX8/bRZ8F5FED83FXb8K6bJlxiJBSngXHRWkEV3azSHNR/xWuz4llEw
 8uvFYNnJMW6M5QXA9U2OWXbLRVYEIGaq+ZXxiQqHtEVlnvs9QGcB7QZpn8ZW40MrGnu2At4AkyhMo
 vWU5s5eJKtuf6q85mudP+XYYF4o8V3ZvAg0xZsT4b3bXUoardZLQYNv5wjDzrw+M99BnG8cLjEQUQ
 khJ2RcFg==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG77-00Eyj1-O0
 for linux-mtd@lists.infradead.org; Sat, 24 Apr 2021 11:06:19 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0643E22178;
 Sat, 24 Apr 2021 13:06:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619262374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rZ+I/irwn/OCLHsOVLfWBRlbXKmaiZIgFDgdHK7w49o=;
 b=L5cygG4pEtkeFYLpTrmrNvYR3aHBmh1s1LeMsNhWANf6DBnBI4oR2YjGXrIJbWGWoXEjS+
 sZsKhOulWcjWS0gjxcnaBJCxqB5qiHQ6p3efyTkiYzdT1phHLqTPaDCchGkqjWZx3xpyIO
 xjC7LgylUEOK/dzyZHg0Jgu8kYLGZWc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/5] mtd: core: OTP nvmem provider support
Date: Sat, 24 Apr 2021 13:06:03 +0200
Message-Id: <20210424110608.15748-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_040617_950986_F26B2FCF 
X-CRM114-Status: UNSURE (   9.15  )
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

Some flashes provide one (or more) OTP regions which can be used to
store MAC addresses or serial numbers. Implement a NVMEM provider for
this storage which then can be used by a network card to fetch the
MAC adress for example.

This is an example DT node:

flash@0 {
    otp {
        compatible = "user-otp";
        #address-cells = <1>;
        #size-cells = <1>;

        serial-number@0 {
            reg = <0x0 0x8>;
        };
    };
};

Michael Walle (5):
  nvmem: core: allow specifying of_node
  dt-bindings: mtd: add YAML schema for the generic MTD bindings
  dt-bindings: mtd: add OTP bindings
  dt-bindings: mtd: spi-nor: add otp property
  mtd: core: add OTP nvmem provider support

 .../devicetree/bindings/mtd/common.txt        |  16 +-
 .../bindings/mtd/jedec,spi-nor.yaml           |   6 +
 .../devicetree/bindings/mtd/mtd.yaml          |  89 +++++++++++
 drivers/mtd/mtdcore.c                         | 148 ++++++++++++++++++
 drivers/nvmem/core.c                          |   4 +-
 include/linux/mtd/mtd.h                       |   2 +
 include/linux/nvmem-provider.h                |   2 +
 7 files changed, 251 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
