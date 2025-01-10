Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F58E7719D
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Jan 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvSjsL+bVHpDlaaIQWTDvTWZf2JPJ/Tsm/8o8L/9HRo=; b=agqQlgEKxXkhRp
	d7n0ax9XkI72QvwOLo9bdhdWz0dcGKfIDBAUtkDI/LeKnDLsgIJvn8sU+botkRA7ytAD2TGoATNzr
	4H3UYUcdzD6msMNQWGHLfPZ5s1ZmC077JykEgFz8ZD2BV0ore6nSGkL0psxEKF20iXUTMGp/MWVE1
	IFNwUF0J6uAQUplSxwaHhihrz41apmrDX3bMSxFAycQG+mWvZS2VtxgPNcb2Tk04XZu/aARLEYD1S
	k45VoOfum8jVQUH4M0nb9QpfURf/0sFaABV2b7edV1xZmlVGU+Jubltjoo2DyhN7ZofrtbtpbwhuV
	9GVHuihdKhnZTA40PdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGoC-0000000FsMu-2br0;
	Fri, 10 Jan 2025 15:20:24 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGKN-0000000Fhw3-2gQS
	for linux-mtd@lists.infradead.org;
	Fri, 10 Jan 2025 14:49:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9CC24FF80C;
	Fri, 10 Jan 2025 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736520574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fyxRvbIJ78XhrIA92AOUArSspz/JzVkpzpIQ04lx1Nk=;
	b=GCL0RWrHj/bBtTJLaVNAZTFZUYv2GIwC9hSS39a3SEweG+NruhCrCZY2viokTM10ZCqHiv
	zkYgul7lL/CriIXoqz65mlF0CbZBks93aFy5Ob0YLARsgoKuKVKViTNLL6y7LWVQPVwJ2k
	QI5CVFQi17MjR6JIDMFXKhBzQpgFlvRqKG/CoZpSxoOjhuCE7nycCpEyitEzIWKCvoipAw
	mjWgPgM/KxBJRnzsL1kA7hnDc6MxYrIY1xAw1lU3IfvPY+ZBq1z5M+JiCQvqZVX82jdfjW
	CZRvrESsQVOUErHS6yfMu5PE/b67SxSm7apjC9LKYkTfqTRLjCUCh+4ABAAcJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: winbond: Add support for flashes with
 several dies
Date: Fri, 10 Jan 2025 15:49:29 +0100
Message-Id: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHkzgWcC/43NQQ6CMBCF4auYrh3TDlDBlfcwLqBMZRJsTSFVQ
 7i7hYSFO5b/W3xvEgMFpkFcDpMIFHlg71Jkx4MwXe0eBNymFigxV4gZvNk13rWgQSEEo8D5ANH
 39cg9QcMjWFvLzBRaNxWK5LwCWf6sH7d76o6H0YfvehnVsm56vkOPCiTYs8lba7VWJV4b78ee3
 cn4p1j8iJtZSCWrPSYmk0rTylKhpZz+zXmef86f1B8oAQAA
X-Change-ID: 20241223-winbond-6-12-rc1-nor-volatile-bit-ffa03c566b92
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064935_834489_5127463A 
X-CRM114-Status: GOOD (  10.37  )
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

Some Winbond devices are made of up smaller stacked dies, like for
instance W25Q01JV which is a 1G-bit serial flash memory made of two
512M-bit dies, and W25Q02JV which is made of four of them. Internally,
the dies can either be in the active state (only one at a time), the
others being in the idle state. Problem: there are commands impacting
all 4 dies, for which we monitor the state of the chip reading the
status register, but the status register only gives the status of the
active die. It was observed a possible internal deviation of up to 200us
between each die when doing similar operations, which can lead to
races. This series aims at supporting these chips properly.

---
Changes in v3:
- Moved a comment one line above to be aligned with the other multi-die
  chip.
- Link to v2: https://lore.kernel.org/r/20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com

Changes in v2:
- Rewrote the commit log to clarify the three alternatives.
- Changed the fixup hook to use the post sfdp hook.
- Added a comment explaining what is the use case for the (multi)die
  select function.
- Fixed the return value of the ->ready() hook to include error codes.
- Renamed the helpers with the winbond_nor_ prefix as many chips with
  totally different names are impacted.
- Moved the assignment of the alternate ->ready() hook to the the
  per-flash post sfdp fixup hook.
- Dropped the no_sfdp_flags redundant information.
- Dropped the flash names from the table (but kept them as comments).
- Link to v1: https://lore.kernel.org/r/20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com

---
Miquel Raynal (2):
      mtd: spi-nor: winbond: Add support for w25q01jv
      mtd: spi-nor: winbond: Add support for w25q02jv

 drivers/mtd/spi-nor/winbond.c | 88 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)
---
base-commit: cfb48994051444aa6b620e48898f95ea91d193c5
change-id: 20241223-winbond-6-12-rc1-nor-volatile-bit-ffa03c566b92

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
