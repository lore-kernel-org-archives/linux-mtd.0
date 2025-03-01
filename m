Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B821FC282D1
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kee5tCvpcdOhM1xBp3abLk5I46OJxNBIiiQPRagqQCM=; b=fkKcNv0OU40zJu
	nGB7/mPbLJr3vd9XsdFF4SBRAEp66eB4JddwezKHt00mHbHtib40Zqd46EadSIAWH3dzgL/EdGr9l
	20NTi9z3tHEg/p1sH+1Zt3NSQdDkGE9jJEBWot41PTnUCXpcFyfRv2ipWQgX2kqWIY8YHd2u0lXrh
	F822uxoWhiX+O1AOHc2AdInH8FUG4lngEfxG+7XuPcZbZ+fZwXThqXwewkaQcHbwE/DydCkTsU66K
	A5N8Wh568TLf1XDsdNPha+E5cHzqWDvyMDyF5qN3aL6xRW3dzsHOCdU90oryyepOSC3utRmaibnNw
	FJKa4UZxo4/dAd8zpLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNpJ-0000000ETXw-3pKN;
	Sat, 01 Mar 2025 14:28:25 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNpI-0000000ETWd-0YmZ
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:28:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2234bec7192so28701575ad.2
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839303; x=1741444103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
        b=aE1wtreFnfm5pwJXtzdCmyGR9Dw8fjDzW2yL0qIz2MzgAB2NRl0ytJS8m22zPYeyxK
         yquUJq9OToa998i9GikzmVeXwJozoz+CUJGd0PUETm0n3M9FxeQjAPOjX9MCabP2xM/d
         tNul/7RkJjP83U0P8WKM98Izk9/USXFaVk5zvVT7KHOAs4OB4CtuRA5+vXN52Ts+3zED
         PrwNUfIsb9A+UZUf6E9v5hIxs/Mx0zjuw1EkwJOOgfY4aYaqh/o8UqFr/sojtyO+ZtPZ
         QruusIvcFcvulwGOMYNwTInfiJnxmDSXqDTJjzmBAUTYbU1k/9w7CHRoKUswAScdfxkC
         SWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839303; x=1741444103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+YDx3nsS23nFYRYOsOtDL2pw2M9KWSnqwRamUvuzKU=;
        b=fbypF8Gf6KUs8hY6C+qgUt+WNbJg6K/ejT66u9wZLWvx0ABaNmgGSYel5dmu39D0WW
         euhmK55HnATaz2IsLraEJDIwIfWAHjTwmoaEN24REHfCiQdw9OTj0bq1WpDFN1Y7xPXH
         h85yCLJBC8vsxOmP6FS8k6V2+5kcGesEiQXgin8WV2aQFTBHRIs7kf8FTWJx0YNapXtb
         2sOdN/B7Wa/84wuGPczmlQPhPexTsYzesyYCUVuuDTRy/GH3MfLlDVCuAqOLqB6RHfT8
         dBbDwrY9cF3JP46SLD3d3Z+31wmHEszQb3CKHwko2UCBh68uIQl0MUg9VXsRboehnNXA
         QAug==
X-Forwarded-Encrypted: i=1; AJvYcCWkbWMjI7AdaJy6QULK6u8c+/2XXSqxxVIAchsynmNZ8wIcHnvxNALqnCt9qsPlyJkYhckaZD/h0D8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf6T342U4mhUfHZOzsc8F8SSPExIe+w1V9VU1obdj4Yy1x7bs9
	kytSUELHi4Y4swHeiKzMEvORJVXcOK6FFmwXBFgbvHssknaQbr3w
X-Gm-Gg: ASbGncu4e8zUOJ1v98l5pn4uYLSZxgY88SMNah5hhBqntGp+MwCn+kyEt2ijPkXBO+C
	R/qyY5yBh2rZrRMx+YZlfrK6frRr22zVP4CrcqCxGLxf9MafFKy9t88wvg8u8EM+aKfDuAIuxk7
	nbXSCF07WOED1hzwT7S1G5wi/AATU69GR9GJ9MLl9IZCLOvGTJ+Bn69l6ZGzh0jflHkVJuZs7fg
	IzXEZMTyNY35rqoZj8VOibSSB45xyVCYSD+9YHcIE0ZkiDtpAydB85WyBz+aiVXikTY66dzeN/J
	kJsdqeYoWFGMB6fy5QPpgoOici+1KZ5CuET08cxFCLmi/Qhs/xkcrajn0qZFr838mYsXaQE6yGU
	=
X-Google-Smtp-Source: AGHT+IGhHD61bMoj/kNCGfxuoRIMfZUbm2G8Vzi7r2Cl3xtga31v9ygF/WbFM3AD1XuJUCHC8w75/Q==
X-Received: by 2002:a17:903:41cf:b0:21f:164d:93fe with SMTP id d9443c01a7336-2236922174bmr117354565ad.53.1740839303516;
        Sat, 01 Mar 2025 06:28:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:28:22 -0800 (PST)
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
Subject: [PATCH v2 18/18] bitops: Add parity() macro for automatic type-based selection
Date: Sat,  1 Mar 2025 22:24:09 +0800
Message-Id: <20250301142409.2513835-19-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062824_171842_7ED38ECD 
X-CRM114-Status: GOOD (  10.52  )
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

Introduce the parity() macro, which selects the appropriate parity
function (parity8(), parity16(), parity32(), or parity64()) based on
the size of the input type. This improves usability by allowing a
generic parity calculation without requiring explicit function
selection.

If the input type does not match the supported sizes, BUILD_BUG() is
triggered to catch invalid usage at compile time.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Place this patch last in the series to avoid compilation errors.

 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 41e9e7fb894b..fa4e45741dff 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -339,6 +339,28 @@ static inline __attribute_const__ int parity64(u64 val)
 	return __builtin_constant_p(val) ? _parity_const(val) : _parity64(val);
 }
 
+#define parity(val)			\
+({					\
+	int __ret;			\
+	switch (BITS_PER_TYPE(val)) {	\
+	case 64:			\
+		__ret = parity64(val);	\
+		break;			\
+	case 32:			\
+		__ret = parity32(val);	\
+		break;			\
+	case 16:			\
+		__ret = parity16(val);	\
+		break;			\
+	case 8:				\
+		__ret = parity8(val);	\
+		break;			\
+	default:			\
+		BUILD_BUG();		\
+	}				\
+	__ret;				\
+})
+
 /**
  * __ffs64 - find first set bit in a 64 bit word
  * @word: The 64 bit word
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
