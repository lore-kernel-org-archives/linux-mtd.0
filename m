Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B64C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 03:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3n63pAwWtETfA/e/ZIgKNWOzpXAlpul+2SkK7Pu1nsQ=; b=jAbKiiM1/61nwo
	Iig8CfPVwUF8P7SRHyxebfGWs7pl7Fw/Ce6YrCVeif2x1ePBC3gugU/T5jkB76/xZKL0CeYxXcSoK
	bFNJFbYwAoDhCLYnvYWHJFqFXbvuDfVLQ3hIy4Q6qyoli17iT5rHnHhg8JfxsMjrW44sz0kuissxJ
	UkKcs3xIkuDz/s6oGF4kAamnuev+mtTTR8Svgt+GEVsg/jUAmpexXmokOGaVaOKiy/UNuxyEL7JG6
	Y97aiBtwh6rXbD55RwvTth7xzmMMLgR2d5n3qlYjFsspTdrsYBESJpnbDCc8rLADJ12XGqlDnBSEE
	Dt9/nUnDmTaLCxzXS86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOB1-0000000Cxji-0hyT;
	Fri, 07 Mar 2025 03:15:07 +0000
Received: from [2607:7c80:54:3::138] (helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOAy-0000000CxjJ-25BP
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 03:15:05 +0000
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5273EFGO029055
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 6 Mar 2025 19:14:16 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5273EFGO029055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741317259;
	bh=hyUZKDF5+ooUtYLzko1Czdm29ayQGeHv7M7tkZymGRA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=XeY620eULnP2/+TN4Y4Oy+L1kjV0g9g4gLF3bGbxoub6oXCjIocCsux0s9lsBThor
	 D5MCM8jchD63LZA41Z+zQXpcfDD0kw68ZvT5gJFtkglJP52RigyVCCeTtLHz5T59Sf
	 BdcfD+nIIh4OJ7E3YNolewxhV+KD9eYVj9gc77UPIV5o6BkuLWAjitNYqDwOVS12jl
	 DqNQVt47yWF1ZUW8TzhPps1sdTJ6LcbKbxzoFjRF0/a0IBkoL6S6dVIt6/UEGX2S2i
	 fnnZIzD2De4gOv+3QNiBzF/iHmcOV6iyiEfSH8J1h96iKhLsl8VHaAdju6VU38SRaP
	 yKG9JyADkfy7g==
Date: Thu, 06 Mar 2025 19:14:13 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        jk@ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        dmitry.torokhov@gmail.com, mchehab@kernel.org, awalls@md.metrocast.net,
        hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
        johannes@sipsolutions.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, yury.norov@gmail.com, akpm@linux-foundation.org
CC: alistair@popple.id.au, linux@rasmusvillemoes.dk,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
        oss-drivers@corigine.com, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
        brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
        bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
        Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
User-Agent: K-9 Mail for Android
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
Message-ID: <F134DC06-54DE-4B8E-8AE0-3740275835C1@zytor.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_191504_537024_F405771A 
X-CRM114-Status: GOOD (  16.03  )
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

On March 6, 2025 8:25:25 AM PST, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>Several parts of the kernel contain redundant implementations of parity
>calculations for 16/32/64-bit values. Introduces generic
>parity16/32/64() helpers in bitops.h, providing a standardized
>and optimized implementation. 
>
>Subsequent patches refactor various kernel components to replace
>open-coded parity calculations with the new helpers, reducing code
>duplication and improving maintainability.
>
>Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
>Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
>Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
>---
>In v3, I use parityXX() instead of the parity() macro since the
>parity() macro may generate suboptimal code and requires special hacks
>to make GCC happy. If anyone still prefers a single parity() macro,
>please let me know.
>
>Additionally, I changed parityXX() << y users to !!parityXX() << y
>because, unlike C++, C does not guarantee that true casts to int as 1.
>
>Changes in v3:
>- Avoid using __builtin_parity.
>- Change return type to bool.
>- Drop parity() macro.
>- Change parityXX() << y to !!parityXX() << y.
>
>
>Changes in v2:
>- Provide fallback functions for __builtin_parity() when the compiler
>  decides not to inline it
>- Use __builtin_parity() when no architecture-specific implementation
>  is available
>- Optimize for constant folding when val is a compile-time constant
>- Add a generic parity() macro
>- Drop the x86 bootflag conversion patch since it has been merged into
>  the tip tree
>
>v1: https://lore.kernel.org/lkml/20250223164217.2139331-1-visitorckw@gmail.com/
>v2: https://lore.kernel.org/lkml/20250301142409.2513835-1-visitorckw@gmail.com/
>
>Kuan-Wei Chiu (16):
>  bitops: Change parity8() return type to bool
>  bitops: Add parity16(), parity32(), and parity64() helpers
>  media: media/test_drivers: Replace open-coded parity calculation with
>    parity8()
>  media: pci: cx18-av-vbi: Replace open-coded parity calculation with
>    parity8()
>  media: saa7115: Replace open-coded parity calculation with parity8()
>  serial: max3100: Replace open-coded parity calculation with parity8()
>  lib/bch: Replace open-coded parity calculation with parity32()
>  Input: joystick - Replace open-coded parity calculation with
>    parity32()
>  net: ethernet: oa_tc6: Replace open-coded parity calculation with
>    parity32()
>  wifi: brcm80211: Replace open-coded parity calculation with parity32()
>  drm/bridge: dw-hdmi: Replace open-coded parity calculation with
>    parity32()
>  mtd: ssfdc: Replace open-coded parity calculation with parity32()
>  fsi: i2cr: Replace open-coded parity calculation with parity32()
>  fsi: i2cr: Replace open-coded parity calculation with parity64()
>  Input: joystick - Replace open-coded parity calculation with
>    parity64()
>  nfp: bpf: Replace open-coded parity calculation with parity64()
>
> drivers/fsi/fsi-master-i2cr.c                 | 18 ++-----
> .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   |  8 +--
> drivers/input/joystick/grip_mp.c              | 17 +-----
> drivers/input/joystick/sidewinder.c           | 24 ++-------
> drivers/media/i2c/saa7115.c                   | 12 +----
> drivers/media/pci/cx18/cx18-av-vbi.c          | 12 +----
> .../media/test-drivers/vivid/vivid-vbi-gen.c  |  8 +--
> drivers/mtd/ssfdc.c                           | 20 ++-----
> drivers/net/ethernet/netronome/nfp/nfp_asm.c  |  7 +--
> drivers/net/ethernet/oa_tc6.c                 | 19 ++-----
> .../broadcom/brcm80211/brcmsmac/dma.c         | 16 +-----
> drivers/tty/serial/max3100.c                  |  3 +-
> include/linux/bitops.h                        | 52 +++++++++++++++++--
> lib/bch.c                                     | 14 +----
> 14 files changed, 77 insertions(+), 153 deletions(-)
>

!!x is used with a value that is not necessary booleanized already, and is exactly equivalent to (x ? true : false). It is totally redundant on a value known to be bool.

If (int)true wasn't inherently 1, then !! wouldn't work either. 

There was a time when some code would use as a temporary hack: 

typedef enum { false, true } bool;

... when compiling on pre-C99 compilers; in that case a (bool) case wouldn't necessarily work as expected, whereas !! would. Furthermore, unlike (bool), !! works in the preprocessor.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
