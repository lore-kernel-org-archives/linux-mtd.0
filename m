Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93921C433E7
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:28:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC89620848
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 13:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdSAgv9d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BTS5xVgD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC89620848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=btM1iPqlcYAkD5lT085Vg4r04WwFPBIWU22uSLr7Jm8=; b=RdSAgv9dyC+mixPGysBPgMVde
	ODKZosPgHfPUFfQI8FsSmJGYEF9A1CxOFq7djkcYQPN/Zs66lJWqIuU+3wJrZ272qDQJAD/lkrf5Q
	wtLW9MpszpfkpuRWOe42xYf94BHj2/MAk+sSiU6l8h3E6vPoSVvSCYl8pO0BX6i8ZppwlpVRvoHUg
	TzulnJYfN2MTrbJ0QjRmDmDXhmMXpcRe2BDTTQe2byZMTuKclRZqqhQM4fi0tCbBLdRWQc/PjJcty
	yjf3JNcbSq73XvE9H5Ksd65guqhh8yReyg8FaFRdzSOzH5Uf+QM29dbnfnw1gCCgg7dlVkkc7huG1
	a6wsM252g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTPlV-0006zb-R0; Fri, 16 Oct 2020 13:27:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPlU-0006z9-6X
 for linux-mtd@merlin.infradead.org; Fri, 16 Oct 2020 13:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=N5KU+PO7l0gAVT/dpNICfEXTr/hmyrV7Zc0zK3h/bOc=; b=BTS5xVgDt5cGF+T5OkGaJBDfWE
 hvgOmNieNHi8FAsSO9lXc0RhY/HyyVzhBfyx9nKQP5THro7C8Ld9LcZ/x4XS6jA+wB5yEnkoCxb+7
 sTib5EFkakiPtnr2D6Tf8WwdhbviUqbNB2F95fBoFTO9R2GSQ+AoSOLx9X87QcsbYVhX9BYwkEHww
 7bI99derRJZWxMeRqTftAQ8Wiy6eS9tXMQfyO72pF4EWnod8m37Mwg+gZLOPcPHfNsPxIuMSupQHg
 WCZp0Gqp7zIrOlI0X7wEwa0hhO3S2Sh+hazj2t2oAezZPuHJlfeOHH5PFYg/4bQzicOcoGOJl9Yqp
 zV+JqZ+g==;
Received: from 213-225-9-134.nat.highway.a1.net ([213.225.9.134]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTPlS-000376-Tp; Fri, 16 Oct 2020 13:27:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH 2/9] pstore/blk: update the command line example
Date: Fri, 16 Oct 2020 15:20:40 +0200
Message-Id: <20201016132047.3068029-3-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016132047.3068029-1-hch@lst.de>
References: <20201016132047.3068029-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use the human readable device name instead of the device number, and
add the required best_effort parameter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/admin-guide/pstore-blk.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 296d5027787ac2..d9ec8b0572d3b2 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -35,7 +35,7 @@ module parameters have priority over Kconfig.
 
 Here is an example for module parameters::
 
-        pstore_blk.blkdev=179:7 pstore_blk.kmsg_size=64
+        pstore_blk.blkdev=/dev/mmcblk0p7 pstore_blk.kmsg_size=64 best_effort=y
 
 The detail of each configurations may be of interest to you.
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
