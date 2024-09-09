Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B0CD4F4C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWOJ1WZEcYe5OVlxQfzLOUlNFNipBUt4rpwk5mH4lKQ=; b=n/GJty7CnUDf74
	NwhE/gWuaz6XRRaw7fAK/Z0odJOppldN5J4fI3Nvy09fnqlNqMhuWWCkLB88e9+F1fvEl5P952Mk5
	uBdpqjeqXGBL4rER2PDLfCcVq/q67sW0UvSD/ZjsYD+aWxpJQiVDXgmT9GoiHXxVQGimZzTvptCVI
	aPuVlJXK3CNgSkDs8Jbj5CYScq26K6u+cXMCyMPcCL3Z1X69oKRQzRZ6DTYevfjt08W3JXL5/fJrU
	izLhBA3fPArqEKkAXQWY1F/V8IPWVOZq1nVIuiiJW27y6MiU0J9+t2EOlo7brWo/tYJHohyVC5aIm
	tfbZDggnGLS944gsRC4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYWC-00000000k3r-20zy;
	Mon, 09 Sep 2024 07:09:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVz-00000000jrr-2STE
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=; b=R2C5c273DhbKKhNuWybTDXZlMr
	C6qRaa0XMGrTNmYKwxOkiodmmBxFkyZUjyhxTuUam7niOkBu7X+cLjLpRUlm2JTe0vRGsGeA+2ejo
	EK176HsbQisDrzR59gCPwuYOnGUt3ZoV0DNer/xwKmnR6/eia5/6BHP6/JApBTivwB1jLAmhGDS/9
	l8XtPAInH005x2APXDCGC/s0HOTR99AduI/AqvegrecIJ1gyrCbWpzU77EFYJ7Y8qAPIQpu2iGdwp
	UytHZalroblHVoIUODxY/bI6AnlXlAjsVGrY5mhp0/v3FBVR6Ld8W89KnrbXsODGsad7+KoOvNqv4
	FdcIlliw==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVu-00000000KfF-3yjK
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573868f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865720; x=1726470520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
        b=aRteNwKVSWBHT8ynl1cO6amjrYIsqAX2XhL51WmUcuIzAtAZ8J3CYlj7uMLaPb3Ojg
         /XdTgRHW5AoqOWCOJ04fOvdYC+VMQmqi7QZqYVPj95ENB0gklY6oH/VOfVkG8UEfnn4d
         i1vHGHFZ72Gl5xPgcndSg0a08+kFbTpn+aEDlYwPGpRF8rnrbFkTpP4UpmplwCVns+ZT
         KXMSsaXACCILSmPx9GC/D0tmsiC5OFKpoRXjmWA9uUO/6WcSczo1jE1h+6YwazkO++Il
         Whwb99toVcGpolVgNLre6nSfeBoUtqjipPXb3PgLmprfJZO0dPndTXJL7QZrintx5Yeu
         T91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865720; x=1726470520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
        b=mMlQafQpS6C+mlbM72YFD3OW3Z33AjOGQKfAW/zBFxWS1XpHdU0Ilo6fWU1pY0duZO
         qTqoYpahBQXXY0cFA5glWbjTfFzlw5C5et3pXgi6/W5rDA2Ogyy+1OrnG3UWnk23LnG/
         iRMcBvVzBEhosFqD6XDBY76Q66l3NPnEPxGIq94sCYa8WTyGbWbwXuie8aeP1QVEPi4R
         DMktR0MoX+VHV2OYQi+3OIHtEbGE3YA/p3MDlBRXjDN1PV9AP2Mumq4fMiaigs3WwRK4
         sxy15r9N59nY3Fj8LMhynbGWKykk1/9MLCXDceZVUj6byCQJTjcLlamHePBKYe3C/4YH
         ceNA==
X-Forwarded-Encrypted: i=1; AJvYcCWlTUmeVEB4Asyk0D79AAWYarV6vwPW6CahX3LupvbYsWje4dpMc39jqf1KluJWzbA3DykMH2WLEvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo/D++TseAMYRsyBaqkoN+5aioo2oV7hQFIa0hENTUfTJSyVZY
	Q3fufDDlQcovh92wziBAqlv5kawD3Lbl9VKyskxiWmZ8yFEq+a2z
X-Google-Smtp-Source: AGHT+IFpMMDkjMFVxEERLEIpvXz5Qb9C8Ij9QoDrxVBU1SpY+XXWpwkv4/0Rcz/ipgLNBmIk031jQg==
X-Received: by 2002:adf:f6c2:0:b0:374:cbc4:53b1 with SMTP id ffacd0b85a97d-3788967e494mr7339886f8f.40.1725865719787;
        Mon, 09 Sep 2024 00:08:39 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:39 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH v2 15/19] lib/test_parman: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:29 +0200
Message-ID: <20240909070742.75425-16-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080843_105886_9DC24D94 
X-CRM114-Status: GOOD (  12.65  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jiri Pirko <jiri@resnulli.us>
---
 lib/test_parman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_parman.c b/lib/test_parman.c
index 35e32243693c..f9b97426a337 100644
--- a/lib/test_parman.c
+++ b/lib/test_parman.c
@@ -39,7 +39,7 @@
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/parman.h>
 
 #define TEST_PARMAN_PRIO_SHIFT 7 /* defines number of prios for testing */
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
