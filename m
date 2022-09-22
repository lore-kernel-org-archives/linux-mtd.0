Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4951ECAAD8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 03:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hhts1s0akuZMcDmSn/0LX/rFFoDX38bsAnGnWbaX1tk=; b=N1u92f/EkSIh6X
	TOhfr27ScopaQthFgepTRDtrsFZq2j1Zpjw6QluvoE7uuTLWxXzYUPqnYyXVe9XcPQImofwH56QwS
	MOolJmwfiN09ULEzqyrdqeO/lwpIyj5yKwxQLfs3A3p7/EDkt8ZARoJ7scGG5xBX65Riy9lFpQupF
	M4asl0hEkiEJEvfNLbYL6nHpXxlQDppG1rTfvazkIleHJ2kanff4whYXTqr+IsLZRz2KohyA0pyOn
	DLY5hiJURhxExqm5Qw+6nMmeRMjIKIdebppTuFvvGQZtz41+xr1LUK2l5aZTjChKmm7FBqHQg/c3G
	xH5GFb1MJEa5wFb2Eb+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCgn-00DEn4-QG; Thu, 22 Sep 2022 03:15:49 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obCgk-00DEm8-Bf
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 03:15:47 +0000
Received: by mail-io1-xd2d.google.com with SMTP id 138so6684320iou.9
        for <linux-mtd@lists.infradead.org>; Wed, 21 Sep 2022 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=EpbOaZSSEWjJApuYY/d5ueNtYkjqQi70fd2PmTjvhNo=;
        b=qdUbnvkUmtnJyy3bCOmsO5rp14Yr4LwRa3nAZzbuKiSasM5s7B2ADAqErkGjvAjLza
         dgwbxT8C+nWDVNeIIiI2xRMq4UnNeWBAjWSh2acKT3L2iPjo9yws3dLOcAGZHcNltGYZ
         /8JeYbajorWB0vxoOEmfgR/jXUOFFhDZ+IefjG3GRmeGgHjLGRq2NV2gBw7mkafPTa5l
         6CBzR6oaqNB9Xxr81I6wmdzAup51AgwjyuKgLls7FiFqjfUvtaCS9sVw72IgOYL727qF
         hSgPaG0IYnzY7Aj88E7mlKCLHElWyRoRDqDMdGRnmBJ5ol6dz4ypvyDfDwS85tFyM5hX
         w4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=EpbOaZSSEWjJApuYY/d5ueNtYkjqQi70fd2PmTjvhNo=;
        b=toXw+X6Ow71PcmNWGKPgxj5DJGGRrmOGbmIXL+keVBCk9Dwjp4FILP/PeccvoA5AxS
         ZVOBZoPN5c8BHzibuviGDuaouuUZ/fYSOxu351Ry4Bax+JytqZKLD8RsRgMPmcPv0eXn
         O2XwDjBdF/X8Ncsm2cBW3lvL/n4IF4pJ6GwfMyUNaGod9O6Insmq+TKP219RjJbSpLGZ
         g+ow44PzKgVN2Fu4ofARbbmXP7LTXj9f+v0Pi5/1WOsLfRwQDsyFUIxyYQFEA+FhvQll
         gNHB2QRK0O+t5ztPtwC1PjukWpwr6bxYgNKwstOy9fPJ1uRTUwQhIHGLFv8kGw0kC1G7
         VC/g==
X-Gm-Message-State: ACrzQf0FABX81IqluPaBkOxRIeh+yKsEE19mWiwS6kYtUH9jf71wokCS
	K11Wo0Ze3MFB9nrT3wgetbczATPuOZc=
X-Google-Smtp-Source: AMsMyM5aMSndx+70RryBqtSsvS8/xNXsIGNWui2vmCKx65hv/tuAzGs13cgMT9xHq7tKi/9egmM8aw==
X-Received: by 2002:a05:6638:150c:b0:35a:f7a9:c3d8 with SMTP id b12-20020a056638150c00b0035af7a9c3d8mr805722jat.38.1663816544005;
        Wed, 21 Sep 2022 20:15:44 -0700 (PDT)
Received: from xavier.localdomain (75-169-14-186.slkc.qwest.net. [75.169.14.186])
        by smtp.gmail.com with ESMTPSA id g192-20020a025bc9000000b003434ba08e11sm1675260jab.115.2022.09.21.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 20:15:43 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] mkfs.jffs2: fix spelling of --compression-mode parameter in help text
Date: Wed, 21 Sep 2022 21:14:40 -0600
Message-Id: <20220922031440.422193-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_201546_437097_C2D2C2A7 
X-CRM114-Status: GOOD (  10.10  )
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

--compr-mode is not accepted as an alias of --compression-mode.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 jffsX-utils/mkfs.jffs2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index 9cc5eaf..bd67634 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -1401,7 +1401,8 @@ static const char helptext[] =
 "                          page size (default: 4KiB)\n"
 "  -e, --eraseblock=SIZE   Use erase block size SIZE (default: 64KiB)\n"
 "  -c, --cleanmarker=SIZE  Size of cleanmarker (default 12)\n"
-"  -m, --compr-mode=MODE   Select compression mode (default: priority)\n"
+"  -m, --compression-mode=MODE\n"
+"                          Select compression mode (default: priority)\n"
 "  -x, --disable-compressor=COMPRESSOR_NAME\n"
 "                          Disable a compressor\n"
 "  -X, --enable-compressor=COMPRESSOR_NAME\n"
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
