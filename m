Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73D4C3ABDD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 May 2025 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YpuHOuOirZheyMke/ZCCY2SAQGlhMh8mZo4SfXvcWaI=; b=BL8gKg+WGMr197
	KquRtwHBgVwDc9qirWBMnYI3U3xk/D1AIgYhfRmJQBmx1JTXB8kXen/O507UIYGYvkZeyUVJmEIcs
	GjuEuS/rHQmrCMSA5qCRDSxjFanBOdbhjwCGyowZsTGxFmuYbwAdpGeuqIEO/wgQ8oXSmPViNqV8B
	bRsH9vhobAlrX2wBPXqevEPcPt4GccEe+txoN+EBcj9m9zhctPcHHsrYg+kMO/JDW9AaLyN2Nt2n6
	RTrs/rAaV59DpDxa85o1L5gD++ksvg3RxCGyIuVtR1jVfnfWrGTuE6EiigVHRADm7hYxrv7lNQn5p
	K6awdcCiCb1aEwSnpoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLvV-0000000Cq2Y-0OJ5;
	Tue, 20 May 2025 12:18:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLvS-0000000Cq1O-0e5V
	for linux-mtd@lists.infradead.org;
	Tue, 20 May 2025 12:18:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07AD85C495B;
	Tue, 20 May 2025 12:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE557C4CEEA;
	Tue, 20 May 2025 12:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747743508;
	bh=PRiFo9KWy8TRBO8vxhgfcI5cP/HxfY4NvAcMmV7/m3Y=;
	h=From:To:Cc:Subject:Date:From;
	b=A7PUiSRvwgYxJWbbDLrYlF+9qpGrwxiUYRbN9zcfnh8z9rJWVy7pZjWEeirAaCSqv
	 dcrSj3Of9z82304KsusGWEHA+ugnvaStOTbx7PZwMHtWJLv1HTjbYm9U/ulaJ1A+UO
	 b+yiXV4l8dvAgX8sxDJQgdkEDCqCLpXAPzRfxZHTdT82KrXi0CnwhYFWsG79jmB+j6
	 z6Bt3H4Z/EdE0yWuNb9EEJvyhIOdoGzomKFDavSoQskQ4A9KKYpXagSWhB4ve+wTQ4
	 hPGvjBpku6DycyVU4anf77ThJwyRPZixk0c28X6kAuJhVsWJLhbOvcGoI4jkR2ocES
	 Yah/EFbs1nvxw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.16
Date: Tue, 20 May 2025 14:18:26 +0200
Message-ID: <mafs0ldqrtqzx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_051830_234595_A1B038A2 
X-CRM114-Status: UNSURE (   7.52  )
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

Hi Miquel,

Here are the SPI NOR changes for v6.16.

Regards,
Pratyush Yadav

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-6.16

for you to fetch changes up to 594c8df92b946c851bb767455f32f9e762d99810:

  mtd: spi-nor: macronix: Add fixups for MX25L3255E (2025-04-08 15:04:54 +0000)

----------------------------------------------------------------
SPI NOR changes for 6.16

Notable changes:

- Cleanup some Macronix flash entries.

- Add SFDP table fixups for Macronix MX25L3255E.

----------------------------------------------------------------
Cheng Ming Lin (3):
      mtd: spi-nor: macronix: Drop the redundant flash info fields
      mtd: spi-nor: macronix: Remove duplicate flash info entries
      mtd: spi-nor: macronix: Add fixups for MX25L3255E

 drivers/mtd/spi-nor/macronix.c | 73 ++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 34 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
