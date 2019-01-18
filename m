Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDBAC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0EC2054F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PjQdwdJE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0EC2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ATPIbSRgyi+6KgQ4DVopCmKMVwPRvXnXhR5qQVUA0Bo=; b=PjQdwdJERMVjn4hJoQP3oRDZyk
	UThUAH6yHsiemhVTEH4ZKkyw3c6lLAcdvjMlTdleHjwanNxkETV8pEsZZwugyH4Iwr7U8F0u9Ymhk
	bmE+rveKE316RkcrO0dUSfvlILIJUo3jEjpNiJUAHMK++DmJQ4SK84mMJl0RuRSdGVF7OCYAu395V
	ia59KX2zhml8AAGJj89uTJbkDxDcDXSx386WOCbWLVp16iK16rL0+Kk5pBi4XAg23S9aC6mKCSzA2
	K95/yw4LubdKadDcNzgHmOkc0qhoowZMeCpld3p2KP2KHmPYFPpE8AUCh+kFfP6UUJ2bM51NQQZTu
	1ezVbONw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkVIP-0004Kp-8w; Fri, 18 Jan 2019 14:38:57 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkVIM-0004J0-3G
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 14:38:56 +0000
Received: from ramsan ([84.194.111.163]) by andre.telenet-ops.be with bizsmtp
 id Rqen1z00H3XaVaC01qencT; Fri, 18 Jan 2019 15:38:49 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkVIF-0007kw-4O; Fri, 18 Jan 2019 15:38:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1gkUm1-0007bf-Eo; Fri, 18 Jan 2019 15:05:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/2] eeprom: at25: Use spi_message_init_with_transfers()
 instead of open coding
Date: Fri, 18 Jan 2019 15:05:25 +0100
Message-Id: <20190118140525.29189-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190118140525.29189-1-geert+renesas@glider.be>
References: <20190118140525.29189-1-geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_063854_277063_8B8384E2 
X-CRM114-Status: UNSURE (   8.11  )
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

Reduce code duplication in at25_ee_read() by using the
spi_message_init_with_transfers() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
  - Add Acked-by.
---
 drivers/misc/eeprom/at25.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 2d8e5388e574710d..18a093e14517ab45 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -103,16 +103,15 @@ static int at25_ee_read(void *priv, unsigned int offset,
 		*cp++ = offset >> 0;
 	}
 
-	spi_message_init(&m);
 	memset(t, 0, sizeof(t));
 
 	t[0].tx_buf = command;
 	t[0].len = at25->addrlen + 1;
-	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
 	t[1].len = count;
-	spi_message_add_tail(&t[1], &m);
+
+	spi_message_init_with_transfers(&m, t, ARRAY_SIZE(t));
 
 	mutex_lock(&at25->lock);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
