Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7285FC369A4
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5F8x4Zdowys+86XrYwu5vBuPv9urGZVKXjm0nFQBH0c=; b=iiwS8+2Ywcrmbe
	c5jrkQ9gIWiWf5Ufg1XCCc49KaNpXuu7nQzv7gq2sqHBYY40hzRf76rNVBC27fnFFplJGBLk7wJTv
	+WPQ58mBYFFH4DuewE1mpJmN50J56r9zpsUNGABmPGxEP6h6OR6cjvyqYJ5Lx7GEDKdqa1lC5PRrU
	JhKI9UVjKjS8xhKGHKU2+yOzd3ky9Mjp8/odEARPbA/wxjMIPUcdUvBaqSBZctLURa1LGLphJmU4K
	BRR9Mp8D4rXwZb6zSMY/r2xm6lkKsj5MxTnA9YeqfhR7FGyaJFVm+49h7fzPz6s94U02KidZ5wWGW
	FsD+nVooIyIgn4ZVMz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XbZ-00000007k4x-35Ei;
	Wed, 09 Apr 2025 15:44:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XbX-00000007k2x-08TO;
	Wed, 09 Apr 2025 15:44:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30572effb26so6491807a91.0;
        Wed, 09 Apr 2025 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213482; x=1744818282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lW4oOCfCNW1Ikfi6N7oqyzQRlobsbPmX3F7QqOKxP+I=;
        b=fAyMaWHENOO/OBg+F+zuV62m4Lte4t1Iy2FoJkvxSZUZC05Zo54YZIaZJoDRM0Y5aY
         O0BSd2UrfQegf3Hs9VD8ytj45iBma6FI0YLLZERUOwsjXwkRLIkaSYGO/Z7PqUPcMv0P
         LUhZSogD2TLJEIDbCxhxxwsgwXxQMgLWa8gUInefVGqMckuCCs5FugJ46qiCvIjFrrO8
         0N/93EK/N2FuasOVXWa304ace7Fbp6oSWYyKU/JHZUmoi/t2ZT+w6IrXdZHYCWq+pl6B
         brKAezKKJeBDxhZeucelhLa6Ap4XZc/hCtZ8HTfIW6IRHkZnx8qCAwVkGX7D08SswDp2
         o6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213482; x=1744818282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lW4oOCfCNW1Ikfi6N7oqyzQRlobsbPmX3F7QqOKxP+I=;
        b=o1/eUGPk4aIgCQ3XsXhh50SAADzQStysVx8fJs0mboRVXZyprr7eqWiQjlztTrlSPn
         D9XwCInPen8WGSPKS27/A9dVAKiO9KkHkAuMu2fjTR8hImVpNvjkEFdCc9N5rgB8DfAQ
         BZOC3JUlcnVkaW0PTYbBwGJAxGU5eElE3xBCqcCvVbvz9/eryl8tJVNPeadzLYl/O9iu
         To13yREtmhTtdclVavnA2NLud1NCunXQNn3+ewppYkOl5uZSd1xLi+NGH8i5GONAfohh
         9mo1kGUTHxZOX6dMnBsXHJDMvvj1UtKIrBdNSiuDP3RZz1LD414PDxPPWFZyGKYy0Ox0
         EJGA==
X-Forwarded-Encrypted: i=1; AJvYcCVn85X+cwuuBesl+/GFt7qwP5IvXxQuLiUZoRGJyjWkKMxRUfaoZwzWaJ+7rFnek8gzAun6A/6+Dn0=@lists.infradead.org, AJvYcCXaHfMYOOGse+j9cdHtRuOPBGsDUOIW94lqdFKAzqh8/7BSO9ql5xj6PY6hXaLX9sGY9pgxCdeHyJCG@lists.infradead.org
X-Gm-Message-State: AOJu0YxbmKEPQxjwbcY5K7skf1BrNuvi/MsU9rM460aO85yKnYTOZ1d5
	pRhGDHkYuCyZ3ojnW3Di83MzdIt97SMr1uAkbzvquuTj5KC+HXpF
X-Gm-Gg: ASbGncvRHKimWbAttxQ8sHYcNl5PaTR5aSZA1eLgvqMB792s8Ov5nqQdPCHo/kSCe6t
	Tlv8dFPSwOTBLSee+zp6AihquYbVkEUcqxrq7In8JrNs4tQLABwiz5vZXabJZJffBTQuCiGlvL+
	UEytByL1IHAY5lsDl54kJkalmFGPA563EwqwHmkVyxIhc8wMM36cqmkcxzGpCSm8mRpJtrVc2Wa
	LrcxuLnU8KJ8I2kFddthVVKz92gDxdQcbCUA4iXud5RApw9rDxLNvw4sQcAEoOKyJg0X8EVr6Ym
	cZct38oq22WbFhBvOpNbqSLMFR6Lowfn4iEFB+EZkRQlG2ikCX1loY0QD+arLwezn2TTLw8=
