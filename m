Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD55C433B4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 07:17:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5488161247
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 07:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5488161247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eXpl1FYngh4QMcB8wo9FGzcHVgI2P5lBrBpa2XHilHE=; b=NSd0h7/g64SfvCWlSUJvOjzWJ1
	J6EunL5rTVAHkgeQExGHEyTej4GPI08bKbhYkYD437qOWfzHs2x518C2jSiciOoynZUZCAJH3s/53
	TckfwFmJ94vnb7sfhAvh6z+/WEzD6Mkp1L/rIFzw7lkkFDXDADFqBuWj7ti6+2+ENUX0/2jw/pZKK
	WmLNEtHdNEyhqLKMCyxzvEi7spBMjTsXNdZmajU7ZpYr84Y4C8W/XZjoBxnwd7CWvn+dsmllNcdrj
	FsSiYg2Ojbc+CID235eAZP92/Gdvr/2j4Y4GpEQmjAu1q+27CxqOiOE1OphBC5fRPENja5I6SQmLx
	YNcf72NA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTfx4-001k7B-Bh; Tue, 06 Apr 2021 07:16:42 +0000
Received: from mail-m17637.qiye.163.com ([59.111.176.37])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTfwv-001k4H-Sh
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 07:16:39 +0000
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
 by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 1A3299800BD;
 Tue,  6 Apr 2021 15:16:29 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] [v2] ubi: Remove unnecessary struct declaration
Date: Tue,  6 Apr 2021 15:16:18 +0800
Message-Id: <20210406071619.644057-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU8fQkkZHxgfS0hCVkpNSkxNQkhIQ0JIQ05VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K006GQw5Mj8PCi1WExUJN1E4
 SzEwCU1VSlVKTUpMTUJISENCTU9MVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
 TVVKTklVSk9OVUpDSVlXWQgBWUFKTE5KNwY+
X-HM-Tid: 0a78a60a31fbd992kuws1a3299800bd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_081636_751650_AE0E0C7F 
X-CRM114-Status: UNSURE (   6.19  )
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

struct ubi_wl_entry is defined at 178th line.
The declaration here is unnecessary. Remove it.

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
Changelog:
v2:
- Add reviewer info and modify the subject line.
---
 drivers/mtd/ubi/ubi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c2da77163f94..7c083ad58274 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -388,8 +388,6 @@ struct ubi_volume_desc {
 	int mode;
 };
 
-struct ubi_wl_entry;
-
 /**
  * struct ubi_debug_info - debugging information for an UBI device.
  *
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
