Return-Path: <SRS0=P3/5=NW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A0FC432BE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:15:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB24360F56
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Aug 2021 08:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB24360F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wtpkoyE5QTEWcI1GAuxWVhKEOTKHbBLqjRQ1wAUYbw=; b=vz7lPjbP6PcJQu
	TQmdNMfV6fk50b0Hj/SMwyBy8divFQY4etd1G5YPfWnxq6pERpRdOPA0JibbzJB/q4KPeK7ojt9K/
	oucB4u+a880cQj8XUTCmwUaflDa+aKK2uPrQXV/Ux+AgbyoOPWK9+dod6Oyb51nwReHCdeAJxaBtp
	1UUKhjyMqjDp7+zrLCPqbIUDnOWa05NhE8XCF6Omr8qvDtEmQPOwAy4/svsr2+FfKninsvKs8PQfo
	lm9fKNfvu99IY5YS7u/Ggqq/s59rZyC02zzuQamGFuhisWK1sedtW12oAWKOibbj9K3Dv8iS1l5UO
	/YDdVhpuCccQ1N5NILBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKyut-001nD5-HB; Tue, 31 Aug 2021 08:14:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKyun-001nCb-Ma
 for linux-mtd@lists.infradead.org; Tue, 31 Aug 2021 08:14:43 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s25so25626688edw.0
 for <linux-mtd@lists.infradead.org>; Tue, 31 Aug 2021 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=oMmNUzmo9Q7r3VmJw4TZNb8caycXHANgC/p8Tuu2198=;
 b=Y10DIN4nlK8rhbm2FENArhhhF6goAfYaMG1c5fY7+75SuH1zbT7TPm7ogk4byfjsFz
 /cvckv/UalCILdzcSeuzHwdnRGI96ObmboeyyVQi3s2ZXGBiPJRUKjKdCw+N5KOjWJ/8
 wVFqDg9IRfxr7SFVIDOWcsW3svrnSz8HO8OtYLdoNBhTHCuidPebzD8Ay6MCOHD2feAh
 Es0+SbUFRvKUeqzgqTDMoOI75ohnRgBc9zP//3AUZBCPaeOHc3UnAuDrEbVovOtZo9C0
 jGNHqcWn/YJ++C29l2lruUVZeUZGNYzyXmTNxzAKn24YbVkrF4pf8qjXswbVQSmG3qtp
 GZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=oMmNUzmo9Q7r3VmJw4TZNb8caycXHANgC/p8Tuu2198=;
 b=jtdjh1hqJY0j2BjBNNyvHgnY45y0eXxkDrrRVzdRt+kMpqgjVKyOEI/PwMA87yMS3S
 klE1iZeSeKbiDTWZyaHRMViTiZm6xcVZDap+4LauoEG6FmEy4tHcxeQCrGXOTYpfvWOf
 hHbrT/78Os51bKaD6pYUXciE0ZVY+EOWHip5NFZIRjt1DCQ8qCF5IN8wtsFexuCwOb+E
 QREPvt3pcK96aI2oM9y2VhINycXWstIJVJR980P3bgtcfQvkLeWKtRRCOOQvl0OE4uaB
 unRmeaXkuS+SrMe07DROMcwjvIvDbPNDlFBrFFGmvY8BBZwEgGA55edYfRI35wGXZBm9
 hOjA==
X-Gm-Message-State: AOAM530ITceshEJy1gyEKbCj9GwA9WfTZ6eI0XgzziSBvq+PFj1hcwE2
 hgw4XBNa7HQbIP+VOhdfZEOLAl6hnE9A9XiL
X-Google-Smtp-Source: ABdhPJzqcQV4CTygqUK/CdLP8DnQGmmYq9dVmRDzSUvLi/sh/KOc347ggv55QK/zN0+X/7+tWOnytg==
X-Received: by 2002:aa7:c88e:: with SMTP id p14mr29058184eds.174.1630397679627; 
 Tue, 31 Aug 2021 01:14:39 -0700 (PDT)
Received: from localhost.localdomain ([213.215.174.110])
 by smtp.gmail.com with ESMTPSA id z15sm8922870edr.80.2021.08.31.01.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 01:14:39 -0700 (PDT)
From: Andrea Zanotti <andreazanottifo@gmail.com>
X-Google-Original-From: Andrea Zanotti <andrea.zanotti@tyvak.eu>
To: 
Cc: Andrea Zanotti <andreazanottifo@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: micron-st: added support for np8p128ax60
Date: Tue, 31 Aug 2021 10:13:29 +0200
Message-Id: <20210831081329.27420-1-andrea.zanotti@tyvak.eu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_011441_803535_EC4C5421 
X-CRM114-Status: GOOD (  12.50  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Andrea Zanotti <andreazanottifo@gmail.com>

Added support for P8P Parallel Phase Change Memory.

Added memory information (page size and sector size) as per data-
sheet information, after typos corrections.

At page 37, paragraph 'SPI Memory Organization', it is written
down that the memory is organized as:
 * 16.772.216 bytes (typo here, there 16.777.216 bytes)
 * 128 sectors of 128 Kbytes each (correct)
 * 131.072 pages of 64 bytes each (typo here, as the total would be
   64Mbit, but the total memory is actually 128Mbit, correct value
   is 262.144 pages)

Patch tested against the aforementioned PCM memory.

No known regressions inserted, as the patch only adds the possibility
to recognize said PCM memory inside the common spi-nor driver.

Signed-off-by: Andrea Zanotti <andreazanottifo@gmail.com>
---
 drivers/mtd/spi-nor/micron-st.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..c78331451082 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -128,6 +128,7 @@ static const struct flash_info micron_parts[] = {
 	{ "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
 			    SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
 			    SPI_NOR_4B_OPCODES) },
+	{ "np8p128ax60", {0x89, 0xda, 0x18}, 3, 128 * 1024, 128, 64, 0, 0 },
 };
 
 static const struct flash_info st_parts[] = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
