Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5F1ECE57C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6hK1avpZzPxZGLtx0wO4MwBBa6BmImXrIJ9XFAqdaQ=; b=Vhsazfd+LyGvYK
	3zyzrPr84zEdur0aKrecWmMo9zCwOE2YTgDzEBok3nHmuSvr19nG6EHjK/INP0qxSByWMsTl/+xrZ
	PPyj+wYyxEETS0RbMinIRyQCaugw6fCwae9MGPduTOXR2bI8LFtE4uY0ozb6ea4vAbfuLXSM0fEPQ
	LSQcfuI44fvJZ0lIdE2IAKujFflBH8pcIEmxQugw6KcNtT/y371kt2WhgY+zew6MqZsXIdadRsjCk
	bra9NXk928JNWAOYfYdI8K9JzAlA4rzLtLHs7Cd6ZcfxOxJufnCC101CjJJdhkZ3FHmlqNEN4PM4y
	pOw+09jAMeYuH5zmTBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGk-00000000wDA-0pYQ;
	Mon, 09 Sep 2024 07:57:06 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGb-00000000w3n-2vp7
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:01 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so890075e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868615; x=1726473415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
        b=gxf1reepCvMyBVdSBBqXkdZ2rvdOSs4WaePa6hJTJKbKhW7gaEebQsR7VglLeAvv4c
         5Ez5XJ5fPZ8NST8ssi4M5bdfA4giVzb2YA60Lw/v98XZtK5Bkoj98xaC0I8mo2Vn40Mz
         g9hepXZq/hs7S+QATrbCgWRWuIVhXGvEpkJ61dDknT0SVKrD0d7fJft/yzx3VYQGyy2r
         Te13ZlxlQDYjhjIxA+9RMKqJrwCByjszJFEfrHwtHuK3Rij62WGAIq4IBa9GY23Y06f4
         Q3eRiQuJbVdJECQ94/ozAQyFe/G9u+t2hkAxBt4ezRX6cNIlJzUNceUg2DPtKEEkxRPF
         8IIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868615; x=1726473415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShjJx/ObaG+8g3GTS0ZEXmep/OHlf8GgKk/3WiVwkKM=;
        b=vrlCA6g/uwhqlmxbBKdOwtGuPwA5Hy9JSj+Bqm8D2xhsIkJIcCbEWOqvUiX0rX6sxr
         XzQHbEw4u4/C8mI9HoXqXMvzSw8Fq9Y8FVXo6Mv6weDftD/8RrJE95KTEPQ/Qg6oLD/j
         uoO6iOOSf/MpZIil6xP2C5ehDT1cwtY0fwoU0vWHSpNagBEyQA5dA2zh0/d4WbZsT2Bh
         q5vmzi2wk1bbA1RvEAy7wENjAGapd8Kr7iZvJDdyHXLHsFKzIa6ByeVER5e6ixMdQWX2
         /jCZ3to7JEFXG9kt1e/gYSECPM7JX2BXezRVcnb2D/Gl3ur2Vx1VBj479zR2mkwzZk9a
         oC4g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ05oc1DXwswb7H80Wiy6XjLXr7zg8ulpWRFFmxqyJsnl9llIzOCfHnPfOLBNepMyKUrkL7iJXSFg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzO3jMCnvKNfiIkZIPzqE+CFR5fFlSCPd3Kwi1ivrDaoEbdisFs
	NOAOru5iTKyu8GU7cR0heZ4ZSbw2Iy7p3MGu/2bqn7j4XzTDBLm6
X-Google-Smtp-Source: AGHT+IHjtALJXHfeHvlFfFIGF/Jv7NubOC1i9OVehC29v/06Ma4HBUto2Yd3NbJZOwnM97uKL0s69Q==
X-Received: by 2002:a05:600c:511f:b0:42c:bb41:a077 with SMTP id 5b1f17b1804b1-42cbb41a1b2mr1246555e9.23.1725868614984;
        Mon, 09 Sep 2024 00:56:54 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:53 -0700 (PDT)
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
Subject: [PATCH RESEND v2 05/19] media: vivid: Include <linux/prandom.h> in vivid-vid-cap.c
Date: Mon,  9 Sep 2024 09:53:48 +0200
Message-ID: <20240909075641.258968-6-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005657_813475_4DCB71AE 
X-CRM114-Status: GOOD (  10.73  )
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
