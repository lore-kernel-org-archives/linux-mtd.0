Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B318FC28B25
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLWV6YvMFxKQnRmSGzU39sVbTmBQUdm/I6ogm7VClMs=; b=x4dIQ9ywFMIk04
	xeeEdZtJZZOpgmnjNxslvkbkTiYsFn05d4TaEC/eCQdrNuKJfILvHlJIM8w8Y6GUtoIbVrKEfFL+p
	baTaFeDV0L9HWcQQG5SGjGY2WmjD3lBFs4WJS9a0s09Kr2wiKawso1musUu5aBj0aeT5mcvQk/hFP
	NCo/0KqmxnoYgBhiUWUpsyTITIoryL6CrNrcFFEl3X63wRzQ+KeC22CKqA6+arxM6ZlZC0+OyExyN
	YXGyNC0bIrbbWI23dABDp9Ow8ePu4k0fC73Rm0Jz4WKU5/jKS8d7gwkUWbAn/iNnRL+6DIvkksao2
	bwUJKwpGYfitZAunEnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE4u-0000000BU57-0C6D;
	Thu, 06 Mar 2025 16:28:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3r-0000000BTfX-44dj
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Mar 2025 16:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=; b=KPJDw+hsaAyE6SRmav91R3Azv8
	SJ58DEkqNNFvUM9Gnaut+W22rPOHpfaQXXA9Or9zZ/Ds9VsjoYFW0eX8M3PrNx1ZrKg54oF8al++4
	HsQkiYriCxSc4/Vd3GQoUdlU2YSgRP4XeuiyOcAzUr4V15Id2Y2zGy1VkvLc7Oi00jPIUP6FJUFwe
	zdTL0fIW7ZvF+5oVp/VzN88M/MUeVh7+lAEucR/OjQb8BPtgepmSpZXc/OskEjzdSccLnkfIq/IYS
	vVX02LCwDcyLQEq4ageur9uDWka4Yx/hMzJ8bAv/NmcJsCX2TD56ZmY0H92ox5Z2w86Pj8y45FWEl
	7ceU7FLw==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE3p-000000019RX-0bCW
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 16:27:02 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2feb91a2492so1694389a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 08:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741278418; x=1741883218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
        b=W/hTgg54IiydUUr18pJRRu30J4FvFjYHjOwSO8oeuRAHQbkWoRhZjbBsNmLj8J3Ofw
         wPUzU5WBZ1BQp1CZYbSbDdAUMc12FAswAQ57EytF/Xssybl1j7d4IbpIWDmo39tM5Xid
         w3PYpStVeoumIHoSjIkAWEOkipldCINXEXAFnEPF8O5dYT1ufr17WYMU43EX+IWKmCGB
         7sXPajo98qjqiKDFZQ5VT0X9iTQDOJ9qls+gBEeUb0Jlvf7swXy5D+qBu0gbfNZuur/C
         trOvlrFKFzKmAYF8jGSYHrdXJPrfD7NcubJObql7yVmsjyylOWs2CQQFCdZ6dghX+EsW
         05HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741278418; x=1741883218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OLC46Ss2m89bTVvfLJi0Yp7p5tSaqeo4vrmp4oYzA88=;
        b=Cl1/nuWwyIYNnFccQ28uw7jtrLf8napp5V7Shrz6HPuDa5vod4Snwlhvq404GfKqoT
         e6Pb9Q1BjrtKILvy0/t/YXinwoOzCY5iXJXG6i6Lb5Rp1JcYphWUfF0nLBmw1KuQFYJU
         UZL/DXiL6MVdqFogo7WGk+H1oeoKM9g6zg0lnhzSEOTGU/sh5/1fgUwU98CcSt1ZjNwl
         h2rga4bhubaJ58jC+eT5aD1nEZXiBABYBG1wChvnpa0aL+k5+AigfKXKv6AU2iNPGMDL
         lWqJUkUcKI0UszDvTojmdTeXUJG9QokwlbCzSCTwFfW+SpguVCcspvMgqx6BBLtRhhfQ
         eKSg==
X-Forwarded-Encrypted: i=1; AJvYcCXrEDob9iQ29lKZ+OH3xzmMDFi0mEStSerYyGxLU604v0jaSHFg2/zAoYi17/GO6uRRLWo06hrdcOE=@lists.infradead.org
X-Gm-Message-State: AOJu0YylKUg+6Pbun+rrKUFQ5QaU5Xr01xNodFHu4LbyAKCK1b6acDWw
	tjTDvT/npMJWBUlMyAfPVko+yLZSy+VbOsWVyxXDn1e6R+CtrkPc
X-Gm-Gg: ASbGncuwMe59n6Az4lqf5B6CSM1oAgiwS1elrbl3z7uk97dEvb7XHToLrn1NvlsWOWE
	knJfDP8BOSYGJs25lQSzLYaUnG3o26vpCZ4yp2kpzbSk9XsykwHKOuv9W7xdt87gZ8YThuUo6Xu
	aKE7clHnoxcXesOjs7wKktpXV4JPejoTp5UyXVnZBEvzKxXJsdWW294SAUBM4bINPHlH3RYJkVN
	xQRn2IXMkGjhiYg4VM0r7rzjTpjBTt6WEWqmAlwvJETzynS0r09atp5KYQulfq0OxoVDGNnCBL3
	VGrBmf7ptTyVsRIqCOuY/pS75nj6HMO4fnIZ50iwxyrbA5yzBpAEwZTKNktHqvmxv9WdTVkF58w
	=
X-Google-Smtp-Source: AGHT+IG03DCzCpNpvI11hw07lC+sk1Ut5naphaEWX0iSJy+1ysJZeXoZKrfH0dsPOSnHxsIbzbSOpg==
X-Received: by 2002:a17:90b:3c87:b0:2fa:15ab:4df5 with SMTP id 98e67ed59e1d1-2ff497ccd9emr10053018a91.34.1741278418239;
        Thu, 06 Mar 2025 08:26:58 -0800 (PST)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693e75bfsm1464298a91.33.2025.03.06.08.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 08:26:57 -0800 (PST)
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
Subject: [PATCH v3 06/16] serial: max3100: Replace open-coded parity calculation with parity8()
Date: Fri,  7 Mar 2025 00:25:31 +0800
Message-Id: <20250306162541.2633025-7-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306162541.2633025-1-visitorckw@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_162701_218522_2B8E569E 
X-CRM114-Status: GOOD (  10.45  )
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
Changes in v3:
- Change parity8(c) to !!parity8(c).

 drivers/tty/serial/max3100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index cde5f1c86353..419d74043498 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -16,6 +16,7 @@
 /* 4 MAX3100s should be enough for everyone */
 #define MAX_MAX3100 4
 
+#include <linux/bitops.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -133,7 +134,7 @@ static int max3100_do_parity(struct max3100_port *s, u16 c)
 	else
 		c &= 0xff;
 
-	parity = parity ^ (hweight8(c) & 1);
+	parity = parity ^ !!parity8(c);
 	return parity;
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
