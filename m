Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5741C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 19:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E5020836
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 19:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DpwWIAMB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="BHEbvjoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90E5020836
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2zrlzc0i2/DeYKil7sB69acFbctuh26WKDjTWLLuH5o=; b=DpwWIAMBJyujX4
	q3cOomLxLyySVypRg+H5p19be7EGvyUPMqjyp54XuD6NM8Vx3EsE75rUdMyOM2+/9XaKUJbZFDdQE
	b4vvYUiOBoZBqs4isNa1lMLB1QzKXnzqLgRymzv8sAen0Nh+tEsn6a37f0MKWYUZi9GLH70Nzdbqx
	1gMyh14iIbKIHtkGoUZjfD55bwAnVF62l5scUkJ4vf+YtwyCVrkHJ3kDyFxE59BnXuv4pK1LsVsDH
	V4ZAR0QGW86A8yIuTsrb0HxVNLh22T9MGPTFTyGNxyKk5CQlO2BDK6M5cFWbzQ3H8+tvaiGDvzxkd
	h0FJ955uvl9Oqlr/cBIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if7eL-0003xN-Uo; Wed, 11 Dec 2019 19:27:53 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if7eJ-0003vw-33
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 19:27:52 +0000
Received: by mail-pg1-x549.google.com with SMTP id x189so13239053pgd.9
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 11:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=KFmQdAdZh8/B/wh1g4c+i5ALsP3kFx6ncDBf/RCXchM=;
 b=BHEbvjoHWqZ7Nv64QnvdKu9CN/PsQfHYxZZQz1Q10KydrF+m2IHzcnK5CrZKkXxx4b
 2YMOz+hd3HzxKnkbWedNtKO00vtCc2M3iMLn8LoGBw3qqR4py04EUe+8nahF6KzgWO/b
 vx1yhOmUkc/tCU9SZaP784yXIevMeiNK8sTRWzHqze2L7IbBFAHJC4itwqTKgrxGtnjj
 YeOhn/aOPE4f5oqAfM8DBWqmaHF/yW9Y7gmPjj650DnJ/PPd/Wng33I4+uBaDrD616/p
 ZRtT+uj/OzuuvRgRQ2d0fDYsZ2aGXgohBEYAYMIdTYa6aIe9iYQrbTB4SE+EyIfKIqoL
 sEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=KFmQdAdZh8/B/wh1g4c+i5ALsP3kFx6ncDBf/RCXchM=;
 b=FRBtkxRf7dBFYuZAF5rSkMBakYQtdfKyjA+RmauNUsHJP04jfgzJf0ArkKG1ycIeBq
 QsVUglBE+Q0WeGb5M+5RWEeqIYTdrR02tWSq1MWQOIjgmwERqYJGeCDNAbUSqzem31Bb
 COfkjoYO763LNr2BA77rdUEhiKyiA7Q7dxgGznZ9niAqAnUi9NFO13ghVlst2OtHwysQ
 PVoFXsIRUG5Yfhm18NXz7s480N7Vn/uV/YU4fgXWmKhSI9uGaUK+NknxC4R29TsZ6rwY
 m3dEoo3bOi9BHtb7fjLWsO3V4I4OEZkZBa75qP/ur43VnoHiNNYIP1Z/KAByMzICY+a1
 CyRA==
X-Gm-Message-State: APjAAAWlc1D/va5K8VSsJf9Y+vSLjw+J+9/8yxnbGHM9a25efZNs4igy
 dgU0/ET5I/1JX0jiQ2g/ywEJW4cjfMgt1nsiA9pxzg==
X-Google-Smtp-Source: APXvYqycyWWqOB+1R/dWpmqnOlhdQUifRBeUd7lNrtDIGomABUXQd06geDk/YSSdxQdhxW6XmQloW5ZXtQ6ql5pkVCc82w==
X-Received: by 2002:a63:f60:: with SMTP id 32mr5943939pgp.206.1576092468990;
 Wed, 11 Dec 2019 11:27:48 -0800 (PST)
Date: Wed, 11 Dec 2019 11:27:35 -0800
Message-Id: <20191211192742.95699-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH v1 0/7] uml: add unspecified HAS_IOMEM dependencies
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 "David S. Miller" <davem@davemloft.net>, Alistar Popple <alistair@popple.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Antoine Tenart <antoine.tenart@bootlin.com>, 
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, Corentin Labbe <clabbe@baylibre.com>, 
 Eddie James <eajames@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Jeremy Kerr <jk@ozlabs.org>, 
 Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, 
 Michal Simek <michal.simek@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Moses Christopher <moseschristopherb@gmail.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_112751_163078_04E1BFE9 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: devel@driverdev.osuosl.org, linux-aspeed@lists.ozlabs.org,
 linux-um@lists.infradead.org, Brendan Higgins <brendanhiggins@google.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 davidgow@google.com, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-fsi@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

