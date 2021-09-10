Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87408C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4600A611BF
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4600A611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jZng90xqG/QlBBWmB38o29bFVIKayNsevFrr1U3Emag=; b=PPywgih+U2ZYn4
	gsRYd6KinFkrbWq9LgREy7B1KayHj6q+huO7BvPEjKrl+RvwMOzgSzOafvc3bnR/5G6r/M4C1yWYY
	jRERNwleumCK8a/DzYRgtg7g6qAFtYZudBLlHMY3JvguSMSFECkduvkrdJLlYHbqmWT2Ip6QAD28C
	ayzRVxThmkjNS4wMn8I5nt6dr2AlMro4kFp/M8JugwfCvrIuxjT+KnYTfKCX1KNF5IhuKru9+wbA+
	Z+Gw5cJZ0Qp2HcB1rzWY187N5LDK00z/gZhNa+CupSc3yjj9z4ciLM6YcDS7x3PW+8oXpsnxwj5Jo
	8vhdfmma+Q7kZixiuP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOnqt-00DpIh-RC; Fri, 10 Sep 2021 21:14:27 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOnqq-00DpHe-Lx
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 21:14:26 +0000
Received: by mail-qk1-x72c.google.com with SMTP id f22so3576591qkm.5
 for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2021 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sqZcZR17P2dgswq0gkDIXLccmz/87IO72um3/6azrvg=;
 b=MK4SuwJqVYgpOuBcf96CoCyZyThtf83uMH7WXOTLeeNFEsHvt3q5Bezs8yGbc2b66g
 7VWXTnB0ag0YKdgHpe7vFCV1O7lmcQ2rhuAxtJmKwpXphUmQdmOOBXN4FVnqoL9Skw4F
 RYy5+Udm3pJTW9ARyozN9lcByNlc8kyDdwsouMYUpjtpHLQqi93cgVGQq6OisMRoxbgn
 X59vogVCV891OHL33BtwdOJ44jzf77H56taZgx/fB+kQxLGlam7PMuYnjnXL8bI4BlKc
 e7fQUkhKL2ROHRfuwt5ktZgVlcTn1qkIkRCPh9tn6uX5yGpJINoWlnnvWJq/4Xi/v4+9
 F3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=sqZcZR17P2dgswq0gkDIXLccmz/87IO72um3/6azrvg=;
 b=aP+6VY9HKKp3nRLr8OFjiDf7I9TVScs7LlDVugwbuAsaG6f7VQ7ZGkTkpYi+UguVFW
 8FSZx7EuC+ppj4d2rF2yDGEOw+5fVQ1HnUa4SJrnmANW6lJEGUP4XbpRK311WNwln1eG
 X+5HYZPKl9LQEu4nKlwXccq5sjP/vX7yXYaGagIh0NXqFN3UIPl/3Xtx6j8jGnruEgP0
 i3bjNY+zwFXCtyyi67fFD4SctNsxmUmxaLOpTMq69oq3do9Gi3vaIYlbUAIqybfjUEYS
 2/U8TPdRU2Hw1cWEQwOMuWBdTLT0uhziNjEdWsd+3kxs+/POZdPugH+NOxjWO0JT/fsk
 M5wg==
X-Gm-Message-State: AOAM533EKT9/kpJ/E4f61HAorl3duWRcya9J5k25HV1fD32VMQSYC6dX
 5aFQOuj1Mq7X0E7pTugB+XxDv9k+GiZVcgET5M9LI0w7fBSfxD+E2GeApd8X7kB6N4dHPclBbjL
 AzUuMFl2bIgsSfcWyO9/fhhroWV+xIvLpwEAUSa3PmyDuHjB8UKFK2bER6SehcOUpV0Br3Msthh
 EDYCkjiH4sXcL+
X-Google-Smtp-Source: ABdhPJwc5HPq8C6/9H1A/R1dEr9INdQu164UzCln+kMWtw7mljuXcAyzRJKrpO+nqvOPzrG9Sjbyow==
X-Received: by 2002:a37:8183:: with SMTP id c125mr9992311qkd.134.1631308461093; 
 Fri, 10 Sep 2021 14:14:21 -0700 (PDT)
Received: from localhost ([186.122.181.76])
 by smtp.gmail.com with UTF8SMTPSA id h18sm4484129qke.6.2021.09.10.14.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:14:20 -0700 (PDT)
From: Mauro Lima <mauro.lima@eclypsium.com>
To: linux-mtd@lists.infradead.org
Cc: daniel.gutson@eclypsium.com, richard@hughsie.com,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, mika.westerberg@linux.intel.com, mauro.lima@eclypsium.com
Subject: [PATCH 0/4] mtd: intel-spi: split read/write modes
Date: Fri, 10 Sep 2021 18:13:44 -0300
Message-Id: <20210910211348.642103-1-mauro.lima@eclypsium.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_141424_794301_E2A5B2D7 
X-CRM114-Status: GOOD (  10.30  )
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

The purpose of the following patchset is to split read/write
functionality from the Intel PCH/PCU SPI flash driver.
Being able to use the driver in read-only mode (harmless), the users
can get important firmware information from userspace which also
includes being able to perform firmware attestation to verify
integrity.

Currently fwupd is accessing to firmware information but only
with SecureBoot disabled. With this driver the fwupd project could
get such information with SecureBoot enabled.

Mauro Lima (4):
  mtd: intel-spi: rename intel-spi to intel-spi-base
  mtd: intel-spi: move chip internals into a defs.h
  mtd: intel-spi: moving write/erase functions
  mtd: intel-spi: add read only stubs

 drivers/mtd/spi-nor/controllers/Kconfig       |  50 +-
 drivers/mtd/spi-nor/controllers/Makefile      |   3 +
 .../{intel-spi.c => intel-spi-base.c}         | 442 ++----------------
 .../{intel-spi.h => intel-spi-base.h}         |   1 +
 .../mtd/spi-nor/controllers/intel-spi-defs.h  | 157 +++++++
 .../mtd/spi-nor/controllers/intel-spi-pci.c   |   2 +-
 .../spi-nor/controllers/intel-spi-platform.c  |   2 +-
 .../mtd/spi-nor/controllers/intel-spi-ro.c    |  50 ++
 .../mtd/spi-nor/controllers/intel-spi-rw.h    |  24 +
 drivers/mtd/spi-nor/controllers/intel-spi-w.c | 289 ++++++++++++
 include/linux/platform_data/x86/intel-spi.h   |   2 +
 11 files changed, 595 insertions(+), 427 deletions(-)
 rename drivers/mtd/spi-nor/controllers/{intel-spi.c => intel-spi-base.c} (54%)
 rename drivers/mtd/spi-nor/controllers/{intel-spi.h => intel-spi-base.h} (97%)
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-defs.h
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-ro.c
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-rw.h
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-w.c

-- 
2.31.1


-- 


This e-mail and any attachments may contain information that is 
privileged, confidential,  and/or exempt from disclosure under applicable 
law.  If you are not the intended recipient, you are hereby notified that 
any disclosure, copying, distribution or use of any information contained 
herein is strictly prohibited. If you have received this transmission in 
error, please immediately notify the sender and destroy the original 
transmission and any attachments, whether in electronic or hard copy 
format, without reading or saving.













______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
