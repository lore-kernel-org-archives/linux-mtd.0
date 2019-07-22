Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55296C76188
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A8221955
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 06:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auNIfMR9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vtmz0dcc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29A8221955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oTuJiNEKnEZiBZaVXCHtlWKHQBPk1fABLu96hI6ElkA=; b=auNIfMR9BWIJEP
	wrTip2gfrcqzwB83s0m5J4knhjqsgl9GODHzIp6P0akSJ+AvjEYX12DCr2oTX7faxE0n3xBnZCWak
	C7ZSPetFLq0XHnR9JCkYSmpNjc+TBKj/xPmqxwIQtLa8Qxn97g1BNaupU8ulYPME5L85VTCR4lQVa
	4LLfsD8YJut1U02jksx0DoYza+3otz8QFZfl4Ug/+DuXhMG4uNUNBoNOZUJnLZsoMgWgw5iBMftaf
	Xqck8gdOwbKUT0aRJMrRUPbooy4YkFNhhdovwbd4Ze2nM5H1gi8F+xD9S/shsjYrRagQ4ZfJ1i6KG
	9zZ5AofPwMyuonhrujKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpRMC-0008Fi-Ty; Mon, 22 Jul 2019 05:59:33 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpRJl-00062a-DE
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 05:57:04 +0000
Received: by mail-ed1-x542.google.com with SMTP id i11so39484366edq.0
 for <linux-mtd@lists.infradead.org>; Sun, 21 Jul 2019 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id;
 bh=YjD84EknKXQ6SgafyIu2355vAswN4w676+lk0Qqv20w=;
 b=Vtmz0dccwTEmYrWEaLHmXaA0xZa5NsQc4ICmHUu07h/zUD3nZEeoulj9M+xVcbGQ66
 c/oyQ/sxDjBhXhb+b2ArlMLkCsMVmIr0BrA6MgR8q0YHmc0ZAbDUrS1ba+iayyPKjvCf
 8nJOq6ckjDdO8BMlrK0jtlqrAqakxImk/9yRA2LYrr3g8AH+uREfF4Cg68x0AwlEa/IZ
 HlUrtbRx3DyBgnoSfeUKSqk1NjWrghk2nLoxshTyPpA0MsThfds+hCg0wInCpi4ypagq
 sG6lgk2n/WQlEqjDg6+ww+tHdWtT+cYyytoPJFsex3hCq2yN2NnYxWZf+wZPrNrRSm/Z
 Cx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=YjD84EknKXQ6SgafyIu2355vAswN4w676+lk0Qqv20w=;
 b=Qen8fZQJqUNV06qxvkVw0Jf1f7iZCZtp5mpOajbjzD2lbvCsRD99pxpZXZyCUiHCUg
 JIlOzfp0biyHbkKlvfu3l0MN3jMvJnM64QJe7XmeUY1UXag0V8c52SCLti7kavY0/gy+
 6yxAnlpPSLHMXPtmGXNhh4cNQOYeXzKaiKrLQ/XJTh9r7C6JQxp9OUkh9VM5OMnZC7EL
 qq5cr0kYUg9ixoYMfOn+Et1/VTBTwD+7NknZ3A+pUOQLWDueIX0fHcmUvNYX8TdDUZsx
 2UwqGqQLkTG1k2cW7SyN7mYinrKIdxPyiCmPH2ILIDb3Uy1DZzyhOG9IivPr1v1E4PV7
 Z9MA==
X-Gm-Message-State: APjAAAUvORiVBxy/BMesAPTg6gWJpAoc461MMmLdwObFvDso1GhJdiYU
 hNZMsW98pFigqnIVTw1BYTU=
X-Google-Smtp-Source: APXvYqwp4Gr3RVhVqlHGhWlojDSuIhtbZE9YVWD5TdSXLWfNomULLmP6NU19lsjMYRlqunLmSuQarA==
X-Received: by 2002:a50:e718:: with SMTP id a24mr57886735edn.91.1563775019154; 
 Sun, 21 Jul 2019 22:56:59 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id a6sm10351725eds.19.2019.07.21.22.56.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 22:56:58 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jeff Kletsky <git-commits@allycomm.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: [PATCH 0/8] Introduce generic ONFI support
Date: Mon, 22 Jul 2019 07:56:13 +0200
Message-Id: <20190722055621.23526-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190721_225701_508103_AE4DD154 
X-CRM114-Status: UNSURE (   9.77  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Current support to ONFI parameter page is only for raw NAND, this patch
series turn ONFI support into generic. So that, other NAND devices like
SPI NAND can use this.

The series has five parts.
1. Prepare for tunrning ONFI into generic
2. Turn ONFI into generic
3. Turn SPI NAND core to use parameter page
4. Redesign Micron SPI NAND driver implementation
5. Support for new Micron SPI NAND devices

Changes in V4
-------------
* Turn ONFI support into generic.
  Re-designed as per the Boris's comment.
  Common functions are moved to nand/onfi.c.
  Function to prase ONFI table is defined in nand/onfi.c
* Enable parameter page support in SPI NAND core.
  Re-designed as per changes in ONFI generic support.
  Function defined to read parameter page.
  Function defined to detect parameter page.

Changes in V3
-------------

* Split the patches as per suggestion
* Addressed the comments
* Some fixes which I missed in last version

Shivamurthy Shastri (8):
  mtd: nand: move ONFI related functions to onfi.h
  mtd: nand: move support functions for ONFI to nand/onfi.c
  mtd: nand: create ONFI table parsing instance
  mtd: spinand: enabled parameter page support
  mtd: spinand: micron: prepare for generalizing driver
  mtd: spinand: micron: Turn driver implementation generic
  mtd: spinand: micron: Fix read failure in Micron M70A flashes
  mtd: spinand: micron: Enable micron flashes with multi-die

 drivers/mtd/nand/Makefile        |   2 +-
 drivers/mtd/nand/onfi.c          | 121 +++++++++++++++++++++++++++
 drivers/mtd/nand/raw/internals.h |   1 -
 drivers/mtd/nand/raw/nand_base.c |  18 ----
 drivers/mtd/nand/raw/nand_onfi.c |  65 +--------------
 drivers/mtd/nand/spi/core.c      | 136 ++++++++++++++++++++++++++++++-
 drivers/mtd/nand/spi/micron.c    | 107 +++++++++++++++++-------
 include/linux/mtd/onfi.h         |  11 +++
 include/linux/mtd/spinand.h      |   7 ++
 9 files changed, 356 insertions(+), 112 deletions(-)
 create mode 100644 drivers/mtd/nand/onfi.c

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
