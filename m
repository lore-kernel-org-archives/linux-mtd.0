Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F27CE8D6A
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SGZyesHwC+92M91ix+DTBRzYXESfi1tE8juIcsF0Skk=; b=l4HMpHS56s+uzI
	5j9U6M1QSRHDd1L1BmK4/vyNkCIIyA7lgo4bHPd4AeAp8bzz30hgiw7eL/2JWE7Hu0e/2VQagnv7g
	igYAo8j1K3pAcJa7U3gRx61s9XU0mruvMla2HdHkDu8ExjtHLPDpjbDW23QZrxCG3juB+0O2vt5di
	l+wgf/RbwFj3j77qvLc5LnMPeacQdPTCc6zvJCqyaRnS4d2YOv8wu5ug7YVN6D/U8yGxIu8WZ9QxQ
	QlpaSSnBu7aDG1S+k6wSs05fGmGSzhF+74BeuoDAywHydk43qIbjBN4cGm+wR2p3iGAms95edAxsQ
	M7vemlVVkhODXM71BjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzD-0000000Cswi-33uf;
	Fri, 14 Nov 2025 17:53:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzA-0000000CsvW-1Odr
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 844F01A1A84;
	Fri, 14 Nov 2025 17:53:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EAF36060E;
	Fri, 14 Nov 2025 17:53:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8F0310371986;
	Fri, 14 Nov 2025 18:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=I0m6j7r0a8lutBYkwziMVIWnO23oOzmLmH8gPoCHn9w=;
	b=DKJvEbK8Wnoypee72s7CKYQV1xOnYBmZzA0rQcUXIm+liQIAbgfBdcH6NesSdzfvGo4nQH
	8RWAxpiprJhB+KuBvlfdZA3m1NTVo9cimjTAyxmzX20GgiT+GfFk1vOAJGE8FxCh0nqqh+
	zYNdnQNbgy2cotLxk4BsyHpQi1H4cI3Spob+mh5qM6HewM61YXak0ykmGAKrYylcx5lPRw
	OPKNEKpfkBhhK11GoLtvP75Ee2pWeP14u4+eDvnhTVNePsnqWMsyWag3gIvbaHYtPkADR6
	CxrK8251OFIC3bsOJJEyvgUlSGQXpQw3zziRoqsX9nqmsp8CXAjcYpTEBgrywg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/19] mtd: spi-nor: Enhance software protection
Date: Fri, 14 Nov 2025 18:53:01 +0100
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH1sF2kC/x3MwQqDMAwA0F+RnBdY1Ba3Xxk7qE23XNKSgA7Ef
 7fs+C7vAGcTdnh2Bxhv4lK0gW4drN9ZP4ySmqG/94GIRtxFl6IJt4g0oa2EXgW1GPpecYohDTG
 POT4CtKMaZ/n9/9f7PC+yf0rybwAAAA==
X-Change-ID: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095324_534116_4AD40701 
X-CRM114-Status: GOOD (  16.31  )
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

Hello,

As recently raised on the mailing-list (link below), it seems that the
"locking" support in SPI NOR could benefit from some enhancements. As I
myself had to dig into it recently, here is a proposal.

First issue that I see, the MEMLOCK ioctl is not behaving correctly
in some cases, as addressed in:

    mtd: spi-nor: swp: Improve locking user experience

Then there is no clear explanation of the shortcuts taken by the kernel
in terms of uAPI, so there is an attempt to list them in:

    mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour

Plus, Tudor also asked if we could cover locking in the testing
procedure, which is done in:

    mtd: spi-nor: Add steps for testing locking support

In order to simplify this procedure, and because it got very helpful
during my testing/development, I want to propose additions to the
debugfs output:

    mtd: spi-nor: debugfs: Add locking support TODO: make the captures again

Finally, I am providing an implementation for the complement (CMP)
feature in order to allow finer control of the regions locked. This
feature is for instance available on Winbond chips:

    [core] mtd: spi-nor: swp: Add support for the complement feature
    [doc]  mtd: spi-nor: Add steps for testing locking with CMP
    [use]  mtd: spi-nor: winbond: Add CMP locking support

Disclaimer: it was much less straightforward than I initially thought to
get the CMP feature working correctly. I tested it with as much focus as
I could, and I am improving the test coverage for the new cases, I am
also providing extra test cases in the metadata of the commit (which do
not make sense to test for chip additions, but may be sensible show when
making core additions like this one), but honestly there are so many
possibilities, I may still be missing corner cases. I hope this will
anyway be helpful to others!

All the other patches are misc improvements or style fixes which I faced
and fixed during my development.

Link: https://lore.kernel.org/linux-mtd/92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev/

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (19):
      mtd: spi-nor: debugfs: Fix the flags list
      mtd: spi-nor: swp: Improve locking user experience
      mtd: spi-nor: Improve opcodes documentation
      mtd: spi-nor: debugfs: Align variable access with the rest of the file
      mtd: spi-nor: debugfs: Enhance output
      mtd: spi-nor: swp: Explain the MEMLOCK ioctl implementation behaviour
      mtd: spi-nor: swp: Clarify a comment
      mtd: spi-nor: swp: Use a pointer for SR instead of a single byte
      mtd: spi-nor: swp: Create a helper that writes SR, CR and checks
      mtd: spi-nor: swp: Rename a mask
      mtd: spi-nor: swp: Create a TB intermediate variable
      mtd: spi-nor: swp: Create helpers for building the SR register
      mtd: spi-nor: swp: Simplify checking the locked/unlocked range
      mtd: spi-nor: swp: Cosmetic changes
      mtd: spi-nor: debugfs: Add locking support
      mtd: spi-nor: Add steps for testing locking support
      mtd: spi-nor: swp: Add support for the complement feature
      mtd: spi-nor: Add steps for testing locking with CMP
      mtd: spi-nor: winbond: Add CMP locking support

 Documentation/driver-api/mtd/spi-nor.rst | 154 +++++++++++++++
 drivers/mtd/spi-nor/core.c               |  68 +++++++
 drivers/mtd/spi-nor/core.h               |   9 +
 drivers/mtd/spi-nor/debugfs.c            |  51 ++++-
 drivers/mtd/spi-nor/swp.c                | 313 +++++++++++++++++++++++--------
 drivers/mtd/spi-nor/winbond.c            |  18 +-
 include/linux/mtd/spi-nor.h              |   5 +-
 7 files changed, 533 insertions(+), 85 deletions(-)
---
base-commit: 1f046901101e2933086b76b1e75b0b53a8a39bc0
change-id: 20251114-winbond-v6-18-rc1-spi-nor-swp-865d36f4f695

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
