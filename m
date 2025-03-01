Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E906BC021B8
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8VjIrTdqdJO70ot7aCLK84xnQg1NFdHIDjQanjJ2Z+Q=; b=K8DOIs6kZkaWNZ
	kEMw8j8zUu+/TNp+eI5VWViczw/wS2hOFgiFnGSe3VkeaItCwNTxI28qVIumbaBNKpd4dE8Obs9K4
	RQXibN4JzQSBLw83N5P3KlvTNVih+Wl2CObUiR3S1IGiybHw71phjsfv4oT6IDyBi1KI+HdxH5Qy7
	/+LjrJz/veTPnI5bDyxRS6sKYzNhL5ICdpzXq/o8aRePNR8JF0KDCqNszC6/S1c5GRjLCDEYCTmLF
	dJkYGbFK8DbDvvJ99N0fZmy2oNR2Xnp3vJyEuSwONSq3uH2lwHJFGYJUIjyXGZ5ytAA1mwjXsBOy3
	gYV/xelOskUG2y38Tr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoI-0000000ESs1-3jtC;
	Sat, 01 Mar 2025 14:27:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoG-0000000ESqo-3XG7
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2238e884f72so4226035ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839240; x=1741444040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=mw0h1FsJDHv7QJYikJijUuwh2D5mUv4UEgfOrRlU6qc3AY+JBM7x+d+yF86nOYooEM
         otTlx+RB4MDFt+GoxY4vDZk7N2nscPVsWe7Cu54+U/ZlJhs/Wdo0eE0KROBTWmHOuPvl
         t8pSMFzAfo6mgtmehXhVR/yG/4aHq0GiXU4oNcZS/iefgtwtg+CiaIWdQF8kibYAUvbm
         i/Wu1vc3mS89NaqsV4iFPi8DcyfFPpOQ9FGb2VdI2RdKZku/DhABOPI34KV+m0VbUMA7
         uEvS0AvNKg6vlaFToR7VJFaHQnzORgp0MCr4wbrdSTcyu+YVd2ZZfYp5qOgMcFBFl0fx
         Nzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839240; x=1741444040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQRFKAla41Ay10wYFnrS+X/WAyPF0gKgODKhC/FC/AE=;
        b=tJLaj41fl4wdvazMkPZ7TAcLUp++j8uSGAvaMdnpByavzefOA9Wtykdj/2o3AdR+94
         XzT9YXzq7orOc/A6uD4kwtVNvFco6nGOMLOnzybSi4NYpss6XFwlAGmMQbIIVMKiklzp
         eECYAjm+Pzsr+obLAIci5mw+n6A6/+I6oRXKU1UNTWl6kO8nw9HsbrcelxIKI1pTjKN7
         3K6SOYHaECKYSpcLbQ0a4Miewy44UJo+WvGRXl/eS/Mcs9h0mJQSvW2iyZmC6euzZ18v
         mS6PYJRg98NLWClwz6luCY9oPmJpAtQ5QcHfb4e42OXUtTthDLIs+JbuV/g1VUr+p9rG
         ZuuA==
X-Forwarded-Encrypted: i=1; AJvYcCUO0pVYb1D14hj+4VPYrmI0QHWDryoonaokkmMd7Fdrsb2QYxfQDfwyCkTTfR0JQ0PPARD5HA5Hp10=@lists.infradead.org
X-Gm-Message-State: AOJu0YzjE+52hWamJhQUqzMucL/+EdkBnOW5P8Wu4fnZQqh4KCuLpXM7
	YXV1ZTHvhdXapB/RCVMRpM/KVVeaVmCh+HOWA39MzFO2aFE8oMzA
X-Gm-Gg: ASbGnctOqnT6drIHt7CsnYxWQT2HzItfNDayeGnKSfsF+YDSs8wEIkph2sB80Ossycs
	iQW7eo1VJrHqnPwizMGiXiQI+MdOhMk99Wo40JMFTWB/zeyZcaUSIcKLOdT82d9129Ny/zpCO1H
	4bS+j/OoTD/qnc+i3nbOtRLPqUkJP8l4vgpkmAXVlTvI1en8UNbdl8UuJ/fd27gU6In2amdSu1U
	klP7SUYANJ0CiAGFv0CrP4kcHmaw40PFfKljVrFd0AsP94tazfJIDVSazr2RzeTnlLinUubztl6
	7dSMg85u2V6RU5l5Xu3p57m2sPFYFT3YXtbhTOvdTu3F+XW36TvNKH17a9efC79ceHcXSBbIZis
	=
X-Google-Smtp-Source: AGHT+IFWKqiV0JEURaPP9WsTXinyvBYz5p+Da6Z0sy2B13n/BlJ3FGZeHRzY7pPlUCpj+eVU13KkqQ==
X-Received: by 2002:a17:902:d4c6:b0:215:7446:2151 with SMTP id d9443c01a7336-22368f61abbmr99234975ad.4.1740839240264;
        Sat, 01 Mar 2025 06:27:20 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:18 -0800 (PST)
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
Subject: [PATCH v2 12/18] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:03 +0800
Message-Id: <20250301142409.2513835-13-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062720_885829_E757C1A3 
X-CRM114-Status: UNSURE (   9.89  )
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..833e65f33483 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
@@ -4,6 +4,7 @@
  *
  * Written and tested against the Designware HDMI Tx found in iMX6.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -171,12 +172,7 @@ static void dw_hdmi_reformat_iec958(struct snd_dw_hdmi *dw,
 
 static u32 parity(u32 sample)
 {
-	sample ^= sample >> 16;
-	sample ^= sample >> 8;
-	sample ^= sample >> 4;
-	sample ^= sample >> 2;
-	sample ^= sample >> 1;
-	return (sample & 1) << 27;
+	return parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
