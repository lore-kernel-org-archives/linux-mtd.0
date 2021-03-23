Return-Path: <SRS0=GnEg=IV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A77C433C1
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 03:19:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3035F61923
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Mar 2021 03:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3035F61923
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hcpHGLQczQH3Ua2IkHIncxmcd/JfhMfM2j+gl9XJRt8=; b=EfVSHesEhwXqC2CHGY6j61cqqY
	dz66SdjbdN1gN2OjV7VyfcJsnw0v8dBy2UUPcQcVRBivlUdquZyxYh4B/pq1+an/1hQTC5ndxjTmP
	bxb3DaJzGnQ69OVGwEycDRYmxtdWxgd5RMk4B/oH1y7jBQmvDPokfvazDNg/3tDxpryimMWCAHtOe
	OzO5WPyIeDxdufUZjG1dGZVuLs/G25BmkMMaL7MT735OQxhuu6mVbsijVG6y6V9uARqFQe4InBIq/
	IwB19R8KFsUK4TjsLcs6DVCqYdZy0aCx5qt0lrpr840Z83OTcWpSFHuQDCvlfacBnpkwiiaVZ3gma
	dtfMn9Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOXYs-00DYiH-Pq; Tue, 23 Mar 2021 03:18:31 +0000
Received: from mail-m17637.qiye.163.com ([59.111.176.37])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOXYh-00DYf2-VP
 for linux-mtd@lists.infradead.org; Tue, 23 Mar 2021 03:18:25 +0000
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 1E210980293;
 Tue, 23 Mar 2021 11:17:54 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] include: linux: mtd: Remove duplicate include of nand.h
Date: Tue, 23 Mar 2021 11:17:37 +0800
Message-Id: <20210323031737.259365-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGEpOGkNNQhkZGBgaVkpNSk1PTUJPQ09OTElVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OlE6Kzo4Tz8LMDoLFT1JVkgD
 KU4aChFVSlVKTUpNT01CT0NOTENCVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTUlLNwY+
X-HM-Tid: 0a785d16dcb1d992kuws1e210980293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_031820_467896_712F688A 
X-CRM114-Status: UNSURE (   6.75  )
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

linux/mtd/nand.h has been included at line 17.
So we remove the duplicate one at line 21.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 include/linux/mtd/rawnand.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 6b3240e44310..93e8f72beba6 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -18,7 +18,6 @@
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/bbm.h>
 #include <linux/mtd/jedec.h>
-#include <linux/mtd/nand.h>
 #include <linux/mtd/onfi.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
