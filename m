Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2BFC021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FkqkvANrytEm7N8YyVmlShssuziICQYc0VB875XlMM=; b=uMymCLmMcG0CFz
	fdVhNa/EN5oh+HrWkagnGaV32+rcJgBhKHIaqkh39nahvAeMCk+TjAWhaUZ+1IQX436ZbLKJny+yx
	E2LOya/SymrKoxxSQgGZRWI/itNdHreBvtJ4KAjFmnKelL4QBDMT3DJeIzfCBXTaYtsFH9aP06neb
	YyyJ6I7scSAYYKbwyJfW22MgNHjdqa0yRVsld5CPz6e920EeImn4pYPOUty9vQ++UJgDxOGTIlMEV
	sEsYCdmw9rsIgOoJyA/iHU0w1yCdyyDfOT71VF/bxOsMD+9neNnu2QoARw6T/l6No4SMTloJBhK69
	HK/I5OS+K5Mb+rgLB1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6q-0000000BQrp-0dKc;
	Sun, 23 Feb 2025 16:45:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmF6n-0000000BQpg-0EiC
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 16:45:38 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2fa5af6d743so5646228a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740329136; x=1740933936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=LKur1tVxWFqb31GeQMH6SbRS9PgdDxcp+lw2blIcvBiyFUaW6YmlJMusyXVjpYryuF
         obsmvIa5wzdVl7YukjuAmr5ZrwqSRXJzEKYTrWOuLwnH6jPA1+DQFArbc9OFHNJEpJrO
         IiDhReqToaEGajR5v+D/vT9FYGzx2AzeWj5sJ+F2ZjzGdhA+dx3wQ5yb7mQrbYFVSEVp
         rTov7gZRj/214cExza3QRHt/P4dg2HWgpijd8Rs2CUBbGicqzHpYg50rW2cBQH+K+w+x
         80IXyZts1Oddnb9a8hkFfRQktJKX5HPurY7s7mLXiaZ2BCQxAWDDSkypSYH8lFE/TmOY
         cJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740329136; x=1740933936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H92cNXD8ivdLBJu7PZvS/WlFHsCPSxa0jaZByFXEmx4=;
        b=PEr2wNzW9TnXHowJz7LRTAdKed9Cwwp4W5T5KCQ70IgiyfHo6ewQl9TsAMVogkUYj/
         TUT6UcZbfHbvPl0929X+jbXFuOuth9cXbRBOxbetGxH+xYn4xqOyUEAMIld/W7ozRnK7
         9R4QOeBgUGlthTT3ocd07rD0fSnRctvFdwHfqtVZbdoljH3sJA9/qIMkQJa2SyB2bsWv
         pCTHaBHLHgJP1/mhG8F/w7p/wPlf7JdF9cI7hpJzNbVZv2D/Cz62syJtNfG5fc5PcL9l
         TmB27kYGktjfUKfvY9HmBFkQzx0baJ1HPZvGAdqgqq9n5c4tsqHSVixRSKqoKs0xSGaa
         b4lg==
X-Forwarded-Encrypted: i=1; AJvYcCUtTv/S+vGY5lGUfrJwiVpZBsnVCu+N3M/eY4E9F+wghfvRnJGvVUQ2Ww7t3l4PNNc+5e8HLdm+vEQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmeAJQ6UQhGKPFhTYyAMynkJkFCJRwY8bSUBQYNWBfP56pHwtX
	fGSTTy34wTdIo4EY2nM+FLDAFMYGXl9G/4UNATiie8NzCPC9QpGP
X-Gm-Gg: ASbGncuwQix3xF7vefHR+Bp8A82h1NpDTQc99xyG6k58pdWvIrpOw5+b7JzcGZIuDim
	/JkFy6cVW0SKn/pdJlDzsUkHNy/BnL8j0Y1a08/9Uk/A5KmyWQscNuK4Zuz6URnQa1OEEhecwMN
	ngg5lNwGDB+KYu8+Da9QytmhodwYZff8LyncjvBZ2hATZ9JVKIkLiTcSQybrKNAIlbWFKSJPt4M
	oz39TvToa9jzjXojUsm+mpPHqmp7zBVb0vAGzqYe2J3xPKCRkoTsfjvLYscPkwp9/BZ7QESQo22
	qukyIYXVQ0U26q8TFrg/KVIg5X9qmQ/Rk2SXmV6QpQVzebagf8lB6lbq
X-Google-Smtp-Source: AGHT+IG/5m3vxk7XH8yJGRjtosKFh6pQvnNnT6e9O4ZXx67836JTtD9gPOQACi8OqZVBfLdHsuq5WQ==
X-Received: by 2002:a17:90b:2e0d:b0:2f6:f107:fae6 with SMTP id 98e67ed59e1d1-2fce7b1a82cmr15222650a91.23.1740329136041;
        Sun, 23 Feb 2025 08:45:36 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb09f6e0sm4935080a91.44.2025.02.23.08.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 08:45:35 -0800 (PST)
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
Subject: [PATCH 15/17] fsi: i2cr: Replace open-coded parity calculation with parity64()
Date: Mon, 24 Feb 2025 00:42:15 +0800
Message-Id: <20250223164217.2139331-16-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_084537_095392_8DEE63D4 
X-CRM114-Status: UNSURE (   8.76  )
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
