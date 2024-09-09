Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C1CECE57E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UhsR6Is8HjlqID+lTbNCqDeGq/yCpdfxE+X4AwSHz4=; b=t1PizhKF+F+dNv
	FA+0exPuhyysPMBDF0FfyWkJ1BCH5GdlbT8J73e8hH4JsIIVNocOypLaG49Dh8y8qm6ZkFE48zn7v
	R7ca5Ly2NX0yURmtwsAPzB0qzVJXKiJiR33p47jp3IcWfKQxDvmidpoYFcb+pgUiWqCsQQg4Pa86E
	3t2+z01WHlVZQg79DTPG6hvL7Dt9h9pp2EqyyYkW0WJq40VXbg+P1spbzhaBPpVa/YLeom+z80qH6
	0UA9TZcBaJhUQWdY8ouAmYg2AGgiTQtBXybbBVKbCHch8tRYPyuGp18aJaMhh+s4H6S82WYgiTTaI
	73PUEyjk9r7TO7tqf6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaFv-00000001DTW-2bji;
	Mon, 09 Sep 2024 09:00:19 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGY-00000000w0V-4A5B
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:56:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37747c1d928so2510372f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868613; x=1726473413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
        b=jZ89+01XJPIh5PTDMzNviu1jWCyZeB4K7SPiSHvLllXcvN2KdYY+n9QcKhKkN6cUUw
         1+QcAAk8irRf73QPRJXhy7g8YmBEYzxdhmrm74J1/gVZKTwcf/5xyb3TTOFqwzWmfYWz
         eQ7i8VEazOeDpGiWYKbnMw6DPozP23cPxcGBsP9rrf+FvIPP+Y14ymvtV4f1D/oODvax
         FcortQbFdgpgsSaruU9kRxjoxQqOcJftLLtNuWeEOkI9uVq8OV/YLJBUp9E5Ln0VleJE
         v3hMhpW2NwUu7bN1TdDJd3HLBG1HophEZht5qsw7eOnSGmn3jKQM7dXMZGy/+n/nkjbJ
         uk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868613; x=1726473413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWDfXNbOPKK8OkK/H/srkd9h9NgocC7Imjlm69NJz1o=;
        b=w/EZ74fmsdbYh9fMx8XTLnQK4NQ15ZTO/Xy67EBHd0G6kYbpZNJy+zBT8YXCVrMn2P
         4YLwocmF48HBQsb3wJK1G7O1nwqC37UQs1Q26G9nZtonlM8R+w+ptH+Zn1j/wPxpayNB
         lhXvQWIaK5/Y+7G/rQkO3rT8TG9IWLqn8xxTX46OefUbcWLQ1cTGqLNSeYB8Y/oHbppW
         SpeWM1O1m1T2AhRgV9W0pwGkh4INK8Was4uvV9sv3o+R/h8495ADdUGvcmiIG4d2gnjY
         UPuWX0hFDWJS1mDEXNK1paAUWNESSOcmUh6v4r9IgnOh2moqJS30FBp2/ukY9IfASY5Y
         6Kzw==
X-Forwarded-Encrypted: i=1; AJvYcCUa4Yr97LwXpfT5f1Ek76JskGcvE2g24n4srSpKMlh+g5XJGe5GNOltSQKrBFdQMpgqFtp3/QFSRyE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkdpvioeCUMu7grY+P80SWeZm2Q7HDqJDnM7pcyskV+oTSlcda
	r+yy1eoY837SOrLkojbjrL7+03S85QO2Rwpcfmgh6C+1yrEyPQaX
X-Google-Smtp-Source: AGHT+IEJwY2izSi9JvPnlSkxsbiABRBgLXcw/WN/9+VtYgXEpeqF7jtackiugNKAcXHsm6kUmrt+Ng==
X-Received: by 2002:a05:6000:e07:b0:368:7fbc:4062 with SMTP id ffacd0b85a97d-378895e2f23mr6668484f8f.33.1725868613138;
        Mon, 09 Sep 2024 00:56:53 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:52 -0700 (PDT)
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
Subject: [PATCH RESEND v2 04/19] drm/lib: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:47 +0200
Message-ID: <20240909075641.258968-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005655_112798_5A639106 
X-CRM114-Status: GOOD (  12.27  )
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
