Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADE4C48BDF
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 16:26:36 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E9AA6157F
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 16:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E9AA6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+FJTuFr5ilxYtFacAZIWVYjnAREBAdI7HDcijkwHN/8=; b=IFDs+M4IBJS8qL
	/OztKe0mqBzVPxKCkA7fib01dieoootwvRDdQ8PPJ6xoGW053wlXnvo1B6HkPGkd66mV8pTrEGs3f
	jnxZ3lDRaMGPjmxwbGGCn8z0sWXVSrhoovdNp5GLejJ1nZGmxjNjCp9FKXGT3QMJ4CUdiCbvTz7/4
	jHiqAC8dOenTG93ZQrpqGyFHJ1E/U5CFBtCq41EZhtPjEd644IDAWJ0qTzdWWa76OBpibdDau5DdP
	0oB4qvN4TYJGpNuVQGsWWvqoEESgHf848Vq55mdG9vU3XBcEWm87i25nVqr9IjWnRG4rnz/sW3unk
	T40UkTap0EswezJ01GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBr1-001KS3-I7; Tue, 15 Jun 2021 16:23:55 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9ip-000SAI-JE
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 14:07:21 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lt9iO-00029g-Sq; Tue, 15 Jun 2021 14:06:52 +0000
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] mtd: devices: mchp48l640: Fix return of uninitialized
 value in ret
Date: Tue, 15 Jun 2021 15:06:52 +0100
Message-Id: <20210615140652.59521-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070719_730055_B7935A9A 
X-CRM114-Status: GOOD (  12.51  )
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

From: Colin Ian King <colin.king@canonical.com>

In the case where the read or write lengths are zero bytes the return
value in variable ret has not been initialized and a garbage value
is returned. Fix this by initializing ret to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/devices/mchp48l640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/mchp48l640.c b/drivers/mtd/devices/mchp48l640.c
index efc2003bd13a..0833f41e9d17 100644
--- a/drivers/mtd/devices/mchp48l640.c
+++ b/drivers/mtd/devices/mchp48l640.c
@@ -210,7 +210,7 @@ static int mchp48l640_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const unsigned char *buf)
 {
 	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
-	int ret;
+	int ret = 0;
 	size_t wlen = 0;
 	loff_t woff = to;
 	size_t ws;
@@ -267,7 +267,7 @@ static int mchp48l640_read(struct mtd_info *mtd, loff_t from, size_t len,
 			   size_t *retlen, unsigned char *buf)
 {
 	struct mchp48l640_flash *flash = to_mchp48l640_flash(mtd);
-	int ret;
+	int ret = 0;
 	size_t wlen = 0;
 	loff_t woff = from;
 	size_t ws;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
