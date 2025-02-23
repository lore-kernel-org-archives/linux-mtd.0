Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA024C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ay+fbsI1ymmp7xbBV3vgH48XbVjXYi4PyV3S9MNwBLk=; b=i+7T2SIHaupeFb
	QbObNwbBq66Iq1+xwcv8dRiChyLf2RMVTsPTOtvNnKPnsq8VLtEyu8+zQgTCZzlV7OC6di47lmopa
	KRzoM7pJCmo4sP6gCRYTaAVY8G6Kl5iB3EkgEGN17oYdicso9arC1S7sIgkkSnl7qjruKpivNH5Wh
	Nal745NrtlnkMJ3Fng8u0jMe/jFcoWdWaQpHLVMe48GjwSq5tsa4ezRS+NtJESoPONViGRsnJx7jS
	g/nfbHlT+F7LzbnNI1+wjfqIqz3UpwK0ZK4b/hZWYbp8SmVM7N824NtfYxpRz0t6TfJ+RKhBWdmd0
	ndK1Lvagb/3V9GDgpk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4V-0000000BPfF-48dY;
	Sun, 23 Feb 2025 16:43:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4T-0000000BPdg-35bT
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:15 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220bff984a0so75865555ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328993; x=1740933793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
        b=Xdp5vz68Q3Q8M4R5j2PoeopdgE2XqKO6pe9PD/NbSRsB8fqRPx4r/eySHTSxaJmIxz
         JRmwhFFqBnIzxWoQlPdaZyMrOXJ/XRGEj5ZGH0rwRStmbtqtX2f61cejL2lfiRC4vuaY
         G5Su9EoJPbEC7gyloRHVffWMCGZdR8Iva+tX17ldp3QR5klJKjNkAqQos2m0k1W3VCvL
         SnO0u1OkUTww6LPbM2hyLWgRppz7FgZ1ihjxdCtZmxAdR4+aodlzrv7GXNDVHxRUn+fU
         CtQu27zclA+j4oFKeBNWGfToDAqBaKgeyiDost34U/X1H1hF7ZxJuCRTDsUjNe+FTa5x
         epBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328993; x=1740933793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwB7nlCWtszUSdGoti59nJGyNKtl99nOClvJi35M3DI=;
        b=Tb+P9xirHX2JLzRE5NEIGfGJ5htnExZF+7ONPCKFnk/MyDHE3xa2p6q9KQ+52mvrln
         uRsLP8Bn1vdHN/ICWIa4TLeXKW0h1Lm6FcUcDSrmA3DtUiLh875MhRH59lPmVccFxlQf
         mZBuDFLAFA84rKzAB4uIHGDoMI7+ebTrO4LAMYzXL3NwLWJLwBbNEurx8ip6BJoF+mnK
         KnqTsBBzNNW2J/yOMHUqnbkUuR2GBzRLEoyUHamZbBDm+wguZkfhcuoClP/PQENVzeOI
         r7EgCWC1nCrHX3m3B05usWETP6WjvTSyeM+KPftxxlVXjHnlfZbyF1tYF2hSMUUebz1j
         jV1A==
X-Forwarded-Encrypted: i=1; AJvYcCWXtRCkPAYJNRQt+Ad9Y/IImgvKPnOWVcXle23JMz4RMr8ZmbrxA+bHrmM+XPMJ+UJ4z1AmlvZR9zA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUJbEY5WGJbHww5Jd+aJS5JtcBjbt9ZwmpLyHDhOvAnp7YTfHf
	YzM0wPOC6TudBwsLKamc8e2ALvM2MtfSb0QlbiVefxj/owSqUFFn
X-Gm-Gg: ASbGncvJZCxTP8iIoMuAEvPdtS8foJ4oupe5snXBY2PJTtHgJQQx30TW8WNMmVEAEx9
	w+1YHgnTvzKuBnGO4wIDxRNIEw/v4cS6zn6mqL3nvAbiUzcq2NuzZ96sxy41zn85BqV0oxKY03r
	Z2ZYE+NMeTbY9Gmv0IMpeU6pUKMP55dBSktZz4XgFNChsqT/RoRmyT2AZMBC/DL5i2HdRaBXwPU
	/d6X6584n526iprgErQz23U5aDgjjDxhb6EiaFsE5k8a6dmcyokvLPRqPXEbq5Z+qfbEOms2bgS
	LY9/WGiCBuYapJNhkqMaEiSc33PpWmb3SuKEGrrvuqeoAPci1f8xanfN
X-Google-Smtp-Source: AGHT+IE58QWfaLQcoNHwIYpospn75AI8MBIDPjCyLRCCZKoYKvgXR3FRMWiJgPdm5hfaVo9o7EyRAQ==
X-Received: by 2002:a17:902:ce05:b0:21f:baa:80c1 with SMTP id d9443c01a7336-2219fff2c88mr180524175ad.53.1740328992776;
        Sun, 23 Feb 2025 08:43:12 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:12 -0800 (PST)
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
Subject: [PATCH 02/17] bitops: Add generic parity calculation for u64
Date: Mon, 24 Feb 2025 00:42:02 +0800
Message-Id: <20250223164217.2139331-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084313_775782_CBE0F0BC 
X-CRM114-Status: UNSURE (   9.47  )
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

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity64() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index fb13dedad7aa..67677057f5e2 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -281,6 +281,28 @@ static inline int parity32(u32 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity64 - get the parity of an u64 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u64 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity64(u64 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
+	val ^= val >> 32;
+	val ^= val >> 16;
+	val ^= val >> 8;
+	val ^= val >> 4;
+	return (0x6996 >> (val & 0xf)) & 1;
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
