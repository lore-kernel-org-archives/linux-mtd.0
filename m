Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AA9C433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A817D610C7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A817D610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zq8mM8l3e7DRut3Fez2Z5YxYR3jqk75JEZMqPDrOLxg=; b=eS1+KG1fjqCGpk54VUgapRoiu+
	s5yQpbZ6bszdW4xus5Viry6qnVncZ71PzEEY2zMlGF6WgIlBc0b2oRRxu+TNrSeSM9w1/zayT13HH
	s/xIoa+v7KrwmnY4C4hQws2Y1gZLCs7Pe4UfcdbMGGirueLF5+2sMp/DxtUFTDJYOWc3ZqTWmChy0
	2nLPlFOaQIYc7yDf3Vjro1jvHjr+IrDH9z6BaOfkivDfF99a8ZR6hdAQUbvE8mUE12X7/8hGz4Dnx
	R0KSLzUiAOqwpGEADcgC3I5AErpWqfOwDkTy4W+wsTQ7RXYAHGP0rYTsCYxCoy3JJGhbn8iVHaPme
	dytNmzJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYFFW-008eH4-P1; Sun, 18 Apr 2021 21:46:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFU-008eGx-So
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 21:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5NsPJb1vjRZMn+tgY1l6FOnMzOiGWDRA2sDyZX+K6CA=; b=XfcBoMoVCAPS3VS1RxKUxJUsPK
 q15SjHPHmDd47ujuMAAZRxCEc4k2VmgRmqJa9BcZ4a01Culi671wLhrZ+LOkjyumHSUF5k939v6Kk
 kzy7jAZU9cPDxqYIJoEHc9gzjJeTpKPXx7FpD4dDFUugCzuQ/bVJIBabQyXMy3WsEyGtFWKrFeNjr
 79QMosnSqRXleRvzGoDI54Fp1Ae6e+cE9dlyFhimSwAXpaAiJfNn0kCJbr9xWhymA/uvjQXO/BPoE
 +yYfY5K6sAXGM6rFNsugjBb8EdLFqasNBzMbWrfiuGt5egLVeoHt65s5zFfiLstPXigasPFE9lEI0
 pCdh3Aeg==;
Received: from mout-p-202.mailbox.org ([80.241.56.172])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFO-00Ai3b-Up
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 21:46:35 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4FNk6V3tZyzQjmV;
 Sun, 18 Apr 2021 23:46:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618782384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5NsPJb1vjRZMn+tgY1l6FOnMzOiGWDRA2sDyZX+K6CA=;
 b=E4eFortyCAKG3+kig/0bAJj1WbxEQZxr1xQtt0G8T67vVM44jyhYpy+5DICwNoP3BGJIKg
 UhxpvkmyxSzPbmm8W6tZWIxdkMTUjNuYSlmNSshbwuYuaVTFbuLFQNl3yYzhqhZQJIXN+2
 xyZQp4v/oslSeNi3D4LirQ2/757+URB3RYSlXAUv4k98STTsJJgTo/6YZefGSt11b01chR
 +H8Aj1imnQLzXy6+dee9k/XVbzMaFN03N+0d3ORi0RV5j+EflaMUPOBxJowKibfEH4t9Tq
 e5TR8DCDvB5/Kxjx8fGDRVglAwDkl2WNhKVLMc+FuzZyR6eEVBcDGuoyahZPRw==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id drumVTUwjMkI; Sun, 18 Apr 2021 23:46:23 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 0/3] mtd: parsers: trx: Add support for Buffalo WSR-2533DHP2
Date: Sun, 18 Apr 2021 23:46:13 +0200
Message-Id: <20210418214616.239574-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ****
X-Rspamd-Score: 5.67 / 15.00 / 15.00
X-Rspamd-Queue-Id: 425B117EF
X-Rspamd-UID: acd552
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_144631_168482_4380C728 
X-CRM114-Status: UNSURE (   6.57  )
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

Changes since:
v1:
 - Split dt-bindings into own patch
 - Rename trx-magic to brcm,trx-magic
 - Do not check np for NULL
 - inline parser_trx_get_magic()
 - Add depends for ARCH_MEDIATEK

Hauke Mehrtens (3):
  dt-bindings: mtd: brcm,trx: Add brcm,trx-magic
  mtd: parsers: trx: Allow to specify brcm,trx-magic in DT
  mtd: parsers: trx: Allow to use TRX parser on Mediatek SoCs

 .../devicetree/bindings/mtd/partitions/brcm,trx.txt      | 5 +++++
 drivers/mtd/parsers/Kconfig                              | 2 +-
 drivers/mtd/parsers/parser_trx.c                         | 9 ++++++++-
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
