Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E080C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FkqkvANrytEm7N8YyVmlShssuziICQYc0VB875XlMM=; b=NKrqhIS3Z2EhVj
	w8PD7yz/kqyK+RPyod+cv28w5DMfY5rOduX1wGHHaGQN+dbj8YeopUIEEO9M3yQGc1KrogzwLDIPp
	h041W46d3bGmDPEsbyr4dhEO0A5L8D6J8X3QiQG1Krsodehz8N7yYuR2zzqvxtX8acydJqMSKRQ6B
	QgeMfxaaRKkwVDrfgfWHYQTISnTd8JitY+2XcWa6SUhH6MjJAmXY1j386IUYoqXu8qzlQHyNcFNVB
	JrAamiWMVlzGkZ/wVGEvUPNAAKeKe4oQ08yGmiotZpw/j2+zQvu76gZI1Umudff3tmXB0b9lW5br9
	3tDrDV58GFJJwzT1AA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNoo-0000000ETDQ-2Rvq;
	Sat, 01 Mar 2025 14:27:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNom-0000000ETCJ-3DOy
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:27:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22385253e2bso13339375ad.1
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839272; x=1741444072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=JjJhljj58DaxOpo8I77nPO8sptkCbwrvAJlcleQ9zSMzgK6/W+a74FLSqErVlNwftd
         EyFmkWuqqipEsqF7Jw/M5reXIgf6QSOI081kWT6VDhaxue4SM/zbeCPqZA0o8tj/6tI5
         +VwnAJlTZwaAz3ONDNxqqv8SuRV24IUjtBTqVjtfdn3EVMXqxWvQPoRDZE/VJOsvBtzS
         BY8+yLZKubb2sTLy+9aW3U5R2agHZUrHjURO2DG3Vh/1+lz1Cx8UjWTRUJF9etqF++cH
         QU++UpjtqxibqEZAUKG49q1zK+NbtfKWjivGEpcoyKUWwr4WBj1MAHE9ICGI+3iyROuQ
         GsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839272; x=1741444072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=EYA0AGZ2wPpZkrys2+XoejpyV3tb/yEi8b6V96IzzMNnmcn5PNyfrkgq35EOpQd1Qt
         klamdl2voGe1OLUaQIQ7ZWjfUJwFX2vN5b3henbZiGjiQfLl0azfDa16z3bfX6BikjRZ
         W+3B8awB/SoVpcnWjQnv9kH+SZGeNbTUY9CKR+pOGD7+91N5bhJ/fnoIh6xVDx/hwY1t
         lH6oz3WjkrWJU8185av2E6qFDUM5sfEVsH7RL4QfUaOqmJg60Fo+9ipR+QkmXTFJhPES
         W2DLa6le3GXPMbGnTx4mzYt8jHIA+gNARF3XmjR3Me6CRFAXmDEGnTF8pvNeorYrsLfl
         k9ig==
X-Forwarded-Encrypted: i=1; AJvYcCWWLqZyIuW1WOYOJtXlcMRZxsioWnAv/lk1J7LvvHT+HNgAulWY/G+bJBeF3lCx88U38zUN+DaDY4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmdppKWy+hqSb/pYMLQ+0vQLPAxPllzTUX/KyL9IuveU0SuutN
	tpLyuoMSGmGOuH0uZlP0PaAPZ+j2vjm+cauic9UYhCfswTsZLvoZ
X-Gm-Gg: ASbGncv0IcxFjm63byLjl+5ZD1D9/ZSYCdkNC6tBkyvlkdwVW9GavP5XIC/OL0DvyoA
	crvaCRruifT0K24/gTdvcatiwodRN8JhBLqOH3pkexfPqatqAa9TRHqj6zYDd3fOt75Okh8s5xU
	f6lM+9HDShc3QSLttsKSg5lWa53NWn7BGEV4m00JsJGOHlsX7drjgB3n6KTZvICtwQ08I0CGwvu
	5zRMSwPacrRoJvR2D8dnvw5cj+SNMAhPRU8j3mtfeYirnmkAomIZu0Z8E9Zn2P0Kh8Zu5XJtm/G
	OzL9vugv4yX+gCb35JYS+YLJd2vPaUstu7mYhUk71xJV3tDZVyh91X1LnvvO+RdwswhcxeMiE0Q
	=
X-Google-Smtp-Source: AGHT+IFJ7v56//ubfe5SZfIgarRaf2kt414B71bZC0lL5Jm/hhEy1S8FPvdkgRl1jpN6UW8NLO4j1Q==
X-Received: by 2002:a17:902:e5ca:b0:223:894e:4376 with SMTP id d9443c01a7336-223894e454dmr21360135ad.43.1740839272112;
        Sat, 01 Mar 2025 06:27:52 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:27:51 -0800 (PST)
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
Subject: [PATCH v2 15/18] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Sat,  1 Mar 2025 22:24:06 +0800
Message-Id: <20250301142409.2513835-16-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062752_803364_F1F9CF13 
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

Refactor parity calculations to use the standard parity64() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/fsi/fsi-master-i2cr.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 8212b99ab2f9..8f558b7c6dbc 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -44,15 +44,9 @@ static bool i2cr_check_parity32(u32 v, bool parity)
 
 static bool i2cr_check_parity64(u64 v)
 {
-	u32 i;
 	bool parity = I2CR_INITIAL_PARITY;
 
-	for (i = 0; i < 64; ++i) {
-		if (v & (1llu << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity ^ parity64(v);
 }
 
 static u32 i2cr_get_command(u32 address, bool parity)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
