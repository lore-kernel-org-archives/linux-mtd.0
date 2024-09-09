Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D70FE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkC0u/WguHEkAtmyCSA44uCdB5GNqq75MCiTKehqGG4=; b=y2Dfwa9uSiEzAu
	xC+j1NFGUXHW/fw98OzIUgAlNRA7nnOYpDl5LAuo7J2DRPCMmf5YrUR4znt+qY3j1IeF4VwsCMt1f
	d3HHRvZKX1Qf30rKuhXrFCzWyGq+FMulZoQQrHAJ5Rm9o8OoZ9KkX5EWoJaYot8K3+PjZTNaqdHxD
	9BMvZPk/pb6vHrPC+Q3FD17YucFpvZM1rqfrctYZzjkGN25vcho6yNgO5zq+GwUCP4R+2jO5MUmqg
	6/bToeskzKeSjGGWL8UMwSfs9Br3bTSYnZY8IV62IDFKELmbbi1C++33l3jpWFGe1baEg3q90dKJR
	rwud73PhULF1sHgryTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVn-00000000jep-1j6J;
	Mon, 09 Sep 2024 07:08:35 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVh-00000000jXe-3xyX
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:31 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bbe908380so35340495e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865708; x=1726470508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
        b=dRZV1qqkp5Yat5DSVfxGNPQP8ZJWMmFsOU8Nd+cRa0q3LHXhpxv3cyO4/Cqsc2Rd91
         CRXpRUbJQl+HmBuJq71JDXdhoAWf2mhochBGx5cDVfXYXCNFysQ0EVy8PGI2nxNVFzqC
         2FKiA3o+vGoxENKr9p3uEX/OXczTKzHWgbifOgJcXsLHdlYQnJbMLJIUaK5g49C3r94w
         dy/5EVjjMSuTySWrbXG/zfGJ92okdpznLicb4Aj8hrD+T7KEHIiSciCYUmNUEgJl4yIv
         YsRYGeo87S4V3RWLLiFDoyhN7MJ1xYTYmwg2utTvn/W+xiWvQHyWqjfX6IHzt3nkFRt4
         zXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865708; x=1726470508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjWx0r6W+Y+t7FzaeoDZ7q2Fdghbi7J4Jwrj3xNRS3k=;
        b=XVxIKAUNehFUgVOsgsAaPC6A8w+TJ6vt+cSVXNQRkifOTRgiciSIZxG3OrusGWj2Dn
         yNe9rLNKndVXit+0q5713aThuHWC8qfbGgbbAvr5/5vKcLeBtXeHLK1w2yu8oYBhg6v+
         Vbe0yYni6AYMX4MWsqMqrmtei/C8FqXl0YbhnFrieC7Nspl5YElXH/Q32blV8bOcWqn/
         mEafMwPZr4r+64j60j5srOyzL2dPwURsVELOj+AcuYXWNoNqy61p4X7UHYgIA4ilcju0
         DDA4PpOXelKCmkvcnXgbaDG25tLWCffSWImEv9cA7EkbS5vPtjlrxHVY4Mrol607BSnL
         b1cg==
X-Forwarded-Encrypted: i=1; AJvYcCXnpOi0bEJY9XwbdNo+e3DbepOfNMmf6sMkP04/HJCNMkHU3uS1BrWgQIJR89WnTL+/54lTnBztYsg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvMyJU8pEubjXSBgR5hT52GqQuU/xT8kXhCSJ3twbj2vHmNG3H
	O4b2tJmrNvAy9hkEpolSK2oWb9PJClH97+CT651g5wdzdDSE84iy
X-Google-Smtp-Source: AGHT+IEUtqMurgdDVKYp6Wy50/2d2bJzb900f0HbaSF3BqAdcqhbaOgpHL4RtjOgNMEwMLQjmxS32g==
X-Received: by 2002:a05:600c:b58:b0:42c:a574:6360 with SMTP id 5b1f17b1804b1-42ca574652fmr62131005e9.29.1725865707608;
        Mon, 09 Sep 2024 00:08:27 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:25 -0700 (PDT)
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
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH v2 07/19] fscrypt: Include <linux/once.h> in fs/crypto/keyring.c
Date: Mon,  9 Sep 2024 09:05:21 +0200
Message-ID: <20240909070742.75425-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000830_091179_B5DB9244 
X-CRM114-Status: UNSURE (   9.08  )
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

Include <linux/once.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: Include <linux/once.h> instead of <linux/prandom.h>
---
 fs/crypto/keyring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 6681a71625f0..82fcc5683649 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -22,6 +22,7 @@
 #include <crypto/skcipher.h>
 #include <linux/key-type.h>
 #include <linux/random.h>
+#include <linux/once.h>
 #include <linux/seq_file.h>
 
 #include "fscrypt_private.h"
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
