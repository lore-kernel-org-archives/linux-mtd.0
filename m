Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EE1C4727C
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:38:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194E82072E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 16:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hryOyNyt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="ZNPdo82N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194E82072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rPhWjUD9UGHJrPXAChmaudYpbedL6G1bAEgUHMSEPiQ=; b=hryOyNytOVuMCjHcAA6voBGkLt
	vNAggz/kDCoffoYybNyWSylp/gCF9o/g5/xdGdDr2sHDe2vzD3M/3IeXE+a7cmuy1YueEYLio1JLl
	kPst8NP/l1GbluOIktiwuMk37y5Wj5ybDwxqtyn2zgSHoQaGrQFcstqPvXE1T+/wRsyFacOMkgnSJ
	cLKtOlOeDr1VUAfbdQhbyuhlT2bkK6cpP4WcqrrT1vJQ/GtCnPy3qdq7G4YUQ0lgusjldQIEpDRm2
	pTELMp2dU03YJM0vkDNpzyJheIinq9nuOzQCUUWBzKW1lwz0LhOWnFwLpeKXO7sM65cgYLylDVLr1
	Xk6VQtcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNf6i-0008VV-9C; Wed, 30 Sep 2020 16:37:32 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNf6d-0008Tl-Ha
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 16:37:28 +0000
Received: by mail-qk1-x741.google.com with SMTP id w16so2052619qkj.7
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmjGHJDSLD445MzK0ZHH2zcKo0LcYsCTK8O0XEHvNPE=;
 b=ZNPdo82N4SU780DChitWi8IdWj1uilBva+gKWUJp7WtVYMQl/FWldvXPgZc1lDDjXE
 lsdLn3sUMMsiGMWJS3vUxCpAjCzu3ee8/YHfMJYmbhpeZNkozrPGiG4tYB63ca0Knp9A
 RSXB9zkgG/YmDpqZOWkeC/rWs+YQcCoDo585Uzgk/sn5KiCmlSdEqUIxPgdau//d1UBr
 m/0T1z5K5k9T/gP/7nWZ8T++e+x0m4HmWPQYdXXWPCGglKZ4yIZjFUaqDwG7k/DqAHWl
 wfIcsRFjT9G+7oCbJmvGCJQqvvD1hd7BMQuLiLYOh0bCQztF508sWsFRF4RHjzsusA+c
 s9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmjGHJDSLD445MzK0ZHH2zcKo0LcYsCTK8O0XEHvNPE=;
 b=A5EyiIVvooeqTCJ5e2JX54pPjxe8mi2mgM2gJNwY6y3q0t2XY777fwLr5KlwA8fKcb
 XHXH+z6cS7LtLdf3OVIYMZpIvcoy+bSDhieUgPtFT1Dl1ECDT+6nj19gbz9IznVe0Ybz
 Rcdqw2QfmPco+5+pHI8AEzly4VRQqNVN45kKgfNcIsbTFLxDLg6dPBl8wj6AkZblTNfi
 X5tTcYPWnrJXOYxD8rsY1r+x06zU35KAkXvN5bp8Ymxdw8s2Q7zxoJZlrCF/ukB0vSIH
 dytyJC99maKyKnpSJoVSLibZsKsDf+obE2JuC7oOZHCcXVaPoYknmygB9+fj7SfZUqXw
 I2HA==
X-Gm-Message-State: AOAM530eO/4/6qUC0XYrmp1QH6667tM7JPAuEy+y/1nhT0tZHNQNL5zN
 I5OsHNIGc4J8eOXXK/6nJfVt1A==
X-Google-Smtp-Source: ABdhPJzoQW+QOAXSW4qUUeQ7QJhtqjRQPlaHbp/YPlLigwsavTETXvSTJGoET2Tvv7aWSe2XnvlmsQ==
X-Received: by 2002:a05:620a:40c9:: with SMTP id
 g9mr3424578qko.262.1601483845694; 
 Wed, 30 Sep 2020 09:37:25 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id u13sm2816333qtv.57.2020.09.30.09.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 09:37:25 -0700 (PDT)
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
Date: Wed, 30 Sep 2020 13:37:12 -0300
Message-Id: <20200930163714.12879-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_123727_895521_1E2CFBD3 
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
