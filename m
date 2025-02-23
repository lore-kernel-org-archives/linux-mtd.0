Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C276DC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q1tUIkOCJCj9CqearjS1NYBQfcyzd5F4mtbhXfQ4O8E=; b=myFYQkiJs58sDV
	leeGgr07ySlGnJzNh5XaCvCRSCX5RdSMi5k6dMD+lZi4KmQZCGMl7hqm5kYK5h2XnstgzJBUNwLfW
	a2dntEJffcdrkRI0WU2tMKRW6DJ6uX0/HxwFkR1WsFJ6KVm8NhBg6Jn5NaJpBA68GnQ4rsfly1Jg7
	PkomMhFk+56EIHM5WAKcOG0jt0DKxbL+jF1iWrGX+t1/Sp//XJAKGM4fA/SPLac8KDpaGAzp5GTre
	r2TK4J7iWW+DDO9AucQ4qOQowtL2jF9bXeh7nGLi9O767U8pbhLSGfDWLAhZufkBBriHcWy8QZSln
	JZfW9QilQ29Zvhls0VZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF49-0000000BPW5-1JM7;
	Sun, 23 Feb 2025 16:42:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF45-0000000BPVc-15M2
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:42:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2fcff77ff9bso2743135a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328968; x=1740933768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
        b=Gk4CdRObPCaxUgDMZ+FENqBBlTuKEj8u86cVdN9CNf4XX92od/NT4A9MHRukZvG2Ce
         qiJJG1xaDh5rZsD4hEMPxg3oO/At/1AYtSXVKCm87ZGmchYeW5HlyXRi+xdwcSS9cn2p
         TRW/NEyR1E6sVpBcoy3Y/OT794LTrL/ZCnVG8igfnnyKV9K6/XVIhbcquEttZ369yE2P
         UFthBn4pgyjFU2LesEeIYrxC7HpiKnjbsCjF0/mS7jVSuSXqBaoc230rKGht72v7GOuP
         Wyv7Z1T9Ql2R76I0dGndpfA68glc4kAs2TRceV8JLwt7sE2LvSgEW9qT2pJ0HUTlWAVW
         uOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328968; x=1740933768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cC9XqKWpwoW6kaiQnMTAJRMWrDuUOdRDnNZLQfAjkgk=;
        b=WhLpym9i63X31FHhxy33NaTMjxGQwUNpzvtSQnxBhOrXqE6FNgm0gd48DduQhIEN5h
         ip0B0FUqxwrU+28LkXGT9OVXOvgr/6gDPLqsINV4scPI2BKiVUoWPyNOlBHg9LAUGFyN
         PGdV7C515qzQbV3DTF0EsSCiIDhy7T3aVEAWvbY8AGXD43OX3Q0Jz9k3IR/6qA63kSXb
         Ffez3sOvjGhO9wJ9DL+kVnwGWorlGzCcCxJiYVwLrJkQk3iqQAROPgelhMsGI1t9jjZb
         eLBzstnL0da/1z2Y/M0OC2jOFZq2dDPTKSSO7NDLeC3UpGiN27gF7moSWYlHZW/g6GnW
         4kbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXu3YrToHihLUbdO/bb6ayQyl6tjgk+7EysmNF8uWp4xaVJYbHYU7s9x29uWs6yg2wA2VYtsYzI+cY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJ3YrkGevwe/x1VQY6/a26UsZADpIdiu+lTfgpiX55NwCCj+AK
	NotDi/Y8AdiXyBiW/YtbvhaKsITt/yS4LoybthXU5F/e0IA3B3iO
X-Gm-Gg: ASbGncv8BM5/t7uLqOsGuQZ3NCCarMbsVTaqiXWXgDpAoNZyGZrAjYjM0X9285rt0gZ
	tLF+Ymqi0wQS/nw1YW6LdxaMqMl2AJF9kmYs10JrFc5Dr70npdd+5x8OF65KAD1Rs/3twy4iAwz
	62CNy7WXVt03xTlqG/xJ6GbTApcYn1oGwOGpEe+LWHuJZcyNlIEMhbhegkbcUrxBk7V0wGHxhlK
	eQwW10jhkYQlJuCk/BRVlnmK1+LFelvfdvbeEjKJJype9kyWRD3ukErEdT4JRZH3zAK5boM+ldL
	CL3BZA+TkZrHC7mntQyXtOIlH/F1X/W9Wd0P4R35TVgqFjAIsmbGyue7
X-Google-Smtp-Source: AGHT+IE9IoeqkqZm6OQjrr5kPJ0U3iRTenWYdpH7xXhEtXcp87aYt41gR2kUOpfxylsV56aTy8WbdA==
X-Received: by 2002:a17:90b:2e44:b0:2f5:63a:44f9 with SMTP id 98e67ed59e1d1-2fce7b0acaamr15072669a91.23.1740328967814;
        Sun, 23 Feb 2025 08:42:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:42:47 -0800 (PST)
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
Subject: [PATCH 00/17] Introduce and use generic parity32/64 helper
Date: Mon, 24 Feb 2025 00:42:00 +0800
Message-Id: <20250223164217.2139331-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084249_297154_73084F59 
X-CRM114-Status: UNSURE (   6.74  )
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

Several parts of the kernel contain redundant implementations of parity
calculations for 32-bit and 64-bit values. Introduces generic
parity32() and parity64() helpers in bitops.h, providing a standardized
and optimized implementation.  

Subsequent patches refactor various kernel components to replace
open-coded parity calculations with the new helpers, reducing code
duplication and improving maintainability.  

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Kuan-Wei Chiu (17):
  bitops: Add generic parity calculation for u32
  bitops: Add generic parity calculation for u64
  x86: Replace open-coded parity calculation with parity8()
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
  rm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity32()
  mtd: ssfdc: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity32()
  fsi: i2cr: Replace open-coded parity calculation with parity64()
  Input: joystick - Replace open-coded parity calculation with
    parity64()
  nfp: bpf: Replace open-coded parity calculation with parity64()

 arch/x86/kernel/bootflag.c                    | 18 ++------
 drivers/fsi/fsi-master-i2cr.c                 | 18 ++------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +---
 drivers/input/joystick/grip_mp.c              | 17 +-------
 drivers/input/joystick/sidewinder.c           | 24 +++--------
 drivers/media/i2c/saa7115.c                   | 12 +-----
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +-----
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +---
 drivers/mtd/ssfdc.c                           | 17 +-------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
 drivers/net/ethernet/oa_tc6.c                 | 19 ++------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +------
 drivers/tty/serial/max3100.c                  |  3 +-
 include/linux/bitops.h                        | 43 +++++++++++++++++++
 lib/bch.c                                     | 14 +-----
 15 files changed, 74 insertions(+), 162 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
