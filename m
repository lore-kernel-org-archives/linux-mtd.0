Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCDC28B30
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9/WBB8ysU7q8Hyvu/PB8ej+wN4edrKbNEGcBTz0eyQ=; b=h+wyZRkxE3YXyv
	8/ApChFRrS8gIeZAmUvTt4r8NespCrpTaOkyCU4lxu5xx+OOgFE7sRxu0CKEbcijDXLOSc9Pn/b9m
	Y5w6ZvI+bQlHEsbpHnj26I4hb0tKU0wH3DFJUaQusj75JKhv366KXqIxooYNRPGKMU9nYG5Wl4z7Z
	8mFxu9IqbUoZtOEHEQgRbx77sX7y+2emcDKSiu+dJw+lEQspMrrvR8CfuJafnLheBdpzDXZuivXCa
	0yXkt87dZZP5sBhR99yC/A4ufCM81bGU6OXcfQDA74orywHyLl2kOUvl4KN0ceQxmjl3GDsyg+31F
	M9ZiVn3IAU6qJE8EbLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4r-0000000BU2p-2X7D;
	Thu, 06 Mar 2025 16:28:05 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE38-0000000BTQG-04sh
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:19 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2feb867849fso1489708a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278377; x=1741883177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
        b=Z/jRA14BFDuMijvO3LOvqm8CpWgBqy/Ligtt/6gNxOnwK3vvl627IAHy09QKE/2oWg
         6IaUIyaCbjOBEogku4kGn/JE4ilYqeXAAri49TTamX3128R9DbT8vLPlOcRQJpXkWh73
         mVFMpI+qwq3K8rpdxBFdPtz7HVPHj1KX+J5MbKLa8yS+RXm0ms279sDEonQKtdOO3EIb
         P6U6Vb8yQhqRKAEcyE1Kgrh5I8DXyIyUvzv4qO9nUsCJoCs3J9WCVsx2W37APDcrDfr4
         WngUHX51OLD1n4r8B5hTNbpcGp8V6pGghk/unMryoNbmxSHEDD8mCy5CUH9+5AQgVLbY
         bSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278377; x=1741883177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4VnYHrG4RwnHlGdrfRVkI5G3ZqKaX1Ck3mTCfWdoMQ=;
        b=u3L0yap+YQkW0kvlF6nCNokVpkRFGWDMp0wUyXOeZ0vaIjHP068akulT2zTksmh1hK
         cT9kyILF5ncKm19Y/hH/Kzg5Gi4QkEFlJfcXz2Stgbkymi3cklmZ4gqL7D0uMsUWy9DJ
         9S2FlEk0V9A7Q8Sla/+1BpO0VnqhLFHorVdIHdaOCdIsRR82Fjk83vgkFekgz5CXieep
         J85+Gx51eRFJY0yWYFrWDxaAeKyWMT4rEnFhziL/Vw84NJ4m/KXj/AkTqBTRx37U8l9u
         zipZe6wjhuzwQBagYQWtJkgZ1cYgTBXUmM/HOaYV9O186U89erJ2OkwFUiTUXRj5RaZe
         JInQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/JMclxxSy43E7hsXQsf5aRfjQThuewJ6JkLI77H3iz/5T6Mhm9dB2dOCljOPnjzL03X8CSJt5MFE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKIrUkWcyieLCHtEw6wDrApzhLuisPplEUTWufAgSG+OuWXysN
	rw4MsFQmL2it89v442dZESD1+ad8g1uN4xjgYJEOlRiUF0cp4gp+
X-Gm-Gg: ASbGncsAM6DzkBU/7sMCHAtGKd/Lgnv2z0u3tGxfEHYb/6B+BmsF9JtPU77HoHpE/8r
	sFCVMRbDfCtPo/SrFb65vT3A6HKLziTMUVrbiTJV48wd7RRwl2zS+omrCeTRxXDuQIqzq3P0dK4
	D9+AVae7x0agAwX9WLCkTLP7J3U9SULPHs9o27zBpGVVYWOzjksHMcsIgHJyS0zCKWBHX/j1Yeb
	6EABvt8g7zgrjF80hXO9LzIEgr4qS7DSOwgJju0i4XdefhtXyvV3iw0CVkhsIjw6YqB8nv56XhH
	MI+De9a1eMeQqTIlwcfNxYSwbb9rcVAW5wUPMsm5izaHpcBoWz+uBP0HzmkEBrb/0ceP0Gf5MVA
	=
X-Google-Smtp-Source: AGHT+IHz+gPXGVLABcu1Z5L/FQeF1foGDNMRW0PUwFQDBuhtYoYyf91GQ4fqN6r0d6c4jX9sVUpwVA==
X-Received: by 2002:a17:90b:264c:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2ff49753d20mr10753652a91.21.1741278377011;
        Thu, 06 Mar 2025 08:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:16 -0800 (PST)
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
Subject: [PATCH v3 02/16] bitops: Add parity16(), parity32(), and parity64() helpers
Date: Fri,  7 Mar 2025 00:25:27 +0800
Message-Id: <20250306162541.2633025-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082618_057979_F5D1B8DC 
X-CRM114-Status: UNSURE (   8.81  )
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

Add parity16(), parity32(), and parity64() to compute the parity of
16-bit, 32-bit, and 64-bit values, respectively. Each function extends
parity8() by XOR-ing upper and lower halves, reducing the input size
progressively.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index 44e5765b8bec..906757e1ddf8 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,48 @@ static inline __attribute_const__ bool parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity16 - get the parity of an u16 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u16 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity16(u16 val)
+{
+	return parity8(val ^ (val >> 8));
+}
+
+/**
+ * parity32 - get the parity of an u32 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity32(u32 val)
+{
+	return parity16(val ^ (val >> 16));
+}
+
+/**
+ * parity64 - get the parity of an u64 value
+ * @val: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * false for even parity, true for odd parity
+ */
+static inline __attribute_const__ bool parity64(u64 val)
+{
+	return parity32(val ^ (val >> 32));
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
