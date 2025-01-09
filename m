Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B23E77197
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=drk1KfLAFlvE1v1Lds93o8JljHEWvsX1RsyGy5g8bGg=; b=3ajJE7Bl58vxFX
	6lOkZZs0V8Vit7gONUy6SaQzx34/vRIt2wrz8b7FkHpzNZd7GZYe9jOLfd/41J7YwpQwshjG+YhzJ
	2GLwPDx38/SYALA02YtO1OlE5HuHnJQLS5M1+0AUPjn5w/5GtYJT42VzNXDEN8LXmiNEtsPsIlrOi
	geQhzypVtC251Wpc05b0HkjMULCTFSo9akbgpTBXr+U3W+715kUJupGSfeJOje/e8/RIzxT9kZBbN
	L5lHi9+M0vqR7rjznkoo+1/pmuz3jjNNpwzuZiAXS20Db13KODvlr5AHrB2GWmr92fe/xPXTBQHhd
	IH5D2oWIbLYpbvpy/Hqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyyZ-0000000DCtg-1YkK;
	Thu, 09 Jan 2025 20:17:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyyW-0000000DCs1-1x1n
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 20:17:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BCB960004;
	Thu,  9 Jan 2025 20:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736453867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lHTN+uUxYUfvT79sn6Gh8NHpABxWPUlvw1WZHA4jj/k=;
	b=pS/7/S6cA5uPUAtq6enHNsyyrYCTupqBRqK8IEcDkG3M5iDeklu8qT78HMKBPN3HeBJzKh
	3uU5vBqRO9FAxHrgro0IIv40w3Lb7XB9aqdA1A3FuXX1JwXvkRnKGKjcP4wb+ObauoteOy
	IbHe0zZa4rr8EJn+yNzOA6Ig0YyTEw7wusMqrfSBgMnPFoGOqaNq7VSngZ9vVpltpIJKb/
	/f7tcl6guoIw6CtJQ2J08cy7/nnQjRwIA+axziityFHokyuFjVSzLeatNoiGd8F14UOdcg
	LfwnGJ4zxjermBs9J+I26rPNtj6ZMXMxEtPSv8AReZRFlXEU1Gb4j8F9MZivfQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] mtd: spi-nor: winbond: Add support for flashes with
 several dies
Date: Thu, 09 Jan 2025 21:17:23 +0100
Message-Id: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANMugGcC/42Nyw7CIBAAf6Xh7Jqyrfg4+R+mh0LBblLZBghqm
 v672MS7x5nDzCKiDWSjuFSLCDZTJPYFcFcJM/b+boGGwgJrbCViA0/ymv0ACiRCMBI8B8g89Yk
 mC5oSONfXjTkopc8oSmcO1tFre9y6wiPFxOG9LbP82l+9/aOeJdTgjqYdnFNKnvCqmdNEfm/4I
 bp1XT8wx0c81AAAAA==
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
X-CRM114-CacheID: sfid-20250109_121752_644990_A1E4EA7D 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
