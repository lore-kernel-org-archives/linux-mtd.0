Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6AEC4743C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8904161003
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8904161003
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpORCWShNcR5EWD5TFAZ8FFzl+CNPzhzgO5dujyXnGc=; b=gxDXnXAYvaSE5a
	bnTqZCe+j4zW0U/QRN/LAKXmKXWRVwZy+KZmlTysihJe855AAeF5SWpewyeLwF47Q1nmkrTguGkuN
	aiYo0ij7s7kiZeJ5ro0O506wdElGfv8+IUEtKIcuDuVQfJU71W9ofUz9Y/3a8f9uE9PPu/zLgovyR
	Zf/6ymgQeNKlLljW+Z2lbo1/AU2i/kzk7B5SUz5kcGQSltgy8N4AIjDk4vuEQKDUq+swS7XUH4bOu
	X+j/vvukKyL91umn0C/rTLbdgtZxUcWh7CGad2hMzq1ixAq/LHim3iuFtWEo5s7bKUbnoSyQQ+vwh
	dGDyCGS0yyY31XQPLw6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLmB-003u1m-9K; Mon, 21 Jun 2021 15:23:51 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLlu-003twl-N6
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 15:23:36 +0000
Received: by mail-ed1-x532.google.com with SMTP id df12so17022354edb.2
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jun 2021 08:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3r07y9YpsFP6j4d+xRWFs7X9CG/fq7/6JrKEYt5N5o=;
 b=CHABTvlmyx94gAxeZB5YtmGfeA6XVooApQ/DywwdzYNjdpPELUHddLQekNcNyesLkL
 Gf+rfbqW2gTjqwBNOZOFZiU/fAuqKqi5S/19FRyRU/Lr/uRGnmFw/HT8/y8mbAvj8M/g
 3WnsIij+jTn3x1LLYjlqiKrHR/RsCgi+rvwyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3r07y9YpsFP6j4d+xRWFs7X9CG/fq7/6JrKEYt5N5o=;
 b=rxqVWto+Rw8fnfJxlAhbgkoCKJ7nXbPEdvd/n61br62IEcUO/HdXhihikoJ442jxGM
 IHlTkfOf8yBPGWAEabbF/9Gr0fpbnMDmTWl7VMUBYVJeC2rKznlmjjQpvjUH47qR8HUi
 HRY+Li/CnGpx0JQERQiy5iB/CpMCfLjHE9sCMvixOOxzE75MC61SiuMO7gE+z+uV/Bta
 QfNOkuGQRNCnTGwHm0pzBS0FqJi08gu8WVhn8r31XYjPm8uwO75Oh+ppiKFkqNmN+g5q
 FW+ybOzjup+AgdPa1/mJ1OPB2+YJPOgdxvo1l+5YNQA4lYP1y61DjmkJ33tLRD7sCz3o
 Nz7A==
X-Gm-Message-State: AOAM532F+j6wrAWWedt9FJZCgmcgps/zWw2MaraFVm3n+wqZ7/PuL3vM
 3Nmp0BnNC/FwksRa/YKQj7cSXb7xQE90Qw==
X-Google-Smtp-Source: ABdhPJzUJHxyH3gAr5+sjINmrbjx11wFZWfZekatWANxoZQ4LpKR+YPkhYw2YxZYuD+unZfaNFeSbA==
X-Received: by 2002:a05:6402:40c3:: with SMTP id
 z3mr22094953edb.187.1624289012404; 
 Mon, 21 Jun 2021 08:23:32 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id q20sm5021079ejb.71.2021.06.21.08.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:23:32 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-mtd@lists.infradead.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 1/3] mtd: spi-nor: core: create helper to compare JEDEC id to
 struct flash_info
Date: Mon, 21 Jun 2021 17:23:18 +0200
Message-Id: <20210621152320.3811194-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_082334_852493_1028D2E5 
X-CRM114-Status: GOOD (  12.45  )
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

This check will be used elsewhere in a later patch, so factor out the
logic to a helper function.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index bd2c7717eb10..6a1adef0fe9f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1850,6 +1850,11 @@ static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_xmc,
 };
 
+static bool spi_nor_match_part(const struct flash_info *part, const u8 *id)
+{
+	return part->id_len && !memcmp(part->id, id, part->id_len);
+}
+
 static const struct flash_info *
 spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
 			  const u8 *id)
@@ -1857,8 +1862,7 @@ spi_nor_search_part_by_id(const struct flash_info *parts, unsigned int nparts,
 	unsigned int i;
 
 	for (i = 0; i < nparts; i++) {
-		if (parts[i].id_len &&
-		    !memcmp(parts[i].id, id, parts[i].id_len))
+		if (spi_nor_match_part(&parts[i], id))
 			return &parts[i];
 	}
 
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
