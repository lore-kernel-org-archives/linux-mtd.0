Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79426C021B8
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXfnnukWA43Kf+vfY+RIj56lSP/v6onD8aKG9/scVng=; b=RWBtfTv8ZXix7Y
	PhxefVIvnKyfudtILX/+3wYIAg3ZzcCknifPwBw+XjXaW/nbFZTtCDMAMcD8MmpfMRsnqEZYTsC3i
	e2KMDTtFzryZKCXraEij+dUnbVIcCJkX+V5+cFBos838KtvdS1/wx4g2fUA+hCyJcKIOYleiyealw
	NBlYSu2zRv75Z3N9Yfb/B6EF5tqwQ60ZpITI6kukW8rZWzOZLSTR3yVmslRkbn2IFOqbVzqrDTbg7
	tqm0GSXoXC/lwQ50HU+QAOEvrrFeS/c+7/E93VXolssR9RaDzCg3gMcxq9XhSR32X21zfGjF5AmC6
	uthA2L49H12O/89ygFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmT-0000000ERkw-3cfb;
	Sat, 01 Mar 2025 14:25:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmQ-0000000ERj8-3Cgm
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:25:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22113560c57so59378715ad.2
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839126; x=1741443926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
        b=BH2kMUYEf9dbvynGRYaeCuk0Rm1yVxOI3bc+8Dozwqu9NAsGIIziAAzs4ii72uFMEw
         DGkVa9eesRknt4pD0RgWMAGILlZF3pVfmZGI7zH/I6njMxr639+/iF9ZNYrA338aaedN
         HtshjBrMPIFAiEy1ab81PmovCgfTeHogGO8Z35nEGerJ6yjMywrroPOJhBuT0ty5DOSl
         vAQDYV4ct0JH8byT26U42dnaJarIx+VWnHHvYIkUSMET6Lcp8wy6G+InT+tyFGkUCIJi
         McQyIdrZ0daxfuv9se+RMNGCIvI1phj+lX5ECn4cxPqnpW3+KyWa6sim0nXKGYRMOntk
         dJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839126; x=1741443926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXn6GKhF5PCrQUxpPI6cKx6cLS6wqLkAI6AcaLhK77k=;
        b=V0FffWQYja1v1hFhC+LKkASRF4EtSkCo8jgobnuGqlhX2LD6UNNWNP34h7W0KFZiVn
         LBrSj3V4BLA3Yk14Czf4NqViBLtXdgpziDMqKlhN7pv9wMGrdQ+6lgSp89C6o/a84Y1K
         5o+pmMW6wZHFILCN3ocEdaXMO+9GUHkPRS5wns6IbrE3MarVdaCxrqxjaFmu9+COqQVO
         FL0ILli2DN9rMmrjhfXlO34NRqjxZrI/gLJRYaA/u05ucuKg57i2hE7+SIGiqh2WozOV
         /+ZbvF2s0aHUPaLd9fovlhIkkphbIkf5V1vdR3W6Q4VnJBJmxiaUrrKN3rzK3ufPFj4F
         ifLA==
X-Forwarded-Encrypted: i=1; AJvYcCUS0Mj3MF6aEBqHcm1sAbnxBaz+MW5Kke+fCHSGAG2fbeqeGRtisZaj73BZXXamAEbbQYZpynIG7Tw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyV1wBrKaW1FidW9g3pVH9FH+E7lDv7evJQ/IHFsVfNZasyFJFJ
	f1ijLVt8dr2m1yDymF608AO71M3MyXqiGY+IKOuxU5ntNGjZS51F
X-Gm-Gg: ASbGncv/7VN5Xec+l14GZG1I61rX5/swoVz3aLjlAXDW758TyNRjUUH4PiXYRgeOR+3
	+t9C1+gLjCNeeUv2DEfsgc7MALnwJE0QD6D4k6aIe9gh1uBFZw6F1uTpbnjEXBHIZ1Z0iH0x5qE
	92L/hgb0GqiDOc7tzoeXqueYt0JPnI/rwcV97SmURwUNwXIZJjlOH8LskfLrBr6a2GJf0Q404Dr
	bvMx7ypBhMhsQqJtaKiNu4U/gUAzzwhpmqkldhAVZKO2kF3XKe6b3ywBoZMY1X+eBeoqdNVctJx
	cdQMheugloLWv21wT2ES0S4SmwoSPgh73gZNyv8jUIC3IfhtJ7Msuxdic8jeoa/mx3DTiETXsEk
	=
X-Google-Smtp-Source: AGHT+IF5pURPLoHQQUwY6iobOMXaj/n4QtZUV4ZbycQ+e8lZRNMONMXX28RkgoVRrFQeanZPW34ebQ==
X-Received: by 2002:a17:903:2346:b0:223:635d:3e38 with SMTP id d9443c01a7336-22368fa24bemr111392555ad.15.1740839125810;
        Sat, 01 Mar 2025 06:25:25 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:25 -0800 (PST)
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
Subject: [PATCH v2 01/18] lib/parity: Add __builtin_parity() fallback implementations
Date: Sat,  1 Mar 2025 22:23:52 +0800
Message-Id: <20250301142409.2513835-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062526_800973_26A7758B 
X-CRM114-Status: GOOD (  13.50  )
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

Add generic C implementations of __paritysi2(), __paritydi2(), and
__parityti2() as fallback functions in lib/parity.c. These functions
compute the parity of a given integer using a bitwise approach and are
marked with __weak, allowing architecture-specific implementations to
override them.

This patch serves as preparation for using __builtin_parity() by
ensuring a fallback mechanism is available when the compiler does not
inline the __builtin_parity().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 lib/Makefile |  2 +-
 lib/parity.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 lib/parity.c

diff --git a/lib/Makefile b/lib/Makefile
index 7bab71e59019..45affad85ee4 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -51,7 +51,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o base64.o \
 	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o bitmap-str.o
+	 generic-radix-tree.o bitmap-str.o parity.o
 obj-y += string_helpers.o
 obj-y += hexdump.o
 obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
diff --git a/lib/parity.c b/lib/parity.c
new file mode 100644
index 000000000000..a83ff8d96778
--- /dev/null
+++ b/lib/parity.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * lib/parity.c
+ *
+ * Copyright (C) 2025 Kuan-Wei Chiu <visitorckw@gmail.com>
+ * Copyright (C) 2025 Yu-Chun Lin <eleanor15x@gmail.com>
+ *
+ * __parity[sdt]i2 can be overridden by linking arch-specific versions.
+ */
+
+#include <linux/export.h>
+#include <linux/kernel.h>
+
+/*
+ * One explanation of this algorithm:
+ * https://funloop.org/codex/problem/parity/README.html
+ */
+int __weak __paritysi2(u32 val);
+int __weak __paritysi2(u32 val)
+{
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritysi2);
+
+int __weak __paritydi2(u64 val);
+int __weak __paritydi2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__paritydi2);
+
+int __weak __parityti2(u64 val);
+int __weak __parityti2(u64 val)
+{
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
+}
+EXPORT_SYMBOL(__parityti2);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
