Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF34C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:23:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6BA64ED9
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 17:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED6BA64ED9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uKP7m+hg8CtZxm2RgyvfKGyW1s3bbQtmP9hEANfcyI0=; b=ATVkCl88APwxAG
	PUDDkQNI7JazXceieUAwV84/VFgFY8vVAcNS4y3VELrgNtEmrI+UxkGxU52kX47dIMdlSMei3V7BJ
	BkXoLabPQT65r0jMeqRTl1Ds7nygTQpYgaQGU4GQz/x634FKQMK50YgPNSyTL/AWcfYwuy4YhRrPF
	pizVaUsnFqS57m7yJEeqF6niuKKsURyY7hSwyYMXkFUBtCf8ERNmWiMhL/XvEaviMDRNbKZMM1B1/
	2Kka3+cqfEH05zBeFp93+jMIQe3PT/lV7miLjNUMLsyE7x55aDk80CgN1PNQfmM1WmLoVxgrF0P5v
	LQ4iP2wLfLB/+RltuC8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVCN-005maW-8d; Wed, 03 Mar 2021 17:22:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSud-005FKi-83
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=3y4qmTiGdbIFuupuPkvPAsKkvoNKr0zm+aN2aaexqIo=; b=vzKlYfiSdwDWpLVUe3kFHBt2qu
 A9CmqjPT2xtIilMuUcqHaqNz98X3jCn45qYqtkUN6KDsWnzOOcAD4qU3PwicTpZ4HxRixSKBmApCN
 x0Qag6zEAf2xVCwfpRzOQPRaR5gF/ryIagcyGmFu1bDa3zgT+t6zqkCbQbOTVJXdHFl7CBoQ1G7pe
 3QmHpwaOYy5rrKXI/FU2W1LJGBlM1miru12PJfhNAb0NoUwvA8wTJCv/Yfaxn4yTt1GItz5WlIvat
 4dBbUefhNkVDhmQJv+TqZ87pVa1wjm6ptM5Y0ojGfN22TdndctOb4JXkw9ESeMtesEkjo7BS2b6Rc
 JIywuxfQ==;
Received: from mars.blocktrron.ovh ([51.254.112.43] helo=mail.blocktrron.ovh)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHO8C-0023tN-88
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 09:49:25 +0000
Received: from localhost.localdomain
 (p200300e53f06820029112db9632db604.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f06:8200:2911:2db9:632d:b604])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id 4E0F523380;
 Wed,  3 Mar 2021 10:49:07 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: spi-nor: add block protection flags to macronix
Date: Wed,  3 Mar 2021 10:48:32 +0100
Message-Id: <20210303094833.139221-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_094925_024189_13A1CDD8 
X-CRM114-Status: GOOD (  11.27  )
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

Macronix flash chips support block protection by using BP bits in the
read status register. Add the corresponding flag to indicate block
protection support.

Otherwise, locked blocks are not unlocked when requested.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/mtd/spi-nor/macronix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203abaac229..2d39dd32a64e 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -94,6 +94,7 @@ static const struct flash_info macronix_parts[] = {
 
 static void macronix_default_init(struct spi_nor *nor)
 {
+	nor->flags |= SNOR_F_HAS_LOCK;
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
 }
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
