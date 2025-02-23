Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93618C021B3
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz2zTtgcrgxg3QfsGoEcyoE/ZTolJlj44PxK2KjwoJg=; b=LDtHXcgg/i0AM3
	CHHVy9olPMyjyzLmk6zDWJ34L4A/T658Mjamt7uDPjxrmhnAk0jGShJQdpNGLYVw89DG2zu+1BLxD
	aD5yImwEYoZDTSY3FK9NR9pTSb3ZLJ4H0FIrPgDH4HVEZQWdDeQveelJhHoxhqbC0cpL7D3f9fS51
	TyIDBgzE2h4dTNVEdZeiEVBqaOIrGxGPIfV8n4SaYKbu/LJzh0yRgyVZBGj1+zL3+VyI9kj0F7HEx
	98HXx1khwv2wINYxYtwbCeU6OoKYJN7eS/AExvk1lCg+vOFR/l12SYmvFsm8up6EydXSiKsbQKwcg
	4sGfdD1Pt1s85nzmbCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5E-0000000BQ20-2wUk;
	Sun, 23 Feb 2025 16:44:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF5B-0000000BQ0d-2mcm
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2210d92292eso109434445ad.1
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329037; x=1740933837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=CiWImcvFNGY2PKTYANMJIVUiwx9l7c0kgg6M+nMnGT1EtyS5DpcPaarHfJ+SHDmQBK
         bReLZtHxj+0ZAfb4qOmLal8ZyYcJZS6x5I9V8EIT06tE34zwtskw1kKGgHc6UGDSglu/
         K4fSxJJ6f7sVoPbqM4VVQ4ArSGQkQQfU3vrp5/8YsCirO5QZh1Abf0+E/kBWFQoeDZql
         0bMGn3ScxArL0Mp7Ueqo4NuwEqhG2ZTYROopeHiYQDweGeVMz4VFIMLObVdUHvtgqzfz
         Tr+4sMbvfAOb+U5Mzf90k8krPq/EfD79BPEUsr9tXr+xmg7tCktnCZq11zKXOWScrade
         yZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329037; x=1740933837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZw0QJRtM6IhR4KZmh2KNqroHre3ebnX5GDU+1y6qXk=;
        b=g3gYFT07ThPpiUXTFPQg1UOrdAWAuSgfU0uiLKffJXGZRr8pR5pkf032VaO3TqyWGm
         IhDvSyUoCPqgOcgH6EpdZhrdZzvIkZoCor4eO9eB0zIBXxiF/VRoQicwFkrUwN9DHnIM
         k5CPXHx5UitObAIcKG/b1JcBmcTDecQ4f+Vg8KQ5JR2edHUsTqdvoCvfI+tE3MIdRdS2
         EB2ND/TUhHbqnIgpvggUiT11FqmYhqvESVkhCTCzU1QuupQ4ZqJsCga7e5oOlRnE2fbB
         N8lJ/L098VJq5EmcDSlqzwwYsH9hC8nvMGR/5/uDN8PJOxusaFOFzpkIDk1FEF99yKBe
         rP5g==
X-Forwarded-Encrypted: i=1; AJvYcCVJVFBwpL93J35gKuFVr1/tFpzddsySsVpmuSBBSu+v/5jsyiW3sudpaBXfhk9duF/XfSIyHCt4i4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV1ag4wF6ZN4NMNijARBpU0l0LbYA2sCQktwCX+SPqnb2j66D2
	SQuESSO5QTyEeS/u/RrEsLnKe4ADoFlRFiJtxrvb+GkdILT4/gwJ
X-Gm-Gg: ASbGncvfppzam/tUb5oagwqmLFK13yrJORuy6e+kAe8ukhjCOWJsH6SJ+itl7Wmb7n/
	ERMgjdVEJeGnC3wmlAQi832L3Au/DaBmu833R3i6Ca3k7h8mp+NCRjhxnFDHk5KB+mD/3b/X3Vb
	+CRZZOz1RLs1u8pe7St3aBIGHd9LIR3fUyomTKSmgA/4A5+92Ddlg1KoW6zjsknSJpvmhWhe8Qg
	QqRXAXaBplo90g+96PorpNP4QZ8q40hNm1kzws5tIARY8dYMdC2EL7OdPRoALDmpSDGbdCmSYvz
	23QLpfcSWAsI+8u5GL2gcTO2dYRld1ewfx3i2bsiDaxosFs+YVIuum5t
X-Google-Smtp-Source: AGHT+IEgNthmnTYYE27hPhlCIM7V4DPg7XXe7YBwN1u1Fl+WN3rwEYwr5OtCEkA4s1cdBmE2mWkiww==
X-Received: by 2002:a17:902:db07:b0:216:73f0:ef63 with SMTP id d9443c01a7336-2219fff4377mr185099965ad.49.1740329036761;
        Sun, 23 Feb 2025 08:43:56 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:56 -0800 (PST)
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
Subject: [PATCH 06/17] media: saa7115: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:06 +0800
Message-Id: <20250223164217.2139331-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084357_702063_8D872FF6 
X-CRM114-Status: UNSURE (   9.74  )
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
