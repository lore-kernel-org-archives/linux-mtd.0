Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14EA10F3DCE
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Mar 2026 13:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7hW1QlFKYp7w0uJw7iSPItVWamXaPyt7sufp5xH+Pys=; b=P97
	wQzhF7h4aCqTo6VVQbG/J4CsfLH3CsUL7DfTw0ZsiqlJ5hzFW5C2abPxFhkgBX7UzSkLBn93nyRfk
	hCcmd39aCA7Mv2dBcQEQoVzx2qlDw9Ng9/xjcN+lumYUFbc1SFPhwuvk6mp1kCv7tg/SkZ0lAwaCw
	wRoj/fp7NNBC8N9ffLMSQgbQGJASWqd9y0L78ygucBGqqYDjk2DWkuG0SPPXWqdNR9UtDySl+icgR
	TZeOma6TnFVfACGjlXew6wQdSp7Kq62P2EEqHuYUbWB/5mTT19t0qeekn63y/umuKjeuhSgoX/evW
	hnQXLVk+6ZbqQ/eEYOavz2AYuuhBchQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Tg1-00000008yX1-0p0e;
	Sat, 28 Mar 2026 13:26:09 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Tfv-00000008yWe-11CY
	for linux-mtd@lists.infradead.org;
	Sat, 28 Mar 2026 13:26:04 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-66a4c6bb6ecso5290925a12.1
        for <linux-mtd@lists.infradead.org>; Sat, 28 Mar 2026 06:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774704360; cv=none;
        d=google.com; s=arc-20240605;
        b=Njz1QVfDJmAiPhwrrF3/9KDtOrBVd3YlDBt+DHMWCwDWyyWLJjNS9A51CZiwZfP9KY
         ZeTC0rxcegni5aBDwt1GC6ZU7pf/SfyFcZ1KMBwWfALvmj5cl3OSf3HcMKHO5GOLJYzA
         txULO37kjDA4Vd+HpdC+Ljdv2F8SRGOc9H+RBWabI/WH8Ud3R7Tt/Wp5BrTQjzGQWiXZ
         6IRAVALmfG+y5UkIds4i9GdH1HQrkVM+cj7TLfP4GJhXBSlicXuMfn6YDvl8VZeeE/ru
         YnhGjBkZcYnBLWqf1pwKxuWwujQ6f7/WfZi27oAB3kmRxHHGkToFI4R1ZdtE7t6DHaZG
         gyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MwTWI+dSmfj1rJzwxvqDvKiCnitNzHAij7DOw5d0Vxo=;
        fh=Gd4kRfoyr9WvSS9M3j9+RFhdcaNG97fzsqYHZ6IIOZI=;
        b=LCSnjdd1smvkyITNzuyHJCqVo3SjGX263wrTGWiBMHzQkQKZs/WNcC2+6xfEsZhB7F
         gqbfOxuPyQIL/ChcdllHxaaNk6oxYY5N8BpZkRF4PKAiD+PIQNTmziS6c7AdDJpTzXb2
         q4vJO2EKbSZcdJMNcFswwiRPNi03km3w5pULLexJmRpvUwr8y2LcJ3XN2FVHZmusxmpe
         fTP949MFJlbeIsttB66nCyvXJcVIqCvGY8eyU0jduPCm2aWJ6jFuO2RIgCbdc2XP8/Tj
         6jaTJcNFf6DzLInuqP6ncJUTyo7FnS5q268grmHetdY1X/qGEI8lSOXkB0Qpe2u8hyt2
         O11w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774704360; x=1775309160; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MwTWI+dSmfj1rJzwxvqDvKiCnitNzHAij7DOw5d0Vxo=;
        b=OQRvW/C/gcTwdz6Dam68LFZti5gpO4C3Vs/wR7n2wbn/IyCTZzU5tErQ5PVpKJXBTn
         XB7ucx3hywDSFFMmvxK61ryTLa6VsRSAh4vohi/aVbP8x4V2dAxhW3W1xyj2NhDIhvqT
         h1u2VGlYfnv3XpNmK8HEXuUYpAGFK0AeJNHGLHhyLb6YGaJPUHanEogOeyQHg6dLbdDX
         //hpPiNtbJ2Q1s+vbhLOQe17faKlNRFSsp3TDHRFXKAEOsFwe5v2dO5+MimnSKuhm6WY
         IwPtKMzIxb57IiJAFZdl1yzne0vbL1he2e0iERkWnw/HUQjvHN3rcrJb9kyLnvZbrqDJ
         SZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774704360; x=1775309160;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MwTWI+dSmfj1rJzwxvqDvKiCnitNzHAij7DOw5d0Vxo=;
        b=E79Qv7ckLELUPFgz4lxWLx0LccngZeQmgdN4M+m7XFjljBUlhdXem1s7tzoC+LRypb
         F95qsWelYEB6M7wfhSGi+BWGobBB9DiAsuRbBXy4RdY31BjolafBnuPl9CzCGoYMR/I8
         MttRRvShZCdtHbcdv0iWftHcySzgHNI/OObUaK7PMTGbMPtVkLFYnHAoIhsH5zNZ59Kz
         sNoGbgMUH8/F2m6D3POW9tVGjg7bKRVZ4F4IAGS5thtlVJ0Nj5fviBU2A+9OmU30GuK1
         3gMKG2Wr6MdeAbZvH9ThgPWLmeG5LOUt8hV7p8NduagKnsp4ytVhh+X1KzNiRL4DcRIh
         Pu5Q==
