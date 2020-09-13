Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C28C43461
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DC9221F0
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 16:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IzOBc1Aj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVb33OPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DC9221F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojJ653D9sLVHRX6PdYSJb65TO/dCFzfKLw2gBf7tAEo=; b=IzOBc1AjmuAG/0h8U7Rc5fib+Q
	YvUVhAmlrDktG/czgBIUNClsSD/IwjVuMoqnRod/czYhmuNB8tekDP5wREeJBwFASDRgZ/D0tiDkL
	6ADZwj7i7z3lO6ilDix9QIaD0Ox7dEvxMqWDK+kGXPpidXZGuKuehvXoRtfuwC+BDmBB5CYXO5pkE
	JYmFTEQNHmcN6Og09dWsma0g5czUOGlyGettcn7M2XPbSWMRoWtcmXXt1Clpu9ka4EqYCoTxHcrd/
	LNAPnL+5VES7HbO1ML8S5vuml509UP+peuOnwphxCyLlcAPnaRiLaPlOzM6jlzKCYU6WUx3RMzJHV
	2ny7Gc4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHUfL-0004k0-WC; Sun, 13 Sep 2020 16:15:48 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHUfJ-0004jR-W9
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 16:15:46 +0000
Received: by mail-pj1-x1043.google.com with SMTP id s14so296685pju.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxRhW0q4qHba4ZEu7vFkAhq6kKTQeSQtKSIqomEo05s=;
 b=IVb33OPbuWUMxtLqCPROtKsWJGRe3DLaIo11HwC/99jf1H4P6CQyAM/meGhHnXcO4Z
 SpsJ6luI87yqCMKxCuEbEtOrVCDFJgv4xL0JDzcSMoEp9Gupx3DTbgtiRp7aYm8hoOq+
 y7Wjz9GP3obFYwrOtjuE4204K1DEsEvY0xDw5sAWOqRSot7thugx95kRLX1oC+dHE468
 ZB9PTjkktrVq6KJrOXPjYaUQmxXeEUfbzq9ib542IP5sIT4i6TzyLuN/WLtchSUCzxPp
 U9NHBR1QpqYkqKEkGNQS0nXtpBZA+02qkyWPJrpMd4kWw8h7JkRJ+J5kSDEl334qut6x
 clfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gxRhW0q4qHba4ZEu7vFkAhq6kKTQeSQtKSIqomEo05s=;
 b=g6KrG018t1sdECbE9OHNU/JOR7wu2VQY0YS9lKVk95b7GIMc6alE4eF+idXolYTMOx
 Jn5hYxelChUN1aNwSY5cet2OnVu4qykMXryVLZvwCmV6hu5dKXZoYe4HidmpdGpM7nVf
 imFKba6LBVImRyn+ZhdFGsm4ef0z5jZGkcHYTm9sNcxqm6dYbYV35uxKfNa00tgVukob
 oYOjRdysFP7EzZFvIR8vcV9U4ZgFhG/MGvQVvlI1HjXPawj1ffYQ7wdoE31i7XrWZGpN
 rMajCXi4HNgz+IG9/gC+kkgl8pRsJ3lAzzqWU8upiO9jP/nY6BMs0RGG8sSh0OrlV+jc
 Qe0Q==
X-Gm-Message-State: AOAM531eZ6zE3k/PjMHDBWLgHl+j3BKFE8oos3Eh26yRmf05RvFYOllt
 84n8BZLe4tUF/1yQUFqlaJg=
X-Google-Smtp-Source: ABdhPJworav/VebiBiIRtBtZQXgd4+pygu0xh8WhqVaUZ1eVeTVt9Lmr6KCC5X5zwK/XXBPjIYpR1w==
X-Received: by 2002:a17:902:fe08:: with SMTP id
 g8mr10563529plj.122.1600013742075; 
 Sun, 13 Sep 2020 09:15:42 -0700 (PDT)
Received: from Thiru.localdomain ([27.104.143.83])
 by smtp.gmail.com with ESMTPSA id c202sm7833953pfc.15.2020.09.13.09.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 09:15:41 -0700 (PDT)
From: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for micron SPI NAND MT29F2G01AAAED
Date: Mon, 14 Sep 2020 00:15:31 +0800
Message-Id: <20200913161533.10655-1-nthirumalesha7@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_121546_046023_3E6C395F 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding support for Micron SPI NAND MT29F2G01AAAED device and generalised
the structure & function names as per the review comments

v4: Split patch into two parts,
    1. Generalise the oob structure & function names as show in v3
    2. Add support for MT29F2G01AAAED device
       a. Add oob generic section check in the function micron_ooblayout_free
       b. Rename mt29f2g01aaaed_* to generic name micron_4_*

v3: As per the review comments,
     1. Renamed read_cache_variants as quadio_read_cache_variants,
write_cache_variants as x4_write_cache_variants/x1_write_cache_variants,
update_cache_variants as x4_update_cache_variants/x1_update_cache_variants,
read_cache_variants as x4_read_cache_variants
     2. Renamed micron_8_ooblayout as micron_grouped_ooblayout &
mt29f2g01aaaed_ooblayout as micron_interleaved_ooblayout
     3. Generalized page size based oob section check in
mt29f2g01aaaed_ooblayout_ecc function
      and separate case check for two bytes BBM reserved in
mt29f2g01aaaed_ooblayout_free function
     4. Removed mt29f2g01aaaed_ecc_get_status function &
MICRON_STATUS_ECC_1TO4_BITFLIPS

v2: Removed SPINAND_SELECT_TARGET as per the comments & fixed typo
errors

v1: Add support for Micron SPI Nand device MT29F2G01AAAED

Thirumalesha Narasimhappa (2):
  mtd: spinand: micron: Generalize the function and structure names
  mtd: spinand: micron: add support for MT29F2G01AAAED

 drivers/mtd/nand/spi/micron.c | 144 ++++++++++++++++++++++++----------
 1 file changed, 104 insertions(+), 40 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
