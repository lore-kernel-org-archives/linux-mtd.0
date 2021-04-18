Return-Path: <SRS0=Qvgb=JP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECC6C433B4
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0B8610C7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Apr 2021 21:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0B8610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Opk//pQCyKa5byYMhE7SdHBLeZkRsz7kIZ2CamEbbj8=; b=KW9iJ6XbknQExXXohWzkUSEeL
	vfJXXpTC2kYC1xe+OX6W+cLmymv7+4TY9mGAoOH503cbQ09/VH5MFWL85vt3yRpMmfNNPWpu8NkOc
	lPeGDgSfV8/LfHgKuA0ZJLBRv2GbkUFJg4XzbE2g4djGo+f3qE1OiMBAwkMjVeIesj7VZXQUIqyln
	b6WE45P+bnqeUL2xPhNovo8TG3PxNxhkdG6aZUvzuCbfXz69ZGmUOSUwcCmUl8jkkCwMwvjFnPWSh
	BncAGiKoeEjuLUOwsEP+pIniAseK2wmBumP/w4KEDsCaeeVTGuJQLOMXnpnSX0B7IOO92QWgTmK8C
	6tgCvyGEg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYFFy-008eK7-1k; Sun, 18 Apr 2021 21:47:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFY-008eHD-Cw
 for linux-mtd@desiato.infradead.org; Sun, 18 Apr 2021 21:46:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=60Hu/ihLA/Vo2zmCFPe7L+SwDq4PXw+pQ1W3kQj9vVY=; b=t/xxPxUx0nO0XelyEJMaJl9IFl
 zeecIvqfijnKguG44DuaYY/R7Ik/oerLHHaIi1wT6KFK4RJbRzKs6DG1i4M0Mw773vfJEVOaZVBuu
 4oH0Gw+t1ptuSq4QNk/VuXdBx5lSFpo4epNYl33APSFwAlX+fWJOmTzduBEethIhZC4OaWTb3mTn6
 Ro02jpZS9cyN+s+PwlALRuJ2wssezI3LlSprzHRF8SZ8cnx3WDQoR/WJnU+j1Qta9xtPgDI41qOHj
 pYRbVjrKVAE59n9OHrWptYhnh6rT59ap7lTDjXhjUB5i7tLb0owAxJFHar5K/tMZGyWhaowVPgdL3
 pmc9uCwg==;
Received: from mout-p-201.mailbox.org ([80.241.56.171])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYFFT-00Ai3k-4N
 for linux-mtd@lists.infradead.org; Sun, 18 Apr 2021 21:46:39 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4FNk6Y3SshzQk27;
 Sun, 18 Apr 2021 23:46:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001; 
 t=1618782387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=60Hu/ihLA/Vo2zmCFPe7L+SwDq4PXw+pQ1W3kQj9vVY=;
 b=fNQj1tBsWj+qeFKp5Fqwb/sp/oLDk2UJU6Ui3pdOnA8EILw5zAtnxJKeTxSRbKAq4w09t8
 QiHauL+LkMgP5A+83/MtCGH+RmuQNxeKgKKGKda531GKTD1e5hBSOJvZO/ygSRM5ayJwMP
 +hQdKAfw9aaDlyJTNjAfHGNlMczWda4MTHfTfW5Sa7Ttu46jjnkevVlkrdKjnHR7yC5i6w
 tnIW5ndISCbKxKeeTUNagga1tKFLuthS/6WfhOuTUALSFa15prDkfMOX+6Ky9A04yjxlNU
 H8HlzoWxdLUWZxuvYG/hv25U47Afyy2Zigf8aE+/hUh6KtX11116JS6663Z8UQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
 [80.241.56.116]) (amavisd-new, port 10030)
 with ESMTP id ej-Is6lpX3Qk; Sun, 18 Apr 2021 23:46:26 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH v2 3/3] mtd: parsers: trx: Allow to use TRX parser on Mediatek
 SoCs
Date: Sun, 18 Apr 2021 23:46:16 +0200
Message-Id: <20210418214616.239574-4-hauke@hauke-m.de>
In-Reply-To: <20210418214616.239574-1-hauke@hauke-m.de>
References: <20210418214616.239574-1-hauke@hauke-m.de>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ****
X-Rspamd-Score: 5.57 / 15.00 / 15.00
X-Rspamd-Queue-Id: 7068417FE
X-Rspamd-UID: 184466
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_144635_346340_D76EE1B9 
X-CRM114-Status: GOOD (  10.26  )
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

Buffalo uses the TRX partition format also on Mediatek MT7622 SoCs.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/parsers/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index d90c30229052..c2af062fdca7 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -96,7 +96,7 @@ config MTD_AFS_PARTS
 
 config MTD_PARSER_TRX
 	tristate "Parser for TRX format partitions"
-	depends on MTD && (BCM47XX || ARCH_BCM_5301X || COMPILE_TEST)
+	depends on MTD && (BCM47XX || ARCH_BCM_5301X || ARCH_MEDIATEK || COMPILE_TEST)
 	help
 	  TRX is a firmware format used by Broadcom on their devices. It
 	  may contain up to 3/4 partitions (depending on the version).
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
