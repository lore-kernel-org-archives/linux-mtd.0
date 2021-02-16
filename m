Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AE2C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 16:29:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C6B364D79
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 16:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C6B364D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nprr4n2qD27tw9ppw3ycXG19HcISxtxk9VfC3I22AUY=; b=uA59bq2POjzJK2g6CL0i+DkaMb
	aIEwLGcdLn4AKz3VJCmXEYe8Lafhxi9DxJzjjXMK1JWJB8we3htkYnVQRfIUeXg2npy6UkY+WNDD8
	Al04kForccOvXaCK7KV0Nz8BerVJpqSpJ4oK5cJCrjvj+v0YjHqzI7PLvXuw+5yJ/0CWeDvz74PPQ
	k+PKlcqKnlAA/vyUDsJ7BpqLP3uPKnotPnRObhBjsL2tOOr3HwikOeplv9WhToyWaIONkX6P8jDeY
	lNh9Hx4Ih47Ken/drXGDAE8apVlO2jGVJZtEePCE3wanLT+fsa4KmLj8gdHUn4O8lxUlF7Og/+Mg+
	mC6ePR9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC3D1-0002MH-Rt; Tue, 16 Feb 2021 16:28:19 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC3Cy-0002KK-3z
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 16:28:18 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BCCC522248;
 Tue, 16 Feb 2021 17:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1613492894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=GagM9WdMfz33aie7QH1eVG9LgSqmihow7mI6uFthL5Y=;
 b=uv2mt67W+kK8JKh7djZuT7Wp0mBYuTmI/2bX8+l37Z6swenzZY5mx1k7xbACS5H8qQIhpL
 Kso05zfPo9hHJvsD0fYM++qaOMiorg5AVizlzBKDV8BD5X/wN+K4Hr43KgUjHsgKZHyFJl
 /P8rHUmO4EP3G4+cVVd0ZRnaEl5zy1o=
From: Michael Walle <michael@walle.cc>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/2] mtd: spi-nor: OTP support
Date: Tue, 16 Feb 2021 17:28:05 +0100
Message-Id: <20210216162807.13509-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_112816_289649_2A64A6D3 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The first version of this patchset was posted over a year ago and since
then, there was not a single comment. I have to admit, this is rather
frustrating. I've now stripped down the patchset to only two patches and
moved the code into an own module otp.c. If you like, I can also add myself
to a reviewer for the OTP code.

This patchset implements the MTD OTP functions to allow access to the SPI
OTP data. Specific support is added for Winbond flash chips.

In the past there was already an attempt by Rahul Bedarkar to add this, but
there was no response. These patches are slightly based on his work.

https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/

Changes since v2:
 - improved commit messages
 - add buffer size check in spi_nor_mtd_otp_info(). just to be sure, the
   buffer is hardcoded to 4k by the mtd subsys
 - moved all code to otp.c
 - dropped the patches introduced in v2

Changes since v1:
 - added methods for Macronix and similar flashes
 - added patch to cleanup/consolidate code in core.c

Michael Walle (2):
  mtd: spi-nor: add OTP support
  mtd: spi-nor: implement OTP support for Winbond and similar flashes

 drivers/mtd/spi-nor/Makefile  |   1 +
 drivers/mtd/spi-nor/core.c    |  10 +-
 drivers/mtd/spi-nor/core.h    |  56 ++++++
 drivers/mtd/spi-nor/otp.c     | 313 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c |  17 +-
 include/linux/mtd/spi-nor.h   |   9 +
 6 files changed, 403 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/otp.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
