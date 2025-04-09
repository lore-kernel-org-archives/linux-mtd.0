Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F17C369A4
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sG8K4R/Cb7pj1avNyOUDGqzkRMg79U1oYgYnAz/irc4=; b=jZTCUXyUtpBAgb
	/AezIXgMqUhpC/oX2dCftNEkUHzeKrnomGh8RassnzDRSf1VsRton55zn65gRtOrRx1GyXyxhXi7H
	SLI49DRFEjLv+8LmXl7gespJp7E7+W7CsFobkodgyBpgP7uVDpi1ZpCy9awqzlY9URJ6IblOEM10b
	lPD4wUi78kbEf+jhRqUIN6k7ohPoFy0r4Xw5JNiv+eC93KYtE9+HeofVjX2JR9Ke0QQaYS/VXfEKJ
	VtRgUnpMg+peep2hzLtu2ekU5MyNmSAF4oXLXy0zc8RlkgLpyo6J4xpsdajOK4yh9NKkWoRbXWwh2
	KNxxridXUTqZEr9yWX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XbO-00000007jyk-2QUc;
	Wed, 09 Apr 2025 15:44:34 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XbM-00000007jxc-24vP;
	Wed, 09 Apr 2025 15:44:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3014678689aso5917240a91.0;
        Wed, 09 Apr 2025 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213471; x=1744818271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
        b=MLXtz02Yl34CC2ck/6nWhqDMOuhcz/QPrfoz4fMA1jNDtxxZS/9mmTQEg6qPd/XJFr
         yIyw+YqaovTj/JygnuGGeRS8le/Oo9GZeQk/dyhpzOSAmiK4dGUwVb6YE79rfaV7rTOy
         DVaresiODQOJuVdPygKHqmkTTFj731CvNCcJk1QXyXGS+r+b4AiNw0+pTLfNWudW2zVB
         wrv3Cv3J52skjfzjM7mlI8DEcrUrAuntUgdfN1kob1i3NTA18tA+FgNN9yuDSTAbJefQ
         /NTkcxt0LBbvigs492mKMlrxtrfUyKS3RPfEPnywqt7v3l7x4bbIYvq/rzl1gNVn+BTS
         mUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213471; x=1744818271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUUuTxOiF/e6pFbiGJ55Vd+VaZOP/yQaXFZJe/XlPzE=;
        b=DwcNrICQaz8VqpbcSqYUq2paRybwgyuT3z/T8zDzlzew8g/VgDq4IrsNAu+Jmx/k2a
         I4d/dGoZpcTNjgdbaVjX7s1eevjhPJyyx1Vuz3EH7TBgehK0F+82f4Wh5JZmQWMP48J2
         JHhYmL+fu3VOVhT1zKEAmyZIEyH0oJkRzH01InFZOGeSlXtkKMENlXquSMr2KJKXVlj1
         7GrAZoEYiUEOodKu+s/y75K7/+9eVhaj3W75U93+AwYcXy/O5UqnZ9qstGWSiR5s3SK/
         3fJIxOFI6gohJYtGwMzh/vsSIGRwrT6ScTPIQyBOVRwVLzDci4vG9boGTY5dgwG9m2+t
         wsEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUMrt9RmBBOhh4PYvETxNqauyu0zX9BwmFHAp5Gwak0gDLDVyhntPLfNiJzMBwkRtjsO5mYVD1K74=@lists.infradead.org, AJvYcCVeklpr/8rzvoBNMvfS5DvKX33mZNZjsSg28U32CgNq8H7F6pc+SL5ul6spjZfok+CTKJ6tFhDPncLb@lists.infradead.org
X-Gm-Message-State: AOJu0YzfFvZR4nNqZMLTOdSWAN9p5odKjBvp3KSJN8kD0SWlAlGRYQWn
	QGF63kxVJCGjxGDIeuCzQnFNklx8srN9PAplun6j4wC7T/GDPyqu
X-Gm-Gg: ASbGnctj/MN3E2V5h34Pdm399w57HdQHCSMgrrW0ka41Q4wDrLiodnkG5xh4ixSwLtE
	ry2JdVKJJmSVChc4l+vkmhnAfBmeC9YiJRiS5vaSgZekE61GcLNIe3AqLzB5kOQPKJF44Kp2jb3
	naEJlDoWYBQ0VG0fk5CjKBogexIPZLTLgcgLnWMCImGHZw3U71Y0EbAsPP6pRxjh2VMJqohRB95
	OUz5L14Qx/vXjOvONGH1h0OZxzZQeeix/Yef02dRiNlz1+OL6T1MXvCOEaSteEXjISXix0zY0uq
	AUO9QSknaGMTcNeOrKyV39uwYIlte6C6YDA/7dAz8UW746tJn7n5KZZi51adDqIYXBCu7yk=
