Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C388EC41513
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1xOopMHGvic9Zi1bQIUVZ75WqJ1KHZZDUYzCg1iBwo=; b=cGhogRT0kAkUGs
	3iFgp7bqsUaFT5rj8JBS6UNxUCs9upLAicZCr0dG6Of/CZIQkhNHWKjnQHfXCyOx7eUDCYYOW3+ak
	NJi5yNQ8ouDIprf+tdnra86s4f0o4W33SieITxJoX7BaFfFOi5UBFYOsSOPAOVqao+hQELjB5HrV0
	y7Edcil8ykS3/Qk4xT1k6QUkFEmhF3cLrG4uo9yFLxa5gsgFKCXuj3nJrL4cjGVMNgpTc6NOeGvFc
	gYGf7m4EQlaqIPMT3RWw+d4f0DcokCUeD6RAbJCSj2SC+gBJkT78AniD1oFPkjXCTMG7f+gfRRUSZ
	PkiRSrFuNK7pTqkd/fvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrd4-0000000Aykq-1W92;
	Thu, 27 Jun 2024 16:05:46 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMrcx-0000000AyeD-3LxX
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 16:05:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0134F1C0003;
	Thu, 27 Jun 2024 16:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719504336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QYwKfFuVfEDPUbH/nDNtXwE5eA7qz9E/MbTLiVp289E=;
	b=EmUsvlBWgEiVANm8K9Fi8pD1RXmP27VRkftq/qwSAjmLaeyy/wMms0/7wVmkDrXK3j3MgB
	I02o3Dp9QZkDbA+sSYADmZEQclrTEL8bNgBfveOdOo/7EmnlXdH0ZMxEVxSGYuszTgNlPL
	PKwB1BJRkH/3lanNoYwsBSMXU24JltgxdK+D7VaBfce0Lj1Aqy3nehxtw5OC3/IHvNzR4F
	c6Lm9QLrHMWgak3i+A03bFqOzmb3xa1GFM1VgQUWYATogSWWAFN/5ThZA6z9mGTCvQ5mVb
	BFEwI3bl56V72rSZnpn/3SAfX6l5KQkAoktdVNaxSULOHevrUarZ+jXbfZvLzQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 0/2] M5441x: Add NFC support
Date: Thu, 27 Jun 2024 18:05:27 +0200
Message-Id: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMeNfWYC/4WNTQ6CMBBGr0Jm7Zh2LAVdeQ/Dgp8BJhFKWiQQw
 t2tXMDle8n3vh0Ce+EAj2QHz4sEcWMEuiRQ9+XYMUoTGUiRUZYUfqYwey4HHNsah7pNjdEr5sR
 0q0zKlFuI28lzK+vZfRWRewmz89t5s+if/VdcNGq098qaXGVNVtrn5gK/5ep8B8VxHF8rSPP8u
 wAAAA==
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Stefan Agner <stefan@agner.ch>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719504334; l=1121;
 i=jeanmichel.hautbois@yoseli.org; s=20240608; h=from:subject:message-id;
 bh=t8JMjJ76rZOb873b3fDyoyUyWSpHdVrcU7ehVUjnDz0=;
 b=VNCOj7wadn5JCWvm8OagpcjDUGBmF5ihMkyIumXpLLsXZA/gvFqHr/GYymChR49vwqMW9wWcn
 on5g/GPeG1yDg6dJ21SmbjJlMApqGfaNXsjr9JoxdwSk0Qsm0U4kwB5
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=oMZuYhJzT0j5MI73RlNUVYaA8VdWpFR/Sao0JKz1D2I=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_090540_068399_A7FCCD49 
X-CRM114-Status: UNSURE (   9.09  )
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

The M5441x has the same NFC IP as the VF610. It does not support
device-tree, so a few changes are needed in particular at probe time.

A new variant is also needed as the Reference Manual states that the
NFC_ROW_ADDR does not drive CS.

Tested on a custom board with a Micron RAW nand.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v2:
- Removed uneeded ifdef
- Split the m5441x definitions in a separate patch
- Link to v1: https://lore.kernel.org/r/20240620-upstream-nfc-mcf5441x-v1-1-69b64807d7a6@yoseli.org

---
Jean-Michel Hautbois (2):
      arch: m68k: Add definitions for flash NFC support
      mtd: nand: Add support for M5441x NFC

 arch/m68k/include/asm/m5441xsim.h |   7 +++
 drivers/mtd/nand/raw/Kconfig      |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c  | 102 ++++++++++++++++++++++++++++----------
 3 files changed, 85 insertions(+), 26 deletions(-)
---
base-commit: afcd48134c58d6af45fb3fdb648f1260b20f2326
change-id: 20240620-upstream-nfc-mcf5441x-82e23b45e286

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
