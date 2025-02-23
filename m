Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364E5C021B3
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFv/VfVJCCjKTvM31anZ00KCan8uQc5wZ9mt/o9HKjw=; b=TTQa7kL+sUQLJS
	Xrk4Ilv+DjRdG5Ut/VnquFzLXK/FxIrmsxWEZvr3pV0+D/Mf9gU6HJ7WkbBBt9+/iWnt3+zI1QmPI
	559ditftFt40ZVgdP4Ihhp3oIF0zPh41AdciHxHbdTgi1yV8yZuBsfIHEERs9e6w/XDS3rAWkt+IA
	gzVBR0B0ACrQ97I1Z2jm/J8ougEpJZm8xx4sC3KkzixcJbRtQRkRYVUA+rm3B96IQhX8vNAuwiSxd
	tpdVL1rs+ms27tyWOl2lwkhNEqS3VQiP75pVZaUBHjlax9+RQg+/KokU+wHwxwELH+CP6PBTs3Q6v
	dI7J39K/3zDDfE43Rtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4g-0000000BPk8-2178;
	Sun, 23 Feb 2025 16:43:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF4e-0000000BPiw-1Q6m
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:43:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so5702221a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329003; x=1740933803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
        b=jg7bgVsZ3QaHRie1kkLiNwmOQ2Qi/Fxb6vAlAof+uZBBI9yESoMQrcZNBOJIZHIlZd
         ZnG+6bxWiqi2wRIc5wCA5//FHUxUFIUdVWkKBOv58AkfNAPyFcYxZKSpKNZTFdbThff2
         6XGJHFlx/C72TBl4eutVtAm1jOLodtzdgAqxd573BaldeIJQ9CZ4f4Zo1kiCf7YG6NDL
         ZGy9qHpElmzmGgWfB+c1yfke2OR/dv67CuCiq2kHYxlyB83WDBTSSq0rz9I2tcEGczbJ
         HooBAwR274tuBSkxiGQgCz45kaPtCVvkSfZvHg1zDb88AYCP/i3aU7V7Y2INjzyjyA42
         lzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329003; x=1740933803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmrxQyU7jDRE4tATauCMPx/rjxqRJrbj6hI/X9rAOQs=;
        b=cSTol7CK4Py9uetFqw7Rr82pNtcpEb+A8WRi54zGahMm8AS/qxlFctpUflbcS4umUF
         N2d3Yz0KchuZIRLx0UG1mckqcWgSXgDEnx5ElEKAMlgJnRVDnuOmHP9VKiZsQoafA/l8
         GoJBiWzJnP2eFJWaPLVHJe8EQ+4yRcoJGRn4SBVSqJcdcXdPB0CztgHQ4oJ+0jazjqSm
         ex2AH1HkhYYgPzRAADnEj9CDa4At0VoQ8JZbK6goSJKtqKCJylAlEuFZ9e4SwtE+kRp4
         D8WK5pyEGxjzezN4loHRbYB6ZOU2udNVaUBKsJr/5eTzxSinfDCsZUgUl2lH44+ZrTFA
         uopA==
X-Forwarded-Encrypted: i=1; AJvYcCXImyZhH9z9Rb0FFzmyFsFmDljWO3LpJU6txSxNeS7aTqqvheccwfqt8p1ZOt7pOXTDFUZ709XPkww=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7L/KDlENDJ8wyph/NwOExKtjKHDxFTMZmiHupM0QDXzBFuEAn
	5UC9UBFvRFSj3ehokOyF8pjaevaieaaaQ9lalur8dMf0jvPLWGRj
X-Gm-Gg: ASbGncvSg5kI5fZij0jgKjS9u5b3ATR6gDbwe720nwNP6vwn7g1Yr35IhHrbBlqofn9
	ku3Iu3ayuoan7om0+tXH1ZmEJgrgUq4ES6RRLDowAMrf3gE9g3UyrwNjvGkU89q6Ira2WfmnoHO
	4jHFBK/RcklNfolSRr4U0P6eVkAUh/QGV/uE7v3NmrTI3CoYSlqyPFTu8oC8+A0C7zp5oImE1Cp
	OggiW7Y7rwRrh0k7oZKpO6Pm7PdDSj5v+zPXHDgG7xWSbofbFPKsYedqiHbDtHd7J1cVDlbnl7O
	UoThZWh0O15HhTkQMrWrKkCyVcMLr5J3lNMHci/OpdlXdiGfEXES9ywr
X-Google-Smtp-Source: AGHT+IFT1Vzkj4StFehOYZfGx3Pqek+1r8/xkOZDF3lpptIfx6ywtn9p4F3sEZEqv+n3pwXv0Ec0Og==
X-Received: by 2002:a17:90b:5488:b0:2ee:ee5e:42fb with SMTP id 98e67ed59e1d1-2fce789bbb5mr17312586a91.13.1740329003448;
        Sun, 23 Feb 2025 08:43:23 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:43:22 -0800 (PST)
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
Subject: [PATCH 03/17] x86: Replace open-coded parity calculation with parity8()
Date: Mon, 24 Feb 2025 00:42:03 +0800
Message-Id: <20250223164217.2139331-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084324_378621_FCE48B40 
X-CRM114-Status: GOOD (  12.41  )
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
 arch/x86/kernel/bootflag.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/bootflag.c b/arch/x86/kernel/bootflag.c
index 3fed7ae58b60..314ff0e84900 100644
--- a/arch/x86/kernel/bootflag.c
+++ b/arch/x86/kernel/bootflag.c
@@ -8,6 +8,7 @@
 #include <linux/string.h>
 #include <linux/spinlock.h>
 #include <linux/acpi.h>
+#include <linux/bitops.h>
 #include <asm/io.h>
 
 #include <linux/mc146818rtc.h>
@@ -20,26 +21,13 @@
 
 int sbf_port __initdata = -1;	/* set via acpi_boot_init() */
 
-static int __init parity(u8 v)
-{
-	int x = 0;
-	int i;
-
-	for (i = 0; i < 8; i++) {
-		x ^= (v & 1);
-		v >>= 1;
-	}
-
-	return x;
-}
-
 static void __init sbf_write(u8 v)
 {
 	unsigned long flags;
 
 	if (sbf_port != -1) {
 		v &= ~SBF_PARITY;
-		if (!parity(v))
+		if (!parity8(v))
 			v |= SBF_PARITY;
 
 		printk(KERN_INFO "Simple Boot Flag at 0x%x set to 0x%x\n",
@@ -70,7 +58,7 @@ static int __init sbf_value_valid(u8 v)
 {
 	if (v & SBF_RESERVED)		/* Reserved bits */
 		return 0;
-	if (!parity(v))
+	if (!parity8(v))
 		return 0;
 
 	return 1;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
