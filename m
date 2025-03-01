Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E4FC282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUbMX0Yyl5bsDEqpVxDZkKwMvhFtz9FehNzPpphJj8E=; b=OCTmRHdPQUVx8E
	eEJLk/ShT65X+hd2kj7jXw7k4IEN8GT2HPz3OLk80oSVgeATbX7oz9eUp0JGzP9Tnb7JxeDfcVQLk
	VQVdMY2t8nbkykgL0bdZXSjcJScevReCpNpxwoOEuVbcoEmAblV9rOW7iP/20PalYS3SGYE4k8r+p
	UMdLKHytFvYimhe8N1VSa+tInnkj1zoLxo1EEEarCK9oCLiynYlRfdymACRKwTL3TWcWaMEll7dWE
	FTt/ARz6gldkxdR4spE5Fya/Lx/tVNm7EljAn3qAn0csKlvyXNtD8S1LpPQ3+O/Xn0hmPKJrhf9nc
	f2DxO5ezxxztm0qX97NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmI-0000000ERgf-35o4;
	Sat, 01 Mar 2025 14:25:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmG-0000000ERfn-1mNA
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:25:17 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223959039f4so3584425ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839115; x=1741443915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
        b=V0pYINeYzuJpanpI7txEQADoNtw6I/BwwaUTtK5gzGPQwjbh2bptLueWOKdECU4Jc2
         8W4/N58onJFc4pfq6O49TSRpUZ6c27ZCyCNO/7pgbrGE37Epm/yyKGY+e1ulE0Lv13jC
         EedlC3L9lP1jIrD2jM974s0zwLC38w9LiAgpZYK5Ak4QZi3cPnlDJW7QZEuIxPbjbfWK
         AXEX5huMfaG5HOuJbmVMJjMMZR0Z1g7QUTmmUymIdYbmzBrg84m/Pj9GYrjXNJ4I164R
         95krAbAg9gzdRcHUfdzJxcD6/kLOV4jO4TzSjbyXQgecaF0dzqyIa9WTf076Elf5V/Iw
         orFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839115; x=1741443915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNP1gcd9iHRxzh69rYhVl4jkjT7XmE00fWzfP312xis=;
        b=itzFleqYiks4V02zqrDMHcem2mQhcHiKx57gX8WLmYE5Yjm8ZcjdnFkcWwYJLWR0x/
         gDzU1CC1mgsSazjcMEGN3N7LQ/9om/E3eDe6H6n93tF6pGYT8n6f0/MfRghasydHHdfU
         BAvqbHS9XXgKcJvH6auauhhl+/N7XIrrcoD1wpYzZd9jkqZK0lYhEa2OIottKpLIUGGY
         OsgqUxs2tr25l3TfbgJisdatZIt9pCCqZOM1FDSqz9d/Eu7ftQw2Z6uAUHeQQnVGQOQI
         JR27YpJRSsQ/k4mvvTVgRh6zmuQyoNFgyV+Y/Da8xY3qNG4aabpsVKdfVnsvwFl8YasY
         8PTA==
X-Forwarded-Encrypted: i=1; AJvYcCW3DwNsf+FeMRcxdRdTsuhIyVGOuD5PA5AVi8BaZLpmWjPbnE1yGhRwrfzoTP52wt0X/2UdQ2/cv/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyrCBSlh9jjuu2h4L8q7XA0lsWUTEb10ZHZCOcf+WEtZj4DK295
	oJ/tF6aLEUUCY6Ds3OLbjveFXJoU6t+6saJyXQC+V6G8cfDMmatg
X-Gm-Gg: ASbGncuZbPxKcZto3iGTlDEONVD7kZrQi+jur+AlcE8zLVs54tmbV73MaTq/6h12uII
	a4rybqH9GtlGDt67IRwQBs3GaSsmgvldHmOW7F3Fe90RGiVnqKLWxMAfYkM1Xejwxiu2hSYS8nr
	bF7oAY4wHd6ZUpdxlwZI1Rr7raJ5axDihflwPNv/AFa7hrDW9lxa1HgAAyMCGFKPAYDBAMhuCqJ
	38O+qkRNVA5K3Wt7WCVzrvBFnZ7yv7isOEuCsyhtP/StTpmVz5sQDQeHHOn/7B1HgAQ06FTjcUb
	Pg8zAhvlKg0cXr/tisGXn2PX+omfOO+qbcGsprzbK8htSVLQ/s1Ke0GT/i9tFk9zZlG4fhumy1w
	=
X-Google-Smtp-Source: AGHT+IFmQ7+Wt4EJx82M81pMqmqG6vjS1UaCqAsjmQIBhBcvOofXBIwpdWFf7GWkoh7LWsBn9NTlfg==
X-Received: by 2002:a17:902:c948:b0:220:d79f:60f1 with SMTP id d9443c01a7336-2236920765bmr101611195ad.42.1740839114994;
        Sat, 01 Mar 2025 06:25:14 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:14 -0800 (PST)
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
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 00/18] Introduce and use generic parity16/32/64 helper
Date: Sat,  1 Mar 2025 22:23:51 +0800
Message-Id: <20250301142409.2513835-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062516_467841_34BE5992 
X-CRM114-Status: GOOD (  12.70  )
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

This patch series is based on next-20250228.

Changes in v2:
- Provide fallback functions for __builtin_parity() when the compiler
  decides not to inline it
- Use __builtin_parity() when no architecture-specific implementation
  is available
- Optimize for constant folding when val is a compile-time constant
- Add a generic parity() macro
- Drop the x86 bootflag conversion patch since it has been merged into
  the tip tree

Kuan-Wei Chiu (18):
  lib/parity: Add __builtin_parity() fallback implementations
  bitops: Optimize parity8() using __builtin_parity()
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
  bitops: Add parity() macro for automatic type-based selection

 drivers/fsi/fsi-master-i2cr.c                 |  18 +--
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |   8 +-
 drivers/input/joystick/grip_mp.c              |  17 +--
 drivers/input/joystick/sidewinder.c           |  24 +---
 drivers/media/i2c/saa7115.c                   |  12 +-
 drivers/media/pci/cx18/cx18-av-vbi.c          |  12 +-
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |   8 +-
 drivers/mtd/ssfdc.c                           |  17 +--
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |   7 +-
 drivers/net/ethernet/oa_tc6.c                 |  19 +--
 .../broadcom/brcm80211/brcmsmac/dma.c         |  16 +--
 drivers/tty/serial/max3100.c                  |   3 +-
 include/linux/bitops.h                        | 115 ++++++++++++++++--
 lib/Makefile                                  |   2 +-
 lib/bch.c                                     |  14 +--
 lib/parity.c                                  |  48 ++++++++
 16 files changed, 185 insertions(+), 155 deletions(-)
 create mode 100644 lib/parity.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
