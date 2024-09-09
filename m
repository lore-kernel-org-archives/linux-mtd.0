Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948A9E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0TEpQo1T/2EQV7/plAHpPZfcTBXCW1Z3yaw/LV47Qs=; b=HOhuqG0I+Tprb/
	W15Xx1EcYRkCzAnCCH8nLMfj53VmQQjK3aJKUoZehIqiycDwVGwnjt6Q0Fr+FR2ptWqOs5yAJczcK
	oy3sJflpS0Q/sFnnqr+M81Q2tUIzVAWj/NcSrrS0gIT8580FCErCVsB9lTlRhbX5h0BIE9uL2HaK+
	xAyQdb8ayAPxG5chR2GYq2B5oLCK37VVvEON4HRLgUGhmPQ9PcbGMAtmQYuvD/wKUd78ZuMZp87gc
	Mtc6VSilYXGapFwXwn7nBiHKnrDaHV1AfFPkQ6NcCqNmAM7sO3tlbTpNMcQIXbnujcDNWzbtY1b2U
	ddE4O7nmJP0wZjRIlDag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZH3-00000000wWq-05n0;
	Mon, 09 Sep 2024 07:57:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGi-00000000wBA-3Hg3
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cafda818aso15180265e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868623; x=1726473423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
        b=CTDT59NqieGDTz1TOE0sSlgd2SGg6pvHjLhwOs/1Z4LHOWcFbn+croWHjSXsGv4r0H
         BHGBf5WkB/XMdMrWo3hWQBF2VE7lwqMm2XlZIlrwMeKgfvV9IkuE2AaAnuP9ZJdpZU8M
         wDbFE76kBodmHReCEpV15Lth6KZ76Zigy+NsqnjMarJ7F0ClDgqAzTULIs70iYST89Rp
         Y+qtX/WkJMireWCA8F9cc83CmBgma2vKM6yj35Zc+C1iQju7wyqEZ3cVJKf+NQVe2XTe
         TjA8MdbkgtwS32z7X5peiv3o6G3+TjB/kGdXUaiKO40a+USxu1vqaXJOzHjnDj7gXuuW
         NPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868623; x=1726473423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
        b=GnKfRshP5Jq7O8VMcO1W/xohIm9VTMdj56f2BF/By09BBCbqOl0sbJOnfjooHiKVok
         aUaWDVqdzsqv25FjXeHNFS4OVRAymlvaVndXaXhLQNzGrcoO9LTng4bFulekkHHaJVqC
         5KZxhtOAXzvxTI8yqQ2ajQRWchJEbiP0+JDfdjidovNQ5nye2CpfObsgymNlrAm3lcIS
         DO4/RPhBHQblDax2K9W9qjC4MmEPs2ZFe9Nri9oihbZ4ALXQd6BU8t2zqWJRtLzixkPB
         ory5wXpVpWeYMHrRaeGFPAqoqnUpdBdhbs/O4DQYxaCG5wz8seOaef0i/cMAiXvEa/bS
         DVig==
X-Forwarded-Encrypted: i=1; AJvYcCVZO5ySp3YLa1I6Rv7+woPS4/98aNqQQBRYxMgj8aYWQZWQLHHKKVX9hBmgvtQXWTtW3X5a6gNZH3k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8wQel+6JUHEX2NStluzeOIgcEG4bvkkQ/giCye07L/Rvl4OgI
	EzOb/k3Y/SyKNw1Z1HQlE0wDJuIuFKeEp6m9zhRzxzFZz+I2BewN
X-Google-Smtp-Source: AGHT+IE9kxClsfj4lFt+9I6K+XsyLZJIMNPvzQQtiREHo0bljCJBd8rPdnCe8AqgSk7kgXsrHagO9w==
X-Received: by 2002:a5d:460c:0:b0:374:c35e:de72 with SMTP id ffacd0b85a97d-378895c53e2mr5981884f8f.2.1725868622808;
        Mon, 09 Sep 2024 00:57:02 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:01 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND v2 10/19] lib/interval_tree_test.c: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:53 +0200
Message-ID: <20240909075641.258968-11-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005704_996707_53A5D489 
X-CRM114-Status: GOOD (  11.65  )
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
---
 lib/interval_tree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index f37f4d44faa9..837064b83a6c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interval_tree.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