# TL;DR

This patchset adds a missing HAS_IOMEM dependency to several drivers in
an attempt to get allyesconfig closer to working for ARCH=um.

# What am I trying to do?

This patchset is part of my attempt to get `make ARCH=um allyesconfig`
to produce a config that will build *and* boot to init, so that I can
use it as a mechanism to run tests[1].

This patchset is attempting to deal with

CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_MTD_NAND_CADENCE=y
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_CRYPTO_DEV_SAFEXCEL=y
CONFIG_XIL_AXIS_FIFO=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_XILINX_AXI_EMAC=y

which are selected by `make ARCH=um allyesconfig`, but prevent it from
building.

# How far away are we from an allyesconfig UML kernel?

I have identified 33 Kconfigs that are selected by allyesconfig, but
will either not build on UML, or prevent it from booting. They are:

CONFIG_STATIC_LINK=y
CONFIG_UML_NET_PCAP=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_IP_VS=y
CONFIG_BRIDGE_EBT_BROUTE=y
CONFIG_BRIDGE_EBT_T_FILTER=y
CONFIG_BRIDGE_EBT_T_NAT=y
CONFIG_MTD_NAND_CADENCE=y
CONFIG_MTD_NAND_NANDSIM=y
CONFIG_BLK_DEV_NULL_BLK=y
CONFIG_BLK_DEV_RAM=y
CONFIG_SCSI_DEBUG=y
CONFIG_NET_VENDOR_XILINX=y
CONFIG_NULL_TTY=y
CONFIG_PTP_1588_CLOCK=y
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_DMABUF_SELFTESTS=y
CONFIG_COMEDI=y
CONFIG_XIL_AXIS_FIFO=y
CONFIG_EXFAT_FS=y
CONFIG_STM_DUMMY=y
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_JFS_FS=y
CONFIG_UBIFS_FS=y
CONFIG_CRAMFS=y
CONFIG_CRYPTO_DEV_SAFEXCEL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_KCOV=y
CONFIG_LKDTM=y
CONFIG_REED_SOLOMON_TEST=y
CONFIG_TEST_RHASHTABLE=y
CONFIG_TEST_MEMINIT=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y

CONFIG_STATIC_LINK=y and CONFIG_UML_NET_PCAP=y already have fixes on
their way.

I also have a patchset that just got accepted to fix
CONFIG_EXFAT_FS=y[2].

So with this patchset and these other three fixes mentioned here, we
will be about a third of the way there. There is only one more broken
config that prevents UML from building, CONFIG_LKDTM=y. After this there
will still be 22 broken configs which will prevent the UML allyesconfig
kernel from reaching the end of init; nevertheless, this is a good
milestone where, once reached, we can stop some of this bleeding by
adding a build test.

# Why won't allyesconfig break again after this series of fixes?

As I mentioned above, I am using UML for testing the kernel, and I am
currently working on getting my tests to run on KernelCI. As part of our
testing procedure for KernelCI, we are planning on building a UML kernel
using allyesconfig and running our tests on it. Thus, we will find out
very quickly once someone breaks allyesconfig again once we get this all
working.

Brendan Higgins (7):
  pinctrl: equilibrium: add unspecified HAS_IOMEM dependency
  mtd: rawnand: add unspecified HAS_IOMEM dependency
  net: axienet: add unspecified HAS_IOMEM dependency
  crypto: inside-secure: add unspecified HAS_IOMEM dependency
  crypto: amlogic: add unspecified HAS_IOMEM dependency
  staging: axis-fifo: add unspecified HAS_IOMEM dependency
  fsi: aspeed: add unspecified HAS_IOMEM dependency

 drivers/crypto/Kconfig              | 2 +-
 drivers/crypto/amlogic/Kconfig      | 1 +
 drivers/fsi/Kconfig                 | 1 +
 drivers/mtd/nand/raw/Kconfig        | 2 +-
 drivers/net/ethernet/xilinx/Kconfig | 1 +
 drivers/pinctrl/Kconfig             | 1 +
 drivers/staging/axis-fifo/Kconfig   | 2 +-
 7 files changed, 7 insertions(+), 3 deletions(-)

[1] https://bugzilla.kernel.org/show_bug.cgi?id=205223
[2] https://patchwork.kernel.org/patch/11273771/

-- 
2.24.0.525.g8f36a354ae-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
