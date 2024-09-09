Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6123ECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6hK1avpZzPxZGLtx0wO4MwBBa6BmImXrIJ9XFAqdaQ=; b=hkb61A5P+Dw14M
	bfklcNdnAHy04I53N9NDSYShS7WcpTeYVfpJeU0fuiXhO6338UomLFlh0HthW1xbk1uxrbIGemw3E
	PtQfIG3pGedpKhOlUZU7fkSqzZC1cBSE+W+Qs2CfHtYoVC299DwdwXDR+l89XbcIjVdH766+pZdOo
	b6LxjdHbHTqL7KGSiKZ9RSSUFbPnUQKDVvTwhrdNosE4scCFAY3LoH5mOprxk37qTwsTylwdPUdr5
	LlSZ8qcNC/aXrfKNK+oEEaTlEu9NJ1PNLNc61EUYUWVFdNp4bkCvIUpVF8fOLhtYLFE6uGVBqytVw
	R5IuceY+D/vGZrHeOuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZYN-000000011jC-0NHp;
	Mon, 09 Sep 2024 08:15:19 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVf-00000000jVL-0KcC
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573558f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865705; x=1726470505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
        b=bXaxLcMUOnTIt9WFR2vL0tariTdKI5ukdPPD+TOx3xmATA9R3Os1AIjo1voVkq9rGn
         4I1V9NX8bm+TqR3JuI38QeIiXJdDp6OfQfozUeCqeAGN/uwIPSvoPzOGIZwXtJMIXERh
         3MFe8b+eHD2cU2JvGW4kyRqEqiwvGp3Kdt1eYk8VZv9hRcfRsNwVywtC5wFXI+WbStY+
         vBG4hWfvHp6nZXg6j7IHKiV3zVXTHLehduebIdFpPFEUmd8GLckaKZZGH6lqao62n7i3
         WwsWeVV+8QsbMmQBllDlzBunB2zrWZx1v9U3lCceZ3bfuGOt/7ZamyGxF344U0DYoqpv
         QAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865705; x=1726470505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
        b=g0HNAZ+3mBwk8MT3hAhLzNwggbBlT8L5ymNS7k/gVfxHoh4w2/Os8ecgAp0EMDHRqM
         Y0EGsrJPkCabJ3s8HcXsNSlWkjJ1oqwD368+cH6noc55qJiGlDS0CqIwY4Yis8NNP3bB
         M5+mrFcy1hc8TnViW9jbJgvtJ57/QKpk5IHJvm837Xtd33mKVsH9TKwqwAbK4WqJRM9X
         igAc9gKcR3Cnlua+IEZ3jE4SgfpEVEYTCimuYXX6sD/lEjftsLYD4h+HmwA9pJOXRa0I
         OUqFQZqF8QMWRodhvHxfd9m9sBTJArXmRWMK23we5hSDwdbx18TY2m5YNRTPjNZk2qrw
         g21g==
X-Forwarded-Encrypted: i=1; AJvYcCV8+SVBFJZdWjwa7noiLwNLHWdvRjOGplQCmCXBUlSp7BOBN60Wk1Vos4ie0GOA64vNSqPzvVtXELM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyL3i1ced+Ho2F0liZOxFAYXuwJq00E8zqukY2VbzYy0xx8ZK0h
	vOmVHjwF4XP7jUoM6/Urn/Z2+K/XYZQnefF7HnV3NJ/OIALYP2KS
X-Google-Smtp-Source: AGHT+IENAg1lx4hzfxdNZ9tmKUR4RCTP87aohUUWb/KE3Nn7ukR11EcqHzf0iJoeJH4fmxJ9dQt47A==
X-Received: by 2002:a5d:5c87:0:b0:378:89d8:822e with SMTP id ffacd0b85a97d-37889d883e2mr5832530f8f.27.1725865704068;
        Mon, 09 Sep 2024 00:08:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:22 -0700 (PDT)
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
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 05/19] media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
Date: Mon,  9 Sep 2024 09:05:19 +0200
Message-ID: <20240909070742.75425-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000827_271895_04293016 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
---
 drivers/media/test-drivers/vivid/vivid-vid-cap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index 69620e0a35a0..184460eb356e 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -10,6 +10,7 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/videodev2.h>
+#include <linux/prandom.h>
 #include <linux/v4l2-dv-timings.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
