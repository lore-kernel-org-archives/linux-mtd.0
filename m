Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C904EECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UhsR6Is8HjlqID+lTbNCqDeGq/yCpdfxE+X4AwSHz4=; b=v7ylbD2psyeulq
	T9Qa7herc6nXBItSH4FE1ag7959o5HbICAtwPjnvrvKUy9ZwR8/aa3qYU+4ULgGX0KnBeq898glnX
	sGOhuiURaX6rvMkagqSl7d/bPG7Ciyabtgn4bo2PxdRJ8wnqyIpAwWHOUX4uA3fowmvfIJau1gU8n
	L+jTCzXmu5XLT1YUQxct6XWxsJqeWjEhYG9ZirYDNVJKHPY3WzJGPW2pFewRj4sisFPY+7HuzLl5L
	MnvqaDwLaBeH/6Vg5relNxgiCE/9Xtc0nu21iLCrpDcAF8qj+yW/q2KOjJ9f5VUUGNZ8tY7WEqa7T
	0MIrTE8Vry/Ewgo8D0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVg-00000000jX4-1p06;
	Mon, 09 Sep 2024 07:08:28 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVc-00000000jSn-2GNv
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:26 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso3995125e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865702; x=1726470502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
        b=LhN3yttAkWAWn7EreWtvb9caRhvcLWOJAEVB3ExE6tsysTt1oZY0VqAwyWIY0U5hUe
         PQOpWtftZE++fWam5Wyu7NmyPp6tqn53rob4n49SPUTGB/5SNnCf2X8gIxAYF7e52BHG
         dj/twh47NQkXiX+4pT8CAHBds+mEh5rmJJoXYQU0aq7l9nSESIABxGHHNOcUjPMTXu2f
         rBId7+Km1oZwXpyt+jZR7j0Alq8drAl16YqJTzRUZsmzIsY3aaYZmWXQjfaDf4SEz65v
         dSQ4JSo4g4S2i4XwfiXd9yI8UGMqdNHMv3JDsX6MVsQU8GqI+5jOPxdY5IC3Q8W56SHP
         5MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865702; x=1726470502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
        b=uCx8HOBs/8lXc+mnDH9setbLZsPTGkw7jQd1NM+Smy6n2k4gE1MqriXIoMYa8Y4LDL
         Rwf6zTIbx6tyFI9mBD4XW38RSOTZcQ+e83OLUwEPl5YmD55AtO/01qXMUR62wrsJe7qr
         yziEK8eT3HsAGufCxEu0zuUcYehR0KeT8A9xtV1UhUm29ixwzHPaJDmlr16X/t5PtYhG
         PnfQuqtEaqfbrijkeJRGfr6xdLIAy8FmixyluijygTVuTIzMLJ54Tyzfwee1O8USLAPy
         +3yWTaWsSGwBB/fv9DDRSrJFPMJekexM5p1HjtvIDniC4PS2LQyLEeNbONRtbLP3A/qK
         1xbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbHCJH1lPqiTImrKVSRxwerR82gTo2HpCgTc7IZr3pZ8mUOawsABalcGDAsYLpuCJh7q6zVx0rUho=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNK4XpM5DViY1ti6q36KV2GdTLW7ZN6WatLUj/ZFZfmQujMaCm
	zXTEyylq+dHv98djvTxiu/OPCN66r2y8HgpV+UfOtUlpg3tBW4eD
X-Google-Smtp-Source: AGHT+IEyQpNRm6Z1Ke3uw6VOA9a0jndOIVoKsF8nIAl4IA619+tgnWwmZALCM8p4dz4tk9TqSiSrJA==
X-Received: by 2002:a5d:5406:0:b0:378:7de8:df33 with SMTP id ffacd0b85a97d-378888478bfmr5359523f8f.31.1725865702294;
        Mon, 09 Sep 2024 00:08:22 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:20 -0700 (PDT)
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
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/19] drm/lib: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:18 +0200
Message-ID: <20240909070742.75425-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000824_608947_16089734 
X-CRM114-Status: GOOD (  12.28  )
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
