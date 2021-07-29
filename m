Return-Path: <SRS0=YHiu=MV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70264C432BE
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 06:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AFE61042
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jul 2021 06:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7AFE61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fG4BJjwruhw4PPDbzCrypHXgsDZXwdChNi472fr0JBo=; b=xaiJhjpCKl1bx0
	MepTEbfe70gM9zO8b3CwJ6cOWvMACGEYLVLRf89RvwlG4rjo75uK1wK7Cf0NkKW6QL+0t7CSD9NFO
	gtWb0sOUILscT63DDn2aw6Lw7D35F1HtL2UDxwOAgGxOq0nmoFEcBGVdR5u70sNunIx7pRQjdyiMn
	CqDUEmeb0Q/gQ4C8C8kwVXpQLTLi1cST2RGkiA/0F0jnsEo3FhqWX2jK5UmejY7FS/vINXwANjPNP
	1cN2z+0rysBfS+fzxW+Tc8V0lxOnG5wMwfPkVIG+HavTdhCkpYiP93u2/DfrJ+vGHzpQudiF+y7kP
	W0QkwApXt83x+pv+P58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8zQk-003FaZ-Ex; Thu, 29 Jul 2021 06:22:06 +0000
Received: from mout01.posteo.de ([185.67.36.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8zQg-003FZx-CG
 for linux-mtd@lists.infradead.org; Thu, 29 Jul 2021 06:22:04 +0000
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 8F9E6240028
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jul 2021 08:21:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1627539713; bh=lcAhkWc/Kvh+uxpOR8FIfKZeWqnSufI171CKVlcwme0=;
 h=Date:From:To:Cc:Subject:From;
 b=hbmT7XRx/sjH+yHP3I31OjInZ03I+KZ/65UQmYBK+5F5YptCALkIaviNvAMvOezC0
 aq6qCcvbZNsfZv6F2SBmPzUgZGDR90Sy9gkTt3uKDsT1B9SEjfhlOBhPkiT2ppZa8D
 iPvFhgluTQ3bRPBovV8yPi/aZO4sjnLbKk7EskAvmgAx7n9UmTMCj6WFRhJq0VPvuN
 vec3t61RA3Xzu88c5rlkSfUWpG1Ax19uq3KO2/1RnBGLQiD08BqZvpHn23FgsN8nJL
 sGFAKhJHOI/0srwz+5Gm9QueYfsASCfrPa762Wi/asMAx6cYeUzGEVSCaWH8WZZQJg
 deYOgRqwb1nqA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Gb0mZ03Spz9rxQ;
 Thu, 29 Jul 2021 08:21:49 +0200 (CEST)
Date: Thu, 29 Jul 2021 06:21:48 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Joerg Reiling <joerg.reiling@jenoptik.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: micron-st: add another variant of mt25qu256a
Message-ID: <YQJI/MlIZ6XKKYJi@monster.powergraphx.local>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_232202_609515_4331DE82 
X-CRM114-Status: UNSURE (   9.34  )
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

Adds a second variant of mt25qu256a with a slightly different extended
device id.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Signed-off-by: Joerg Reiling <joerg.reiling@jenoptik.com>
---
 drivers/mtd/spi-nor/micron-st.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..2682d67d037b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -156,6 +156,9 @@ static const struct flash_info st_parts[] = {
 	{ "mt25qu256a",  INFO6(0x20bb19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "mt25qu256a1", INFO6(0x20bb19, 0x104000, 64 * 1024,  512,
+			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
+			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512,
 			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