X-Gm-Message-State: AOJu0YwayQoOH09JyXWfsWKYyrw0AYrCYJ7nl6M2qjt5EXJPNBskqlXy
	GsX3++V8OegA87LQnR4gBG7aee+JHNiJICwUlFtgJxKe9DpkHIWb80ls5PhvBdwN/lElT+RpvCW
	lRWM6OOFAvyAAvlsjhGiNKgRiIisxYuuzKg+uL1Q=
X-Gm-Gg: ATEYQzzu/WAVLxKQNJpAdLRPsGhhpHuUQdf1E1/sGfgZClMWQviDm6CqJntdBmkSTgs
	jeHljUM7fzwyToN5ozfv6FrRVzwigwUVisr8W0Xgf83l2PUU2rDQysW/XJE+n/Pg5/8vjYA35ZP
	c68NRYpaxdV6dwukQGFzI17FSxBwwyYSMBRmsULSynYAXdigvvsGwdpANymRVB/96YLqBvMDRuG
	7WD7BBKap0AWQvs/Ns2MoW/NtDc/uw6ZxC+IHyAhxq0Nb6PFPS6UpLBGgeoLmWpOVhj92fsklq4
	CJkdA/vzdQgdqFu1WiOSIytL/bKSLe8qDX+zbOiz768po+Op5bT0DUVraaw2ptP+N7a5GmGogb7
	EE+a0UiouMac=
X-Received: by 2002:a05:6402:a0dc:b0:666:d675:e2ed with SMTP id
 4fb4d7f45d1cf-66b28b5d0c3mr3135815a12.21.1774704360186; Sat, 28 Mar 2026
 06:26:00 -0700 (PDT)
MIME-Version: 1.0
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
Date: Sat, 28 Mar 2026 13:25:49 +0000
X-Gm-Features: AQROBzDdOxAOK_gRe8B2DerXiFBmdAPw6-eihSshlIJl9aSmtKEAXl_QNv1F0CQ
Message-ID: <CACwZE5QV+2d4iBvSP4hQimLCs+UCbQFrVSfvBFQ-Ne7z_tgfbw@mail.gmail.com>
Subject: [PATCH] Ensure Dreamcast VMU MTD code keeps building
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_062603_324252_6EDA812B 
X-CRM114-Status: UNSURE (   6.33  )
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

vmu-flash.c will not build for 7.0.x without this change



Make necessary include explicit

Signed-off-by: Adrian McMenamin <adrianmcmenamin@gmail.com>
---
drivers/mtd/maps/vmu-flash.c | 1+
1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index 75e06d249ce9..7c18658a5e7d 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -6,6 +6,7 @@
  * Copyright (c) Paul Mundt 2001
  */
 #include <linux/init.h>
+#include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/delay.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
