Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA91CD4F3C
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgrmykqL8pWfHayv9NZMnW7lmQ4g8NaUqEmGla4mHjI=; b=2/zYWstH72E8Oi
	mem3HOteLoMM9iCNEAzQM6XdKb33fjrCrY3SeJl/jrTVHg2fdVGKBh9lB2uJoVEsFQURGmfRW/BoI
	w3EFHxhLB+hYwgYRnfHYsSC/DQmv9R9JCD3danC6dY3+btx9icID9MOecVx1FNG/xDPUhYs7c+uub
	0XQ6yOeaIsNZDHZ37vnemcaU5NzDArfz5J2qxUpw/mKucFY/n+FWHrR6u++vWpuADxsU58nfjtXE7
	B+V7Nf6j5vZ2SDAdwMg90pdIUtkB+fWGgBipj+oc8YGsmBwVn0Xl3YpuriHfTW9Wk3bxaX+LR5BY6
	TzixZYmhxBfA9T6v/lJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRK-0000000FUOx-1ka3;
	Mon, 18 May 2026 11:47:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRI-0000000FUOG-3zOu
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 May 2026 11:47:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=OLKMx0XG0KEj4EtOA3tO3neraMW/tRjRnfYn5YIq3Mw=; b=Q68sEJJxbv7KAa5oAWxEGiDtX+
	m1Mc+F6J6HeNx88mYLjva3rsGOwGCJ3YJRJ+TSRagm3MR+DxPPv6/MYZn/LfUPrXsC3DuR4FCPbx0
	vYtyeORgVhapWRmHL3THuJJY+6zpu7W95cyeL0IE3Q9t5r8GyALSu5gBVOLZOizzvKta4BkqgcjHQ
	ZiPOtLnz0swP736mSs0F/Ukz2orI9vcL1UFpQL2IaVCyt2X712RGNDwV88CFpLOoHDxbIJYBZB4+2
	A1Vls1tRLosVRcyXp1Qc0mieNmp3zmNEwMEQH1dtEiExt9PxLLlONlDY2EcWfI2sljLFVVYQqEFkC
	KufgETOA==;
Received: from mail-wr1-f54.google.com ([209.85.221.54])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRF-0000000Azu6-0mnK
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 11:47:15 +0000
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so1025100f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104830; x=1779709630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OLKMx0XG0KEj4EtOA3tO3neraMW/tRjRnfYn5YIq3Mw=;
        b=TKWoyw/ACO8XBH7h14uh6VtJPwmTo8h/GX6b9t487az/uI9KtS3rGYqy8UXpsvcSvH
         4U6XyVFnRTmyi3dmhSn1PZt7boazx06We0FtHQob09JZP1WficPd31Jbsj/72pNvS7Jg
         pa+FAfkI7BNVY1iZ1+ogIey4cpBi1x3uJv1ygm8LwEnvmXVdQSX0mV9OveKydPvR1+i4
         EN4A+AnJAgopltaRM/JdOcXtmkBhX8xjIm7vHS5JzzBKdzvzWpVuO/JCV8tU3j+IZAC4
         StPX718OfQ+bT9UgcZQbWfeQ9qooZhP+65YxmXQSMaXg+bCHDtX0O0Sxsmj4WrNyr1D/
         +OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104830; x=1779709630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OLKMx0XG0KEj4EtOA3tO3neraMW/tRjRnfYn5YIq3Mw=;
        b=sFrhz/nLrC5UU4aLstXQsl1tktDqAud9+TWt2u7Bhp0rp4UR+Fu/03ku90Iz/Keziq
         xdkGuh5pxIAis9a9XfBuqD2QgDYtdTw2SftoYmwK0WNtPh5EHRyGLXkZIiMCbpUMdmj/
         EBwKO97SX4zaRMBHbsdgleZGbt6pUll7xhez4bw4lVsxeOFRZSKvLi5J3375cwbGaOv3
         P4cCtGfP0Q5HLtYo5N2JGddB0hoHHjG03xQ3fxEzlainMCzg033Do4GiYV9er/5NOEsM
         ajb2qkItPWtWPWubojRbW0ZiMAnjBs+0F0uoFmw+JUO0I40UZ/UzuOedO6qzh1JTutt+
         5asg==
X-Forwarded-Encrypted: i=1; AFNElJ83pk1XFcZrcbbio11VBHj9DaxgDeAfWUtv9X4/soXGN2Bbj2+FT29uXhLE2aa2uECVJ2HfTfmdxvo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaJgXFdggcHcKcA0+25rlc5hWQ2IgLROUgE7EM5R9sZteLi+wh
	+OeVw4wmDr5uJJWlGTYGzRqVzjCOe9WVIvUKGkl79RwWWte/dWnMSMs=
X-Gm-Gg: Acq92OFH+RIX4eDV0Gjm/HzIOG0giTNr5o/3DQ12hAwBEgpMuHoD9TpslDYzPblvcH8
	U4/VGJFwKakHu0mPM9miRxR2tvE6chpCKB1aODIKi9xvTw4Xt/xRuU/uEneTdEmdL/tApQkqtXn
	KEcDPmNMXY1csMoUIKgyWh5VejkwTuByhR+okX2pfGokGwYKcjiD4/c17dh39EJQmt+3PNwWc+b
	8s06qjvkJ+Z/CT35aTofTRAfh/Dq/dmJG8DiZEFayjA2ZXs0WSA2FISZMvBQh65c79qQPoWTo/O
	scMiG2MsX8JGgxttHWwIvcyWYVZPopWxm/9Qnr4kuo1XRPhgqd3ls1JxhHKRPTHqreo+QEeDatn
	Z66gOkh8wIpSIoH9vI+0fgs6FUAw0t2ohNr8QGPfPw+Sii+0COBi6W6yNvxHZ3XCCryuqiS9deV
	xScczxl7J1AzHfqG7FCt58a3KzogKkca2OvZhpkvZAIz/ZJgW76OwmfV4DGgzrjrS611KvMUkdS
	lrNUxBX
X-Received: by 2002:a05:6000:2503:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45e5c35e7bdmr22892189f8f.6.1779104830110;
        Mon, 18 May 2026 04:47:10 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:f15c:fd38:3fe1:9653])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a666fsm35365327f8f.36.2026.05.18.04.47.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:47:09 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrian@newgolddream.dyndns.info>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 1/3] maple: fix build error due to missing include of linux/device.h
Date: Mon, 18 May 2026 13:45:19 +0200
Message-ID: <20260518114521.81564-2-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com>
References: <20260518114521.81564-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124713_643347_EA61D2DE 
X-CRM114-Status: GOOD (  10.68  )
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

The commit 313162d0b838 ("device.h: audit and cleanup users in main
include dir") removed the include linux/device.h from linux/maple.h,
which led to build errors as linux/maple.h embeds struct device via
struct maple_device. So restore this, as it otherwise results in errors:

./include/linux/maple.h:81:16: error: field 'dev' has incomplete type
  struct device dev;

Fixes: 313162d0b838 ("device.h: audit and cleanup users in main include dir")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v2->v3: no functional change, reword commit message, align subject to
	main includedir, add Cc tag
v1->v2: no functional change, just rebase patch

v2: https://lore.kernel.org/lkml/20260427114750.2480900-2-fuchsfl@gmail.com/
v1: https://lore.kernel.org/lkml/20251117224408.498449-2-fuchsfl@gmail.com/

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
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
