Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C16C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGWSIRJuuWXh73y+y0O3IVgiGYD6jONAQWkA/NzBepk=; b=uXpu2l/Amejzwc
	AzOm2xaKKaHZNDIv1/aysV7rUJ0AVblkZwYCkOAWNU3s9LZSweRkUFNYo77kZVtMpr9wamqa2Ib7i
	EHJuM+2UP5Vhz/Rbnp/5jYrKScnaGpNMOcUXhhuyBGv59wjzsx8CGOORrGGjmKHbf7xiXkmAd9Nfz
	3tTRHjX85Wmg2wS08XVCZdGQ1gNpKOnyVdDfYwuVxPtv7pgB65V2sKnvqtCbV76ZGlIvxaazPmopX
	EhWQVN4eIs076xLjPG7x5gfpW4T0FqgkMJvJyGuneSUZRX2KQtALD8dL1VyoSjntIFoIXXltwNWNV
	d0aLYo/SHy3gRu4LQGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNme-0000000ERpM-1kEM;
	Sat, 01 Mar 2025 14:25:40 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNmb-0000000ERnj-1y5V
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:25:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2235c5818a3so14252475ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839136; x=1741443936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
        b=ISnsRw6BZyunKkXWzvpgCA0VEnonnjpeWHwThfUp/daC1Gi283slFIZ+zbDcIeS/d3
         LRAt6vyIS71eqDSkTGyM/QQlFvklzu2kCOD/OMg0Ldq086WrkYsR0diFQLDxn+L287ls
         yLy1NNQ4cXuCCHA6kI4Rg6Oz1WqGU/9DSCPXUbNdMzp9O8PK4i1fXQefNh5AXAuomHE+
         Ak5TCu78p8EGiQR95/w+sdqLmVrii3rtdsHQorgNOoUGEKky5hsaMVNeniDL2XDkYMMT
         xw8b+JhGghlK8+fTs6IThm4vg5t3j4EjwvcO5k9PbuwrqWioSRAbaHgz8OwF1Oy19APo
         MddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839136; x=1741443936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DnAEglK79Mk3omljF0fSTgcHsRTccmWpKjUoP5FAFM=;
        b=lpuqKypOUK0ij0TznDWdikuJfib9tOuF2zb8ErecKxtqxUHsv/JvJaH9KXAojpvWJh
         PLnYySW8rkaQZqXRLMWkSa6wNpptLdpCNdN1/PbkFWQgkaJusBgaZIGZzoBVevaWFuOd
         5692n83vxDQnUyAvQQtyX/t591n/XXqQ9SE9SiHv1EKAbaaIXGSG3daztjHu/fwaCDpz
         2OcXho7ojc0eUjBk7bBqOob9Jjz4LHORSv4hD15pK2QK96Oxs1akTK05Cq0/U/HVSsLf
         xNj9Hlk/m0lITSEPwDBubnLKNtsI+PqM+TOHKmTgEpO1OKF6i50+EvNbTLSlqZwREvCs
         wr7g==
X-Forwarded-Encrypted: i=1; AJvYcCW2FJUZHsR519fvhMfBsSM/vTSbVwY7HFbOkwUDeYTH+KswSIytzG6lBWmA4u2riMTIlCj5iYBxpbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyX9+gJ1khg/RKEM18b47mAhRCtSiTtZwTyqduGi7kc5zOe0fYR
	gYK4RXZ5uhcGlx2bCTYlohBi7D4QU3hVIuPwbn3ad5GDeLbGtmc5
X-Gm-Gg: ASbGncufNVYBEyhzmUOMVL5a0XZUM6R0KA7Gzee0p4Wip1koXhu1I9Nu3yjCL5tNdZv
	wCZnjuIzUthN1wqDRgCaIM3O3LDkndM8StpAVS5DqUFe6YORnRooEy4z1gFzbyBXZnpNy5Sc0a7
	LLQ/iXmDztyZ7OPg8DDm2AFiTPUWUwjHx8DVZYio+/nZ3NcSVtADILF7lCuyUV+2v6hvEdAxA9E
	cScHOEPZ9v0LYTqNB2lpn37lXAROVc+o2d/s/37OZcdjrbqRNiIikhsDn6PMLweBnhjUdJ5P5J3
	qirsCGAwhU0zy1pULptArf2ZSq9zCvxuHVHqeJjgyaZ0R8AYVH047yYkJ8rGeJi/orovIpZod4Q
	=
X-Google-Smtp-Source: AGHT+IFRKRz4BN5AxlaA28KHfZNYjOTMLj0QAU9lL8VlPLbOS4h8EVG2ykvV/etQT7fBRPoRmphS1A==
X-Received: by 2002:a17:902:d4c9:b0:223:5240:f831 with SMTP id d9443c01a7336-223690dff12mr91198085ad.25.1740839136548;
        Sat, 01 Mar 2025 06:25:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:25:35 -0800 (PST)
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
Subject: [PATCH v2 02/18] bitops: Optimize parity8() using __builtin_parity()
Date: Sat,  1 Mar 2025 22:23:53 +0800
Message-Id: <20250301142409.2513835-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062537_508848_8008923B 
X-CRM114-Status: UNSURE (   9.31  )
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

Refactor parity8() to use __builtin_parity() when no
architecture-specific implementation is available. If the input is a
compile-time constant, expand it using the _parity_const() macro to
enable constant folding, allowing the compiler to optimize it at
compile time.

Additionally, mark parity8() with __attribute_const__ to indicate its
pure nature, ensuring better optimization opportunities.

This change improves efficiency by leveraging compiler intrinsics while
maintaining a fallback mechanism for architectures without specific
implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..4c307d9c1545 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -229,6 +229,27 @@ static inline int get_count_order_long(unsigned long l)
 	return (int)fls_long(--l);
 }
 
+#define _parity_const(val)	\
+({				\
+	u64 __v = (val);	\
+	int __ret;		\
+	__v ^= __v >> 32;	\
+	__v ^= __v >> 16;	\
+	__v ^= __v >> 8;	\
+	__v ^= __v >> 4;	\
+	__v ^= __v >> 2;	\
+	__v ^= __v >> 1;	\
+	__ret = __v & 1;	\
+	__ret;			\
+})
+
+#ifndef _parity8
+static inline __attribute_const__ int _parity8(u8 val)
+{
+	return __builtin_parity(val);
+}
+#endif
+
 /**
  * parity8 - get the parity of an u8 value
  * @value: the value to be examined
@@ -250,14 +271,9 @@ static inline int get_count_order_long(unsigned long l)
  *	if (parity8(val) == 0)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ int parity8(u8 val)
 {
-	/*
-	 * One explanation of this algorithm:
-	 * https://funloop.org/codex/problem/parity/README.html
-	 */
-	val ^= val >> 4;
-	return (0x6996 >> (val & 0xf)) & 1;
+	return __builtin_constant_p(val) ? _parity_const(val) : _parity8(val);
 }
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
