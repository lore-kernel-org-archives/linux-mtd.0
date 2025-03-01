Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33073C282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz2zTtgcrgxg3QfsGoEcyoE/ZTolJlj44PxK2KjwoJg=; b=lzBOfcGzXp1A90
	NzLmRGNWLdirbGxeehJgFyfw8ak8lTSNfF+g1nBJcjqqpL54aWUanGaU+B79B7cTaWLA9NZx+cxrD
	oEwFNo6GnCUQQgZCUlmqrYtYAWiMr4uF2ugl7FjW1hKB+In0m3FwDq5hwc8aEkK9sdIW5X7139ZxD
	5bK7eqFkcp3SCVXlru8U9uVSDnwFc8G8YIhgO6Mv/QjmpNUJ9QC4JWoJyuFgwLYPNnjJHqpSE2lxi
	/rfLISFD0vfLf68iXtSRDQDMdMK4I2h+cp6F9wbsSdr6AEErxCFNrpMv8pe2h1MYRaMjWkAE5VrdC
	uHaNfHO1Ij17UuM5asDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnI-0000000ESGI-0xH8;
	Sat, 01 Mar 2025 14:26:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnF-0000000ESDA-33pt
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2235908a30aso28659215ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839177; x=1741443977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=btLDlbyTzQ3J9SiYRjuCMd6XPb4Tvlh8rAXsEzloZ4Nuq+zhY7lVFc0U94AeZd+vsg
         0p75bcCUKfRtbSCGtbVdo8o/cq5LnPMztpUQLYZfp7i2KftPYWOYUObWgUj0gTacKydr
         BbOnUcaFWwt82r5Z89DB18Tzo+vV31AoNgU6YmXFc1TTm30jj+Z120JVzoYwy+4xo92g
         K6qTgJ5BBuDVCjyDA7DCTPFcD3CtcRGNkWg5sOKoyel4oWRK7ejP3ndVcWCUCpcoX6kz
         WBkP8ROJysgyLxtp/2qwDO4AofyCWfBKPxpNrl11ae47mAMz1hNhZn3j76m518qKCDc1
         u70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839177; x=1741443977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=wuV5Q0Au1262jOgIhjrDas7+F0v5jsYNyFZXKNZYK51L2kRixvIL3aSIq68jnDelbP
         SeTIQ/5C28IsGvh2HKcVaUrGva0nAZe2l5jpExGmBfUPSmtoQOxsHm/5X46v4BulXpEl
         HOJqg0FVtrc+SHcleEiAfPbxJ63b1iuYZtjtcPsAba3YNlTApxFFIIP0ZWoSq17gLtMV
         y6/zIYnfzDzeAZjqxIrbTe9a5HxnKvFvVVUwcBvUrFU4ghDL7Ul+6r7XkpG1AWbGBkgV
         N/1YwAsQ58FnW+eNKIqfz9qZe+pR6/s1kMwE7jG41zuzj68V42nfhEp3fYXd10PzNh7W
         e7hw==
X-Forwarded-Encrypted: i=1; AJvYcCVe2SkxKRbyVGwHp7/Vw1K+NJqBRnQzFJpqzXPan4tyUmNhW9X3RKaoNbDvPSLkMmrMk6227HtwFoQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGZzRQV0sGZDRj8YXtGnSsyybaRVrS9F7jN1ix3b16ReBQ5Bsw
	mNvbZMvP8dn6A+W4HsCCoBIHlyhcp6fuzNUgXkZ/uwQysgdXLap9
X-Gm-Gg: ASbGncsT2ID8vD16BtEA3kl/FJ/hinodoSwe3+3KqhO4ZWcKFZqAvVyYfz8XKxSYY3e
	cBnIOhGid5jDqs60tgoEdzkZuYKVySuSQySQgrn2MiPWF0pC65BOYpK/SzZ/5L+1a3kM4JJP9RU
	T+1X4j4Z/i6oyQZhxejDrSzFg0g8PE2VQt4QLul3jGYh42W0676FqDK6Ajn0jPOqE+0CqlAInfp
	NS9fzobL+k5grwXFWCBDMXbi2FzdPLeTZTPClFqejdMT8Z4lmjcCHJP8nYQpWBK5sPXIKs17Rcz
	9VLLDGFoh2tCLc50nhRumLbOW6ZdTOS7oi/05LEn050PhvZG+tMGGWlyl1mg7mBRp3dC/0qj8n8
	=
X-Google-Smtp-Source: AGHT+IHr7/bNocCASgkhvMFxO0zdSkmZKMBxSgSw4TIYugdqe+gxkfqzHvRXHP0fkW72YV0RkO2YNg==
X-Received: by 2002:a17:903:2ca:b0:223:4b88:780f with SMTP id d9443c01a7336-22368f7558dmr109533355ad.17.1740839177198;
        Sat, 01 Mar 2025 06:26:17 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:16 -0800 (PST)
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
Subject: [PATCH v2 06/18] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:57 +0800
Message-Id: <20250301142409.2513835-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062617_765120_ED43BB86 
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
