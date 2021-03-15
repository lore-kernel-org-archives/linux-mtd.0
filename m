Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA6CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D0161494
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 17:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D0161494
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RGqYYLBRKZnRiE/g+rLiITU57CmZ09QVEd6zdnXCCVs=; b=oM4eV94tT04rphMxdYgbWN1RQo
	9fcpdrQT7v7QeWkboTBvyTDnPiTIdgjnaEzL8cJO8N7+U8dtjgS0HXwgF8bLXpYJfEof2ICANmsVb
	SHTkcQP9eaE+8uhQJ5uT2tG/piWGuLMq+MWb8kVu4er/HltUHxtGrgB7+7voZB2ZUMZOGE42brnXs
	a4kDse06zNvuGKixCmuTmID1yy4PunAz5YkDjkjx6hCfV7UxEIF5jy37L6Ws59QCzk+/MCKBpu8AU
	1VI1GKmmskj3kjeNas6dhC3pi4anI4w4st4fyBFE7Q0XAoFuoTbQoYMIUp2UbPs7dga4kXvtg30wM
	C7EPl43A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLqgo-00GSV3-Co; Mon, 15 Mar 2021 17:07:34 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLqgd-00GSSn-LZ
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 17:07:25 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DzjX96m28zQjnD;
 Mon, 15 Mar 2021 18:07:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1615828040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ogxWmH1gOXUGHnevD+bVLt2j55kjnvf9v9fVDOED+V8=;
 b=xbZzDcTl5b8JTbdonAtXl/Y9O+NR6+9ujUzSuj1UjombskW7ExrCWc4aQakQvHCNVM4BtK
 faDI9231qS8IIYQqtVZbPZ7qbU5UfDLXOv9NioTk0lztaXM7LgI04m1I7SXv3wJji9sj7w
 rqHwmSduApI1CjzDI4czAciKMsJf9pl3go00gYvrwbrhiMe2HgE16CkDY1rFYeV14Pmd6Z
 4HLeaHB7wMywF/TRLspblc6460iMKHm1asQvIJnwOJxROVFbIklgLTkaLuaMKrDso1N35B
 XDixmdZfev6lPShAcPojRi9b1P3SRqY1VPZBCR0lWnfLF3DcurnnFHgBRlprKw==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id d6LftOmvvsCm; Mon, 15 Mar 2021 18:07:18 +0100 (CET)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 0/2] mtd: parsers: trx: Add support for Buffalo WSR-2533DHP2
Date: Mon, 15 Mar 2021 18:07:09 +0100
Message-Id: <20210315170711.567358-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: *****
X-Rspamd-Score: 6.39 / 15.00 / 15.00
X-Rspamd-Queue-Id: B7CE617CE
X-Rspamd-UID: c2e563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_170723_862156_9FDA660A 
X-CRM114-Status: UNSURE (   6.72  )
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

The Buffalo WSR-2533DHP2 uses a Mediatek MT7622 SoC, with the TRX 
partition format with a special magic. Buffalo probably ported the code 
from their older Broadcom based devices.

Hauke Mehrtens (2):
  mtd: parsers: trx: Allow to specify trx-magic in DT
  mtd: parsers: trx: Remove dependency to BRCM architectures

 .../bindings/mtd/partitions/brcm,trx.txt      |  5 +++++
 drivers/mtd/parsers/Kconfig                   |  2 +-
 drivers/mtd/parsers/parser_trx.c              | 21 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
