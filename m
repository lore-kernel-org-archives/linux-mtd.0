Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFF0C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 10 May 2022 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XW1frQ0cVaygWqPRhNp04pMTMG3ZH5ybJ9PiAXcQfqM=; b=BCi6HTbYW6Y3iD
	9h5mKS+rNhYuLaP5nO0DBJIt9AYTbhEzKoZ0Y2wEY+w70KUbHFFMeLa6cGYl18/6XsJI/rmYFzhLe
	LaG8ReS8riuGb5F1wIdjnVJzgrXzzvken2UQ8pO0KUP/cJxjTTNvI+xB5F751HiHFf8XGLJ0/VZYX
	0ncJkCTEJn0gTqBhVylzAyHmJ+Jc/IRjmHHxqApkOrOu+nedwNtLA2cQYVzO2Cr4x/0lHCJnDaajt
	IeAiZSi2rR1gE9ZGtdo4/KXwQH5pKlLLtK1TR6scruRbZvNC97P0qEjvB29wRaDXroKYcZnu7I4ZH
	biElioHWiOL/rto2P9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noQRs-002O3t-7u; Tue, 10 May 2022 14:02:48 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noQRo-002O1Q-35
 for linux-mtd@lists.infradead.org; Tue, 10 May 2022 14:02:45 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6CE0222238;
 Tue, 10 May 2022 16:02:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652191357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MAMluAWKintqA1HsqZ0+rRZBUqhaKw3r86HTFWznY5U=;
 b=B+iUHM3+LJwbo8pibqOVNP85Fc6l9auZlcceatGQKKTPcUdKaJ3qaOGzX4YBq6JPmLuljJ
 uPdR01FK54X07X3OAwJ0u4tpzNjcstxhisR2sgY0uA8gqxzhBMzjf/MXwFUEhvPhV0FxaW
 aXIrBzEaVGNFvu6gDFyfj4ouv3SiouQ=
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 0/2] introduce SNOR_ID3()
Date: Tue, 10 May 2022 16:02:30 +0200
Message-Id: <20220510140232.3519184-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_070244_693508_B55A5B19 
X-CRM114-Status: GOOD (  10.17  )
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

For support which rely solely on the SFDP data, all we need to know is its
JEDEC ID. All further information should be fetched from SFDP. For this,
introduce a SNOR_ID3() macro which should be used for all new flashes with
SFDP.

The dropped information are page size, number of sectors and sector size.
The number of sectors (together with sector size) is only used to calculate
the total flash size. In case of SFDP, this is read from there. The sector
size is also used to select a proper erase opcode. We can just keep that
one zero and the selection algorithm will select the same erase opcode;
that is the opcode for the largest erase size (which is btw rather odd..).
The page size is also taken from SFDP. There is one exception: older SFDP
tables. These doesn't contain this data. So if there will be flashes with
that, we should assume some sane value.

Shaik, could you please re-test your w25q512nwm support with this patch. I
read through the SFDP data and it should behave exactly the same as before.

Michael Walle (2):
  mtd: spi-nor: introduce SNOR_ID3()
  mtd: spi-nor: winbond: use SNOR_ID3() for w25q512nwm

 drivers/mtd/spi-nor/core.c    | 7 +++++--
 drivers/mtd/spi-nor/core.h    | 9 +++++++++
 drivers/mtd/spi-nor/winbond.c | 3 +--
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
