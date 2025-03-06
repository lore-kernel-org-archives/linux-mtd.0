Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00257C28B24
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yD8qMQNKGzOtztMQKpFnurvkDdIC2XIQYtsLGoGFgac=; b=3dQ9TUqnBY31Tb
	q5y/Q/DZQk8wkpAIz/AytTl1sQ8mSwu6eAg9etC42uZ2Qm8Wdj0N1GX5VzSID27cd/09SETirf/8K
	qnlbUBcY9O0wrKPCJJPFfH2ej7mow0H+CkRfJqKgvqHkNQUA7X+qjG5Ry+WGsNVu7EJIWNdqMQ3us
	NtON+EAlT8bLICsMBztwJgaCGemXFFTLfWKFMPy3chuytK+LRNrpNHMZOsn82oQhWOg+bDM/St5ML
	5sZGIfM/GDu84jc95aWrnjX1HGHC9ksqMf2ksKGQ2nl9hfywuRN7BIKLZnz1mmv0622or+6YW6ky9
	FhDGaLp7rGrst4qOcVYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4s-0000000BU3X-3JHz;
	Thu, 06 Mar 2025 16:28:06 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3S-0000000BTYY-1hAK
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ff04f36fd2so1703773a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278397; x=1741883197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=VkvgVy7tUUtbZpMBy+/9PL99I/5bB/+PpA9oilF+apZFLz5eHGKLG8HieHpaOK4m1R
         NVULV5oOS9a20FtAzwfI1AWB6eRyu2tFF7Fd9LvaB4EHPbp2Y4PsY6Qf/KoNbXxLENTa
         xX9ts3f+jamsytBFAqL5VWgaiBrKZkFFwW1/7yKjnLAiDDBxIlWH6JJTS52IAx9cGzyR
         pZKWfrQ3Gb9LSC3OmEca8xHXdlEwB+x/2jM1XEIq2GVNaR4HdLqytcMcsuZKf/Bzzu/O
         EUNuvL7O5LBb65pUs4TEh1YWCkFb8f2qmwtXU4sE58w1vQAbpFqeQ+fg93CUUSnKqf3I
         YA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278397; x=1741883197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0Ho2aCKNYfg5T/o22fFzxZ+UyjSx6Fm0wn6W8o8Gr8=;
        b=mxiHf5PeM0Gmt8hYhkZVvU16MDJrQqlBigYXq/5D5jetOIP2/DVaK6rMDXweKLXSHo
         vaW6g1SHHpgeto+F+fjgyi7sTWV6rQZ9PK0r45QmYRlLXicK1cRz7qKc/3ax71Zwu3+B
         7vfkvrfVzDKGtmm3Hxs41CEPh8agdqNd9gyY/2IQH7CJpLMaslcOzScLpl0zm/3j0OzT
         sBqWSH8EFOmDJlN6X7Dx0eNy8XqEii61JmziOz9FlWtbbMBewyiDbcOBqdZFJ8+X6ZpD
         MxWN3b9MsqUBa65pj1Col89rYQdEZurUg8StNkCn5X8R1cm5dIV34gZnXfbAK/0cMQAm
         9v4A==
X-Forwarded-Encrypted: i=1; AJvYcCXBHfotDEzGoxcd2u6S+iRf7TwFuIBzOYfogguc6GBD2Pk3lqREYRf844FfPQz6wYXh4AljKr5QuFY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMbKgxMa+A8DtPLwawoPk+pQyfmku8Jlzvo5zxdaegB0eq6jbm
	EmxI86aJ1cGAQNLxzXiLaOeiimEKH4G3zioM9blBxCmqReKQVrFT
X-Gm-Gg: ASbGnctN8h3h2Kf2LeQi4MmUYY6ofq2nRdp7cASfZNbGLGVwWoFg9g29kytq4ldBqla
	Zrx0wJWlySsiQskW/baJ92rzH+eKIGZJwhSd83GPPsO4YNMqvvWAZ6spo4/UPHIM7bfIOBZHyrM
	iC2QOMOwu6nU99FOPGLRH9dVDMossic3Cx8zu1U/lch1l5PzflkPvE+VWZBupjVZFP2RqvYfiu9
	apFrfRZspdjuZN4CHZHJ4x/HRrZxnLRnpmO/GLyBlJe5iSqy+kCpOHqI7/vldIt36lLWIWx3Dhx
	hXKFDUYdMNJO/gHqCX2AllxiaBwhltK/FZ2UknMuF4Q9QDSNzAfvdp4S6WqKak/PHNoBMrEy36M
	=
X-Google-Smtp-Source: AGHT+IEdHwa48DziWanocz8wQ67fQs43cM3+X1TXQ11+KVNWCpcETjdD+vdPtUkiB0WUQbIndA90jg==
X-Received: by 2002:a17:90b:1cc6:b0:2fe:afbc:cd53 with SMTP id 98e67ed59e1d1-2ff497a62c4mr12413101a91.28.1741278397498;
        Thu, 06 Mar 2025 08:26:37 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:36 -0800 (PST)
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
Subject: [PATCH v3 04/16] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:29 +0800
Message-Id: <20250306162541.2633025-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082638_457246_861D87BF 
X-CRM114-Status: GOOD (  10.10  )
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
