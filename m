Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424FFFF8860
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SG4ROyGeFTtTKbudjF0oKpKjPukS4bWP5EqKJzX8SIU=; b=W1D5PfeLla7O/B
	Kd65eai4dTOj/Q8/bT2Y7eumOyA+i68lfdNqmEPQIvkYmxREPhQ0M8So36md4+3xqKyXNxLMukgsY
	+Usg4UczgtppzizI+MSBqZ5WB2zuvz7clPmcxfmJ4sWCrvmANqk0z/sET7sOCf/Zst3IIyQ54rZFd
	L9moml0wTYGmdIsiI/g2H+cwt3uXzNsVGCtlIZUDs+nKHuvDX7IQ+kKcbFJIA6+1NqGpf4xsAXg6g
	lFzOuo1BTCl0sOABkjDdTjyVGzd/4AqkrejV4utGzOw9A5zwIw5ydj2J+6JQGayISNPLP2hOE+ey7
	yrDsoA457Z/+BLHPn93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUj-0000000GpPL-1JoO;
	Mon, 27 Apr 2026 11:51:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKUf-0000000GpO0-31Pu
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 11:51:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso108379425e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 27 Apr 2026 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777290675; x=1777895475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c9PGXNkAslwn5PF5hDFlY4Tr7da2SwHFO7xPTeUxuok=;
        b=TnhmMjgRYZpFbazK0UY9HrFLsdogPpgUdL5Gxt2gL7IzatGSyvBqzpYW9sl9clE+ac
         1ILNlOOD7ccbBB/pXaCk+GFlkIozxwxLhbV8RepYEfkvS+dqANnIdkN/72RhTdpaqU8v
         j5KRos8Q/AoXbELnRa+xnwnC3KLWarexu6kdTMWUcYWBrdHVDT934+9c04sVraKZrf6+
         VfFduD22vRHshjA8OaahbHWDU7SoOZueTwfMHcBqZrzi1rpR2f65GLDt6sMrj0k3LrWV
         eSWlKiEC+rtLJgJpjcX8rm3J4+i8z1CrPNI3DfWR+AhYS6TSMAs92wdsaTh2Anx63Aqi
         TvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777290675; x=1777895475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9PGXNkAslwn5PF5hDFlY4Tr7da2SwHFO7xPTeUxuok=;
        b=ezNCaQupoF/tBXAQJLbL2jzdGtJPvrwXc2AbGlU1pucstMOOTqBG6DD9FdgJiLGM8c
         BbPGK57pn+cC/8Cfhisa8lHQ8EFgsS348cO+hEDzda3U03Gh8CJtbZpUSDn1USZBnlli
         G4sdFepj1wIl2hYPwx3AM8iQBV8IdIFoWJnEE1rNkWjOGCMBeBT4jRG1ZozbSkBUIKIQ
         85RAZ71v9TcJefiugMNTlS/1cJz0MMZi0DCGEgNuDlnj98o9TDJ4sAoccOkSlSb/8jPu
         kKdW7iLeehllWVOFRglUxivQlPUbzRzOGj8qiU82yuDj4fFrylJjUdx00EOPBT32Tebg
         Ir3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+e6rAl8ECAljWVK7Zq4bh71R/Xs9MoykP1m9BCkmb+BTLUmTmAJO6g4efWtXYRQGHUuYwORIxqQ9I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxX3743B019B1a31dQGWgyZgLloPWtkqF4ii4JeYysDaUiBS+3Z
	tj74NHncW130E8CUlUzbzhOZ3EpCPywXJtIH71Zc8nK+iAcd/pv8HAY=
X-Gm-Gg: AeBDiesW3MGo5UGk/KfRp/vsTSc4eJxckH0iA1jmCvCFfLqxnvll/JchplJZwzhVoEm
	VZI0iRBhdRcEVW0i4mNr5q1w358eMcvqT9NRa7kQCv7mOh3eYfL1GmbVu6WRbJMw7JO+iMvTNc6
	w6G5f62oQzzrECfWhtae+VvlcgNmCfNpD9AARcmQ13NlgkXW96Gl8ruWZeMqm94Nq0EnSoKK8+B
	0pm6rybbYkVls66QI/vTibW6PrCMEY/F9wEXCZph/pwkLEIDFTTCt7rcSjzIpNbRzIDx1nYeJ85
	K/Za27lbRjsetmlgUpkrX18h8onguQ/yPujrQ44iIS1gAM2k5nsuen2DWCFvQBHKOtB0VQxRnBE
	2X7aLTzRqsYIGcp11onjGuUYknU4z/gjXk+rR7mJ50rMLSbLeX25Rdb7JUqnFziUC5oLkZouY/C
	hQXY7AmpzwTws5uqhQbJy4OuLvIZ/bWCn8B49CT1zZuHkg7NzKu2Fqel+ZxoUO8ZnJtkXUEenvN
	r4jLFFv01eo2L2j2bg=
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr476219715e9.5.1777290674926;
        Mon, 27 Apr 2026 04:51:14 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:3c87:b0bc:8c35:1ba0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4c221cdsm81399615f8f.0.2026.04.27.04.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 04:51:14 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v2 0/3] mtd: maps: vmu-flash: Fix build and runtime errors
Date: Mon, 27 Apr 2026 13:47:47 +0200
Message-ID: <20260427114750.2480900-1-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_045118_133057_4497B64C 
X-CRM114-Status: GOOD (  12.33  )
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

Hi all,

This small series fixes build and runtime errors in the vmu-flash driver
(enabled by CONFIG_MTD_VMU) and the included maple.h. These changes were
verified on real Dreamcast hardware with a physical VMU. The VMU can now
be successfully probed, read and written with MTD tools like mtdinfo and
mtd_debug. Previously, the driver failed to build or crashed during
probing.

        bash-5.3# mtdinfo /dev/mtd0
        mtd0
        Name:                           vmu2.1.0
        Type:                           mlc-nand
        Eraseblock size:                512 bytes
        Amount of eraseblocks:          256 (131072 bytes, 128.0 KiB)
        Minimum input/output unit size: 512 bytes
        Sub-page size:                  512 bytes                 
        Character device major/minor:   90:0
        Bad blocks are allowed:         true
        Device is writable:             true
                       
Thanks,
Florian
---
v1->v2: Rebased patches and fixed the hotplug issues in other sh
        patches.

v1: https://lore.kernel.org/linux-mtd/20251117224408.498449-1-fuchsfl@gmail.com/
   
The original v1 was postponed to fix the hotplug issue and other runtime
panics, that are fixed in the following patch:
"[PATCH v2] sh: maple: fix empty port handling":
https://lore.kernel.org/linux-sh/20260426212714.2286437-1-fuchsfl@gmail.com/
 
Note that in order to use the VMUs while there are empty ports, it
requires the above patch.

Florian Fuchs (3):
  mtd: maps: vmu-flash: fix build error due to missing include of
    linux/device.h
  mtd: maps: vmu-flash: fix fault in unaligned fixup
  mtd: maps: vmu-flash: Fix NULL pointer dereference in initialization

 drivers/mtd/maps/vmu-flash.c | 7 ++++---
 include/linux/maple.h        | 3 +--
 2 files changed, 5 insertions(+), 5 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
