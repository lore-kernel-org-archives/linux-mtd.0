Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAC1C28B26
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAsQb2wd7JRnt1V87On8py5rg6ekQ9IsBC7QJRxAw3o=; b=l9P/cUeoAbnYey
	fSEq3Z024d8IXYQe+q3t4QuBdDAZzisek6ieQnrkl9JsTaj5KczZkYjTR9UBZSO7th2dfHD9+stZb
	fdwzjEApdy+Pm2FSCjX1aVSldwCq/reM7XLScIg34IicdM5Lb903aJ8WSjdONyEaXj6X5LVq3hv4l
	GRbXzB1+RwU67Rkg8eg0Uk9sVXfLaFXkcG9H11h8J+A05k2E2+VH7iIqCo/ao6MU707xujeqxEQO2
	jBSrKZ9pIgozj/5xlS1LNmDV9lGAsHllRtD+11fMj5q8a4byiY5Dk5KioPifV+I4zeGFYhj3TqyOb
	bwz1Chxkz1Sq53vIefZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4y-0000000BUCj-3nIp;
	Thu, 06 Mar 2025 16:28:12 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4a-0000000BTts-46Pn
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:50 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fec13a4067so1484311a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278468; x=1741883268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
        b=Cd2/1XKzvETFHt7g3TZzAk5Iw9JbjQncqCN4IQKDeEELZl73ovWTLRF5YndqiWfavJ
         Nj9yDkczOP7dXJuJ7xvDVcnqx2S45/qkpUvuT3Q0ASFJxd4FF4w0lVv5hRISUMu/bhg1
         O7Zz9fOP4b4jzcw8qFiZQeyNOtezuvaLVtMUzPLcSsuhsteuXEn3+p6A2GA6gDmFII82
         jXU6n3Val2E/k7lamCIl3G0+FiIU9wjGxI2JBwbH/1+FcXOrahIxiyiOXvqFf18c39xD
         dBNBrWmK1/T9nBGX//SWktKLNEYedvd/qYwxuTPBfJ0FFvBFOd8m7v6mB08W9/XXX5Vy
         leHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278468; x=1741883268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lzzZDV4xgSskf5edAWcKAl1UECahSIOp1fWE1tA1yk=;
        b=LEnu3mP18rHRox39pdb0dL4wsBOsSDwqrL2MlyvJ8qWxDPQbHilZ3NWpl09Qc5HnWU
         mhw0sd1yecvgzD2Qpq2hzeQrQZ/qIlv+1BmbKyCReVDRsm6YiHYho0HkRtjBRSHHF3Sa
         YN/PQWvdRNUAKLxvkE8fzVU/NuTQp4YQslVA6FjEXOHsPMmwFSqUJ5MsC45KvzuoChOF
         GHRMjgWUiPyALYPEsTq5Tv80IT1H77y9baSDtocNjFQZQnw17gw3ptg7swGcg1+7whIP
         blWSAvvgYlFm64p+CRtu1mAF7ZTCVHviGIZeAG/eLuv++aUWOxe9/WOJ5w4RKmYh+n5c
         lJjg==
X-Forwarded-Encrypted: i=1; AJvYcCXzEbdqpMWx7EotsC4URR1Il9GmjccwZl17HgQnGSrcIO2/+RpcXOBNaDuiSBaFmxkPh3CaFj/HCO4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyyzVoibG2F8ODB9sFWGVvgXqFusy8S65nnpAMwWbq8jpKzPok9
	1XxZlJtBZqT+FH5UDyYbXjVF2t20xN88UbUFZghqmqsmGz/Lro1e
X-Gm-Gg: ASbGncumzo24sPt05V/F3Xhx1i5tHlngdEiycyrPEayxLcO0AcAPuzKQy8R7P/RBMXC
	NvYaA5c2Ic4dpDE+qcpiyu+d8799luf0WcBO9og92b5c6dyUZcWEbf5FczMz9qOaa8Q27WbDqam
	TkMEx1/8vU73hh8Tg4Mhkf6Jd6jJD0dEE0pgKAUSiD4EfcXEigK5ViFXgOtlNpVAYb8+A8U8qkU
	/w4G8o2/ZCC1siDG0FXlkb1P+b/BPGOZvdZlCSNyMv9vojCuKKEndWINlMoVdJ9mmov6AkcpvQI
	jFGY477hu1uicg4BM41iA4uEas4zx02hYzpGhf7jexPOvGlYdKjY8JgX/Lc6nYRKIZdnZEG3FlQ
	=
X-Google-Smtp-Source: AGHT+IHWBk8+6ksfik0EhK6cGMIWVO4KCt6lAGGIta1FZHsm7ob/3ELoZ4FHcMM7AbzddV9ZAUKTxA==
X-Received: by 2002:a17:90a:c888:b0:2fe:a77b:d97e with SMTP id 98e67ed59e1d1-2ff49728368mr13045551a91.11.1741278468014;
        Thu, 06 Mar 2025 08:27:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:27:47 -0800 (PST)
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
Subject: [PATCH v3 11/16] drm/bridge: dw-hdmi: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:36 +0800
Message-Id: <20250306162541.2633025-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082749_014417_0260B4AF 
X-CRM114-Status: GOOD (  10.27  )
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
Changes in v3:
- Change parity32(sample) to !!parity32(sample).

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
index cf1f66b7b192..a992ecb149d7 100644
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
+	return !!parity32(sample) << 27;
 }
 
 static void dw_hdmi_reformat_s24(struct snd_dw_hdmi *dw,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
