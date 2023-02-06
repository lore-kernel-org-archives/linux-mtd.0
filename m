Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798CC05027
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IR5aYnykRc9pBhw46/VVQDYVSBPzhURUEVSKFGk+/3o=; b=zRGIn5SVpSg4Qx
	AWuQNXGWYWuALvFBdqjfVfk2cTOJEOwjcQflUcotWPrcn7zLHZpkI7/Klyg/SLWe/6R614SWSOCbS
	h3UEft67uKwhgCgkfy8sjQJvcBB2uYqAdcoswK4Qn5DGIhoUFRf6qHoJx+To07ZI1pXh7HG9iGEMr
	xD9sndD6dvxDC6RgWqKLXj0otdvYMHhzFmpfi4pL1bQceytQNMI2k3KdiV3JXbsyKSygtcwEQW9ej
	9nL6A7ZDWdOgkhBIebf9UnB+troI2gTj5hYUKu/YQ5j8/dj54H6C2tUDIo/+Jmcidj72GWZy9U9Ox
	s00H1RLJWytApBiPx+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAIC-00A5zO-Mv; Mon, 06 Feb 2023 22:48:56 +0000
Received: from smtp-out-01.comm2000.it ([212.97.32.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPAI8-00A5we-6X
	for linux-mtd@lists.infradead.org; Mon, 06 Feb 2023 22:48:55 +0000
Received: from francesco-nb.toradex.int (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-01.comm2000.it (Postfix) with ESMTPSA id C5C74842D8B;
	Mon,  6 Feb 2023 23:48:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1675723725;
	bh=d2Mw1ifhUasYYJOL5dXpMXCcSZG97erK/rQKkH2U1rQ=;
	h=From:To:Cc:Subject:Date;
	b=LtRf5WJGrcTjlbdKfU0fkLCo6J6S4jcEAKf0hAXUb0j+PfwnoOHNQoQH3aNvZVUAM
	 B6K0r9/toOGA58E1AhB1qiyR4fR/LiWxwFRPSsI2zZqs9N4zSOoUe0k9wcoWuIfIyS
	 ckWPBJ2j6xCYE90Z2VSqItusBRtbu838qdIT62zBOnjdb07tO0PkPk5NUy3O2drzzX
	 pmkhOdoYjX83VcURN+tWFRTZBZbX+OeQZlDkpjUPASFaxiMT5rc3bbchLB5QSMO8z0
	 5zdzRp2MEDJ1myFRxiZNhyVgXTe/VcgyMG2mb1Jn+ZP7jcP90g6aSTJcJM352B4H06
	 sl7Ff87v5rMhg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Simon Glass <sjg@chromium.org>,
	u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/3] fdt: Fix mtparts fixup
Date: Mon,  6 Feb 2023 23:48:35 +0100
Message-Id: <20230206224838.75963-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_144853_195912_93E3B6CA 
X-CRM114-Status: GOOD (  14.50  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Recently we had a boot regression on colibri-imx7 because of a cleanup change
on Linux imx7.dtsi setting nand controller node #size-cells from 1 to 0.

Because of that Linux partition parser was no longer able to properly
parse the OF partitions leading to a boot failure, the above change was
reverted in the meantime as an immediate workaround, but some improvement
is required on both Linux and U-Boot.

This change improve the U-Boot part of it, #size-cell is set to 1 when
it has an invalid value. This has the limitation to work only with devices
smaller than 4GiB. In general the suggestion from the Linux MTD maintainer would
be to not edit the DT partitions from U-Boot unless some dynamic tweaking is
required.

This series therefore convert colibri-imx6ull and colibri-imx7 to pass the
partition list from the command line instead of fixing up the DT.

Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolcini.it/
Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.toradex.com/

v2:
 - removed dead code from colibri imx7/imx6ull
 - rewrote and clarify commit messages

Francesco Dolcini (3):
  fdt: validate/fix cells count on mtdpart fixup
  colibri-imx7: specify MTD partitions on command line
  colibri-imx6ull: specify MTD partitions on command line

 .../toradex/colibri-imx6ull/colibri-imx6ull.c | 11 -----
 board/toradex/colibri_imx7/colibri_imx7.c     | 10 -----
 common/fdt_support.c                          | 45 ++++++++++++++-----
 configs/colibri-imx6ull_defconfig             |  1 -
 configs/colibri_imx7_defconfig                |  1 -
 include/configs/colibri-imx6ull.h             |  2 +-
 include/configs/colibri_imx7.h                |  2 +-
 7 files changed, 37 insertions(+), 35 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
