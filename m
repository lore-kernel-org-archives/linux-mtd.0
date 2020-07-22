Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676EBC433E2
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35846207DD
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 08:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WOpIGYmq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35846207DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AaPJ2KHPbrGF8cCjCe+23+RlXWOECXVXnW+9Wvv0nrY=; b=WOpIGYmqDxm4MpPsAFm5SzUnNC
	W4RimbKmYCqxjnjRCpdS4dHKZhdGDL37yoei5f4MRUlsvC9MGIpcNxRApPtSxvPPmV/DXCKyCCuwf
	DEXZetqw2xa+38LOrRdp4sXnkQCFsJEdLaQf4MhFILU8g6mcUXm9Y57Ai8kO3CLebWIIKKEFymt60
	YmpfIMtHw+co+4/0o7FQrHjddsDgsPhvqlm3AWhwtGOrOpI/vpUYz585iT0o3y2OCkeziB8qkSQ20
	7ofBZjkFkgfRd8mypotCty+/ceV03jK79UuN4makyf9aLebNt9TuFEQtioyVCjtCipjL/8NJuhitf
	JWVx1Cvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9is-0007FU-35; Wed, 22 Jul 2020 08:03:30 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9io-0007Cr-DT
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 08:03:27 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG3.macronix.com with ESMTP id 06M83Cpi002700;
 Wed, 22 Jul 2020 16:03:12 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
From: YouChing Lin <ycllin@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH 0/2] mtd: spinand: macronix: Add MX31LF1GE4BC/MX31UF1GE4BC
 support
Date: Wed, 22 Jul 2020 16:02:56 +0800
Message-Id: <1595404978-31079-1-git-send-email-ycllin@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
X-MAIL: TWHMLLG3.macronix.com 06M83Cpi002700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_040326_877289_51B15663 
X-CRM114-Status: UNSURE (   5.12  )
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
Cc: juliensu@mxic.com.tw, YouChing Lin <ycllin@mxic.com.tw>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

The Macronix MX31LF1GE4BC/MX31UF1GE4BC are 3V/1.8V, 1Gbit (128MB) serial
NAND flash devices.

Validated by read, erase, read back, write and read back
on Xilinx Zynq PicoZed FPGA board which included
Macronix SPI Host (driver/spi/spi-mxic.c).

Thanks for your time and review.
Best Regards,
YouChing


YouChing Lin (2):
  mtd: spinand: macronix: Add support for MX31LF1GE4BC
  mtd: spinand: macronix: Add support for MX31UF1GE4BC

 drivers/mtd/nand/spi/macronix.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
