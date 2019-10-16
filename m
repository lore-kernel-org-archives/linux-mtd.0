Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E82ECE58F
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 01:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175CD2067D
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 01:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzTHPfKJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2cAhIp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175CD2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O8NmN9OrDob2BEme23xEqRFzCAOPTWgUXan4F8RNEV4=; b=rzTHPfKJj2Rdzo
	2NRX6BcO+TImpDiH5XuK97xSSssSE5HherhwTV1//Mofe3hcEA3hIF+HJR2K1UdBUtB7VgoC9zJVH
	jwiKVIaNE+tqDD8QYvgvLQ4g23hRzJGg309d0MV2QPs3bqHpgDqTBXb6/4gMI9GE4533UoeFw/7eY
	Hjd31ksnoCl8nPVoFl/DUvMTyy3PXvSDaJ2QvPvwqDc3epYkMv7Qi/tAstJkQ27Nr+00Lwr2CTzVc
	FH0d6sIIvkKqo89B24IJKRFBeD1ljCD7biWsUZfH9UZDkxPJiI2PFkbI1hLpn3H/pfQpaevlokEFF
	1MrdcDx8HJiD682Vv9FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKYI5-0007GI-Jj; Wed, 16 Oct 2019 01:39:53 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKYI0-0007Fu-T4
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 01:39:50 +0000
Received: by mail-pf1-x442.google.com with SMTP id h195so13632538pfe.5
 for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2019 18:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrtU0AEZKYDZWBVf1gNKSefnw5x4YOEIDWqA8O0kKHA=;
 b=V2cAhIp1eAQXSLsvZn1Z/vzHKU3uE2JriGrV7Is0yjbwy34Sblarunskfnq9WXrCh/
 eBleZMcFOTJoOSJD21r+v92UP3uCfaTmc9xM0iNOqE2WeSBMbSK2cMuL4qQ4Q4wyOYEJ
 eH8QzVu9/OJF1GVKXtya4KVJNbdCw8Vlm3+uTGDZrNkAQ54vrsTKeQaN+hGpe82w/S0p
 9Eaa4ensoPOAKcFfxerpyRHy3HrdLonOPMI5WyH422b55csWQiY0ZMSDJlZlkhdf4svk
 xvNJRIXEWkAA5Zl4mr8GbrMdZP1Ma0A4GPh2pQska5TzhFbwyGHQWkLEZse51bdCBgNe
 skaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BrtU0AEZKYDZWBVf1gNKSefnw5x4YOEIDWqA8O0kKHA=;
 b=WPzxuoBeFg7szCzzX/2xGMrFmeCIyzhY5AxC/HfsuIJpZJ1I/lHaOuHUWGM+oEfxdI
 WeTe4CBjHZABmleW5xK1yavMWQ1OAlU+8mBgup/QgDFZwY2g5zK2k8nTGyGowQAm9eIw
 ozfyNxohLIoQgaz162ZkVdV+ES3XZNML7sS1CGn0S2NMWzEmxRk/fy4vkbIOV0a+lwhm
 EYvGpAvZ4lLbUgrowJLOeF7r7DsHFdcTeW3OSMc8fVwNSyFnehiMZhE6gIJMmxtEESRV
 Yi3yhZfa9mFnT9GSCwxaj2NySMAb2K2xhm1uD8+HKHz4enZHvISVXk50tSmgFDVyHLX/
 jOAw==
X-Gm-Message-State: APjAAAXGYXy+uogmu/LMa2sMQGlqZYfMb58WIN62cz37uogWRXaZC+iK
 53AK77o5MPqRg9vPFDerZghsGG3z0VVt8A==
X-Google-Smtp-Source: APXvYqwKDR4nRa/MAA2CIiB+2BRslacdm8lDn2OMwvYG7HxBI27huc24uwQYeD6zKQBU1JLWRkVb0A==
X-Received: by 2002:a63:e509:: with SMTP id r9mr25758636pgh.431.1571189987702; 
 Tue, 15 Oct 2019 18:39:47 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:7001:2668:5400:1ff:fe62:2bbd])
 by smtp.gmail.com with ESMTPSA id v8sm574725pje.6.2019.10.15.18.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 18:39:46 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][RFC] mtd: spinand: fix detection of GD5FxGQ4xA flash
Date: Wed, 16 Oct 2019 09:38:24 +0800
Message-Id: <20191016013845.23508-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_183948_963789_654CE85B 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: Stefan Roese <sr@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Jeff Kletsky <git-commits@allycomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

GD5FxGQ4xA didn't follow the SPI spec to keep MISO low while slave is
reading, and instead MISO is kept high. As a result, the first byte
of id becomes 0xFF.
Since the first byte isn't supposed to be checked at all, this patch
just removed that check.

While at it, redo the comment above to better explain what's happening.

Fixes: cfd93d7c908e ("mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
CC: Jeff Kletsky <git-commits@allycomm.com>
---
RFC:
I doubt whether this patch is a proper fix for the underlying problem:
The actual problem is that we have two different implementation of read id
command: One replies immediately after master sending 0x9f and the other
need to send 0x9f and an offset byte (found in winbond and early GD flashes.)
Current code only works if SPI master is properly implemented (i.e. keep MOSI
low while reading.)
I'm wondering if it worths to split the implementation of read_id into two
variants and assign corresponding ID tables to each variant, or we could
trust all SPI controllers and this fix is sufficient.

 drivers/mtd/nand/spi/gigadevice.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index e99d425aa93f..ab0e53b09f0c 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -249,13 +249,14 @@ static int gigadevice_spinand_detect(struct spinand_device *spinand)
 	int ret;
 
 	/*
-	 * Earlier GDF5-series devices (A,E) return [0][MID][DID]
-	 * Later (F) devices return [MID][DID1][DID2]
+	 * Earlier GDF5-series devices (A,E) need sending an extra offset
+	 * byte before replying flash ID, so the first byte is undetermined.
+	 * Later (F) devices don't need that.
 	 */
 
 	if (id[0] == SPINAND_MFR_GIGADEVICE)
 		did = (id[1] << 8) + id[2];
-	else if (id[0] == 0 && id[1] == SPINAND_MFR_GIGADEVICE)
+	else if (id[1] == SPINAND_MFR_GIGADEVICE)
 		did = id[2];
 	else
 		return 0;
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
