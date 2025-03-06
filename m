Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0714BC28B26
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz2zTtgcrgxg3QfsGoEcyoE/ZTolJlj44PxK2KjwoJg=; b=AMz5tv+jAkxjlW
	G0xnbRXwAV/4Gp+y+jNTU93KovQQns1NysFQE8ANhI5vk+7n8OPc1PFuBy2bl1dhRM6h+nmKYjPtc
	l+QEUmENTAVapKNXzSEwoEhUHcVR8Z8SJD4Ure6LqQ5wRHKt9Te16/w5jbqC629kRtKT9MDorh9jr
	oR0q4iVTH6Q3e9wmGiLmyeVO9FL55uMTyaLlfXGYLov1q9+fkZqwoOprsZ1yqRVeEjWmI/4czOJTm
	a/VvGNdyWGZoWQBdGls692lI/RJTS8B32d6+nU6k6LhWS772Jlosfr6/PMmwlHfVBv/YzaLhGLtw2
	Of6DK8kEX1lXctNf3yNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4t-0000000BU4S-1Yai;
	Thu, 06 Mar 2025 16:28:07 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3d-0000000BTc2-0nMJ
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fea8d8c322so2026954a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278409; x=1741883209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=N9zM05SxYAPIjph1NpUGj/tfvPsxzmsQnMOslYvPhUj8AJWFKLrHn9YY0/alY8XvOc
         YwtWQYZM/4YEcOvOSKWPxq+M/F+SxJgjrKuAnlSQxVarbsuhRyM32y8VGjLL8AZr43VE
         Jgah+vMtQE+K6LFTM71pvY0Kr7N9DLS5b7cOCqHQQHDr/ARHGmupgvI6XMR7BTvYAvDs
         YzDYxmX1rTYc3FfNBKd/xCkGe6YaWfAlgrCxAKFwlNMHawiUgmUIktgsgXT5367+2S+s
         rgCElARUXJNydK1L3YQM+JE4/8t9QIlwTMu0H1Kw0Ndg2yuSy9OPef9YHUmnnljY2IbJ
         BTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278409; x=1741883209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=UBHKaqyUG6qbgL0yzFQGY1n1Gowvi0+2O3RxeasvCQJ4vAwtehPbJjxKABFYBzpCx9
         6DwSsEYjEeL76s8OpRwq+EWmYa1tAiGi/STeHG1ZTp6DDAr4EJttrIUHYxapJu1u0bO+
         L2PQMLdOVoaRifZQFGKVya0ig56F354vOFws8I4IrkfIszs6JNHxwZHqKTJVrskRos6n
         rRAiUHYDjci3VdRkG1Fy/rx+TjJ02Lgg+pJif+R3JomYD/M+3TJfk/6KKVlozDSejbxZ
         R2aE/obuuvZiZIgnRHQamgwxJDnItWpS6quSFp3Fx4eNURssXaYap+3erwVwOX3sgOM+
         30Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/sYeADd+A22m8kO9NePU6YsvlNfMOWttcjrm1HB6QEGhACWqX0rlK9g04TViSVchm5zN0QAFMZg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5lBxhu4NmqY9YGD/J5Q1wYDcgu5NV0Gwlpg5JioIEOay3bQpf
	r7MgXiN1B4GCl2TQgKf9O8Tax7Yqi1t5MvP8GCXPIRRlcXBFWvjd
X-Gm-Gg: ASbGncu0oqxJNdvgK+OFx8RKiHnfPbBoEbZmNC5scMIPYi0fAgEXQtzGEO7VO8ZD4U7
	16Ao5KmhqvqOjaoFKaMnS48NT7xm5CW12EvR1tXePkiX0MIWAQmHHZq1ueyQyaCVp//rWTvX2TL
	J3SxWbKPnLuxMHu5hvTNnc/Y1zYcTHQciOmM/ognk9IunKzhbDHzcQT9APvPXGkPCtwVk+4wo2w
	fK3N3gONUndGP+5NCkXZM+jueNnIPdpKxHVQK/T1/4J1Mz54QEVQyJY5ID4shAv3eaUzzx7JuPE
	jsT5mPWTE3xpIhx828MV6QiQQZQm1voJGTfNOlNBFyaNIF+WGxOER7lHGQzbTamRv1TGzoKkDO4
	=
X-Google-Smtp-Source: AGHT+IE6epbCXvOg8cIc3QqWkrmaal2XvyOtsnANvbKq/mA/VIWvo3NmMHOwXwWdALV1bmHV/eFsdg==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-2ff7b28a652mr262212a91.34.1741278408658;
        Thu, 06 Mar 2025 08:26:48 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:48 -0800 (PST)
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
Subject: [PATCH v3 05/16] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:30 +0800
Message-Id: <20250306162541.2633025-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082649_226297_AEC81EB8 
X-CRM114-Status: GOOD (  10.49  )
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

Refactor parity calculations to use the standard parity8() helper. This
change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/i2c/saa7115.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/saa7115.c b/drivers/media/i2c/saa7115.c
index a1c71187e773..b8b8f206ec3a 100644
--- a/drivers/media/i2c/saa7115.c
+++ b/drivers/media/i2c/saa7115.c
@@ -25,6 +25,7 @@
 
 #include "saa711x_regs.h"
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -664,15 +665,6 @@ static const unsigned char saa7115_init_misc[] = {
 	0x00, 0x00
 };
 
-static int saa711x_odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int saa711x_decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -1227,7 +1219,7 @@ static int saa711x_decode_vbi_line(struct v4l2_subdev *sd, struct v4l2_decode_vb
 		vbi->type = V4L2_SLICED_TELETEXT_B;
 		break;
 	case 4:
-		if (!saa711x_odd_parity(p[0]) || !saa711x_odd_parity(p[1]))
+		if (!parity8(p[0]) || !parity8(p[1]))
 			return 0;
 		vbi->type = V4L2_SLICED_CAPTION_525;
 		break;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
