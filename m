Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5401C83F26
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c+Ez7GDU6nLsxOzJZKp33O5Imkfu6Na0ti4jVhVDAi0=; b=fS2t5WY0rvEBl4
	F8MSUfuO564tXeKRoAM0dECfQKeEydZuJHShav/D2vHrmoJx4d1oLNxeyJce0Gr5G9pZW+ExiNm+e
	CpeQ8r0VgLrXaT92zKfNohUT9fM9rUhy4tsgVX3v1/CoejdcpprW9E/k0JjJMwAMmV5jrmGrEZl+S
	mrkEXxsC6BQZ85DsF6QWByogORUR39DDJzY6HoQVU+sKdqP/ZjTJUlxYj/NNejH0bjydQ7NurrNhE
	HlB865KVVtVuSvPbCCgzigf6bZwgTooGKwLcChNeWj3QiLdw7jD/IIIDnmSCTzvnNI8nf1ILxkzSU
	n60EtQJzbAx3+vigivHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOX-00000007bly-1CdR;
	Thu, 24 Jul 2025 13:54:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueuQ9-00000007MTn-0uoK
	for linux-mtd@lists.infradead.org;
	Thu, 24 Jul 2025 11:47:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6F2CFA541A4;
	Thu, 24 Jul 2025 11:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B1CC4CEED;
	Thu, 24 Jul 2025 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753357652;
	bh=eogJJz8siWeyCmzGfyIIhq9J9YzQO2EY6qDVFuLzIJE=;
	h=From:To:Cc:Subject:Date:From;
	b=c186cKx4PZ0ILh2xQYwdf0QOgqAAZ9XIhdVFScVjcfuAX3vJe8O3tvri1hjXN+7Ka
	 V4/qeRBTteFv1UAEPuoBfdMG504gxaT+27HWs1lqaVTYVG3SLvbK4F2dyHXP1dbg1Q
	 fjc3FImpba1kXjHjn5bY1Ovd5MMAcS5D9RpJgo9L5CfpoKU+s03k2FOsUj/x3TPAm/
	 IauDQl1b/7LDjpwySovHxzjyL7nvc2espHu0uL3jnpWK4LC1nWvFKDnFBQQpSE8LGf
	 oX3gD3OdB8tpO0eNds7f8UJvE7NgC8ri3wDb5HpDEGYgS8nmgYNCQ3WhCeYHzHaYLy
	 jpIzcWBnHJNjA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.17
Date: Thu, 24 Jul 2025 13:47:29 +0200
Message-ID: <mafs0v7nhstda.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_044733_319768_535C5E9C 
X-CRM114-Status: UNSURE (   7.09  )
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

Here are the SPI NOR changes for v6.17.

Regards,
Pratyush Yadav

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-6.17

for you to fetch changes up to 2e3a7476ec3989e77270b9481e76e137824b17c0:

  mtd: spi-nor: Fix spi_nor_try_unlock_all() (2025-07-03 17:12:17 +0200)

----------------------------------------------------------------
SPI NOR changes for 6.17

Notable changes:

- Fix exiting 4-byte addressing on Infineon SEMPER flashes. These
  flashes do not support the standard EX4B opcode (E9h), and use a
  vendor-specific opcode (B8h) instead.

- Fix unlocking of flashes that are write-protected at power-on. This
  was caused by using an uninitialized mtd_info in
  spi_nor_try_unlock_all().

----------------------------------------------------------------
Christophe JAILLET (1):
      mtd: spi-nor: Constify struct spi_nor_fixups

Frank Li (1):
      dt-bindings: mtd: jedec,spi-nor: Add atmel,at26* compatible string

Michael Walle (1):
      mtd: spi-nor: Fix spi_nor_try_unlock_all()

Takahiro Kuwano (1):
      mtd: spi-nor: spansion: Fixup params->set_4byte_addr_mode for SEMPER

 .../devicetree/bindings/mtd/jedec,spi-nor.yaml     |  2 +-
 drivers/mtd/spi-nor/micron-st.c                    |  8 ++---
 drivers/mtd/spi-nor/spansion.c                     | 35 ++++++++++++++++++++--
 drivers/mtd/spi-nor/swp.c                          | 19 +++++-------
 4 files changed, 46 insertions(+), 18 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
