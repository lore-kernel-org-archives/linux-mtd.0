Return-Path: <SRS0=Efe6=3I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E008C33CB1
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447DC206D7
	for <linux-mtd@archiver.kernel.org>; Sun, 19 Jan 2020 14:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuGn1wmk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBfLw1NC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 447DC206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=soelVqGNTPmgrjy/Ehf5c+hmyOoacq8IFW+A1Yg5xlM=; b=nuG
	n1wmk3RcUZ2Vl7RXS1sLanfQb46ilU9SZl1qj9tmXWd9SNcQient0VZiOpiQh8gRZVHn5ZJKSMM+Y
	rbeIRceO+oyTkmVaqePoRU7It7yGTJups3TwOgbm+xhiVhvur69vFYjMerqdvsWGKgjnhcj/au/tj
	KhimeUmItwAkT/o05PV20ANH5+yR+c8XUNKIQhkPYhyKwHTMmVdRGGfKMYrJST3D/45J8ZhHxsx4f
	4I3CslNf4v3wuYuc2t2J83RoWGANjztpInWlR7mN5lFcDXGhSy5q6y40paymSLvEU2E6qfSnh+BnS
	JjrJhkgTPwRkPIOtf6JrglpUEojT0hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itC0L-00010G-5R; Sun, 19 Jan 2020 14:56:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itC0F-0000zW-53
 for linux-mtd@lists.infradead.org; Sun, 19 Jan 2020 14:56:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id j42so26909445wrj.12
 for <linux-mtd@lists.infradead.org>; Sun, 19 Jan 2020 06:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cxLWjS9rw2dbUJ5Mao99KZZP4Ha2WG+mka8EA8GPkLQ=;
 b=VBfLw1NCTFrJxi1gTq1aUETO1U/+Ores0BJps6D6jQK+Wjo0MsA9T9VmgRo+IYOYE9
 zhhKiZvUZlw2p6CIL4x0TxBhLxyjWqje3Ybnohh+Y8S4BvOi2mt8SMXhd3VI39XFg0O6
 zk+oEje0Pij2DzvqdoIDh8VFNq+0hEoXvr5q4CzvFoDIm8q01Ty1Y7Yr0XOxmLf88dY6
 eMuSy8o+j0ABX5F2GLW6S0y4ml3GKGy7dy3rErWh9EzbyfB0x97W2uu6xVHds5rGbqJE
 Gwi/HNc4m7xAja8EWRhwyKpVXQvS3ELd3aP8nwuxHYIpsibf9XInfa3Es+I3XdEIFUJY
 TEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cxLWjS9rw2dbUJ5Mao99KZZP4Ha2WG+mka8EA8GPkLQ=;
 b=gpa993iP7fEEw5GX+OU4danCcdw4tTPZx7xWLtkYlolQtijb60vjRVSz6btXAo/+Q9
 8D3faYdQy0Lqk+kquopjnaqrmMQDu1M00TxkMsJmfPF5bB5FeYJ81AsNGFgXLyGG0nR5
 LOlSi/7+krj5+J2nzeHPjq2dHsDDCYp3+8piF6QnFh6LQbOr+b5q9WDc8Ci+f9n29/4M
 9PL0quFYygYqJY3iEvLAtxhUlyNcGCrz+uVLXn9vnTaaEU8WhWkuIoR8IwYeyKUWmI+A
 NjVHcICtv8LJZxwHVQfMpA9JyJFWbkCxJp+DyQwKPrS8B3KGZgYbb3Nc0Z8r6nVMJgIW
 Y25A==
X-Gm-Message-State: APjAAAX5blwqHatcZwqHUZMbKpwPLlur5L3VpVPELaMQis6WZZHXpD5W
 fmUtZWR+7GWmqzBmLojYajA=
X-Google-Smtp-Source: APXvYqzZrBpwU32I2VMY6j+WyZGG/d2rirtJd6hXGlB0KQ84KULzBIzuxcsgbKhGZcuJiZPBfnqt0w==
X-Received: by 2002:a5d:558d:: with SMTP id i13mr13579849wrv.364.1579445794806; 
 Sun, 19 Jan 2020 06:56:34 -0800 (PST)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id p17sm43347877wrx.20.2020.01.19.06.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 06:56:34 -0800 (PST)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add new series Micron SPI NAND devices
Date: Sun, 19 Jan 2020 15:54:28 +0100
Message-Id: <20200119145432.10405-1-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200119_065639_220855_4AF95D9A 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

This patchset is for the new series of Micron SPI NAND devices, and the
following links are their datasheets.

M78A:
[1] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_3v_nand_spi.pdf
[2] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m78a_1gb_1_8v_nand_spi.pdf

M79A:
[3] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_2gb_1_8v_nand_spi.pdf
[4] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m79a_ddp_4gb_3v_nand_spi.pdf

M70A:
[5] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_3v_nand_spi.pdf
[6] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_4gb_1_8v_nand_spi.pdf
[7] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_3v_nand_spi.pdf
[8] https://www.micron.com/~/media/documents/products/data-sheet/nand-flash/70-series/m70a_ddp_8gb_1_8v_nand_spi.pdf

Changes since v1:
-----------------

1. The patch split into multiple patches.
2. Added comments for selecting the die.

Shivamurthy Shastri (4):
  mtd: spinand: Generalize the OOB layout structure and function names
  mtd: spinand: Add new Micron SPI NAND devices
  mtd: spinand: Add M70A series Micron SPI NAND devices
  mtd: spinand: Add new Micron SPI NAND devices with multiple dies

 drivers/mtd/nand/spi/micron.c | 140 ++++++++++++++++++++++++++++++----
 1 file changed, 126 insertions(+), 14 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
