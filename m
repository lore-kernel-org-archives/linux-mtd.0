Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7176BCAC5A5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OInCOOEHdwXtiyD0zFK+IpfGlDX7/byosQ7mtuSFo30=; b=BMBnzq0qYvdubb
	ErqoOyXeVRpDsQ4dj7rxSBnB1dS43W+8kkP8q4FQQcnNn50jO71cLJ/d+JU8Uk+JchGXUSnPjdXLw
	hs8/+dXhieAkF7GbSnxqph7ktchBBFGIadhg8VxM+3aq8S/U2dvFHOfRVm6G6MncdjFzO/HJj53JH
	XfwkZoSMm9kN0aHivE24cpTS8uUFcZrtqxkmVcPAIZTDRd2NzKBRjTiseAaK/N/tOafmphw7pgUux
	Q7iObf9vvRioqigxAfZhAuUyuKM36cosdTrtm9IY/8gt65E0Enwj9RZLl6SOoAIS+B0hDQhtUuQH5
	Zy8HpPDLHtEUt5Wt/+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RbE-00000001N6t-3OvM;
	Wed, 24 Sep 2025 15:40:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RbB-00000001N5m-3NsI
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 15:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F986440FB;
	Wed, 24 Sep 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642A3C4CEE7;
	Wed, 24 Sep 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758728404;
	bh=LUl4Qceco3k/Q01Cps0+JdmoQ0zMLY4yYDqRrdnXaD4=;
	h=From:To:Cc:Subject:Date:From;
	b=TcFWIZUXPhiPqKVmEJhw66eeyJkST0712+EWBuFJ63X+z4zAoHmG8CAo+WcRlEizG
	 PXVn+a3nj/H6awJPxm1vajLGls1ZoEoUqniIh6pBbEtBexgZDhXrCw1iJ7FjC6WOcN
	 zMTFPknqKzDoh8pcX2aDArEc3m0LLAZBHHOIJly+CRDEpvKGur18xkFVc3KZil9J1r
	 nBfb9hS234hg2+bPZBfiGy7bptZW8ICRUwlDgS7nILGeH+ecqueHJeJMMxcRlgZ/km
	 k9OH8uQtNnMa1NqKIX+oQmfPqfXH3rM7hco00LsJYj0RCqlqvaMc7wHEwpJtprco83
	 Rn4T434YIKLUQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: spi-nor: changes for v6.18
Date: Wed, 24 Sep 2025 17:40:02 +0200
Message-ID: <mafs0ecrvdfl9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_084005_886442_2450F4A4 
X-CRM114-Status: UNSURE (   7.63  )
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

Here are the SPI NOR changes for v6.18.

Regards,
Pratyush Yadav

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-6.18

for you to fetch changes up to 17926cd770ec837ed27d9856cf07f2da8dda4131:

  mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode (2025-09-01 16:11:55 +0200)

----------------------------------------------------------------
SPI NOR changes for 6.18

Notable changes:

- Some flashes can't perform reads or writes with start or end being an
  odd number in Octal DTR mode. File systems like UBIFS can request such
  reads or writes, causing the transaction to error out. Pad the read or
  write transactions with extra bytes to avoid this problem.

----------------------------------------------------------------
Pratyush Yadav (2):
      mtd: spi-nor: core: avoid odd length/address reads on 8D-8D-8D mode
      mtd: spi-nor: core: avoid odd length/address writes in 8D-8D-8D mode

 drivers/mtd/spi-nor/core.c | 145 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
