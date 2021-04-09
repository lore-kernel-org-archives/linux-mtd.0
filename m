Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FB3C43460
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:12:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF620610CF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 03:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF620610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1d32URC9x/QM/Z5jrhOd9l41qUKMJO5K5TPAKNvYdlc=; b=BYpPlzsuP0rTwo0ktcszGs76vo
	JAYUtfZxexLsWqR515dAvfW0JLd6T0nmcAhezZp4V4K9S8oAT3XtcyrkQMOo3UAp0F2wZzatYkh0S
	XsW9au8w9Ez3kZjUyOqQ8/sqh4z4JM2dd8x/j6FlAWWVlVwVWBNMeymspkY2EfTGW27F1wlOxPSk2
	trlwznVFI5VN0XLU1v5+xz/mdWbfoB6LC4m9XBMu8ti+CZAw4RN6KuIEhik+e3PoyPqCSWN4E0+Wn
	GZUZkNldFcWr/7rd061+B99Lt6RmLe+aILO8z2HQPnU43Cmzd/Og/pL9qvUqtxgLbrdeeWNzpBCNs
	BWLkEfHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhYU-009nj5-MB; Fri, 09 Apr 2021 03:11:36 +0000
Received: from m12-16.163.com ([220.181.12.16])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhWi-009nSD-Qj
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 03:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7rh5j
 vLPWFTr5xxocUp0KFEzkTg6sq3XwroqTIXlHro=; b=R6kJUS/YV/JefnZ9Qv7a/
 B7gj6IFH4Dwg5gRwyMW8vZag/+Lu7kmdmJHcFPNKMde6yKkTSjL4z0naZiT7v69C
 r0+lprj/y9s0ZFEQ9lPKRhhL4Q/S9GGKAVGtpS2HrIEFpXFjrBRRTdCvIsy2LEVo
 NhxerCcU89tFq+ZGZwPRBQ=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp12 (Coremail) with SMTP id EMCowADn4DhpxW9gVATTkg--.10285S2;
 Fri, 09 Apr 2021 11:09:31 +0800 (CST)
From: dingsenjie@163.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] mtd: devices: Remove superfluous "break"
Date: Fri,  9 Apr 2021 11:09:00 +0800
Message-Id: <20210409030900.40296-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EMCowADn4DhpxW9gVATTkg--.10285S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxTKuUUUUU
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiHhdmyFSItk9OwAABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_040951_050337_314157D1 
X-CRM114-Status: UNSURE (   9.01  )
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

From: dingsenjie <dingsenjie@yulong.com>

Remove superfluous "break", as there is a "return" before them.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/mtd/devices/ms02-nv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/devices/ms02-nv.c b/drivers/mtd/devices/ms02-nv.c
index fb4a6aa..08f76ff 100644
--- a/drivers/mtd/devices/ms02-nv.c
+++ b/drivers/mtd/devices/ms02-nv.c
@@ -286,7 +286,6 @@ static int __init ms02nv_init(void)
 		break;
 	default:
 		return -ENODEV;
-		break;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(ms02nv_addrs); i++)
-- 
1.9.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
