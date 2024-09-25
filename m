Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3950C369A9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xlgDWhHhCjqzO8khyaRXb3FZWKAuFbxTztQgveJIf98=; b=D+k09Hqmi+NqfO
	BVhYwr+7PoWP92y8tBz46XPC7y5LgS0VoITbGqOuxwfmvFy+8dCg1f4V1wzfOZdiQ54tNptF8TXjE
	AuG2nsc9FI79xMQftv9BsHVN/uLARITP5/4/Q7esOOfSEN4ELTNyIG1zkPPTg6Dq74CW4g/P8Bu5Q
	X8Ygtetlvkt8rCDCuz5YS7Ik3KzpaOYqSkCER3XzaOMCE7scLyXejt9mdLKYDdccg6J6bgNBbCrkO
	Y2V4x+626pX15Y35qVLxk5Eaw+vVScN4tqSq5cfblCM9BkleSi+7pvUbieUqSkwwqRFRodQQNm1gV
	umq/i5WFxgpc8x44gqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMoe-00000004Oqw-3bb0;
	Wed, 25 Sep 2024 07:52:04 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMmC-00000004OEE-05Lw
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 07:49:34 +0000
Received: from localhost.localdomain (ip-77-25-16-238.web.vodafone.de [77.25.16.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4XD8511kCrzMQYm;
	Wed, 25 Sep 2024 07:49:25 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Esben Haabendal <esben@geanix.com>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH 0/2] mtd: spi-nor: macronix: reading SFDP by all Macronix chips
Date: Wed, 25 Sep 2024 09:49:01 +0200
Message-Id: <20240925074903.1983601-1-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_004932_085102_37215E4C 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add reading SFDP to all Macronix chips.
All chips in the Macronix competabilites table
have a replacement chip that support SFDP.
Macronix stop producing any chip without SFDP 15 years ago.
The benefit of reading SFDP is by supporting
fater op-codes for newer chips.

This patch do not add an all flashes support.
This patch extend the already support of SFDP to all Macronix chips.
The new chips that reuse JEDEC IDs and chips that
are absend from the Macronix competabilites table.
The patch just remove the restriction!

Erez Geva (2):
  mtd: spi-nor: core: add manufacturer flags
  mtd: spi-nor: macronix: add manufacturer flags

 drivers/mtd/spi-nor/core.c     | 9 +++++----
 drivers/mtd/spi-nor/core.h     | 4 ++++
 drivers/mtd/spi-nor/macronix.c | 1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
