Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC655C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF176206DA
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 23:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ljfViVV1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="DoQqlLAL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF176206DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H5YVh3RZz03H2/+KvaOGNkV26oH9UyOuJsHKSvDSLfs=; b=ljfViVV1Cd/Y0S
	ljLNYlFqusZaSHfjGFiwMAi9Yw4GFPQ5y98kfvnVc9ZsQB6goHaVYU25oq6kq7zqwso14nqtgKyuz
	PMr6tIt8lfU5STJ4B4NCu2XMycNcdFYPsZgE8S5z6DbSBdYEooF8DSH6BBd5+01AajSnwHAQ7xe2o
	4WXOZQwraUSFrGXOiCxBHZX3evLMtUGuyRBFFf4HdbkyVbah9Gz94ZvZxFr+IRU9nz1aSgSBZxERk
	p3+4+XA/4+KsruoUkkbWYvWrygp4EnuiVHLyMIrEZaGHmQQsfqMCte7vdRY3H7W6mr9KqcGiNI0eI
	j4Wbs95iBWJbaUiShEtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipKtL-0002To-FS; Wed, 08 Jan 2020 23:37:35 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipKtI-0002SL-70
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 23:37:33 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DB21823D09;
 Thu,  9 Jan 2020 00:37:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1578526649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yIKQUIBF+OZc7Hts35piuQ5vFTf1r8jv67Ut0VYsjMk=;
 b=DoQqlLALqK8p9E6ZVtLw0Ypcw3fzijH0EdqArOMoV4sGrZeFOON1xKSmGXfnFlMtb7vwwE
 gGJz1j7scBhqHdGGt+CDEvS9vUGZwpQZkwkd+hB9LrmhfoW8XQonYPYdmdZiWKXCoR1xIZ
 3nX9Qlcyu5CG26KL55It4/WUBsHZjVg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mtd: spi-nor: OTP support
Date: Thu,  9 Jan 2020 00:36:52 +0100
Message-Id: <20200108233654.29027-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Rspamd-Server: web
X-Rspamd-Queue-Id: DB21823D09
X-Spamd-Result: default: False [4.90 / 15.00]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM(-0.00)[-0.698];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:31334, ipnet:2a02:810c::/31, country:DE];
 FREEMAIL_CC(0.00)[microchip.com, bootlin.com, nod.at, ti.com, gmail.com,
 imgtec.com, walle.cc]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_153732_412561_1F9D2759 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul Bedarkar <rahul.bedarkar@imgtec.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchset implements the mtd otp functions to allow access to the SPI
OTP data. Specific support is added for the Winbond flash chips.

In the past there was already an attempt by Rahul Bedarkar to add this, but
there was no response. These two patches are slightly based on his work.

https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/

This series is based on top of the following patches. They are not strictly
needed, but the patches might not apply cleanly and - more importantly -
OTP support for the new W25QnnJW flashes, which are added by one of the
patches, is already added.

https://lore.kernel.org/linux-mtd/20200107222317.3527-1-michael@walle.cc/
https://lore.kernel.org/linux-mtd/20200107222317.3527-2-michael@walle.cc/
https://lore.kernel.org/linux-mtd/20200103223423.14025-1-michael@walle.cc/

To dump an OTP area which doesn't start at zero (like for the Winbond
flashes) the following patch must be applied to mtd-utils:

https://lore.kernel.org/linux-mtd/20200108232359.27372-1-michael@walle.cc/

Michael Walle (2):
  mtd: spi-nor: add OTP support
  mtd: spi-nor: implement OTP support for Winbond flashes

 drivers/mtd/spi-nor/spi-nor.c | 279 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  52 +++++++
 2 files changed, 331 insertions(+)

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
