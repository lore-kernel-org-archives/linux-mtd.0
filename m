Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7CEC369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrxNUO7ARxi1DxVPHlyerrOBiSou2EK2DhiT6SG4MKs=; b=lI/Czr9U8PAzM0
	Khe8oO1tRP7Dex51+bgmni+YvB34ni4EmouhY+DZsDzHr9GdiOu4Hh4csq+QBMPt1v6/hur+n6X9D
	WdE0K9ZM8Bks9GL5SX958n/QoG9hO54CwtwezXShYOEfawnAWfkVJp1IcEQUA3zj1bZ0x8KvsgFj7
	TOdLeEk10JNkWmtBYsO9fXUX4VQqAUmq90Gk6gOhmATrcO2cWyNrwixJ/RojgvY4KPKGbuA/R5Kkb
	8pke6ut38BToo7HRHraZ1BaN+y1isDcQY60nk29IBh2CIJrorXV7jMrT9dnJhW4lRyUNPrRa2nXYk
	LerbrrpQEEy6NGi0BenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XdW-00000007lIQ-34ME;
	Wed, 09 Apr 2025 15:46:46 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XdU-00000007lGk-2cwS;
	Wed, 09 Apr 2025 15:46:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-af5a4cd980dso5091136a12.1;
        Wed, 09 Apr 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213604; x=1744818404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
        b=kvru3InXi6k/scZEIcBO5l5kcyEOYhPIV0mGthmM4zEsHtr4rNKuIGrjh2cDhwWvvd
         wYD1bh6yXyLLsJiwLN2wpz5hSTBENe5JCm3dSJk++tZNXzZZVPgsJnzr3DF0ahh3dMQi
         AITfandCP6yETxeRHHH747oBddzUcopU4ilaqOhiA4n50txSXV8TC8QVKDUSf/4hfAGQ
         GHKdmw2YrNjM+1AbMhpoVDlDJh8fKyFzz/2Z5Secs/zxCfxaZwRtSWsp9RObRN6ChMEK
         jj0RoUxn5Hnf9gOyyQkVPkpLb5/pxbT1j7J4r3dQkMXYMR1BVEMJ2zhIEcuKSdXOVt+m
         1U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213604; x=1744818404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BuIdzO9eB2TbumWIHS4Jh+TQPJAfCKqhpNNx8Z0il0=;
        b=kJ99kjeyqS61vLQBstep8qSYkYPH4YPRbvoibrsT94tY+7j5KOypn5IGvj4FMBPoeg
         WsfZwBmYIG1jvWyZ4sUUCZzbCQ9cRcISR2yzRBTHiY4BnfimTfCEpvS8uV1RkeO5Ee5G
         TX/+r3q7XRsnVCFh5xYRnWmzIBIJzZchteAVGOxJZFbUnFLtsBAYofYllvxAC4x7lfSI
         0robvfib4V7qnCRoXDM1nXNCA5ZAp/SBS8MO3WIBhFXaB9AZxdtTdMjoL3ESeF0tWBZV
         CbnXYrY+L7xq46wp+xApANHl/VEs3knkuGa+go3S2lf0uuv/jkZX6G/0OUPzTwCHUWMw
         JOuA==
X-Forwarded-Encrypted: i=1; AJvYcCXdVqnE+VVqCR6Roira6wkZ13w4IS13aksndbQ3OY+Xm29MHgOFqX4d9chiJ4TCmIloStej6522Of/u@lists.infradead.org, AJvYcCXnUhJLZXN1vCWiTcad5Vz9EUg16YwIeqNk4nnwMIVQE+zO+kzSYjEDOKUABxBg7iYBzrP9/cKjKB4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzQHfCqmOidonpASwOZ0ztDkPjIC6k0+kK7IsJzQloqM7W1ZvI1
	QSDmqO9ZF7H0UWyO6JL8PUfv1GCwRRFSsuoq0EbYhG3ivWvYSZ+i
X-Gm-Gg: ASbGnctr9OKY9hPA5gw7PWC+96nCGtDmgSFZ7v0tgUPhSoxn/qU2OQumJvz/1qY6g5i
	9WY/1Blp81B2fGJ/kOprsvYPxt/NTPEItGID5Sj9MENB4aBX6fL6ZiURdwDOTzwiayhDAgkwB9U
	WYlTg858n8m2WA6IAqdoPInv7nFlrtoxod/cHmzUY3gVe2rX8ghkAygB+3jPHLktzzmQXtyJxtM
	lhx50OLAyE0Jpo4faudAJn9bstbFd/eXi+JCeBTB+1MrvBEkiDI68O6onfIbSL4Es8RVSESmJz8
	xVe0/tFg6s/sWuFlZaK4cKUUKgC12pnnLTAkEEUqRe5JtbYB9mSobGjS7HWGK0t8qs6kOMU=
X-Google-Smtp-Source: AGHT+IHJFVNSWnOegw3VgIiiuGFrSpWrUrgalLTX98dIPQMejjp36YTfz+PTZSsEbZDfgQmuBjYI5A==
X-Received: by 2002:a17:90b:2b8e:b0:2ee:90a1:5d42 with SMTP id 98e67ed59e1d1-306dba636c9mr5272799a91.0.1744213603675;
        Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:46:43 -0700 (PDT)
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
Subject: [PATCH v4 11/13] mtd: ssfdc: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:54 +0800
Message-Id: <20250409154356.423512-12-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084644_664017_41C25F93 
X-CRM114-Status: GOOD (  11.48  )
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
---
 drivers/mtd/ssfdc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 46c01fa2ec46..0db4776424d0 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -7,6 +7,7 @@
  * Based on NTFL and MTDBLOCK_RO drivers
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -178,24 +179,11 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
-	int block_address, parity;
+	int block_address;
+	bool parity;
 	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
 	int j;
 	int ok = 0;
@@ -215,7 +203,7 @@ static int get_logical_address(uint8_t *oob_buf)
 			block_address &= 0x7FF;
 			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
+			if (parity_odd(block_address & 0x3ff) == parity) {
 				pr_debug("SSFDC_RO: logical address field%d"
 					"parity error(0x%04X)\n", j+1,
 					block_address);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
