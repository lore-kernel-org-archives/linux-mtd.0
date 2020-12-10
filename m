Return-Path: <SRS0=O8Pa=FO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0A5C4361B
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 03:23:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AE292313E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Dec 2020 03:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AE292313E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASw0xo3AGFwWfpW82Mn5TCS7eYGPi+q9P75D4bR6JDQ=; b=gKcdvenusWGwWpskAOuHgKGSAl
	DBQvLu6WDjEM+G/3IQt95MJ81lkB3sBLY7fJ29HgtUHgHNr/RIVe54uKtAp+PJUvFG+PgPU04vfyR
	mRLJ2lczngamWU7kV9yJCC3H1r14dKltAaCP30egg0WIc6vMTurvxpZeYjJnAMz6GSvsfrmG/Svsx
	Hlev5+6bB/byPzkoR4Ju3vOGN4zIq1NtR3IvEO6qx1NoEJALmzjsdrm6QMWlwN/U9+9xtQMNxKKz8
	1H1ytkATlrUTTzZXbn6v9/6Q5YBLNlEpktx0+NMSJAAxPAz5QLgL/dXHuobyBhFXbxwWz5IfOtExm
	YzEhPpPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCXi-0002Jf-QK; Thu, 10 Dec 2020 03:22:58 +0000
Received: from twhmllg3.macronix.com ([211.75.127.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCXf-0002IR-OQ
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2020 03:22:57 +0000
Received: from localhost.localdomain ([172.17.195.95])
 by TWHMLLG3.macronix.com with ESMTP id 0BA3MURe011440;
 Thu, 10 Dec 2020 11:22:30 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH 0/2] mtd: spinand: add support for MX35LFxG24AD & Fix bug of
 BCH
Date: Thu, 10 Dec 2020 11:22:07 +0800
Message-Id: <1607570529-22341-1-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 0BA3MURe011440
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_222256_174093_C0464B28 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

This series adds support for MX35LF1/2/4G24AD, are 3V, 1G/2G/4Gbit serial
SLC NAND flash device (without on-die ECC).

And fix a bug of BCH, the size of calc_buf/code_buf is limited to 64 bytes.
If someone uses Flash with pagesize: 4096 (for example: MX35LF4G24AD, 
eccbyte: 104 bytes), some errors will occur during the read operation.
So we correct the size of calc_buf/code_buf to mtd->oobsize.

This series has been tested on Xilinx Zynq PicoZed FPGA board.

Thanks for your time.

YouChing Lin (2):
  mtd: nand: ecc-bch: Fix the size of calc_buf/code_buf of the BCH
  mtd: spinand: macronix: Add support for MX35LFxG24AD

 drivers/mtd/nand/ecc-sw-bch.c   |  4 ++--
 drivers/mtd/nand/spi/macronix.c | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