X-Google-Smtp-Source: AGHT+IGgg0DBuH33oW+E+873bMYyZA/oUaltEXJsqFjgXBWTSXKYJ4mXYIMoJApL4m1vTMrn1nnOpQ==
X-Received: by 2002:a17:90a:f946:b0:2ff:4bac:6fa2 with SMTP id 98e67ed59e1d1-306dbbc1e1emr5446016a91.16.1744213481930;
        Wed, 09 Apr 2025 08:44:41 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:44:41 -0700 (PDT)
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
Subject: [PATCH v4 01/13] bitops: Change parity8() to parity_odd() with u64 input and bool return type
Date: Wed,  9 Apr 2025 23:43:44 +0800
Message-Id: <20250409154356.423512-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084443_070391_A7EC2B30 
X-CRM114-Status: GOOD (  16.05  )
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

Redesign the parity8() helper as parity_odd(), changing its input type
from u8 to u64 to support broader use cases and its return type from
int to bool to clearly reflect the function's binary output. The
function now returns true for odd parity and false for even parity,
making its behavior more intuitive based on the name.

Also mark the function with __attribute_const__ to enable better
compiler optimization, as the result depends solely on its input and
has no side effects.

While more efficient implementations may exist, further optimization is
postponed until a use case in performance-critical paths arises.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/x86/kernel/bootflag.c               |  4 ++--
 drivers/hwmon/spd5118.c                  |  2 +-
 drivers/i3c/master/dw-i3c-master.c       |  2 +-
 drivers/i3c/master/i3c-master-cdns.c     |  2 +-
 drivers/i3c/master/mipi-i3c-hci/dat_v1.c |  2 +-
 include/linux/bitops.h                   | 19 ++++++++++++-------
 6 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 73274d76ce16..86aae4b2bfd5 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -26,7 +26,7 @@ static void __init sbf_write(u8 v)
 	unsigned long flags;
 
 	if (sbf_port != -1) {
-		if (!parity8(v))
+		if (!parity_odd(v))
 			v ^= SBF_PARITY;
 
 		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
@@ -57,7 +57,7 @@ static bool __init sbf_value_valid(u8 v)
 {
 	if (v & SBF_RESERVED)		/* Reserved bits */
 		return false;
-	if (!parity8(v))
+	if (!parity_odd(v))
 		return false;
 
 	return true;
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 358152868d96..15761f2ca4e9 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -298,7 +298,7 @@ static umode_t spd5118_is_visible(const void *_data, enum hwmon_sensor_types typ
  */
 static bool spd5118_vendor_valid(u8 bank, u8 id)
 {
-	if (parity8(bank) == 0 || parity8(id) == 0)
+	if (!parity_odd(bank) || !parity_odd(id))
 		return false;
 
 	id &= 0x7f;
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..dc61d87fcd94 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -867,7 +867,7 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		master->devs[pos].addr = ret;
 		last_addr = ret;
 
-		ret |= parity8(ret) ? 0 : BIT(7);
+		ret |= parity_odd(ret) ? 0 : BIT(7);
 
 		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
 		       master->regs +
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..df14f978a388 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -889,7 +889,7 @@ static u32 prepare_rr0_dev_address(u32 addr)
 	ret |= (addr & GENMASK(9, 7)) << 6;
 
 	/* RR0[0] = ~XOR(addr[6:0]) */
-	ret |= parity8(addr & 0x7f) ? 0 : BIT(0);
+	ret |= parity_odd(addr & 0x7f) ? 0 : BIT(0);
 
 	return ret;
 }
diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 85c4916972e4..d692a299607d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -114,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
 	dat_w0 = dat_w0_read(dat_idx);
 	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
 	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
-		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
+		  (parity_odd(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..7c4c8afccef1 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -230,35 +230,40 @@ static inline int get_count_order_long(unsigned long l)
 }
 
 /**
- * parity8 - get the parity of an u8 value
- * @value: the value to be examined
+ * parity_odd - get the parity of an u64 value
+ * @val: the value to be examined
  *
- * Determine the parity of the u8 argument.
+ * Determine the parity of the u64 argument.
  *
  * Returns:
- * 0 for even parity, 1 for odd parity
+ * false for even parity, true for odd parity
  *
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity_odd(val))
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (!parity_odd(val))
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+#ifndef parity_odd
+static inline __attribute_const__ bool parity_odd(u64 val)
 {
 	/*
 	 * One explanation of this algorithm:
 	 * https://funloop.org/codex/problem/parity/README.html
 	 */
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
 	val ^= val >> 4;
 	return (0x6996 >> (val & 0xf)) & 1;
 }
+#endif
 
 /**
  * __ffs64 - find first set bit in a 64 bit word
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