X-Google-Smtp-Source: AGHT+IGnoEozOknyoC6We3L6wSu5LW5c8+l3K2S+PrKsnw7nWoi0Lt21fMnvhITP0Puz6RwfcrL34g==
X-Received: by 2002:a17:90a:d884:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-306dd1719cfmr5116718a91.0.1744213470998;
        Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:30 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 00/13] Introduce parity_odd() and refactor redundant parity code
Date: Wed,  9 Apr 2025 23:43:43 +0800
Message-Id: <20250409154356.423512-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084432_534455_909EF233 
X-CRM114-Status: GOOD (  13.94  )
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

Several parts of the kernel contain open-coded and redundant
implementations of parity calculation. This patch series introduces
a unified helper, parity_odd(), to simplify and standardize these
cases.

The first patch renames parity8() to parity_odd(), changes its argument
type from u8 to u64 for broader applicability, and updates its return
type from int to bool to make its usage and return semantics more
intuitive-returning true for odd parity and false for even parity. It
also adds __attribute_const__ to enable compiler optimizations.

While more efficient implementations may exist, further optimization is
postponed until a use case in performance-critical paths arises.

Subsequent patches refactor various kernel components to replace
open-coded parity logic with the new helper, reducing code duplication
and improving consistency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---

To H. Peter:
I understand your preference for a parity8/16/32/64() style interface,
and I agree that such a design would better accommodate potential
arch-specific implementations. However, I suspect there are very few,
if any, users who care about the performance of parity calculations
enough to warrant such optimizations. So my inclination is to defer any
arch-specific or optimized implementations until we see parity_odd()
being used in hot paths.

Changes in v4:
- Rename parity8() to parity_odd().
- Change the argument type from u8 to u64.
- Use a single parity_odd() function.

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

v3: https://lore.kernel.org/lkml/20250306162541.2633025-1-visitorckw@gmail.com/
v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/

Kuan-Wei Chiu (13):
  bitops: Change parity8() to parity_odd() with u64 input and bool
    return type
  media: media/test_drivers: Replace open-coded parity calculation with
    parity_odd()
  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
    parity_odd()
  media: saa7115: Replace open-coded parity calculation with
    parity_odd()
  serial: max3100: Replace open-coded parity calculation with
    parity_odd()
  lib/bch: Replace open-coded parity calculation with parity_odd()
  Input: joystick - Replace open-coded parity calculation with
    parity_odd()
  net: ethernet: oa_tc6: Replace open-coded parity calculation with
    parity_odd()
  wifi: brcm80211: Replace open-coded parity calculation with
    parity_odd()
  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
    parity_odd()
  mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
  fsi: i2cr: Replace open-coded parity calculation with parity_odd()
  nfp: bpf: Replace open-coded parity calculation with parity_odd()

 arch/x86/kernel/bootflag.c                    |  4 +--
 drivers/fsi/fsi-master-i2cr.c                 | 20 +++------------
 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 ++----
 drivers/hwmon/spd5118.c                       |  2 +-
 drivers/i3c/master/dw-i3c-master.c            |  2 +-
 drivers/i3c/master/i3c-master-cdns.c          |  2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c      |  2 +-
 drivers/input/joystick/grip_mp.c              | 17 ++-----------
 drivers/input/joystick/sidewinder.c           | 25 ++++---------------
 drivers/media/i2c/saa7115.c                   | 12 ++-------
 drivers/media/pci/cx18/cx18-av-vbi.c          | 12 ++-------
 .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 ++----
 drivers/mtd/ssfdc.c                           | 20 +++------------
 drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +-----
 drivers/net/ethernet/oa_tc6.c                 | 19 +++-----------
 .../broadcom/brcm80211/brcmsmac/dma.c         | 18 ++-----------
 drivers/tty/serial/max3100.c                  |  3 ++-
 include/linux/bitops.h                        | 19 ++++++++------
 lib/bch.c                                     | 14 +----------
 19 files changed, 49 insertions(+), 165 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
