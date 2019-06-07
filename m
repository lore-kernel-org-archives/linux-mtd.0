Return-Path: <SRS0=qE3A=UG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E974C468BD
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 15:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F5321479
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2019 15:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQe0jU6s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="By726Rt7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F5321479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e7AQbP9QrRn3aAtXKcEx1h6JdHWu2+JHv0gi0NfKCzk=; b=TQe0jU6sFSR+pH
	fZSfO34Y2jbIblfUFxt9HJCcwixz9jQWl+WmIJCgdHsBBxwWf3AmI11n7GE6fQ4rsXicEWJemgk0t
	tS5MmhDJb9Aw8n86rE6adNAMsUbTKQhcTrFzMublixw9/2iZethCXhKxBC+PyDK7N7LTF2KRtsg5p
	QCSz/+7R8Jnrpkz3WiCbYf49YP+gg2YtWBjgEV7ATTtOamYKxWZOI4Zb3lg3ZChXe6Z13pnxxhU0X
	W0DqymBi2lJCV2VuXCgnXR3B8hwPSD60MIu43HW82XnHZ7uqZXkZP5qav2pxeoj3PqhZxD7ndjIlL
	hFEu0o5BcXlUyWJcz0tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZH1n-0006Vj-Gi; Fri, 07 Jun 2019 15:43:39 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZH1k-0006Ti-M3; Fri, 07 Jun 2019 15:43:37 +0000
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0448BC5859;
 Fri,  7 Jun 2019 15:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559922215; bh=0lEPE/omdBqnj239oGGM+RMVir+ROFSBHtl3mcsX8h4=;
 h=From:To:Cc:Subject:Date:From;
 b=By726Rt7GGoItd7VLH3TBczHPVhVpeILAw1YpJ4M3MQvag4phbfn5xr0LFy6t5X2a
 +QHT35L7b8z+XR/QkNLac6pNfuzVv0z8uWcy23Ymd0TzpFn17a8THB/fh5sC4Pu1qW
 UAKxZGZjB8ZmnSXXvae7Ug6uw/m79q5H9omwDTpzQXGCyKx/9mzOF080RjfNa6ubqM
 yGU5y1NV3MGMokfvHraPa7myWHXntpVK1g31huj07OfGhoFrpwCJWTKxW6Adx6Kgzd
 w+vRWqICzpUcVteMmSrGLt99f2JPmsZ2/GxyiaQfV7mxpSazQa+uAxFc/F0nZkqCJc
 hy8ps+XwlfyoQ==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.20])
 by mailhost.synopsys.com (Postfix) with ESMTP id A3946A022E;
 Fri,  7 Jun 2019 15:43:29 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: add support for sst26wf016, sst26wf032 memory
Date: Fri,  7 Jun 2019 18:43:08 +0300
Message-Id: <20190607154308.20899-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_084336_725511_FB832314 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This commit adds support for the SST sst26wf016 and sst26wf032
flash memory IC.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 73172d7f512b..224275461a2c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1945,6 +1945,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26wf016",  INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "sst26wf032",  INFO(0xbf2622, 0, 64 * 1024, 64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
