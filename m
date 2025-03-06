Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9896AC282DE
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41VAB634gWz8RkrZD9PEgHejQ2Lg9dkZOcJEeprjfY8=; b=uS/yIKJq4E3DA2
	IiB3hYWLftfnRdksWuuiZFG5YxGjT60RuR2RV7+8jUQ5whBvLH2PNVXONunN4JTmeVF+0X9QvXJRj
	hzWxLlrhVRAfzpSX8jEjYrdq22qEtkJuH/3yZsaW8es8s9potyovjMGvbsScqftGOjunBsW012qmX
	hLzIncpbFHCJkNbZE0sdbLVSfHjYTRtfJzWdjvcPgA+/No5vuOvvqHb3WPWHzL5aploMHFgBMnMZp
	ZblTlwzo4vY/7aBUMHsX4w7tzzVa7q0EGM2ncM/DeJO0OwtRQqMy3lSGE9u+BNwuCqvDwS4emCqlB
	4R0rDeovATCn+XYtAS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4r-0000000BU2J-0Gqo;
	Thu, 06 Mar 2025 16:28:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE2y-0000000BTMx-09ji
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:26:09 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2fee05829edso2022851a91.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278367; x=1741883167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
        b=bPpqhiBu/Lb1tsMYTHeiD2EvlJI8jiJWGG+Opdqr9Plbn8FwlqS/R9G9GXj9n31m0i
         1etQ/22wgGXgUd1yN1ZyQk9xUqsy2+EEMZUyrBVMjHmbKPy9JDbak/q1aVTWrmWwAPrh
         zq1UPqNdnPruxOPATkK1cublxdh1IcN6kqifg+sHy/vZmV1nQMylRk1ErHChrvXk2rp0
         2OdnYcuTxLxtxWrkwM+j9ZHNJKlc5yv3SfVAoVDJm7UTRDol6xivyWNCERcavtYIGHRw
         cMkuMO7s9CS4HAfMGOtwhkywfi4/BPVBOY3pvnepEoaQph1ee+hUPM3M7qniUE1Kn+lm
         bPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278367; x=1741883167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwdp+8POnpYEEnQ2mWPyy8f6+vYv2yxFxSEYWvX3Jsg=;
        b=a4xpmlj7TGLR2eEC0ct3m3gCKWh9UE4zlKT2k5tZZX8HSDpQPXUXM8rwOFO0qcWgAZ
         8S5EZG2bjkZhyDQmtmGjcJy8BOTQt2d+YxDOLBnW7oaAT15ddHlPL+rZ02pluVduY/pd
         w0lPSORgWk4P2stvRundJuXF2EUikJ8ieu2SNICiBALIrvICOFawMHwGkFThH6L09oNN
         /92uZxpuW4LIYwH5YnOkCLj1xejxC/4Ay7fL+32LvZMkYuF6YvbXjOByVclOHupxgM8t
         +i//daYYeEbwxe0tXxJEtrhySE6i2/a5VqSqevBB4EWphMnHOdH2OLyTF5+tF8Skok8Y
         JPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUttMRmTkCTPKXOPMJKhT+ZwyurFoKoBSUoGy2/A/lHR8lLdVo6wgR+JRxPW96GncDl4NeqcM0yHYk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUQHC3C4bi9S/PlNX+SkDxd3q0QPzSbql1DgxrQxTkYxZ9Eqtn
	9T1fHiMFEEEgDIrBxWpatxIjYntUKFn68Et7IEwDBTLrwsZI0m1w
X-Gm-Gg: ASbGnctYFYGF237c0CaVdA0A4c4TPk8rP7RsvabQ/sQ5jG4NsMwHF4YIueFyOzdVJro
	zp+ZUw/W9aaXd+Mt5jRHzgISrQltSyXYNGMbwYafVMC6/dBHEIkxBVkVExz4I0+cUrknbeQ2TpB
	J+H6t2AXHbMoJYTxMn4vv5FNo9oeMY/dtcTOYBJrO9D9/fb4hZEIXr3ixNtVSbhXjLxgEAS92Cv
	w3R0rgoTAbjNXPii3euRHZ0F/SXAVlqNDCiS1tVh0PfRsW/NEwnseUE64piaDjkKcnXW3rBdklv
	7yfG3CXtIHTCd8wSbrLw4QEGegTGQVlJcELDm/oF+5AB0ukNA/h8U1JfDNcoVc9TcHaNj2Diq5s
	=
X-Google-Smtp-Source: AGHT+IFHH+1zpB7N9XuTVJAOvoyUY8hkKo2wZOm3e52unMZzsjH5Hx1bGZW2MZ4mGhzudOerhh255w==
X-Received: by 2002:a17:90b:4b44:b0:2ff:7b28:a51c with SMTP id 98e67ed59e1d1-2ff7b28a652mr259914a91.34.1741278367078;
        Thu, 06 Mar 2025 08:26:07 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:06 -0800 (PST)
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
Subject: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Date: Fri,  7 Mar 2025 00:25:26 +0800
Message-Id: <20250306162541.2633025-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_082608_073278_0F2556D7 
X-CRM114-Status: GOOD (  13.57  )
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

Change return type to bool for better clarity. Update the kernel doc
comment accordingly, including fixing "@value" to "@val" and adjusting
examples. Also mark the function with __attribute_const__ to allow
potential compiler optimizations.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 include/linux/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index c1cb53cf2f0f..44e5765b8bec 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
 
 /**
  * parity8 - get the parity of an u8 value
- * @value: the value to be examined
+ * @val: the value to be examined
  *
  * Determine the parity of the u8 argument.
  *
  * Returns:
- * 0 for even parity, 1 for odd parity
+ * false for even parity, true for odd parity
  *
  * Note: This function informs you about the current parity. Example to bail
  * out when parity is odd:
  *
- *	if (parity8(val) == 1)
+ *	if (parity8(val) == true)
  *		return -EBADMSG;
  *
  * If you need to calculate a parity bit, you need to draw the conclusion from
  * this result yourself. Example to enforce odd parity, parity bit is bit 7:
  *
- *	if (parity8(val) == 0)
+ *	if (parity8(val) == false)
  *		val ^= BIT(7);
  */
-static inline int parity8(u8 val)
+static inline __attribute_const__ bool parity8(u8 val)
 {
 	/*
 	 * One explanation of this algorithm:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
