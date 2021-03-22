Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AEBC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:20:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768A461994
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768A461994
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=91pklmD0L+tmUDXTbs0BFrNhx/SVGbkegXARdhDp2JA=; b=j0WcUWblj4X0KaLcOBj3oYfQ4n
	/5Nn3mUArDo284HuFaK846h4ntxQB1lCuXWL0tvjTMdIsHnUmx1BfBFvOipv9HJ8emZzJvLkfPk89
	Y+p+lRZL6yQLKouNuu6llfImbcr5OOWBZE7CXS+mW0Ag5xu9MFdXymxlujEWyX4ZJEGjhHT5/Hurc
	xYamxrtvuRzIJwzQwwSg6bv5nfX+GwSEZYmSX+J6UPwqTWaCZqme0iXbGvAeHTXfrDlUo8MI856Wl
	2UexqjfO6y7I8cb7GLtbHy5e04vlgPw/8Wjf0mRxtL2Yn36c3Zn+65lL24WUJlSjAnvl5RGqrTWNg
	dTxMhAHg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOP9x-00CEjc-JC; Mon, 22 Mar 2021 18:20:13 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOP9r-00CEhS-4R
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:20:10 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3347122235;
 Mon, 22 Mar 2021 19:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616437203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=SxpId9qwMWCyRo+nBXdhG1wstwEIVslF9/SHxhhLN5s=;
 b=KWo0c2fipzhzAxOznyiMV3nndYf9T5pqY15N4oPf5BKWqv3AUM9i/+/bQ2PfJirbqak137
 gxfK2iQ8CBKDA/w81/XJ6cDmO94ifsGuZ2Ip7eEc8AzZ7qqYTE9aRL1A3jscTjRU+4WaNV
 ZNot83yCr9OMiYMJcJ0LgiQg9tW9vsQ=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 0/4] mtd: core: OTP nvmem provider support
Date: Mon, 22 Mar 2021 19:19:45 +0100
Message-Id: <20210322181949.2805-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_182007_320704_3AC542DB 
X-CRM114-Status: GOOD (  14.56  )
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

Michael Walle (4):
  nvmem: core: allow specifying of_node
  dt-bindings: mtd: add YAML schema for the generic MTD bindings
  dt-bindings: mtd: add OTP bindings
  mtd: core: add OTP nvmem provider support

 .../devicetree/bindings/mtd/common.txt        |  16 +-
 .../devicetree/bindings/mtd/mtd.yaml          | 110 +++++++++++++
 drivers/mtd/mtdcore.c                         | 149 ++++++++++++++++++
 drivers/nvmem/core.c                          |   4 +-
 include/linux/mtd/mtd.h                       |   2 +
 include/linux/nvmem-provider.h                |   2 +
 6 files changed, 267 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
