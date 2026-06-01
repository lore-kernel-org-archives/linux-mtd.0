Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54379CD5BD1
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 12:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JPipHqAGyNqswoCZXks0aefj+7B79wcpbe8GzP4x+rw=; b=D8Rv88auPNGmcA
	xWmSpUg9c53Av5ajfBqre34/qCX+XpS01yaFPPTleyZCLTj/+Bp0McieGfqpZ8dr8TR6WdBfJhp5O
	J/1ZWN3pOWUIeMPMc8rP461pdVDM5o1/SQpYx5j1ciCxnJDOSgY0HUYuOfwLIUltkc8BAr/85w0jl
	8hw5FTMcgVNkATTOAWRx6B0I+YV5+hp5P8SHUGGlp7gDS6SXrIl84ZnzzeFWhlxFlnTjcAFnEAKKE
	COgQjUMQhycZPAcuT3XZJJh2Fs0D5NxRWvKcqh286KdZf+LvId5eyD7/69WSUQPXseVnrbWU+EvL9
	QMPirS/c5KSfUJ8IlFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AK-0000000BAml-3rIf;
	Mon, 01 Jun 2026 12:54:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2AH-0000000BAma-3AVz
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 12:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E813F60018;
	Mon,  1 Jun 2026 12:54:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07141F00893;
	Mon,  1 Jun 2026 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318484;
	bh=DJWqFwNOB/m3tEt5oHYuoWheZSYkh5nf9lNnEZ96oCs=;
	h=From:To:Cc:Subject:Date;
	b=MWP0jfBfgaXrzSdveeqzf3yirr0PpFrfORvFgy79Kad9Qq1cOFc7lsghh9YChcIzZ
	 Tnh7vptO54b62cXlimsc/xyqhYfhMNBzhn8V1NhxpkHNL5RyGomgeMW6lxK+zbcccW
	 52ZdXbY0CDAKgOPgRVJGUaK+4jyGg+ObeWLFuUAIfXtVUs++Z9Dycy9rxrpLpWe4If
	 Adh5qhmz0QC6VYffs1z1gzGyYcRTDfin8d/lFj+BppHt3qdcpZF6c2QY/LVP6OV2t8
	 e/VBsokHda9p+a/IeaOIHXkRZs7VAq4Cs8L/Rd0asgSTYmr3htgv4pATZgpA+VuJJm
	 bWFVGfhAHNB4A==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter initialization
Date: Mon,  1 Jun 2026 14:52:42 +0200
Message-ID: <20260601125438.3481722-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
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

Try to simplify the flash initialization and get rid of the legacy
handling. As default, all the flags of the in-kernel database are
taken and amended with the SFDP data.

This might have the consequence that all the flashes now get a
RDSFPD opcode which might be an unknown opcode. But that was already
the case for any flashes which were unknown to the linux kernel. So
far, there was not a single complaint.

See patch 3 for more information. If feedback is positive, this is
intended to be applied to the spi-nor tree after the next merge
window, so it will sit around in -next for quite some time and get
some testing.

That being said, I've just did a quick test on my boards. Please
give it a test on your boards.

Michael Walle (3):
  mtd: spi-nor: spansion: s25fl256s0: remove SKIP_SFDP flag
  mtd: spi-nor: don't clear the SNOR_F_4B_OPCODES flag on failure
  mtd: spi-nor: rework flash parameter initialization

 drivers/mtd/spi-nor/core.c     | 67 +++++++++++-----------------------
 drivers/mtd/spi-nor/core.h     |  1 -
 drivers/mtd/spi-nor/spansion.c |  2 +-
 3 files changed, 23 insertions(+), 47 deletions(-)

-- 
2.47.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
