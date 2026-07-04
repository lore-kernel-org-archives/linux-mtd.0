Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E71AC44501
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jul 2026 05:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7B9v/NbtEQKowyDxyKs5ujwjNhxeRdap+6h/GbNHGKQ=; b=d7I0LpXtUWTnJN
	bjwNQNtrky67s/t3LLsqK76wCUfknfZQ7WoCXRPEE5R+qj0NUv7NxFPUODdP+fGj2px2M6T5WhZ9X
	DMHixBxEOF6FNZF6ScL1eYBMQD406/1T1cyFP6uWTSmQGbz4tilzjif04CPl60GMWQINlkM6gxv+d
	tgrlYOLEWLWh2teNfChW82zy1fYkjEjnKUCZxmxQkXvmdvb07IA0C6GXDIMYJGXWNpLAF+ytvQlWi
	Jxd2TaNVwZx2xwAlv0ufXn51BhP9JPNLgCHE55Dc8jOYzrbeM6+KsxZ1IM+ZpNzcTSoAlJrB5LTta
	gu0v7D1WcViRBiMMxuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNh-00000008BXh-2l7C;
	Sat, 04 Jul 2026 05:57:37 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wftNf-00000008BWq-0ri4
	for linux-mtd@lists.infradead.org;
	Sat, 04 Jul 2026 05:57:36 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8475eca3a66so1685450b3a.2
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jul 2026 22:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783144654; x=1783749454; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUBmbNocxonyJ3lOrR4g5OiG/+KsVvhX2DrdQTMHh3Q=;
        b=AkBe6kexxPrA2fKMzirRwWMCfjTyG2gkh6kDGJyzAGcOMppBv+FtZeEJhnb9B9MNIm
         iakgNrSV3KnYuwYDMdCCJPRNe/zcTBZoW6v9XPW3vZ1iboHGmGQknujJ8sSXC+ycRYwS
         dMtRCQAfRCoxLL0qirBhFX35sg8LozqCjj+TJS0QHg2N0wb/sOIjJ4v9Fosr6x8vc2Ru
         J9lYXROLMQqzsa0HZa0Cv3y/+pSEFD3+78H8mc5bYe9k2n2qMP1oQYpvpRGq7uRKzIID
         WczQ1XLtUQHuO16nvtRc5UdmH8R2xnLxHss91l80ZcVqyp6xdiMdDxp7tf/yviPI6jA7
         /opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783144654; x=1783749454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUBmbNocxonyJ3lOrR4g5OiG/+KsVvhX2DrdQTMHh3Q=;
        b=jXhDgDvNltaHe6vmUX48pnOHCqQ5Rm36GBiDL22Wcsyry8qG5maqTdIGnXnnScyWeD
         jNqICJ9AaSpaO48o4N9xBNLFJBNvKTeMRmZjzJdb6dLjm2ol2JfxJ6tpeL/ubA9Ipt5B
         2lLmUlIQH4mMHbbWEzqeXwrl7jIRiDOIzWMkzIuV+PRuUrPaATIJHBQzqs8FjHJw64AF
         MufABL3lYIJ6OGHrDyTtYBN5wpy8vzSgv6Me0u4Abo7XpuKt99hEfDXpR99wv5NMJH6M
         Wabn4ezVZMplU0Je9UjSmT8j8P3FD0HhaClNsOkaToqX94I6q8SRlVI1t+PXpGkmQJic
         bIPg==
X-Forwarded-Encrypted: i=1; AFNElJ8qD6VQvrhGU1D/G58Ic+UCRecvxzqg1ZPFv8LO5Rgb/xV9vXKgFfpO844IUCuGt6owIfdeFdTwR1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOY3dULgG1PUgFXaATf9YwnrhFV7NCSeW1PZdwx/Vkzj/WQUs
	0mxuINsIOTLyvbrNOXkf4LKe5lsSEJ1NuZgY0LTTprx0xxL5LaBpLKX+
X-Gm-Gg: AfdE7cm4qWDQbnw3PcrzrjOUiSUFgS0BlVwk14gxO90BRRFe62nnsTH6kFBXZTxQ+fq
	LfPZFVjYkUAawh9JZZxhNqDRIc5UZ7w6xf6xMvfFFyIJ/13iKuCBfPs972ryL2KILioPxI44ZTC
	crUA4ZyKJpYiPtqsQcS/8HRiWEztrEh0PUHqzF3+uN2Ucl4V+xaI8f3NN6wrQhy6PGSlAdo9NZO
	enlYWSbSGa/+AYgRkmq1I4YhOI+QoAwkvooBaRK6mx0Lddj2vMD9nT5spGE4lf8Scep6kGUWkkv
	xThPCnwP7xl9AWb4i8HtJcXJANW36v/2o/+Xbn4sN3i8eyHqVMO5OgQ5xLbZl0JfEGJJJTlcuRi
	74bN8qW5mqwBrcneXiwCBSC8ytojEg2xtuT0pyjSvUJ8vPZLcz+kcY6zNwlNOfY96h1Tt3jM0UE
	D6Esn79cBj5iD9XSu7/ZFiHy2PcyMuHX1XkWnCSesiq1ghOSng6IpEqRnVByWuX5ReOohlfgBuf
	/w=
X-Received: by 2002:a05:6a20:d805:b0:3b4:65d3:17b1 with SMTP id adf61e73a8af0-3c03e4bb67dmr2019218637.43.1783144654392;
        Fri, 03 Jul 2026 22:57:34 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:880:86f9:3b00:6746])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm26262412eec.8.2026.07.03.22.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 22:57:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 03 Jul 2026 22:57:24 -0700
Subject: [PATCH 01/26] sh: maple: include linux/device.h in linux/maple.h
MIME-Version: 1.0
Message-Id: <20260703-b4-maple-cleanup-v1-1-41e424964da5@gmail.com>
References: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
In-Reply-To: <20260703-b4-maple-cleanup-v1-0-41e424964da5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Florian Fuchs <fuchsfl@gmail.com>, 
 Adrian McMenamin <adrianmcmenamin@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dtor@mail.ru>, linux-input@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sh@vger.kernel.org
X-Mailer: b4 0.16-dev-6911d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_225735_250071_D3ADD14F 
X-CRM114-Status: UNSURE (   9.39  )
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

struct maple_device embeds struct device and struct maple_driver
embeds struct device_driver. Therefore, linux/maple.h must include
linux/device.h to have their full definitions, rather than just
forward declaring struct device.

This fixes compilation of vmu-flash.c which includes linux/maple.h
without previously including linux/device.h (or headers that include
it).

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/maple.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/maple.h b/include/linux/maple.h
index 3be4e567473c..22f2930251ed 100644
--- a/include/linux/maple.h
+++ b/include/linux/maple.h
@@ -2,10 +2,9 @@
 #ifndef __LINUX_MAPLE_H
 #define __LINUX_MAPLE_H
 
+#include <linux/device.h>
 #include <mach/maple.h>
 
-struct device;
-
 /* Maple Bus command and response codes */
 enum maple_code {
 	MAPLE_RESPONSE_FILEERR =	-5,

-- 
2.55.0.rc0.799.gd6f94ed593-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
