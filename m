Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00381C67861
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h+PU3J7RLCYv2dsXxCVGbnTGHGHQDwoZhhCDwh38eeQ=; b=bS+W5UkyiKkJT6
	rHl72Xwad4N45w/wqN80FmQUxqSG/rp8mfApjsA6X26dtZZDNwf2PrxOsxy0YIFZbIv9TSgSKncuE
	DFUNjQjiKPR44Q7UZZ8Ad6bSsSlxELDywUrNwJkANwghWmjdazfg2hipoaY8uzIapvzMfqvtKsfM+
	4hvWv23CshYyNIU0YEAHHY/P1T7Uyt4Sa4TNqK9zR4yQqvxMfikN39z9j/BQdafmXTr6HIZ93glQr
	hUqhWwfrNCB+ZkkExyHCGCgWcC3OrKu/fDhZI1Tp56yROBRN/LxMIPg/mkm/8Py5pKoZlRZ4zmzIR
	qKwCsfOZWv5WmY84R1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskaI-00000007T7R-3ZxL;
	Fri, 05 Apr 2024 14:30:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rskaF-00000007T6H-3u8y
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 14:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 903C9CE1F79;
	Fri,  5 Apr 2024 14:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9D1C433C7;
	Fri,  5 Apr 2024 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712327420;
	bh=+hmouGUWtNRPVBEAQ5zRor/cUdIz1q9ZT+Aeo5mwccg=;
	h=From:To:Cc:Subject:Date:From;
	b=j09wuuDE9l5oYSv9w8XepGpi8h2sXOQdieK6zR23WRChleFDSnvbOVd+ExJnd/PXy
	 qdABiXoKu+9hxF4ZT9rFLZklYVCZIhjtZwfl+LMS9CuaD80N9b4J+ctJqvj8JZGfbS
	 k/EdxwZ7oJlIureGUJxau4aNZ17V7TZ+xviTLUS6nlAWdjuj1X9wzh2aEh6VIXaL5S
	 nrm8VdBr0/6Z0G4X4SwC9Hxc4dXRoAZ+f3bmpnHH7AlIujr+eM9sjFM+SjKkkGMzM+
	 KTn3DQsXZKnPBd4f1FNevs0uzygBXAJ2Oj0VwD1yRVm9XwiDHmHUf07eaB5vdvnX9i
	 2U2SM9ymcGdgQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	stable@vger.kernel.org,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: diskonchip: work around ubsan link failure
Date: Fri,  5 Apr 2024 16:30:04 +0200
Message-Id: <20240405143015.717429-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_073024_241065_EFFF6E8F 
X-CRM114-Status: GOOD (  16.90  )
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

From: Arnd Bergmann <arnd@arndb.de>

I ran into a randconfig build failure with UBSAN using gcc-13.2:

arm-linux-gnueabi-ld: error: unplaced orphan section `.bss..Lubsan_data31' from `drivers/mtd/nand/raw/diskonchip.o'

I'm not entirely sure what is going on here, but I suspect this has something
to do with the check for the end of the doc_locations[] array that contains
an (unsigned long)0xffffffff element, which is compared against the signed
(int)0xffffffff. If this is the case, we should get a runtime check for
undefined behavior, but we instead get an unexpected build-time error.

I would have expected this to work fine on 32-bit architectures despite the
signed integer overflow, though on 64-bit architectures this likely won't
ever work.

Changing the contition to instead check for the size of the array makes the
code safe everywhere and avoids the ubsan check that leads to the link
error. The loop code goes back to before 2.6.12.

Cc: stable@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/diskonchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 5243fab9face..8db7fc424571 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -53,7 +53,7 @@ static unsigned long doc_locations[] __initdata = {
 	0xe8000, 0xea000, 0xec000, 0xee000,
 #endif
 #endif
-	0xffffffff };
+};
 
 static struct mtd_info *doclist = NULL;
 
@@ -1554,7 +1554,7 @@ static int __init init_nanddoc(void)
 		if (ret < 0)
 			return ret;
 	} else {
-		for (i = 0; (doc_locations[i] != 0xffffffff); i++) {
+		for (i = 0; i < ARRAY_SIZE(doc_locations); i++) {
 			doc_probe(doc_locations[i]);
 		}
 	}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
