Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,WEIRD_QUOTING autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4B2C43463
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:50:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C03920795
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 21:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lrba3+Vt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uz8mi+li"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C03920795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VCZ60CwRSLRDdq8xkOSOIoWs1Pe5S0QTuMcTPNEo9us=; b=Lrba3+VtziDTK71mGzvpKinvJC
	+NzuFs7UX+iq6TNo0TACdIIEf1nbuRUWUqhzRBY+DhAodr82drz5K+RceSCasdazIsWe4wBIHDSIW
	T6YCWN8Nuk4W1FbQvN3J1DD5OwgnzsdUDFaID8fqPxRe7pIdhYPqjh1dPaLUp6B6gYwJySQdRknEu
	8EwrXfZlAwQbZzYWpxeDT5wSsz9hngrJk8/Xj9srae8TeOecpQYH1mROMQerDF1+ghSY1svKOj9KW
	1Tp7mkbBjqQN9RJwMTF53RVcz3+zwNuxWTRExo5uM0tJaeLoPFB8P6nzNDEfZ01t+QwGXxYg7lFOE
	I51GIFog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJkkC-00015k-0K; Sat, 19 Sep 2020 21:50:08 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJkk9-00014c-V8
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 21:50:06 +0000
Received: by mail-qv1-xf41.google.com with SMTP id j10so5147319qvk.11
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 14:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hl1o3ICFuXiy7eA4eDYoCmO/Au2P6m1F0ozkchaXgs=;
 b=Uz8mi+lijtNLOM5wb/5Yk7OxXSqXl5fTEBY7PXi4nuO0+QLCl7qsbdZhtRlzWbi4QG
 tdbMEYnSfTvGVeIxXS8ZJP83K41jhJgNNfVxfPKrm4+bLPNbecb3L/gfyUut5QP9iV8c
 vGom8C4REFcJzu7P2gdHgUTNgPVQZSJTpWH3WcaGnvL5NG3WOodcUQviG0FcAcFsuBtS
 xrtbP5uCqQc4vpI+1hgoHKwFDX7uKgXC0ld7xBvLhQP5WpEj1N6nW5urAaTvm8sCrFg1
 NeF9HEzYLFN8oO76DOF7VpSPsjarccv36/5l8suDdjtqOR+qXUTKq2yu4veidiBzVN9W
 38Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hl1o3ICFuXiy7eA4eDYoCmO/Au2P6m1F0ozkchaXgs=;
 b=Rm6Rz3MkOzdoAxNL3y02/i2p26CIoUjngNuc4fLfFa5MtRev0gdDflPledh/Zjtxmm
 JD9793E8SaoU8VWi5Pa+b1midIYMlxcd2Q79JsOE8DQbrnjmhArK2NuIWJhLiFaWg3l5
 tI04yYqENF3voisabnZ9PuGt7w5KGVs3EL8rGJLIi6vtvYAVihMtxlKMpLsu98iP5Ovv
 qg6HwMLEB/iqyippOZ4PHk8qMRUQZNHI3F/K2NLofngZvaVZXrc6t7HEFRGc8PZI/Ol8
 yakHMYrqVUyfR2zKQ5AxilXwMvOkcifaLSNdbSJA8QHhqMgHruzZoWeWUdAVhIDSi3pk
 oo2g==
X-Gm-Message-State: AOAM532a9IMEmPUaapw0f/qArSTlmTZQyB+OvzLnLI2vZFj2iF0EteWk
 +K1jfJwjt2cFVsFBw/o2iS4=
X-Google-Smtp-Source: ABdhPJzdzJ1kGDYMRHif8O/iBPP6dvdWrG9E2e77pdxXFPpqjWA/ABGx99WwnWT1CMkGNUt/ozlxnQ==
X-Received: by 2002:a0c:c543:: with SMTP id y3mr23404364qvi.47.1600552202469; 
 Sat, 19 Sep 2020 14:50:02 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id y30sm5617173qth.7.2020.09.19.14.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 14:50:01 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] Actually implement nvmem support for mtd
Date: Sat, 19 Sep 2020 23:49:34 +0200
Message-Id: <20200919214941.8038-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_175006_037294_114EF33A 
X-CRM114-Status: GOOD (  20.11  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd support for the nvmem api has been stalled from 2018 with a patch
half pushed hoping that a scheme is found for the mtd name later. This
pathset try to address this and add a very needed feature for the
mac-address.

My solution to the already discussed problem here [1] is to keep it simple.
A mtd subpartition can be set as a nvmem-provider with a specific tag and
each direct subnode is treat by the nvmem api as a nvmem-cell and gets
correctly registred. The mtd driver will treat a direct subnode of the
subpartition as a legacy subpartition of the subpartition using the
'fixed-partition' parser. To fix this every nvmem-cell has to have the
'nvmem-cell' tag and the fixed-partition parser will skip these node if 
this tag is detected. Simple as that. The subpartition with the tag 
'nvmem-provider' will then be set by the config to not skip the of
registration in the config and the nvmem-cells are correctly registred
and can be used to set mac-address of the devices on the system.

The last 2 patch try to address a problem in the embedded devices (mostly
routers) that have the mac-address saved in a dedicated partition and is
a ""master"" mac-address. Each device increment or decrement the extracted
mac-address based on the device number. The increment function is
implemented in the of_net function to get the mac-address that every net
driver should allready use if they don't have a trusty mac-address source.
(One example of this implementation are many ath10k device that gets the
mac-address from the art mtd partition assigned to the network driver and
increments it 1 for the wifi 2.4ghz and 2 for the wifi 5ghz).

I really hope my mtd nvmem implementation doesn't conflicts with others
and can be used, since this would remove many patch used to get mac-address
and other nvmem data.

[1] https://lore.kernel.org/patchwork/patch/765435/

Ansuel Smith (4):
  mtd: Add nvmem support for mtd nvmem-providers
  dt-bindings: mtd: partition: Document use of nvmem-provider
  of_net: add mac-address-increment support
  dt-bindings: net: Document use of mac-address-increment

 .../devicetree/bindings/mtd/partition.txt     | 59 +++++++++++++++++++
 .../bindings/net/ethernet-controller.yaml     | 19 ++++++
 drivers/mtd/mtdcore.c                         |  2 +-
 drivers/mtd/parsers/ofpart.c                  |  8 +++
 drivers/of/of_net.c                           | 53 +++++++++++++----
 5 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
