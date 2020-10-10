Return-Path: <SRS0=cnOS=DR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3ADC433E7
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D97207FB
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2020 05:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j3yujUYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66D97207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UriTYcPW6ZuEbsDlSxMjOEW77jsBmZLmjm7MoZ69zto=; b=j3yujUYZBWWZ95B538+/k6uYqc
	GxNPvTRXjIRP0JjRXR1RC2bPebS/NoTMk5Qr2eX7pe9HGD89oledmxNZz2cVXhvdix0NZA31tOSpO
	yQ5luFvurpX0yfBWUtLzhu/2hNNpnDbdK7urC5BdgUVUOFoO8RFAKEvPBjuhLWuCUFtJHmfBPOHEC
	Qd/seDoccQNoY9bxosI4Xr9nNZnjYlvkfD3vlcE6zPNK3ynQAmwkxZLQZcxkyj9JGFo8JLc3zKnIM
	ZqFvHXFd67YGSCBokbfBerGO1nLV4tjxSGaDI4lthBMYFUBa5Y169DWGb3YNYMST06JaVpEAvgLon
	++f+Oxfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR7UL-0003dA-CT; Sat, 10 Oct 2020 05:32:13 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR7UI-0003c1-9f
 for linux-mtd@lists.infradead.org; Sat, 10 Oct 2020 05:32:11 +0000
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 09 Oct 2020 22:32:07 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 09 Oct 2020 22:32:06 -0700
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
 by ironmsg02-blr.qualcomm.com with ESMTP; 10 Oct 2020 11:01:44 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
 id B9926217BA; Sat, 10 Oct 2020 11:01:42 +0530 (IST)
From: Md Sadre Alam <mdalam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] mtd: rawnand: qcom: Add support for QSPI nand
Date: Sat, 10 Oct 2020 11:01:37 +0530
Message-Id: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_013210_468599_417EDD87 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: mdalam@codeaurora.org, sricharan@codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QPIC 2.0 supports Serial NAND support in addition to all features and
commands in QPIC 1.0 for parallel NAND. Parallel and Serial NAND cannot
operate simultaneously. QSPI nand devices will connect to QPIC IO_MACRO
block of QPIC controller. There is a separate IO_MACRO clock for IO_MACRO
block. Default IO_MACRO block divide the input clock by 4. so if IO_MACRO
input clock is 320MHz then on bus it will be 80MHz, so QSPI nand device
should also support this frequency.

QPIC provides 4 data pins to QSPI nand. In standard SPI mode (x1 mode) data
transfer will occur on only 2 pins one pin for Serial data in and one for
serial data out. In QUAD SPI mode (x4 mode) data transfer will occur at all
the four data lines. QPIC controller supports command for x1 mode and x4 mode.

Md Sadre Alam (5):
  dt-bindings: qcom_nandc: IPQ5018 QPIC NAND documentation
  mtd: rawnand: qcom: Add initial support for qspi nand
  mtd: rawnand: qcom: Read QPIC version
  mtd: rawnand: qcom: Enable support for erase,read & write for serial
    nand.
  mtd: rawnand: qcom: Add support for serial training.

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   3 +
 drivers/mtd/nand/raw/nand_ids.c                    |  13 +
 drivers/mtd/nand/raw/qcom_nandc.c                  | 502 ++++++++++++++++++++-
 3 files changed, 494 insertions(+), 24 deletions(-)

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
