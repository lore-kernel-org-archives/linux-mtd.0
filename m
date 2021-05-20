Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66AEC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:00:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E7C3610A8
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E7C3610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+tOUDOMOSHvmcE69rGz9f9INRZ5TiE7cBMWQzHkmAmg=; b=k33VQJd/YIZunl+OEuypUch4Pr
	bLExNBKErWzcxj1cXvu4rYV2fn+jVauEdImULqhGJzA+tSN9s42O1csq8wAVdlmyZlONaDuGmNeA9
	aBF5ZZaPx9jdTR9GcQihHIC7fCGuIBS91clfxmyQw4JZGB7HGOp66jebgxm8Jjj7KjfZHRFyQ8HdP
	78NrpoLwN1EIw/+Wk+dcAHfnkmF4ve9nGIKT+YKKbQvvTKGXWvMOWlJ1uJvJEBn4vrdCXlznRwLbO
	nmMrB6YPHb2H/F2IUT/tXT7UOrdagEs2ZR1Tv6poCI6lKFHRhjjLi4q9RpFED+x9E4AN0ymKKcXzy
	9k/M0Pog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljl4l-001oyD-2F; Thu, 20 May 2021 15:59:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljl4i-001oxg-HW
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 15:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=J9MP0abbU4xuS7oSHZeZ7pjk1CJg8587NSni94cE2RY=; b=wMiuYVzo4aq5ge4mzE59iSn4PC
 o1dIMU4v2yZTz5jm7EJGHSE9KWFJiRVGMm02o19kdAnE8UW9mEb2x5RZ/1ayThNWPLT1FpbagDgZp
 AONmedYCfMtotPPP7+ORhlNpu+aSsU9+9UDIWi13R5IKQyoz8dm+vJ8A4ZFhl6HYpPYJAqyjuPZHV
 m+9NJZEn42zUMqAi5xHmTRIj7YtxCNkEG7isFW9X4IEODh+kGOEJiJgP7F655WP1eWButYj5qLoWU
 D6xf0mna/WyPwTUr55rd5c5BhQYyCmHeZZbUUnJNQTCw/5hfHdsxEAh9fXw67QlRE/t13fxl8gxd9
 lBO2UiTA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljl4f-00GUM9-QW
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 15:59:03 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5E9E62224F;
 Thu, 20 May 2021 17:58:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621526339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=J9MP0abbU4xuS7oSHZeZ7pjk1CJg8587NSni94cE2RY=;
 b=iLhiC+WFXWrECKXxcInNpNS64N7ga1QtkCyu5vGiLHzNS4hyp52OQ8tWDUHDproHzxYomD
 XaJUMI4X84fLEgzZ2Hwm/3SbrRVUTRC0TZi6//aziq6IqrlLeSn6j2oPwDV8T/aCDjeZs4
 mwIjSQPVKbT4HYEWNY8OnoEgdShcsTo=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 0/3] mtd: spi-nor: otp: 4 byte mode fix and erase support
Date: Thu, 20 May 2021 17:58:51 +0200
Message-Id: <20210520155854.16547-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_085902_035728_2344BFDF 
X-CRM114-Status: GOOD (  10.64  )
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

This series is the follow up on the single patch
mtd: spi-nor: implement OTP erase for Winbond and similar flashes

Pratyush Yadav discovered a likely problem with bigger flashes, the address
to access the security registers is either 3 or 4 byte (at least for
winbond flashes).

Changes since v2:
 - fix 3/4 byte mode access
 - use spi_nor_erase_sector() by swapping the nor->erase_opcode
 - use more consistent wording regarding the security registers

Changes since v1:
- fixed kernel doc

There is also a patch for mtd-utils to add a small tool to issue
the erase:
https://lore.kernel.org/linux-mtd/20210510201319.25975-1-michael@walle.cc/

Michael Walle (3):
  mtd: spi-nor: otp: fix access to security registers in 4 byte mode
  mtd: spi-nor: otp: use more consistent wording
  mtd: spi-nor: otp: implement erase for Winbond and similar flashes

 drivers/mtd/spi-nor/core.c    |  6 +--
 drivers/mtd/spi-nor/core.h    |  6 +++
 drivers/mtd/spi-nor/otp.c     | 79 +++++++++++++++++++++++++++++------
 drivers/mtd/spi-nor/winbond.c |  1 +
 4 files changed, 77 insertions(+), 15 deletions(-)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
