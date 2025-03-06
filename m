Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACBEC282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 17:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1eMxFYsjtU5LA98jqHJFyTXHOrRjOGb3ZX983HSSKs=; b=2xN3PmBOjpoOlt
	3ejhydACFius/8l8HiVMfBNAaqHMaBQrDTRTdfaADHU1A1fEEQ8Qjz/OQwdT9S5tRs0PRivMLdhFF
	t/6Th/TP3bMNqxv0bLHE3qNGe2kO7dbqVRVUPhNqZ822gbYTh9orTEuZH8Y3B2qBj2/ICCRpMn3Qi
	JZ5MDbbe23cHpY3jxqEfVyxq8iyGc9TqB3TgQY3PadVJGUEubu4+mN2SKGraJJ0HyseFiUcQgLlke
	7GxM9FBXcaWpveNyZ/Aowrm4SlBvROlLkYJ9vfdPHJaUWLBYDtedqC8Rk/i2nKKzh38rTz0ZZ/nZ6
	osB8/aKXQibIocsvAs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF6f-0000000BhZf-1jRs;
	Thu, 06 Mar 2025 17:34:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4t-0000000BU4N-1QkC
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:28:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so1507818a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278487; x=1741883287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
        b=lR/yeSNMZPZmTQU4dyva6ylFOnxoVwZfAJ7GjllAF247EbV4OmrcbxzSku1pzM4D+i
         9ZDzg/2KOaOM8ciWjZZt+pBRFjc2bm5gw0UHslVNLQedUrfYzAx11w396JPVloIwzYk8
         vYQloBIOzWkug4qSj2FOaMSF0vo7Mk4NKwuiwCAGq+NJw3msG09SPyd787OUVe/06dwJ
         YRx/Dcejcz+FyDfkXcTaXRd+UFkKwZZlc9tX0XYSoUfxBBeD4YPPksqWThMWSMRbE3wC
         uO//M0dm04J2/D/nURdpZIpWZY9tbG1ufXf0fKkp3/HSHGyJjWy6Hes+BLxWymsxNjjY
         AvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278487; x=1741883287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVzC5eNDjiMbvhvqlOK1r/73KNx64ddnKPcxwil96xE=;
        b=nqNMlNon38ze1usm7CkiikHm6SbpJ+SFEkl1yFD2L5o8WrKcym7+F3qbGm8iQlklGh
         GAqmRqZ/6Ev9IXh4IX4OglH8FTD+4vXDC8MDDQH/lEoZYcIwkyYA1HkkYzAGw9y1fDfj
         FWt/EwcXj/BjO+CIFEztV4Icm7LNRD6V84PxxLZziYVKDDdRtICGuZVLLt5Xf77CiozE
         0qtkoZub2yoesYwumLL4OoqpDlZDdZf5zIvVqOtT8BuDEn2GaeScyVmStL+1kFcFOXP0
         Tt2QtKE6INmPHxxizGossAS0BHVBkfL3mz5wYMSpJULYXf10D1gfogE7F1rucD+0TRRw
         tI0A==
X-Forwarded-Encrypted: i=1; AJvYcCX2ome9xj/4UY0QqIKdtwuo2fXyXSTjiuAhfYGiMTwe27SlTDDHWmkT6mUMQY7GKSLP8UGYn5jkB3k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEMNf4cubGiz46TluWwQByxKvf9vXBR/NsL0EIgB2q0/yVTXfM
	eeNinsM7MdXTJx03tUzhFKhbTrl8R6hg7Iq4on6zwJJOvSnr1F9I
X-Gm-Gg: ASbGncvIboccvI1TtYAe2sNndjazpGYLSsnLB00CiKRO41yxFL9yCibngtYT50ShR8S
	xhrZ1LQdeKmC1qM51bD7rXVSj8VaffMxfpUCzL/Wz0CBEfek+EqPfSO1c1IikZxH+Jd7uFH/+rO
	VGJy6Ttk31L2I3d5OB/dJIYv/j038KtXs0yig+UqvAKFo+t8ry8UIWIlFWUBQuImNcTdoHGjwAK
	7Rx7E4pbG6pJz+1PQn7Abwq6FH6th2ST5fvDHyv+zHq4F8pKyxVQVDtZnBkFGzVlH5syxoLrTFa
	v3j8rjKzB0ppIjcwjBh0zJIMH8BYtfKqAyOCGuKdLGddiepC/+HSMYDkT1zfOWqGkY/0yoMenLA
	=
X-Google-Smtp-Source: AGHT+IG1hUiIY04WmIWjSTraivZtBZJVGW/maYZ4w8gjs57Y/NbYWELqgVEzi3PK9/fk5EW05X3DDQ==
X-Received: by 2002:a17:90a:c108:b0:2ff:5357:1c7e with SMTP id 98e67ed59e1d1-2ff53571ccbmr8979955a91.20.1741278486674;
        Thu, 06 Mar 2025 08:28:06 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:28:06 -0800 (PST)
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
Subject: [PATCH v3 13/16] fsi: i2cr: Replace open-coded parity calculation with parity32()
Date: Fri,  7 Mar 2025 00:25:38 +0800
Message-Id: <20250306162541.2633025-14-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082807_392528_AE9BE2A4 
X-CRM114-Status: GOOD (  11.62  )
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
Changes in v3:
- Change parity ^= parity32(v) to parity != parity32(v).

 drivers/fsi/fsi-master-i2cr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-i2cr.c b/drivers/fsi/fsi-master-i2cr.c
index 40f1f4d231e5..46511236bbca 100644
--- a/drivers/fsi/fsi-master-i2cr.c
+++ b/drivers/fsi/fsi-master-i2cr.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) IBM Corporation 2023 */
 
+#include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/fsi.h>
 #include <linux/i2c.h>
@@ -38,14 +39,7 @@ static const u8 i2cr_cfam[] = {
 
 static bool i2cr_check_parity32(u32 v, bool parity)
 {
-	u32 i;
-
-	for (i = 0; i < 32; ++i) {
-		if (v & (1u << i))
-			parity = !parity;
-	}
-
-	return parity;
+	return parity != parity32(v);
 }
 
 static bool i2cr_check_parity64(u64 v)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
