Return-Path: <SRS0=TepB=IE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30D5C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 557E3650AD
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Mar 2021 00:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 557E3650AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d9heV0HO8hdKayGPW/+VsW8yXBZctpfNHQqdU+Gtma4=; b=f/ePWr0ARGlmJMSXtGofUjp9ev
	TsmHrIpn9wwhPuxxBTCDMM70b+5l2YMo2byy0lNHe6/oQngYQ727xtsp18IP5zx6hc79zycOtXkGH
	ui4WH8T4N6kbAxp/LbcMzIupqPaDr1nI0uRoKTxrFjKIeE9pBmrbkTPE3HAQpPfhU6rG7GWiP55dv
	fDjt+35/v4iBe9hvmGP0Ud+qZF1sFWZIIys6V1K0Q+ISuDM/Q+8zegz1NTeY32j0GzNmwCyxRpqzg
	OIbkHAH+3GU3SMg3CQu4hTuDb7XJsanRidUf1uGkAwccHTF8ZOLg+isbe3n+4MDaLCeOve/UizVDy
	bCi126Eg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lIKT8-00HHhv-GX; Sat, 06 Mar 2021 00:06:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lIKS2-00HHEI-VB
 for linux-mtd@lists.infradead.org; Sat, 06 Mar 2021 00:05:54 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 144DB22205;
 Sat,  6 Mar 2021 01:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614989146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7Uoux/O1JWx+NLbrxspPKrHa/J//QkiAqvm8Eira3vg=;
 b=GwWx8WXP9kh/IPmsql821t23VrYqfX66wYLwdOyrg+qz7DB2NKGotL2loKOe1wXbDE7xf5
 D+GGfapUc3JHlFAvPOQnC92T2T+nkqREhTkYq0DT5Aeps5yizTHtv0hpx9RGCBTHlMu3v/
 UYYd5V3cisV7bjHsicgXjaWiGVa6z6k=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v4 0/4] mtd: spi-nor: OTP support
Date: Sat,  6 Mar 2021 01:05:31 +0100
Message-Id: <20210306000535.9890-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210306_000548_999102_CA500742 
X-CRM114-Status: GOOD (  10.99  )
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

This patchset implements the MTD OTP functions to allow access to the SPI
OTP data. Specific support is added for Winbond flash chips.

In the past there was already an attempt by Rahul Bedarkar to add this, but
there was no response. These patches are slightly based on his work.

https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/

Changes since v3:
 - remapped the OTP regions to a contiguous area starting at 0. The
   chips/cfi_cmdset_000[12].c remap the regions, too.
 - with that in place, read/write/lock/erase spanning multiple OTP
   regions are possible
 - picked up Tudors review remarks
 - added new erase support as RFC because MTD API/ABI is still missing.
   Feel free to review, but don't apply it.

Changes since v2:
 - improved commit messages
 - add buffer size check in spi_nor_mtd_otp_info(). just to be sure, the
   buffer is hardcoded to 4k by the mtd subsys
 - moved all code to otp.c
 - dropped the patches introduced in v2

Changes since v1:
 - added methods for Macronix and similar flashes
 - added patch to cleanup/consolidate code in core.c

Michael Walle (4):
  mtd: spi-nor: add OTP support
  mtd: spi-nor: implement OTP support for Winbond and similar flashes
  mtd: spi-nor: winbond: add OTP support to w25q32fw/jw
  mtd: spi-nor: implement OTP erase for Winbond and similar flashes

 drivers/mtd/spi-nor/Makefile  |   1 +
 drivers/mtd/spi-nor/core.c    |  11 +-
 drivers/mtd/spi-nor/core.h    |  64 +++++
 drivers/mtd/spi-nor/otp.c     | 453 ++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/winbond.c |  18 +-
 include/linux/mtd/spi-nor.h   |   9 +
 6 files changed, 551 insertions(+), 5 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/otp.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
