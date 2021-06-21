Return-Path: <SRS0=qKgU=LP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EEEC4743C
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECD5E61002
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jun 2021 15:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECD5E61002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eDVBvj3tZcGIQd4tjYTQzCfl3++gg/u4n9avD8QPOQ4=; b=phMVI5trxLjB/O
	7eZl9Wbe4bG5Cw4gwD17PEZsf6hlYNHKhamcISm+j5yofKohwO3kSOkSrKPW4hrCMQ1PwmOawuGMB
	f8P11NH0x7cuCoZ/tjln51VpsKBFISj+0olje8Rb2Keu37u+IaUCJVDr+sNqBip1oZM8D4tAuCrDV
	H2pg+eNXUP6nYIUZaBgUBSG01OOg2hkBqAdqIMqXOpqj8ikstFOCPY4aXeIYE7/JMrffXf9EFW/qV
	zFFq6CvUPBWwl3jR2fvh1nlnlOWoGc7VEbkNX5iZ2NJO7Zg9ajDaM0f1JeVHAp9uDd7Hi5yNjPk5q
	PZOM5yfppIoPlLCG6w0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvLlx-003tyh-HW; Mon, 21 Jun 2021 15:23:37 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvLlu-003twc-Jw
 for linux-mtd@lists.infradead.org; Mon, 21 Jun 2021 15:23:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id g20so29527764ejt.0
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jun 2021 08:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCNAaafNj+4vIYMCE6BaU8BQ51vMFCgrIkuTeCkG8XQ=;
 b=d0yKttHj1+xWLz+gt8ga7xWlBPI9lQZ8See64Se9W1MX7AaFpgndPL8aFz4SZk9o0q
 daBm0osE4hkxfWYcYukvAzlItpAQmJ/BkRQXwqSLDjTD7AKKUhGUMxgYtRXoVLjlpqjR
 wRbQnoq/OLHA2Ir6pIkKwevzxuD4wBHEGWzC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCNAaafNj+4vIYMCE6BaU8BQ51vMFCgrIkuTeCkG8XQ=;
 b=LFEc5dcaAY2HxuKkHXaqjaoOGRfQdqfMyAJojeCBX37hyVBY5NEyUEr216amDyDeT0
 NVNgiTdRQWsrJsIXSRat0KoM3ndzYpjso5B3NlLuWVm1HB9HlX1OWtyMpHibun7dDoOs
 LUMrO09flbpnz+vM1kgdwhJgsGYFMSzpTIYP71qKL0UYx0Mx4qJ5hpCQiN/jsn4vIzJS
 3uRjWc+NPyTQPiJQZ2vlfmAi5BTAHJkJLCbBLi2NMqTdEjzY1otgTPYsLhP5tNpdHuta
 F67FfQC46oeIMy4POZksGvLUDZdiDBfa1UDWeF2VNg071dkwQR7L7FICLr0un9tgMRp0
 E1gA==
X-Gm-Message-State: AOAM530zAs5NvmKMEhQjSXsLe7dmrC+JFpjkJILyzh95s5Ix5F90rmy2
 u0B46M3cDjeyhOnzBRpfDzAIRN8CqqqFWw==
X-Google-Smtp-Source: ABdhPJxLQENI+f0AiVfMHFBW/wQIifzZ78MC7T+dMTAOZjVorKPvwYKpZUenrjA0yLEDZr5kf4k2zw==
X-Received: by 2002:a17:907:3faa:: with SMTP id
 hr42mr8003974ejc.129.1624289011355; 
 Mon, 21 Jun 2021 08:23:31 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id q20sm5021079ejb.71.2021.06.21.08.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 08:23:30 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-mtd@lists.infradead.org
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org, Esben Haabendal <esben@geanix.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 0/3] mtd: spi-nor: dealing with reused JEDEC id c22016
Date: Mon, 21 Jun 2021 17:23:17 +0200
Message-Id: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_082334_851733_590F2796 
X-CRM114-Status: GOOD (  13.72  )
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

We use the Macronix chip mx25l3233f in a number of
products.

Unfortunately, it has the same JEDEC id as another chip which is
already listed in macronix_parts[]. Since that other one does not
support SFDP, and its data sheet warns against issuing commands not
explicitly listed, we can't just do RDSFDP anyway and decide that it's
an mx25l3205d when the chip returns garbage.

For lack of better alternative, start allowing multiple entries with
the same JEDEC id in the parts tables. That allows a correctly written
device tree to specify the right chip, without being overruled by the
"JEDEC knows better" heuristic, while being backwards-compatible (as
long as new chips with recycled ids get added after the existing
ones).

While a step forward, this isn't quite a complete solution for our case:

Some of our platforms are based on LS1021A, thus using the
spi-fsl-qspi driver. Back in the 4.19 kernel, when the driver was
fsl-quadspi, we couldn't get the flash recognized unless we
monkey-patch-replaced the mx25l3205d entry with the mx25l3233f one
(i.e. added the SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ bits) - we'd
fail in spi_nor_select_read() because
shared_hwcaps&SNOR_HWCAPS_READ_MASK would be empty. In contrast, with
current master, the chip works with or without the third patch in this
series, i.e. whether it is detected as a mx25l3205d or mx25l3233f. But
the read performance is ~3 times worse than in our patched 4.19 - I
haven't quite figured out why quad read doesn't seem to be used or
work.


Rasmus Villemoes (3):
  mtd: spi-nor: core: create helper to compare JEDEC id to struct
    flash_info
  mtd: spi-nor: core: compare JEDEC bytes to already found flash_info
  mtd: spi-nor: macronix: add entry for mx25l3233f

 drivers/mtd/spi-nor/core.c     | 18 +++++++++++++-----
 drivers/mtd/spi-nor/macronix.c |  3 +++
 2 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
