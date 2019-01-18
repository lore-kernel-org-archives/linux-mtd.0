Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E0DC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9563B2054F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxG2YnYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9563B2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GwPX2n/q4MoyX7F7W7iOWLgUAKm3Cz+9NqHKZA5hQhk=; b=VxG
	2YnYpM48PBl1YAXHcJWzdPY220ri07Syuqiy3eazHwXKFN6uFThjSBnFwA/2IX5fFbtePY1nwf4Ky
	lawOwLI4nl9XWyvD5va/TfWZUFuT6zK/jntFbsx+HJeJJsSO8jAtmQMvlBLCDsuSp44O1/+l5N9EK
	r+6HeMUEp0dax2Tyd3IDrWzLm27pu0kubSjUguZhAfYa2clvOrZ0+XZ1MNC5H9Fnu3sSU3xUSm4I8
	kWVwrjwhuaPrqytIGxOt1KV7nOYrAWCfcqrUJYTtwcFiNpNI84AfFynZif1eD8ujxCSTHP3vf2w+4
	rzYg0ztRk5p6Ke7tz+9OBbzLJDzjwDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkVIj-0004i4-O5; Fri, 18 Jan 2019 14:39:17 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkVIN-0004JE-5h
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 14:38:57 +0000
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id Rqen1z00F3XaVaC01qentf; Fri, 18 Jan 2019 15:38:47 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkVIF-0007kw-6y; Fri, 18 Jan 2019 15:38:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkUlz-0007bY-2x; Fri, 18 Jan 2019 15:05:27 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
Date: Fri, 18 Jan 2019 15:05:23 +0100
Message-Id: <20190118140525.29189-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_063855_363612_B59153F0 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-spi@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

	Hi all,

This patch series contains two improvements for the AT25 SPI EEPROM
driver, related to SPI transfers.

Changes compared to v1:
  - Merge "off" and "offset" into a single variable instead of just
    killing the cast, as suggested by Arnd,
  - Add Acked-by,
  - Dropped "[PATCH 3/3] eeprom: at25: Split writes in two SPI transfers
    to optimize DMA", as this is better implemented in the SPI
    controller driver (cfr. e.g. "[v2 PATCH 2/2] spi: sh-msiof: Use DMA
    if possible",
    https://lore.kernel.org/linux-renesas-soc/1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp/)

Tested on a Renesas Ebisu development board with R-Car E3 using MSIOF
and a 25LC040 EEPROM.

Thanks!

Geert Uytterhoeven (2):
  eeprom: at25: Merge "off" and "offset" in at25_ee_write()
  eeprom: at25: Use spi_message_init_with_transfers() instead of open
    coding

 drivers/misc/eeprom/at25.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
