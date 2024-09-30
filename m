Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D5ACE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mblkVrb4aPwMDR0URuxvbin6X2Y16Wi7+PmEBiyS5M=; b=noMG0KN/TamlVH
	vrTReRc6CjjQmiibTE1CKkJZeAAZq6pDRRwebbW0NC5wc6morf1KxW8fJs0ptobLRhwGAPFZhbug5
	UZ+h3F3yRS839z4175igUmmKiT5HFjZHlJp5ok1DpRRfIiVfxmDra9I2iW5nMbh+hzx0hnhMJCq1n
	jNCy5CU7+eERZTDNrtHPJTp/oiXZRN9+k9p4AcO7TznEcnEyetuBlu3RB+dtAfmJdPiBHoj787+pN
	prfjQZ2+cm0ry/jdFNehNSQ9RvqrP8afAm34+8xOaHgxsSOLJhn6pszRbwsqK/+GiAeL9FgF6aT0L
	nWXjlRKSfr3pad6T99IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB0-0000000HDfJ-3NRc;
	Mon, 30 Sep 2024 13:10:58 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeO-0000000H4nl-1cYL
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so39960365e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699834; x=1728304634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIz4XxD/MXWvSuHKaNsZDh3MppYU6Ey9Ren8dN/1Nnw=;
        b=a+LlLtWL9GIPgGx+Bq4yiQVYeJhQ62VS33WL6gf8HjV1Wl5LegrYazW0XKzC/H3Uuk
         3vO0hjqUXDz0PW+N/i8DQEenOQ4x5F48xT6Rs/N9mlgoBXGPZd4zUV5UbuvzGerubt3A
         9tVNTuO5+EFZbyTEZ9OR8UeMiI96ew9QC1Iclc8RvBmqmLG+CnsTHTIS6OXbiA+oGr3L
         MAiLLBkDDD/gc5hvnd7F+MSTr/wVFIH3RpxBhke9Tlb2mI+Xtsx3dM4y9i1bCTyuIkKa
         rgqzqehp/8r2ZoCbf6mC0iIXScBAwOeJQcfmDN/g83S2OzB2LK+NI+VvKOU9+xMVU/gi
         q+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699834; x=1728304634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIz4XxD/MXWvSuHKaNsZDh3MppYU6Ey9Ren8dN/1Nnw=;
        b=DQEf6jIdmVR1LR36POWxSpiIsue/LpGFb++oRqTynZg4pzAWVYfrqXQPCR9+KzuF0l
         vD2oAwAbxLLLBbLGQ5G/cNE86Nlm9lhggMubhAxx7gVOMZ9qb7kXI82niIWXgffwFoAO
         PZeV08/IQnGXOHHkK4sSNzQtflVKt7oxKMjlVTCAEItqXzj+O2deoQ51htlKkfl/Z9S9
         FI0mSLemqo3T3vp2SlsShv7r+fhp9AhGMu12cLiAnOwdSRBCgjF5u1V/xbNed2+PxtZM
         7hXu6BdxZN6+HubiBoba9tMS7FoZ0NbBlW2dZDJfs3wKwQiMmfoZzgjUXkR3S++kXLYu
         ABEg==
X-Forwarded-Encrypted: i=1; AJvYcCWaJUJR9EEMK5pQ40Mev0SsT31c5TgDURcGxD7Tt3ms7d1uPFMbHz1HJDOlBJTb1Uly2d3uzg2PGj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YylG7tsvhxvVAwWyFmuv2VpkCE5XTzDBudCMw6J+bQ6zrZrj/Bu
	9tC0UcT+1V5dlmVdysb9FvyuQ9VeEg+5jlN2FupBrumRmmAyDk9k
X-Google-Smtp-Source: AGHT+IHLebdUj03VIWRmjVk+jZmmDpfIAH8/fQg7ILqXr2avcVfhMeGRYFMjONtxE6BzkKSMTbFFfw==
X-Received: by 2002:a05:600c:1549:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-42f584a1d5cmr91192685e9.29.1727699834409;
        Mon, 30 Sep 2024 05:37:14 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:13 -0700 (PDT)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 04/19] drm/lib: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:15 +0200
Message-ID: <20240930123702.803617-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053716_451866_DF8AED6E 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/lib/drm_random.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/drm/lib/drm_random.h
index 5543bf0474bc..9f827260a89d 100644
--- a/drivers/gpu/drm/lib/drm_random.h
+++ b/drivers/gpu/drm/lib/drm_random.h
@@ -6,7 +6,7 @@
  * be transposed to lib/ at the earliest convenience.
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #define DRM_RND_STATE_INITIALIZER(seed__) ({				\
 	struct rnd_state state__;					\
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
