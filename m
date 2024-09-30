Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF5CE8342
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgjN0cIufcYoTl4c0DA816V83igJ8lKVxbapaYfJ0zs=; b=IYCrepNcc7r+Id
	EeoF4s4G0rlJsAi7Fa7NCNYbbe8gDT+M4iUGA3Nvm42nwD+AibAdYqb8vS819cKMaT5QTIfvFRjMu
	GXOx2+8JI7wHuSOBFlFmRGZXG7gXTYKGNOtAWeS+aF7GSg6QilzJEnDjssZghIwyJKfGQqOPSCEek
	SPtnxCZIW9v/Am9jwtwdf/cFmoF2wgXhNJWsFTpOzBO95UPwUHBPaRWQPn1QgezOu78tHo5OwLYBG
	QbpyzRqCzwBmNzSTLeyeT+G4hHZG0+/yV3l5zjw5/WLFxMbhG/Mg4LJuy2JIjPwjmtnZzynZtmEGI
	baHVeulX0kd4B2E8I/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB1-0000000HDfy-3RUh;
	Mon, 30 Sep 2024 13:10:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeP-0000000H4oJ-1BaC
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so38166375e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699836; x=1728304636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOB1xBCChyVodl1AKBCRn0/gjY8Cy4B28eaNVB3ngoA=;
        b=WK3XSAh4L8QToQLOrT9BCf/wr+hxnHlUJDb/6lIYle7CmsbjXDcSnwTOB0pMQtWxfX
         PLPqfhKoQBfxsB53wDi0hZo9gdu694QeKjuI4KE73oLsJqKKayuEFe3FmeIIBh1jgORF
         o57Va7CrOt7oxs0DknVPd4fvNWt/iXnJP4OYXyNR5gzqQbuCSyk+XiASbQM8s5W3mFKf
         w8/VFVchOrXdwj3HZz0ar1RqRRSqoYOZceI1Z5TA/ibwcKcIl2ggmDeomBLbGzT3PHQl
         C0rc88evUUrbOtu/c4xK873PtQSpSkR6XofybFqWRDM/7n3GsiJVkhNRTdEpOxBw7+sq
         TF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699836; x=1728304636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOB1xBCChyVodl1AKBCRn0/gjY8Cy4B28eaNVB3ngoA=;
        b=kT7U+unWSmLmUv++jsPs4LhcFaVy0jvO2YWem4jguPz9B2jT/sm0AedNBN24iR0j6P
         fOdOKaHLi5G11K09dEeyDQBp8mQo4qh9KUkGuR+GjCUcOtIhZ+DuatlTBufaZV68oD6y
         fEHM1Nf1YWNa98QgrfFFWWua8TvFdedMkCesXC7TayX7l4//SspN89zk8m74o6n9q5dr
         8DbLxrOs814oXdSgdVJZ1biHnBNctDEzf5DTxC2q6lsOXRmIy8EiS/SzauX88GhqjUZ8
         5C3y7skwymhPGp4ynFZ+s+0ZmXPLmp3X7YkDjpAUA/7WDjzeUlPNMvFwj0GJSxCIY7+O
         gkbg==
X-Forwarded-Encrypted: i=1; AJvYcCVTNg/GP/B7d7fSzdrigsRulT+wSk7lbFetYvtCq+ojK/fOkPU4M2QLQVXwqdruP6R8RJwTCJAeQYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJNJatcX7P0fJ1CKQVHBoOPqET2Qn+6jKDQBKZU+7xCiJiKaBI
	zw8aUdXPr65V661QpVYuZ+doyITQ7DJfzKZiaYuDjVjIncj9f/LznhVu8H8yYRk=
X-Google-Smtp-Source: AGHT+IFX7UFFJ9mFBZg+bn1buBc9cHhJrMVxmqzrsXfLIQStfn4WgdL6i0BO6HCbDChBmeLhRHv16g==
X-Received: by 2002:a05:600c:1c85:b0:42c:c073:412b with SMTP id 5b1f17b1804b1-42f58490786mr95354705e9.30.1727699835819;
        Mon, 30 Sep 2024 05:37:15 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:15 -0700 (PDT)
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
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 05/19] media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
Date: Mon, 30 Sep 2024 14:33:16 +0200
Message-ID: <20240930123702.803617-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053717_343498_1B1391D9 
X-CRM114-Status: GOOD (  10.42  )
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

Include <linux/prandom.h> to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Hans Verkuil <hverkuil@xs4all.nl>
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
