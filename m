Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC97C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggRoZzQfMmy4ktAJ8fEM6bnuAN+79kgRgg2yTiXByhM=; b=xmSmO+AuK3niEL
	1u7m9R9Kg64kEhcge0p+dy9AN+W6z905R9thKRH94FHR9vzvasnQidCE80r+5GcEBwgT0QnlFnHt5
	S9i/aF74z7fcnXbbCOdym4y+QO5HLePZcBby8wwf4xJRml7Sc/aKamIs1lK1THRY0TOx8hnjvnRv8
	bEwKMko8r81kQ+LAUNiZU6/d0Oqm0K8cU/aHUIpjD7KNZjDcj2e8EvjimoiHSNW0aPfggp8430z8W
	t5OUcdsqvLJhx/JwK4sFcBjElN5U8em+v4Eo6GlL0XChbRvcPGk3ij3e8zFvGghVTba6QET6L0K9i
	R/zm3ql7IV6Fq11+g6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XdA-00000007l4m-33mB;
	Wed, 09 Apr 2025 15:46:24 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xd8-00000007l3V-4B7R;
	Wed, 09 Apr 2025 15:46:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-af519c159a8so6358293a12.3;
        Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213582; x=1744818382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
        b=LI9IzzJ2AKyvnc2smFWMWewQhFOK4mzAEFiC0O+xwb+o2iV/0mPD6G7s0m2VnM8fUi
         SJg8oRBJ7psatbjPt5WpfJk+yXGueTyhFSWWDdBkzlSIQQv53Dpbg/bbkX/Xut7N5lYz
         Yvn+hCG7cZAH7cg3ykOn0YctXEYtagiAIhGSoDGwBld0ihuUPfjui73UTdFBPmYHII+D
         fGIzyvt0po4ntfC/oMLTR9aTSOEKRNY7RDa7kNGuweI2Zb6utX74AvH5wQNpTwlggioF
         aNur93tF6pq9C38SjlQrTDmvG9Tlc7s3J3qmW9lYVOJDiLEkTzEo7XtPEMSBvVnkQCV4
         qdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213582; x=1744818382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbWQUZQwY5O/XbpqxBGOs/Motht++mnKBdeylhl46Ro=;
        b=OwxOvZICzIEiDKXzpNJ8xr2sOP5aKRqpxOcPB+s9vL2RxiZ06s2T6xzpQGeeGW2Vuz
         5pkZbSofznYC0DNf/6giUnqeW2PCJxtRKMadyBfLz/ii9UC1H11EWvPgTpodFnDhM1WG
         o7Eh7GNcfRoAK5e9e5Djpcp/WQVRMRjlEE0u63kzdU8zKUpCWcsP5ktpBUClj4YcDhwR
         Q9gprmDHKRZy5Rn5Ih0BoLe9rYOLU6H5G6PcTmBCUYBy+jXDk9DAaGanPVchGqx3Ze92
         ezljaoUv5TXBkef93/S0f4qTxaMz9O6gvGCmLrU/dEwtYlteknz2uwioBQ0Y3EyNEoaZ
         sAqw==
X-Forwarded-Encrypted: i=1; AJvYcCVzDEXOQaSw3jFBOXL+6jAHim8OgdgqmYHT2hkeJk1K0QhwlVcHIyJiWydnVTpOTDfy5tQqAxnRRgqq@lists.infradead.org, AJvYcCXm1xqbOjFncBrh+LfLJKag6tEg1OrBrExuGoCbfy0iqzb54X47A9e8Qfx1eVS9fVfYmjQP8pTs6pQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw25TO+kEadEs8TW3PV3QUmMbhwkCxZj+qiohlUxwEfrFijnZey
	oyMPM1cR6PvOKdvAbevIf/zKUJZzGRbofTFtr2kQjw5ZtZ7ZmlDa
X-Gm-Gg: ASbGncuk5xyUtHYZPzksCFrFr672XEGgle+ij7oF0aN0NLAlzlvJ13aWtX7wJAk9h4i
	TRov+IBu97X3WYzE9RlWznyNP3fGxGK58BvM2KS3veJ97NkGuKIk9U4DFXHUTolTjDrV9iuUOKV
	BFNkb6olYtbN2cqlamTzR8QVOWxPJwbiI6HYIKBHezWY9Hder2EyCftiYt3PpCSUKgPpqC3WpBb
	TV2NeaQFwtq2G8TYmYAXw1YCUvMpxThE9IVqvx895gARpHfNz91rPavOnYkL/HHUu59axBdrsFl
	7e/tpmGg3xTVMH0IHK5tJFrq+9RcSlYErDEO4JOL4QKBsjIt8vYngBWfQWu8sYDsmYJqFTY=
X-Google-Smtp-Source: AGHT+IEd3EC/Z0ac7A9mI3otjelgXE3L0dUH+HAICIEWTo12gF8GwwD4nirjVp0rJrYl27/5nkbmDA==
X-Received: by 2002:a17:90a:d60e:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-306dbc2a7dbmr4740684a91.30.1744213582002;
        Wed, 09 Apr 2025 08:46:22 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:21 -0700 (PDT)
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
Subject: [PATCH v4 09/13] wifi: brcm80211: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:52 +0800
Message-Id: <20250409154356.423512-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084623_032374_D1AE2273 
X-CRM114-Status: UNSURE (   9.51  )
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/dma.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
index 80c35027787a..5d7500ee2d3b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/dma.c
@@ -17,6 +17,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
+#include <linux/bitops.h>
 #include <net/cfg80211.h>
 #include <net/mac80211.h>
 
@@ -283,24 +284,9 @@ struct dma_info {
 	bool aligndesc_4k;
 };
 
-/* Check for odd number of 1's */
-static u32 parity32(__le32 data)
-{
-	/* no swap needed for counting 1's */
-	u32 par_data = *(u32 *)&data;
-
-	par_data ^= par_data >> 16;
-	par_data ^= par_data >> 8;
-	par_data ^= par_data >> 4;
-	par_data ^= par_data >> 2;
-	par_data ^= par_data >> 1;
-
-	return par_data & 1;
-}
-
 static bool dma64_dd_parity(struct dma64desc *dd)
 {
-	return parity32(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
+	return parity_odd(dd->addrlow ^ dd->addrhigh ^ dd->ctrl1 ^ dd->ctrl2);
 }
 
 /* descriptor bumping functions */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
