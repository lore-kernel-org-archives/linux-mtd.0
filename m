Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277FDC282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zNKgFricqpU7DnWhSnnKZ1E1kEoHlTTMOO0QAtlK1c=; b=FyKZwm/TVTkr8p
	YV6pqb/K0tEwbMlfFSZU+auuP+VmU57YhZnRWKOG1Kj0oUDuCAXfCFCkLIYM1CG/luXEV6n+AEq0H
	snDp7IK3CP1R3+nxZz9LAe2g4gx9mzu1vZ8PD5K5Hiror6iGqRHpH/lo0ZLQeDMyItNaIb8mG82l+
	+Qj/v3n5v8zvjszLZTC8X4+UipjKOT9T8+fGucBqDKsZo08LPWALUy37jiVjB3Pr2Otx6Bs8AhinO
	vehgNj4HfBjXRNkY3f/UEpbtyQtpMh3pgqKcfoiCieM/UCbOiYWX/HK7DwXqiHXLTTIduwlCWTYpI
	3zc+nuylvqOVg9oPNrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnp-0000000ESZZ-2L90;
	Sat, 01 Mar 2025 14:26:53 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNnm-0000000ESWg-22JU
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:52 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22374f56453so33971035ad.0
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839209; x=1741444009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=TO68qYJAOt77GfEpF3lKYavKsx8aGCRIrIA91woBFv/toOYB4EVOQqt4fBV8WokJIj
         z2SPhcJITGjsL/92a3Y5uGov9K3IUUqcBpP/7nwzfHZANBVXZCxW1uDHSSRshmroCZKt
         jhJumMsKDCqQM+cO8vTHbthPZtSfUD0zkX/wCjqn0x9BaEjj1kwa8Wv2YLhSHkf7Bk4G
         UFAZyQJISGvadTAYqbHiV6Y1B+reKiXYavo/Ui5RtqoFdPoTl4wAbgTtpOtrbD66gzdm
         LhmFzlX0BC703Vl2B6X00JEt3uZAsMHF+kf1bWaFbzlSWt7DB8Zer2+eGsGaNrrhN0iA
         Af7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839209; x=1741444009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4Bkihj4DGACHQctYAnhtp6nEz1RGAPDBfirVsTzUzk=;
        b=ju3/9ybRhDOyYdP6BPYZtldvw0b/e0iiNOpw2eAT5iwbkavNqdtvjJM6CPl5aLbqFy
         24HnkBYbl8NnPertkjkarDV7DDQpKaQbYKl7mHeYVirDOEYCrbWMU0saouhxImYWf048
         JGWorZjlflcIXbCaRJFLH/yPmsDGDOKjhC60GrHchz/YOu4D4U1cmDqtB/erQvch4LCp
         BHxEiP3Wn7HvdvaUNIrePjwhrkxnaU0uzV6ZLUBECKXZLOO6JqLksc8i2lEQsxAVvM4J
         M1svnjsgTYnZ51klqTRMQFXtEON3W24wQEiFX+Bn2byuxZyHlY4O5d65SyeV9X++QZlr
         GB5A==
X-Forwarded-Encrypted: i=1; AJvYcCX40p2LLlA3gZivoKoVMwlbhA0px703MV4eRAdNPjOsCPvdaP55RX7zHY1/TaRfOfMhBusp/2gZKQA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxzwglnKWYjPTRW7R1dVzIh6+ddSdSNXBQMZ7QtIV/SCSHScyWf
	crxsuWT5+ARqKw7jY0Y4o1ObXB7NVoMIbO9cD49w1u3+bwwzcJXP
X-Gm-Gg: ASbGnctmOQEfFtZDji0sm16FehiWVG1B5JzhcS+J39R69J/asTFpZxK5yMfTQLD2Ld6
	J9wCAsWYlWaGzMRQ3UwrJunXzimIWLew3+2Bc4u27iLUrnLg0O0UdfRTafntCF+2iTVRpkT/Cmb
	dQhJIvNLBvgZcOFFzkBL8xaLJrD+RoLhJvOQGMVV3sKj5SEi3c6foBNp+cxd3f3j4tP2FFDRGUs
	fmnUD5Vc31cZN5Kj3MAGJai9mRjPHTDT3+Fv/UsXuXRJqrk2wTJRkqUeF9UM01SlHFxY9Dv1NFD
	TNq5X2FGv4FKxb+NZHLOWMIRygrI4V3NKlZJVj4LZo5anlx4LVsJcdIBMfBp4kZ1rmrs8m5Pblw
	=
X-Google-Smtp-Source: AGHT+IFGrjgDJrSlPcepaZbcj3TRgBvaEfqqC0e6onE8P6bMgkRDhKKNubsynOimmjCrDvdqjeVQ6w==
X-Received: by 2002:a17:902:cccd:b0:21f:b483:2ad5 with SMTP id d9443c01a7336-22368fa8f6fmr116510795ad.20.1740839209574;
        Sat, 01 Mar 2025 06:26:49 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:49 -0800 (PST)
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
Subject: [PATCH v2 09/18] Input: joystick - Replace open-coded parity calculation with parity32()
Date: Sat,  1 Mar 2025 22:24:00 +0800
Message-Id: <20250301142409.2513835-10-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062650_522821_632DD027 
X-CRM114-Status: GOOD (  11.47  )
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

Refactor parity calculations to use the standard parity32() helper.
This change eliminates redundant implementations and improves code
efficiency.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/input/joystick/grip_mp.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/input/joystick/grip_mp.c b/drivers/input/joystick/grip_mp.c
index 5eadb5a3ca37..897ce13753dc 100644
--- a/drivers/input/joystick/grip_mp.c
+++ b/drivers/input/joystick/grip_mp.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/proc_fs.h>
 #include <linux/jiffies.h>
+#include <linux/bitops.h>
 
 #define DRIVER_DESC	"Gravis Grip Multiport driver"
 
@@ -112,20 +113,6 @@ static const int axis_map[] = { 5, 9, 1, 5, 6, 10, 2, 6, 4, 8, 0, 4, 5, 9, 1, 5
 
 static int register_slot(int i, struct grip_mp *grip);
 
-/*
- * Returns whether an odd or even number of bits are on in pkt.
- */
-
-static int bit_parity(u32 pkt)
-{
-	int x = pkt ^ (pkt >> 16);
-	x ^= x >> 8;
-	x ^= x >> 4;
-	x ^= x >> 2;
-	x ^= x >> 1;
-	return x & 1;
-}
-
 /*
  * Poll gameport; return true if all bits set in 'onbits' are on and
  * all bits set in 'offbits' are off.
@@ -236,7 +223,7 @@ static int mp_io(struct gameport* gameport, int sendflags, int sendcode, u32 *pa
 		pkt = (pkt >> 2) | 0xf0000000;
 	}
 
-	if (bit_parity(pkt) == 1)
+	if (parity32(pkt) == 1)
 		return IO_RESET;
 
 	/* Acknowledge packet receipt */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
