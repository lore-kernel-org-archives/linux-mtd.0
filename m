Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D66C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:56:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD21761103
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD21761103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iBw2cgT0A57J4SuMAf2LHrRxaRYhSpoqcEONpQ1N98g=; b=gSyYfB7tpFizkGf4cvvERcTeH6
	kbbsSKYn7520/zpzyL9zXfYceKadH7BPixbrBpEKNxpGihkEA9w1O7WHdFC0y7dPv70WnCXhLdwga
	j7/1dFQWl5VUsTPkhRxucJ7KTjL/JLf8auAZIv77JCEmtK5ZigsEbsu0PNM/AUhaykBi70G1D6QrM
	8dpv2w4tRAZhYk2UfVj0Y8Apn8rsY0LfojY2FJ+A9+URXsqF04MCq0d6mpwAsXUFV1ErtmfV0RyX6
	W1p5dx2r8IfPr1VOzAwXCck9LC4a0evLcQSBLBgGQzq5SuUBFfxP/RSRK1FrkKUB6oPEuFIMGpZWd
	hcj2v1XA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN3x-001zf9-Py; Fri, 16 Apr 2021 11:55:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyk-001yeq-Ei
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oB/Ab68gOO29EsC3+FTgow2Hyng5ZQUfAUylQq2Zats=; b=n43zCyw7bHyHDntOEC++hdoCKx
 8X2zTNi4gPfNICFKGEUoKV2sUKaiCXF2I6nuzSg9P86HbEksf1H+JErnyRDwjki13AXgnk1MHwZWO
 a+adSzsYfsXU9/hBTQD5e8bFEMNftOGcaN/YwgndzaVGOeROlXNwp3pds94ZMsKRDec+FM1YdQvjT
 G9OvW7r6BgLYYU5NGAcRwpWhaso5iuKrlLyGcJetlAMPb/qg0wQeYMLNvPwoPYO3wrYntB933HlJz
 s5OPVxFkYmLB4CMJ2tVTJzfXVfMJV1t4vQhBMVaqZLn2xEGhl/gqgbsd5TyTP7lbGcF/Z9q7MONUC
 ZgLAHNag==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyg-009KfT-GF
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:41 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 388732224A;
 Fri, 16 Apr 2021 13:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oB/Ab68gOO29EsC3+FTgow2Hyng5ZQUfAUylQq2Zats=;
 b=BmPdDcxQB1Eapv8iuzLFQUGQJMmkEWLN+iC1WMgLX9XgvYdC/LdpG1VQHmIoaQCbC19VmY
 NWGIbrbdzKftuXcqOst+rDVo+Mp3du3fr/lvnI1M54iPJFGVMbFvugME+g8iNlFrRHp6uG
 JPT8OMRC8O5Ao/yeO+TrCDZN0X5cwjs=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 0/5] mtd: core: OTP nvmem provider support
Date: Fri, 16 Apr 2021 13:49:23 +0200
Message-Id: <20210416114928.27758-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044938_750191_D28A53B3 
X-CRM114-Status: GOOD (  13.56  )
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

The goal is to fetch a (base) MAC address from the OTP region of a SPI NOR
flash.

This is the first part, where I try to add the nvmem provider support to
the MTD core.

I'm not sure about the device tree bindings. Consider the following two
variants:

(1)
    flash@0 {
        ..

        otp {
            compatible = "mtd-user-otp";
            #address-cells = <1>;
            #size-cells = <1>;

            serial-number@0 {
                reg = <0x0 0x8>;
            };
        };
    };

(2)
    flash@0 {
        ..

        otp {
            compatible = "mtd-user-otp";
            #address-cells = <1>;
            #size-cells = <1>;

			some-useful-name {
                compatible = "nvmem-cells";

                serial-number@0 {
                    reg = <0x0 0x8>;
                };
			};
        };
    };

Both bindings use a subnode "opt[-N]". We cannot have the nvmem cells as
children to the flash node because of the legacy partition binding.

(1) seems to be the form which is used almost everywhere in the kernel.
That is, the nvmem cells are just children of the parent node.

(2) seem to be more natural, because there might also be other properties
inside the otp subnode and might be more future-proof.

At the moment this patch implements (1).

Michael Walle (5):
  nvmem: core: allow specifying of_node
  dt-bindings: mtd: add YAML schema for the generic MTD bindings
  dt-bindings: mtd: add OTP bindings
  dt-bindings: mtd: spi-nor: add otp property
  mtd: core: add OTP nvmem provider support

 .../devicetree/bindings/mtd/common.txt        |  16 +-
 .../bindings/mtd/jedec,spi-nor.yaml           |   6 +
 .../devicetree/bindings/mtd/mtd.yaml          |  89 +++++++++++
 drivers/mtd/mtdcore.c                         | 149 ++++++++++++++++++
 drivers/nvmem/core.c                          |   4 +-
 include/linux/mtd/mtd.h                       |   2 +
 include/linux/nvmem-provider.h                |   2 +
 7 files changed, 252 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
