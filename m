Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAEECD4F4C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k41Kr415qOjgZ8QRK8w/zm9t1OLr+xKDeLKbA1PT0ts=; b=3rS3TgFSEDsiT3
	3p+fVqVo1eg4JhhnJp6CTciPgGE0jYkGz7cKY6SDZ+VUvxFrgCO+xBdpIMAjPyMjwtZQuvcCiYAEP
	5v4TI9hlB5bp3t19W9n3PVfHurHL+80J2MAMPPCzSdTfip8R6dFTAfFi9eGz3IIVD9P03dONTlC6H
	X6FIl9t2NFDteOm0xAktlXRZs9ipz9qGO8iBSl2fepMuZb/43O7aeDbEilV7ezSqxi2y7Sgz5QXHS
	loLdUtzbL3lnjAUD78t1JAXTIXknBuU1JFxdisP8mdL2yxTejUo+gz6AGCGWhXwxT5bZXMVD/FFVA
	rBT6r6z+Kstxz19gDIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVd-00000000jVA-1Ggx;
	Mon, 09 Sep 2024 07:08:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVZ-00000000jR8-2L8c
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cb2191107so7673265e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865700; x=1726470500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
        b=h/sdoYgYhJ5c5mKyGgtvAPHZG8nu00BYUy5NJDHgldWkUytalKsjqSBHzCjrLDQjsZ
         357V3KleVOgr0D4p1jaHVtQqMCOZNRYliG5urmpOjCwg/0aFtogAsqrDKewoK85S6D8X
         cVr8tWwO9YiCGUdNWWpbHdh3C4Epko5c0683+tjQyKIv1FM7UfM7zQ2ea/wtrIcDN5/5
         joo3uwoMdmNbdkgSVG/d4ujOVPeyRz8j9OYGnEJ8Cw0hGj8puTV+lX/pvW+qwGygga7d
         TmvGSfk736wfb18TqLNPQ9YWANqsFwrSMClKBf69ng2Ni4nCwwlSdHuWNdAbeft1JZ5K
         G3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865700; x=1726470500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
        b=nhOke8z7tz/rCqvL/8hCH4nowHfTSxEf3Q1o//jGlcmTjqEVIcZIHKpC3VXbwMVldp
         0+DByhX0m3//HlPrR7QY9iuaapZmuYMOMlSIs56kQg+d/AWasjimrUgLpQLj5Z5Pkzwu
         uoPtr8csFWjT4RMV4/4jveSXcLPQK1chuHgnZBARmZB01VD1zx56Ozp8vGB5DzPujb61
         lqAgovTlvPtKwVk1659zhN4CE9N1RDLKPMFwQ29V2YeAVD5L7c5d9qnyyYDKhvDcIwpG
         YtRrELELDOMfW4IePfDyaNW4SZcitMn9Cv3J55soxlHbbdCiDVzDUHoCEk2O1YYnTCWf
         lB8g==
X-Forwarded-Encrypted: i=1; AJvYcCUmQVuxyLDHm1PN32c5UFMZRDp9O7IeC6YeRAuHr0X5gOyxY3j2ugb9eN8hnyU+OOKzzrNdtLGx5ys=@lists.infradead.org
X-Gm-Message-State: AOJu0YxdyGGgJR7cd+F6ohAnELw53HjFmdoR3wTM7VpZCM0gj60hPn1g
	O907x0xvNlB3IkBB4LU5rYEkGHmEeNqaiPXQHv/NLisFDLVRQDKOgbsDrM/2rJ8=
X-Google-Smtp-Source: AGHT+IEQzX2PbRsNpI7OC/KJTEmDR4766NrwIckhKr3JcIgfhLZTDniK2o3Elu8rKu52YDTKEqoecQ==
X-Received: by 2002:a05:6000:1566:b0:374:c8d3:5f2f with SMTP id ffacd0b85a97d-3789269e55bmr3943369f8f.31.1725865698964;
        Mon, 09 Sep 2024 00:08:18 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:17 -0700 (PDT)
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
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v2 02/19] crypto: testmgr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:16 +0200
Message-ID: <20240909070742.75425-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000821_676997_B51102B3 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..eeb7edd99a93 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -23,7 +23,7 @@
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/once.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
