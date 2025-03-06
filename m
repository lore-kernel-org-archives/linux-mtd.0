Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CA5C28B28
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UR3tQbccR6a1tmS7uTKrgUHvE+QdSjaqHbfSWWOKveU=; b=qPmg5YN9tukjOM
	UoJgQwZ9e16lE6wDbGCKneiXbOWndiJKb12S+Qt0BrtvHtRovUe3wSIZg6DE/U3mOgj3TL1XnHoPK
	oRnoFq3qdf791gjAcMXFbrjTJQORwVzEihwzdm9QzMmeBwReZylASlzGAeMcexmtf6fZ84WmvZfTn
	PVlPmAglkXwrSmCpGUtDJ/0Qlf8Bh2Se670qB+GdvaFCpq9KtkCazloXkj7ltSzjBRt8hRCg1hyK5
	bFUYU1d+jOBKU9gpR40i8UXjGVTheCdnlpOgr7hMJ+7+8joyCY1m2tTrLq543djV7ggGQnXzmL1QE
	h0IRuwxabYwXy5yt5lwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4q-0000000BU24-2Fh7;
	Thu, 06 Mar 2025 16:28:04 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE2p-0000000BTK4-0oWM
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:00 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so569562a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278358; x=1741883158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
        b=FGlH0SJEIQqVgaWzhHtOyoucg1sFdwyEi0bpzolkPfA1+NOmJxFmF7NWAOA3A+ipvk
         0A5607icZoHBjkxTyE/1yLcESBrCH3pKOZ3B8IhMSHVHnKg3QvDRp7nT41YW5SJrSNc5
         R3ycgR/26cgfdrYe1d6urGzazekRMXT6biDNOH+nemohMWrg+QMb98c1tdgg7W7kpYiH
         21aj0nNtXTgTIyXYF5e9HfoJGqwFs6PlfiE603adw1p7KHjwxQ5B7vYI7mIc3f3nhsEq
         Y+8Daj2Q7XlXlrVzKg6DwCNQAzeyq7dnTYyDv6lXzLPgC4Dt7URzJGUsANCmwBRfuWt2
         ptrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278358; x=1741883158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1Sq6955SeW7fXdSe6bezpmzNTL9tmkfZyPLC9/YdtI=;
        b=LIqE4G28e/7ILt6dvKnXYXG/V9Qtc05xQxt00+YDHD8hIiThXmUtpCte8L3w8gooKn
         fW6SNTmjCbzo5hzId+bs/lmq0OppEXUkS6htMoyiE6CF/2EsTjNGRlOwMu4kLJ/UFUwG
         C/YoMzc/mDKBT7gipXA/3Bzndh0MXaLEsaQ46+MKyUY8gp3mGXWgQBWrm7gEK0HbpfZa
         XvV9+d74LZIn6a4zbmB1l6lYL2ql0R0RAWbIFvFLHrZP0Siu/EEgk7pAyZYLQQIJ5Q1E
         xnQIP5zZe3UzAGziW51Fj6s95dlfeodD/a6Wj2shkcFj2pGcal0tK83WjiEGNCrHTRqi
         srJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX/b4WYA6YJwomorqwWfcaescC9qup0lZMzdmTcFidrDPKUs4/BFybFU0+uj+Zk/gqucVP3fbGAMc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWAXdL4AZ+UjRTAJ908QDdwqJaCz0gEOoRu+8EWxPOr3f3RjqQ
	JnXihpethtC2mk93Tt2ahCKFNcWKqk/+1QPIUIiVlRGzMokajvAp
X-Gm-Gg: ASbGncudFop3vEPbxFuUVEaJhO/7SZR2K28PXLkVOKjIsS4GIxeiEz4OJ18bJkbsrgi
	Gdy5Tmk9ycXjkVYpQri77hBpE+Nwitng50G+knkPxaNArBNV4qvmIJjqtc1Mou1wO282Xnp83wo
	siBkFbwvqx0LX/raLoB/nt8thN7bH7WR0vzr4/GOS/uhHufQMduN1cMPne3U11FbPnveA8c9NLb
	A/YsbHcjovmFQPqDXr6uwuWXG7cJpWSXX9ijH/gieUuEG0ImIcqDl7TCit/aY+FtFLkZbNN8s2u
	Q9sPThZ9FY444H4XOwYpxQ0ZZNcrXE/2wvYX7zo3nz7joEdQYf0fW7caymslMTgDpm3WvaPkIVU
	=
X-Google-Smtp-Source: AGHT+IHx/FA9q9VeYWlT31tM+odxs15FTKCjv2n+9fQOLwshtfFtm1FM7EynPDhqEgIZlabXqJLing==
X-Received: by 2002:a17:90b:2702:b0:2fe:99cf:f566 with SMTP id 98e67ed59e1d1-2ff49775b54mr11884816a91.13.1741278357585;
        Thu, 06 Mar 2025 08:25:57 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:25:56 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	jk@ozlabs.org,
	joel@jms.id.au,
	eajames@linux.ibm.com,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.torokhov@gmail.com,
	mchehab@kernel.org,
	awalls@md.metrocast.net,
	hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	louis.peens@corigine.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	parthiban.veerasooran@microchip.com,
	arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	yury.norov@gmail.com,
	akpm@linux-foundation.org
Cc: hpa@zytor.com,
	alistair@popple.id.au,
	linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-serial@vger.kernel.org,
	bpf@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
Date: Fri,  7 Mar 2025 00:25:25 +0800
Message-Id: <20250306162541.2633025-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082559_233581_B5E5FF01 
X-CRM114-Status: GOOD (  12.26  )
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

Several parts of the kernel contain redundant implementations of parity
calculations for 16/32/64-bit values. Introduces generic
parity16/32/64() helpers in bitops.h, providing a standardized
and optimized implementation. 

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
In v3, I use parityXX() instead of the parity() macro since the
parity() macro may generate suboptimal code and requires special hacks
to make GCC happy. If anyone still prefers a single parity() macro,
please let me know.

Additionally, I changed parityXX() << y users to !!parityXX() << y
because, unlike C++, C does not guarantee that true casts to int as 1.

Changes in v3:
- Avoid using __builtin_parity.
- Change return type to bool.
- Drop parity() macro.
- Change parityXX() << y to !!parityXX() << y.


Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (16):
  bitops: Change parity8() return type to bool
  bitops: Add parity16(), parity32(), and parity64() helpers
  media: media/test_drivers: Replace open-coded parity calculation with
    parity8()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity8()
  media: saa7115: Replace open-coded parity calculation with parity8()
  serial: max3100: Replace open-coded parity calculation with parity8()
  lib/bch: Replace open-coded parity calculation with parity32()
  Input: joystick - Replace open-coded parity calculation with
    parity32()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity32()
  wifi: brcm80211: Replace open-coded parity calculation with parity32()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()

 drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
 drivers/input/joystick/grip_mp.c              | 17 +-----
 drivers/input/joystick/sidewinder.c           | 24 ++-------
 drivers/media/i2c/saa7115.c                   | 12 +----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
 drivers/mtd/ssfdc.c                           | 20 ++-----
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 52 +++++++++++++++++--
 lib/bch.c                                     | 14 +----
 14 files changed, 77 insertions(+), 153 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
