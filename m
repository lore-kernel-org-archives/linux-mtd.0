Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AB1C4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 02:47:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3932C22CA0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 02:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3932C22CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=szNNj66K7tMlSjd5YjiweoRXYHOx854aTm+1GZcGJ+k=; b=Z9gTZR4AIdIr3Hv6c54yFdySL5
	A91vM+789L/WE4IoZjydUFB/XxEctD5RDqopTSXppaJ7+ICY4tjjHy0de6XVMzURAdpnYtJX8+2sg
	76Oajm6u2KhYPZ1xz9zkrlSBzxRmw/WNdZdvgHw96HwfqEr7XPwr24x2XjPYK6od1+JcunLnz3Odu
	pTKlKCFDsHmNviHZXi1dIHWWvj5aUd64Ui+HVgJwgRzYPDQ+R1p4VJhXZ0p5F08jOePB+Dri0g+Ba
	N4VXlk/An2L8Ci1nTD5dnsfpgpNriVJr5UL5RMrEHTX9wGw7bBklScE+Z5J22zqFoIdBkHVMaylOp
	xQ1JCQwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km6Yb-0003WN-Nj; Mon, 07 Dec 2020 02:47:21 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km6YY-0003Vb-Ni
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 02:47:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id 11so2113295pfu.4
 for <linux-mtd@lists.infradead.org>; Sun, 06 Dec 2020 18:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lUjtHUc+/RanEZLK6AwzwiyRY6nDEaJFoU8TjTaj7Vw=;
 b=r/EAKvlk4KcV0aPkG+j+X82hY3XfkftcAGtTkSC9c8jiCUbqn4PsY9xEwr9EzwBtGl
 b8v8XCgyaH6qyOPdRnys1bkOVGp8HTP5a6nfTV4JZM0tDaI9HAwS+9egM/RLxLz06AJc
 c5Io+pDvd8tJ5+Ke4Tj+MQITiK+yDQw3MIun3pG1EPWXJ5AViHV2LSmhdMVd2CWjKo2m
 cGBxob9huGEcTXHFBbxsPMlSEPan29kQeWlysrEXG2487KEknCTJLyZqdAJJ0nj3hoLl
 pI0dTsqWDdgGH6+Pkl2EiaPBBAv2kGhWw4EKOqESXvyGPL/I6nNOCiyjvO3+v2Mcq4pQ
 zYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lUjtHUc+/RanEZLK6AwzwiyRY6nDEaJFoU8TjTaj7Vw=;
 b=NO9UfGiaJp8Zo3kWJRoK8e/Qk3tEM8P7eCWNIGAiJgqO36UEjqvKVyVtdQmCOa6Q39
 nc3beRtr5aDKlLECnUp0cO9vlBieTm9XNqpdcCBwd5sbW81Z8WCJYyej1uIpluuHL9WC
 aGz8we1QMdEHadMbL0o07WA+b3jLBDgN31o/hl0xGCHBfiAujaTBS3rNFeceFJQwmJoi
 er8yvtjEvsO3rLiLss5J9huEON6r8mUVRqesPoLqIIQoolxSo4XawtR4IiCYXpk75a5U
 XpTVoP2mNtuK/hqCdVnlMSOp6vLeEYx69Gbq1Cj7FPyAa6fYvO0W0C8rxMsJHA/V/nX0
 mHYA==
X-Gm-Message-State: AOAM533pD6BdFqEg1xBPB6VBYoQCNqN+iyxfM/pcBPy4wknsUuOPpvvc
 BOiyCR51CkYh5/qBqutfKsA=
X-Google-Smtp-Source: ABdhPJxbot3J20xUZBkWXQqicQ6Nxxr4DCxsmtzKWqwM0VBuqyA3iZLhF+EqEnbaSYUgkQchYWDFcw==
X-Received: by 2002:a63:f308:: with SMTP id l8mr17020520pgh.68.1607309235694; 
 Sun, 06 Dec 2020 18:47:15 -0800 (PST)
Received: from DESKTOP-8REGVGF.localdomain ([115.164.208.235])
 by smtp.gmail.com with ESMTPSA id 5sm10328812pgm.57.2020.12.06.18.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 18:47:15 -0800 (PST)
From: Sieng Piaw Liew <liew.s.piaw@gmail.com>
To: 
Subject: [PATCH] mtd: spi-nor: macronix: enable 4-bit BP support for MX25L6405D
Date: Mon,  7 Dec 2020 10:46:12 +0800
Message-Id: <20201207024612.1318-1-liew.s.piaw@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_214718_814644_F3A8E16A 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 liew.s.piaw@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Enable 4-bit Block Protect support for MX256405D and its variants using
the same ID.

Tested on Innacom W3400V6 router with MX25L6406E chip.
https://github.com/openwrt/openwrt/pull/3501

Signed-off-by: Sieng Piaw Liew <liew.s.piaw@gmail.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 9203abaac229..7aa8b1ee9daa 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -42,7 +42,8 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_4BIT_BP) },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
