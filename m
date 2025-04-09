Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67184C369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRTBVyKnCLO4ux3u0lblcJbp7yp9YNF/Rxik1UN/wO4=; b=ZYhcKdh2463eEP
	QdKI0z5vSiPZ1ZUb9kEQjbWBfaksGmsi4Yn8okxI9NCAjGk8pSslBlBwhYzspjyU/GrE8Lbmi1/wf
	OYqYpLB9paRmAyIgkuZKIBq7mJdcqrVH4xbtGEstcrJbHmIDT3CzXNYNUso7fmkzn4WaGINgNiEA0
	ynFELlH14PECcRN2ABepxgESOhY7KZEvKdx4pfX61SogyguhD3pfO0Q7AeGjk6DYFQaf9/FlbqtcA
	08sEEImxCMQotrkRtEVMdqYR4EJMipCxrds31KAmr7tyzNo57CYqJKW2Ns11cquUqg8cFKbfHDjeU
	3uDlqlYwwQgGBselPszQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xbu-00000007kJC-3oBM;
	Wed, 09 Apr 2025 15:45:06 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xbr-00000007kGL-42Si;
	Wed, 09 Apr 2025 15:45:05 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so4806371a12.2;
        Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744213503; x=1744818303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
        b=WDuJ77Wbb+0ToRLdVV6XMxEcbssJmycHAXdUrQ/yw6XsWCDH5eEQ0H1KY57Iu1pnnf
         4UviysqLK9IR8Pql6xDf4kRN8VTZt153RqpOJzqUGJjvLQ5NeP3bwflQlxZTxuz0iYBj
         3MsqpB14277NDdViQljw8G6floxSCzN8gDhy4dM3cAC4wmw8FaltEvRaOf/l/mItzLae
         sTTmlUaDF/yv7XhXT6vezLNOACENtvj8aQOMerJiOcdpAeBfx7bSGz9x6VdbmlzMCMhF
         PCZ+21i2bnmCxJHhAC+/QTo8CbbhPnev9G8Muzcxlko6n72SaFKqRWfxrTFMhMxqdEWB
         Zd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213503; x=1744818303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU43UpH11wLCdsjhsyHst5iurlQ+ThcWcqMooUtxxjY=;
        b=QmqroXC9z4DNHYcHHqsLUEMkamrsznJB1VwvtB8LKsbeT32buAG7GH5E8CeF6/Cu6p
         sN/Gp2RoL48BCFq0VCBSsl7uZaySbm1HwLcfQVGc1m8DWpHvOygOXyMMgVFgILRuzG+e
         zTIXp5qYOHeCPuTxLppWWZnjWa6jpv4p9fOguweSs6A78cnYwRqTe6bc1owD30P+Ydx9
         FUpJNTHRoRKvnjAu1PB9ARW3TZw0ZmLt/uRO4dc3mjwBK++KX39K1okan77e7Bd9XJN0
         w+IrgoHHGnxz8mHMRC1NUs/RsLpscGImQODcoEPbodvmq66KkyPEdug5qHmbISyo3ddV
         5hqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFayhNDA6fnPf+hSZ4yoa0RKPvYyN/pdQWxEKzOf/uSwRvCdiq0g7JiJoOCQhV5bxA5tNs0Jgma0k=@lists.infradead.org, AJvYcCWp2nhwp+0mjpUkrRqPwfmBi0+dwP5aKdgSGEEbi8XFST27OF4jq8jECh0GO5H6+HzCmAoYfDTr/u2y@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+eVILAdneE+sUly5TP8hCVmWxvKirWSxIXqBF/UgO/K2voXnl
	5W9iWzUQubBkb7zIy9HNdJ0nRWAmUhWKo4JwRiNmm/cUZD1ynyDw
X-Gm-Gg: ASbGncvSdIwaDq05xlVRxFAhSaeruxVpc3tYECG9UTO2iijaxYLUIO3xhPLMa+E9/sW
	J7EOaRd6VLU79NsuulCPmm2VUQlAF4aibmfyCvYXMeKy5Dl3DrGQ/wqLpd3hTVm5gGX8+oKZSRN
	p7MBnUXvKiQZO7qJeveB/8ZwkPePvrgv3l2/6pBTHx1NB6nqGIR/aPcpOMdNszFJ5BuDDE3Xlc4
	bt/FHvkm/DWQisiipRLTrtMczT36t+4VWnrSzeg9wTbqLACVUckv8wCticaKdBFVskuq3SfWNB6
	cjxmKcBbj+Fae7ZDjTKwFYp9NDVznYTSvuGzGDdOOLaHSR1Rc7eLV+I9iJwCFvrevJUd43c=
X-Google-Smtp-Source: AGHT+IEs9q8P41yMEf/AWjN7idtRUGM7Z4tfe1JBSuODcHBz5h8hVFHXITrRQEV2h0IxkqA/pyunWg==
X-Received: by 2002:a17:90b:4a47:b0:2ff:7b28:a51a with SMTP id 98e67ed59e1d1-306dd52d43amr4827521a91.17.1744213503051;
        Wed, 09 Apr 2025 08:45:03 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd171991sm1952304a91.37.2025.04.09.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 08:45:02 -0700 (PDT)
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
	akpm@linux-foundation.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	alexandre.belloni@bootlin.com,
	pgaj@cadence.com
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
	Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com,
	andrew.cooper3@citrix.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
Date: Wed,  9 Apr 2025 23:43:46 +0800
Message-Id: <20250409154356.423512-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409154356.423512-1-visitorckw@gmail.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_084503_998089_562AD961 
X-CRM114-Status: UNSURE (   9.37  )
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

Refactor parity calculations to use the standard parity_odd() helper.
This change eliminates redundant implementations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/media/pci/cx18/cx18-av-vbi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-av-vbi.c b/drivers/media/pci/cx18/cx18-av-vbi.c
index 65281d40c681..15b515b95956 100644
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
+		err = !parity_odd(p[0]) || !parity_odd(p[1]);
 		break;
 	case 9:
 		sdid = V4L2_SLICED_VPS;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
