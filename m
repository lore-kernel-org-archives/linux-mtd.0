Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B67C021B3
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBj30THC61+wMyF2Y0qHET5dj7Bybw0l50C4UvPEUDc=; b=VYbxxaz5Iu9VMF
	f+Kz0IXyVqyir/JhMTGLSmTvsP/V8KIWI9/npJGyrRX2WauOdaKr9wnj6Jyighq7Wp/8j7vyfuzAs
	U87k/m8hDHgNnEaV+5pQT9PLRN14kohuUQFL6JrUVf7fI3qA+zyyrcqPCVXIIiFcq0f/tvaYmrgbO
	fq2XHYYNI5Rjz0ZMSALrrf3juMWHpv4ra1RAeNMiJmg1R9XJdf9mjTC6C5cDlmhhNOYiDvCnz28cS
	2H/bdK+2rqJOZXEJZL00JOd+cDe6VtunJQ7Nro30RMiBZ6PgIDcgbAjv0Z/+XLBnt1LCvoksDbmA+
	BgWIjlWK6mnvsPrhVIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4K-0000000BPZg-3PjS;
	Sun, 23 Feb 2025 16:43:04 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4I-0000000BPYf-26gK
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:03 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2fcc99efe9bso5600715a91.2
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740328982; x=1740933782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
        b=jbrZiFT/r9RiVIk1vAMgQM7Ty39mV4QAcBQ+iDmgZAwuVscASTF0wwncNrCMDAyqdL
         G85MmMH1n4esxjOjSieAvv8ZP8C99sTxRS04VhYATVTiexW+zS4Da9bnzFf0yzUudZJk
         QfRdu6WmMaq1xHTXc7GyJnrhtwE91Fx1BNUP1Ht7Rz4mgkl/umNVWyfhZaXoo40IaMoC
         sWL5zjNxYBGbXkDarixiLa6d6JNWJV6+p0MCvijhK75Wo4mNi5Wx56wO6yfdIudRtuSh
         vDuVMyPKhK77cjeQV9JlBl7NgJR4lK90crOS9ZMWZayylvGJaeRi5rcKZnEuTnWr3Lp6
         m/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740328982; x=1740933782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8NvrVTMlDH5q7zXpF8J7bfqPimXPkp8jnsCRo60EBQ=;
        b=Rd/hR+/mIVZMPLgGXb9OBcuqvIGCgZ/5jeKu3sJPpvKc6dqo+8dCNXxY4mOx+r12gX
         Ok+XAufzcjKnE5fy93kOqVgDSVB2amIZVgTHiJenCgmk7JVKkD1dpHblFaG/5VCDHmz7
         mZz/KAMwYEXQE7SbO2PP4F4CbeFMJ17aaXsoEmGqGdvBLTtIZsSudwu3oGJC7xxKJEUa
         R8oFAwJRCFQkCUG6fLeN8m26OQIf4KKcql8zo0poDY9Z97spkhsGW6V/5kItJDML3aWH
         vJKnRqOzjijJTcaBjhw+rTtBE4mhsmBL7fcEt84KeY9AJ/t3AcYfiCbLGHQpW6w7slkJ
         dnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbSsWQyLIUB5jNWLnqMQogFcAEltC0OyqmIdxmJ1aZpfVPMYicZdoyj7P2sLc7Y1fcjLP0SClBTfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP76vj05kb5iGCxEG2RXisK+JmmSpIF8ITLogLeA0tAZ+XVHeT
	vbIgBl1I0fF62KZlLpO4H+huVygOETyIC04Z3ExfWgxKrevhQmqk
X-Gm-Gg: ASbGncuYTvKIxz0LM2uZkuJQtHhzi1s7Ijefwli2s6j9ke45ZP9GW+j4usO6dUqYwmL
	R5uqWxfgzwq0pxV3LwkiHSqqz9kRZIytMrdX7wSaKwxIxM/eJcdDy/UicTCropsD5oh3xLvDcnV
	nkm0h3swi2ypKiDro+QXmjyFFrzlaZgm03vD9+ugGNPsJtuHWIzb/an4gAyjePlZHeb/mzo5hns
	MI9k6wTAp9iIa9er8vBm41zsJbYpBVENwxqBybunKlaJnJ/7y447kyYJulm0HKfwrlzUK92yRNB
	WSeVfp1I2OzpeRnarELR2OPtUspSybi+lxCaudJVpub+dgpW2Y8EBoCp
X-Google-Smtp-Source: AGHT+IHY182dhZjo+LBq9qsTP5GtRPKleXwf977mCGplhz7BFQQV3AK7mJ142hsRvikrULeBFmErJw==
X-Received: by 2002:a17:90b:4b90:b0:2ee:a6f0:f54 with SMTP id 98e67ed59e1d1-2fce86b31cdmr16578615a91.13.1740328981599;
        Sun, 23 Feb 2025 08:43:01 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:01 -0800 (PST)
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
Subject: [PATCH 01/17] bitops: Add generic parity calculation for u32
Date: Mon, 24 Feb 2025 00:42:01 +0800
Message-Id: <20250223164217.2139331-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084302_539243_F1472C88 
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

Several parts of the kernel open-code parity calculations using
different methods. Add a generic parity32() helper implemented with the
same efficient approach as parity8().

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..fb13dedad7aa 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -260,6 +260,27 @@ static inline int parity8(u8 val)
 	return (0x6996 >> (val & 0xf)) & 1;
 }
 
+/**
+ * parity32 - get the parity of an u32 value
+ * @value: the value to be examined
+ *
+ * Determine the parity of the u32 argument.
+ *
+ * Returns:
+ * 0 for even parity, 1 for odd parity
+ */
+static inline int parity32(u32 val)
+{
+	/*
+	 * One explanation of this algorithm:
+	 * https://funloop.org/codex/problem/parity/README.html
+	 */
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
