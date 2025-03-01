Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FEAC282C6
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Mar 2025 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yD8qMQNKGzOtztMQKpFnurvkDdIC2XIQYtsLGoGFgac=; b=f+IlwqFGrilXtq
	sHLzIRYld9yjlygVc6llmB5TKjUvdPe7lti3ifQDYcEUB29vvfiEVoBmotIb1COeqSQ6Qm/wD56bV
	EDR0oD+T8zeHJ4NnhYDwFBQIpbfo3AIwCDMHY8Jph7WqhSNK4ahWTYS68gtTHiRXJlN+tVRigepC1
	K3oMshfyyvilxUs7VSVcaDJ7Iy+zn4Y4OlmQ7dSg/9HyM7Rzznep80J4wJOn5OvRLHWpqGr6jVSIG
	xTb/x7GVD/784+aLjTlSaSJV2XurUNG12h2BlgUTL7363HgGDilRPL8imFC1ufgyu6fiOLysxmYAa
	h5KhIR6UT9qbhr9TDYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toNn8-0000000ES8n-2sUZ;
	Sat, 01 Mar 2025 14:26:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toNn6-0000000ES73-1f7b
	for linux-mtd@lists.infradead.org;
	Sat, 01 Mar 2025 14:26:09 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223378e2b0dso44908235ad.0
        for <linux-mtd@lists.infradead.org>; Sat, 01 Mar 2025 06:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740839167; x=1741443967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=KefGb4dcx7LzNyovZiLf0pyQmPAwXNcGlFLHhXdXUv8PuQyGTCy2+6ei4TmqnKWXzs
         ua0QFrxmLd2WuEHBbrKUhY67yF2JULx8u9Y6eDlrQyTCVPaxGpDKtc1oCwOetGlvelBY
         mVCavFm4ed6uarUyZvYN3lum8hVKwgWN3SuSgh9s4OTFJbhNosD6Np3YLvnul+GuuSbH
         wOL/be0+dO6Jo+xRuEFkfsjTisaFOHgsQtErWO05r0dv11oioyTfOkTzNyLY5h06qQRU
         SDWODYHdibVa6tallUzRj2af0KCoXJGdYGWJxtEZdSdiLN8fYr2CR1rHCU+3t153KrCB
         T8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740839167; x=1741443967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=X3kbdzkp6PGqccIkBOnhamqUzdLJre/HjW7pPK6Q+s3STGmVXe0S5jXivvDQOPIBFL
         fl04iyYePHA2yIomPryODVdW2hXlMYS8dyGVm2IJhlfxuW6pAE1p+P1fTIl3XmvfPS4I
         AC9L8UxDTyEzPqAXcLmLud8S/X7TPAJ2geqcPUiSAr35n0g8PtFeA15/LiRyEBBNZoHX
         cGv4yW63U223W2QdjYtEHLsCvV4eXA9+RS4VSecKngnZusP4UxItlL05+9QeaG7imEaV
         /5ps3WX8XJeSjBMNvzGI4ZWS2vxL2huYqbsR1ly4DR/Ml5jrTp5z/80c4sao0Fj+5tNF
         pkCg==
X-Forwarded-Encrypted: i=1; AJvYcCV9N5dC9aDrwTyqFgYCPBo+gc7kSp7CHC6NHxcg+tFQfXxaP0awSnk0OO/eNFXLJ/8PJ60Xs4mzPs8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCcLRH3I2Mdjn5k2Pf1Xr/XXEhLuKjbxLTsh/2sgRDlQk+J5sp
	L7Qz5veoHXHlHZ4di05Aa7fUnChEb0sAx3uMrjixf9Hq0SId7PbW
X-Gm-Gg: ASbGncsq7gH3kpZw8ev3lLUzzNDdwO09F+b92vGkTzDOy7sjAsE5Wb1tEOYKt7p1TKc
	2UQz3aWKjQ4FqyM9A4diQU2q2OIwLOLQ7wGB2ofCkF8wYCj3mRd/WeihFxe0zxQW1D/XS4bB+SJ
	ZEL0D311a/MlyK5UJiOcQ5ZddU5EoXTL8fzwE+KXRT/U/dgvfXYclW3vpvWCI1wevWzfZUJk9OP
	yh5t5dmkTu6CDKjiN0/+YlX3+5hsZykaw4YyBTunmJi/EGl5GIQY95Ge/yXmJqr/tJJ1WZZla2c
	NoBpIf85irlMDL2NKbNrD+HR1gJBlkSLV1CHAVl+O8j7bjXtEFXWPXF+94YetmZqhiTs1NQOu4A
	=
X-Google-Smtp-Source: AGHT+IFTfohTxN61KiiUMR75yyegIVFtOgTpaXboBycWTn/wkpOLO86TKXx34bh6gLZ1DoKzx8tYbQ==
X-Received: by 2002:a17:903:fb0:b0:220:e7ae:dbcf with SMTP id d9443c01a7336-22368fc9332mr106296855ad.23.1740839167480;
        Sat, 01 Mar 2025 06:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fa8f1sm49231965ad.90.2025.03.01.06.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:26:06 -0800 (PST)
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
Subject: [PATCH v2 05/18] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Sat,  1 Mar 2025 22:23:56 +0800
Message-Id: <20250301142409.2513835-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301142409.2513835-1-visitorckw@gmail.com>
References: <20250301142409.2513835-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_062608_434275_D5306E0B 
X-CRM114-Status: GOOD (  10.09  )
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
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..1a113aad9cd4 100644
--- a/drivers/media/pci/cx18/cx18-av-vbi.c
+++ b/drivers/media/pci/cx18/cx18-av-vbi.c
@@ -8,6 +8,7 @@
  */
 
 
+#include <linux/bitops.h>
 #include "cx18-driver.h"
 
 /*
@@ -56,15 +57,6 @@ struct vbi_anc_data {
 	/* u8 fill[]; Variable number of fill bytes */
 };
 
-static int odd_parity(u8 c)
-{
-	c ^= (c >> 4);
-	c ^= (c >> 2);
-	c ^= (c >> 1);
-
-	return c & 1;
-}
-
 static int decode_vps(u8 *dst, u8 *p)
 {
 	static const u8 biphase_tbl[] = {
@@ -278,7 +270,7 @@ int cx18_av_decode_vbi_line(struct v4l2_subdev *sd,
 		break;
 	case 6:
 		sdid = V4L2_SLICED_CAPTION_525;
-		err = !odd_parity(p[0]) || !odd_parity(p[1]);
+		err = !parity8(p[0]) || !parity8(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
