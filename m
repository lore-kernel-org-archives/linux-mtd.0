Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99514C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImqHyDeF/YR6f1zHY9gpL4vIBY7rkQ/tl+3ZSXVPrbw=; b=L6vhRt1c4pU8iz
	LlC5GGkdgc4H2zjs/JceI/RuJ+gAnDRzE06MpK0ojsnIAm6u+HNB/fumfthTk2BmoGSGt2aj473On
	Mb05crBCHerU04LVjgbUmpsWvFrthdE5JNiu6FW33Vssr6JaM90ZAUDUjVM515NwQxdg+lhMl7Wh+
	NvlLnsfelTrHfDfWklilhj/UDlqZT+f/67qh+FJK198YcD3xNB4mM+2XroP3cBam/ghR0AKws0Id0
	oHn9OHk78q68LhI6TkKzzGCd/G1XPFQrOsQuIlJSiz4BsN1dIu0bhdRlckJA5RmysFswxqp2x5xJd
	bV7inmP3VlBTBzSQNaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmo-0000000ERw0-3wtX;
	Sat, 01 Mar 2025 14:25:50 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmm-0000000ERuJ-1U1k
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:25:49 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223959039f4so3588485ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839147; x=1741443947; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
        b=SJyDmOsX0SM6q0ftvGkRLaZwiGZpuRv3M9BpetcbHsCnjFhp4LnQualeQQ9D/pAhgD
         RzUqaMBxUw/BunZUvBL02wLLdovlh3jk3vlxjtkS52Z0kK6yepigAsY+5LF8YR1onUXx
         zL4K5HsWTynSHkxiKQ57L8QZo13+UaR39KYfKV53BA02RTmGwUbdQT7Hieqe4pO7a0kX
         k/eeZqESkcKGjSWkD0OjS1AJo52izRADR0Angsr2c83yaFDCemBaOORs+qHr11pyg3p7
         GBd52upAKre6dPTKfXueit4kzrdrbehkjAyDr1NbqwQpHouShP1U2gfGb+/0gQuE84xy
         TAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839147; x=1741443947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWaUwtVpZP3UXTpS/tFZiOQ6e7YZSypzh2SSq6Q5dUY=;
        b=bMOHvnpA+30K5+oIQk4m82bmiZSiPj9r6mSrk0khn0FJzwH9zQjaDHwCWw5E05dDpd
         L6LH9DHQlA0HyHTTSM6Tk8OvAb6tCRzqVexvbyUVPKgz6YkzKqlje0nSSLBZrSsIQyBR
         Tepe0iPOwnEQkhxORBZplUl+UVPIjlhBLoj34fEsM0SVOF/qs02kARcmeRdCwe8vKQxm
         mSxSx6QfE1OzoD4KsUlZpc8g4BSuQxGhJCAnp4ZzzjIj1PL1NS45TxwDKNt/PRRuTDs1
         kbSU5yaV/GPcTSEmu2bXkNGVX1p32FIP8Mg1dN75Nukrrx5dx2tRzQc2XS1/Rv/aJh+S
         pUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdzDxEuAc6Zpb0s/dhXsFhS8u9946wOP7AvoGPTTZkOwsAF5rlxVSGATMysaC5PiPkaN1Vv6r4nLs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz5zFh7DcuKrDUvcB5e95gQBE/4Tn6adJOtcjAehKSWnY6MZ3S
	812F6M1xER8UUJA48UbgZ5LOjJYbsYfxbr5tdCoQKGsqDUczm2gk
X-Gm-Gg: ASbGncsiAShCWn2x3rApiDNbH6X3YpAi59MzemIDlvSvb4nD3QNil2Ap4iX0Zw4WA4D
	gof0q+GXvKAQ6mFW4cy3573t6xV/iRt6f8TM9XRu01itjB/zJ4are1jPCtSizHcho6moB5/s3pK
	ONW9Qp4l0xFz/0Kx3+yx+BOzS59xnl9S2txC44JmEN0z9EQJ2BFl1SxoDmSrbmQXKdCGobDI7VO
	SrkNAW+cdY54jBqeLZMt6sLEP306d3WvbEuxJm4TKlc/RUgaNT2w0WVYL2QmPnxLPMgnwcljZ25
	GBcaKAqpJKcyrRlXq6n/rXQOP48SuzNuAbG2aej8zW01XcW81T90E0T4nK+FOraIeehr3cl0QAA
	=
X-Google-Smtp-Source: AGHT+IG6ecfCPGcNZUMHBfcPl8yc5atQiQ27orXscqjAcai4Vvxl2x3xemsSJ5TeQh/ex0SazOZMFA==
X-Received: by 2002:a17:902:d48f:b0:21f:507b:9ad7 with SMTP id d9443c01a7336-22368fa8f1bmr107105175ad.25.1740839147356;
        Sat, 01 Mar 2025 06:25:47 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:46 -0800 (PST)
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
Subject: [PATCH v2 03/18] bitops: Add parity16(), parity32(), and parity64() helpers
Date: Sat,  1 Mar 2025 22:23:54 +0800
Message-Id: <20250301142409.2513835-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062548_390677_E3B11FB3 
X-CRM114-Status: GOOD (  10.03  )
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

Introduce parity16(), parity32(), and parity64() functions for
computing parity on 16-bit, 32-bit, and 64-bit integers, respectively.
These functions use __builtin_parity() or __builtin_parityll() when
available, ensuring efficient computation. If the input is a
compile-time constant, they expand using the _parity_const() macro to
allow constant folding.

These additions provide parity computation helpers for larger integer
types, ensuring consistency and performance across different
bit-widths.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 63 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 4c307d9c1545..41e9e7fb894b 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -276,6 +276,69 @@ static inline __attribute_const__ int parity8(u8 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
+#ifndef _parity16
+static inline __attribute_const__ int _parity16(u16 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity16 - get the parity of an u16 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity16(u16 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity16(val);
+}
+
+#ifndef _parity32
+static inline __attribute_const__ int _parity32(u32 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity32(u32 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity32(val);
+}
+
+#ifndef _parity64
+static inline __attribute_const__ int _parity64(u64 val)
+{
+	return __builtin_parityll(val);
+}
+#endif
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline __attribute_const__ int parity64(u64 val)
+{
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
+}
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
