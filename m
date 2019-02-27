Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38ABC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 20:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6872083D
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 20:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDVymTtB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="f88ojvt+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6872083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=GDOmjSLXc8UxfnLkBzgtxTZSryy5z9WLcjCpR2DAyTA=; b=rDV
	ymTtBU9ne2U9Ofp39ziZzSnPo50QVo/oYJBkDaDKho/rU9glj5bG59Ap6BUO8naizxk226xl4u+Vp
	LckC70E6El8Oy1q896o8r7rWAvWkqoxGiBRnU2ggn5t4RUzTEBw1YoFEZXs0O6Eeke15sMZ97Te7L
	9xAkgb4eNqN8+yzPjMqBHJzBBYk2lxL60bpiaODrXqlDDc6hwrHnF7gJdjZGeelTrhLfqkCN5wX3W
	tbbqEgu5Z4sxMHzYSPrd2147ocbvgT2/K2LEMu1efTdILPXcY+RS4k5Wza1E2DQQeRxPOBPOYXSDW
	clbLqZufdb31yZO9OQxP7DCk+MqaZtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz5zZ-0004Qm-7H; Wed, 27 Feb 2019 20:39:49 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz5zV-0004QK-Ir
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 20:39:47 +0000
Received: by mail-wr1-x433.google.com with SMTP id i12so19566879wrw.0
 for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2019 12:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=xLclEW3kyvhpBFp3rI2l7mOfB+3i226+50DfDYHpl0w=;
 b=f88ojvt+JAIJNxdYbx5b9Gy2SSdAMX+FIMhCLjc5ySKgO0OvB8ejc20QAsCUSuvYu0
 S3GYZ2wywJvRMyyD/mlWq4hlU//jl30qLU9h+Snjfu2TGxWVFctEraVG0OTfnZVwYtgN
 MpbxSypq+XZEdOqJYmoTzo52WyCX+62/mMub4y+jTUWFYyWcTeVyntqbac2t/U2qwl5f
 VSDUYLf3LyEpGef4HgkyXJ49PQMmLweujT3AyljdTJL82m7T6cV5AQVDtENpLWoBqojb
 O2Rg+eYh8Fnn9eK4kGTIt8eTJrj8bHnbKQOtNwMoL2Cj+I67T4sfwrxxmgR7Mesu3n7y
 /0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xLclEW3kyvhpBFp3rI2l7mOfB+3i226+50DfDYHpl0w=;
 b=mtICg/o+fI7wJpM/3QNYLke/0nkQvnP8ZShAxrYN0m5cwpEKLp5RqDn7liOMG0jMn3
 PZYrIPSbPeDQaP17VGRVBKQo0dzzYbCkFc8dAPQLAE5Yy0KGNez4uMbEVsDhdolh9DgP
 Ykj5K93jNbUmBCzXRqTgySCehSE8Ndr7kjCzab2KNjY3GuvZUeg7j0FEEbAcGKeno6md
 RFrpBZhd57JuuzzokU+oEpevfCBQfqudUMxmT/OIlLDvry9YSQIrAnYirScZzyCiprR5
 GC6RZUU2UAEAqPuCQzYmSVFskSrOVZz3eCYOJdMfi6qklWYP/Wa+efYPPpgj+43Qhpj2
 H72g==
X-Gm-Message-State: APjAAAWEZZCDyQag0hs5J6EKyWY11hXZxKyV5y+8FK2szDLkd1G+sFxm
 noodNeIMgd5fwbaIJdaGYOuqeeUXTO6fV2ElRgma5PIr
X-Google-Smtp-Source: APXvYqxMkCuiDW/IoNs6jF/k2ak1Y6OrIVln2S3GqA1mHKxBNmCPl9dzZvBYedlw5zmh6Qmb7M4aE8gsKnEMrUy4zkg=
X-Received: by 2002:a5d:6846:: with SMTP id o6mr3663517wrw.160.1551299980742; 
 Wed, 27 Feb 2019 12:39:40 -0800 (PST)
MIME-Version: 1.0
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 27 Feb 2019 12:39:25 -0800
Message-ID: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
Subject: ubi/ubifs performance comparison on two NAND devices
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_123945_769681_0870637E 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Greetings,

I've got two embedded boards (IMX6 using gpmi-nand driver) that are
identical except for the NAND FLASH and am trying to understand why
I'm seeing a massive performance difference when it comes to ubi and
ubifs (in particular ubi scanning and UBIFS resizing).

Micron MT29F16G08ADACAH4:
- page size: 4320 bytes (4096 + 224 bytes)
- block size: 64 pages (256K + 14K bytes)
- device size: 16Gb
- 30ns per-block read
- 300us per-block program
- 2.0ms per-block erase

Cypress S34ML16G202BHI000
- page size: 2176 bytes (2048+128)
- block size: 64 pages (128K + 8K)
- device size: 16Gb
- 25ns per-block read
- 300us per-block program
- 3.5ms per-block erase

The parts are relatively close in per-block performance but because
the Micron has twice the block size I think of it being twice as fast
on a per-byte basis compared to the Cypress and I do see this relative
performance when testing read/write/erase both in modern U-Boot and
latest Linux. What doesn't add up is that the Cypress part takes about
7x longer to complete the ubi attach (between 'attaching mtd' and
'scanning is finished' and about 100x longer to complete the UBIFS
free space fixup (between 'start fixing up free space' and 'free space
fixup complete') performed on the first mount of a ubifs filesystem
that was created with auto-resize enabled.

Both parts are 2GiB and the ubi scanning on attach in the kernel goes
from ~4s on Micron to ~28s on Cypress and the UBIFS free space fixup
goes from 0.5s on Micron to a whopping 56s on Cypress.

Any ideas why would I be seeing this kind of performance difference
when the raw erase/read/write performance is (both datasheet and Linux
tests) only 2x slower? Anywhere I can look to improve performance of
the Cypress part?

Best Regards,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
