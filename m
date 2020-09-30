Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD3C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E43020706
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KybS7w63";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="hSyO/kDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E43020706
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPhWjUD9UGHJrPXAChmaudYpbedL6G1bAEgUHMSEPiQ=; b=KybS7w63w01ZypZrRz6bonYnvR
	VyEhdW3W2LWmwqkWdQ1bqIGWbIqO54KCQGVKTHx1So9FkEya+ACbqxQHn3PbqTP/WQZYcgJ7cn7aG
	lWdy9M+A6YaHYboAnv3XYFQJjxqxaCYCcpUQyXLHI4tPCDu3aEzndoF7twFt5fMHto4+UHsF3BD0C
	6Cv65s49kVI7XjGGzoBHx0vnIhI8cQdnHWZiu9NDuYyfRkXqB0mYYhTiRwVVWpG4/aojDdgiS3m7E
	0wcO0V04zahrgccb+YU3Bbj8Jzr1uDC7QzsWq+bQ0fwWOv4Rdlvv53fPW7498QakOj24V4lM421wF
	FjW0xoCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNcVn-0006vX-IZ; Wed, 30 Sep 2020 13:51:15 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNcVk-0006tg-Sn
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 13:51:13 +0000
Received: by mail-qt1-x842.google.com with SMTP id b2so1191237qtp.8
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 06:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmjGHJDSLD445MzK0ZHH2zcKo0LcYsCTK8O0XEHvNPE=;
 b=hSyO/kDGmOQ7Dmh1PdLQbvlPl8ycNDTIn1QHxi3eKr0ds5wpxEMvKkn40uGFwY8neu
 UsONdpeiTq92eM4iwi38Hnk8GT5nIf969ie38Q1OV5zskMWvYsIWAx7vHrHbE5/n3Yo1
 AmSWvO9CaRxr0jfFSDMl7OZNrSzwsLmuyBIe8rkaZFsVhTutsflfL4+8+YYJZCRU+wL9
 ZIaMuD0ZzYTu/sXU62ZOUJtQ1ohKhuzbG3imcLqN8lLRuuQGiJ4HvaYgQ0Ce53+Do8JD
 JHhL00lvKeYhcAfvGoBxqVadyKZM5RSaHVgq/2+UjumxsJuhDYVfL8yA3uOHO0NdAnpC
 MTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmjGHJDSLD445MzK0ZHH2zcKo0LcYsCTK8O0XEHvNPE=;
 b=n1uHS3yzMlkcMEtDIzJzB4GTspsWCPtCRbcewouq/uyFBif6Iham1kL8jNWmKp4iYw
 kN0gpTZBHWLqnsDsJGfK1beNBYuWxOhQlPcgy9oJuXt54vvw9UzV4YgFVGcKgjZ5QjmF
 ZhG5x2inw9gHipJQk2t/bCHVZQ029Q5o+CRixE0XXmoxsIlwdJ4dwDbN9+ujnBzaslNI
 KFCLkH7Zwd0CbwgPO7vhE+9pqRpULQ2md1YLaOeJdE589EXNNMb8qkq617tNaPJgS1xn
 nFdUFZeD6V9eSUh+EeuYQxPR5K2KdDJ10GfapvQPmLoN+f93Zn7MeemLUyo8RhmwI+T6
 QYaw==
X-Gm-Message-State: AOAM532f3Iniis1CtpxTw87kc668tG3cnuieBMiFkKgmIDPUam4vyIJL
 Gtpr6nRtmCFstkTCaBC0Nla/qw==
X-Google-Smtp-Source: ABdhPJwLN3DrwH4o0moTLli9BNmHMEo1GZaRrJjuhOeQ9R/a6auEof7aMdctsiBBjokQL9ig2vG8hA==
X-Received: by 2002:aed:2b63:: with SMTP id p90mr2284241qtd.71.1601473869706; 
 Wed, 30 Sep 2020 06:51:09 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id y29sm2510008qtj.20.2020.09.30.06.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:51:09 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Hughes <hughsient@gmail.com>,
 Alex Bazhaniuk <alex@eclypsium.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Platform integrity information in sysfs (version 9)
Date: Wed, 30 Sep 2020 10:51:01 -0300
Message-Id: <20200930135101.5424-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_095113_241501_834DCF6A 
X-CRM114-Status: GOOD (  13.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch serie adds a misc kernel module and extends the intel-spi drivers
to publish platform integrity data in the sys-fs.
Please check the comments in the following patches of this serie for further
details.

Daniel Gutson (2):
  Platform integrity information in sysfs (version 9)
  This patch exports the BIOS Write Enable (bioswe), BIOS Lock Enable
    (biosle), and the SMM BIOS Write Protect (SMM_BIOSWP) fields of the
    BIOS Control register using the platform-integrity misc kernel
    module. The idea is to keep adding more flags, not only from the BC
    but also from other registers in following versions.

 .../ABI/stable/sysfs-class-platform-integrity | 23 +++++
 MAINTAINERS                                   |  7 ++
 drivers/misc/Kconfig                          | 11 +++
 drivers/misc/Makefile                         |  1 +
 drivers/misc/platform-integrity.c             | 57 ++++++++++++
 drivers/mtd/spi-nor/controllers/Kconfig       |  1 +
 .../mtd/spi-nor/controllers/intel-spi-pci.c   | 75 +++++++++++++++-
 .../spi-nor/controllers/intel-spi-platform.c  |  2 +-
 drivers/mtd/spi-nor/controllers/intel-spi.c   | 90 ++++++++++++++++++-
 drivers/mtd/spi-nor/controllers/intel-spi.h   |  9 +-
 include/linux/platform-integrity.h            | 19 ++++
 11 files changed, 288 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-class-platform-integrity
 create mode 100644 drivers/misc/platform-integrity.c
 create mode 100644 include/linux/platform-integrity.h

--
2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
