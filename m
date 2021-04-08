Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1924EC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:30:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A338D6113C
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 13:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A338D6113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZQYfcAm2tQXtMJGIoAF4hBOLAwtdQxrc9UWE9TuOLQ=; b=E6+Ltr6CSPwnlWlHyK7dSluFO
	nuNPzvU2TRGHEk1sD3gIQMj8KGBdTqCTFETdlL7w6ttojRepdfU90caudokBluOrc4xsDiqGOihpX
	aCLkNcCVvbn9l0YSEEuaFI9cZ+8c4SwhomaAdLrozg7Wn4nWyqWIa1jNqbYEdt33UkRKGvGWTK6as
	Ukiq++t0HWThwx0P1sO0S0tlFD6+CwlWXUVH77awNAKrdmW4gspJQOAxEibp+DYUsHKPCKfYVWVdJ
	JSEb0HSDhwmIy+MZ+2ssGcxZpEqhn/+u8wSz4p4vhFQq0+4G6x2IwfIUOyQQwy0APWiTob844sQDA
	ZKVYv1gmg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUUjU-0088FF-CW; Thu, 08 Apr 2021 13:30:04 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUUjP-0088EC-NX
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 13:30:01 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGMW16Qz9zPnwL;
 Thu,  8 Apr 2021 21:27:09 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 21:29:49 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <joern@lazybastard.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH V2] mtd: phram: Fix error return code in phram_setup()
Date: Thu, 8 Apr 2021 21:38:12 +0800
Message-ID: <20210408133812.1209798-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210408144610.0c0686ae@xps13>
References: <20210408144610.0c0686ae@xps13>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_143000_073656_9409A54D 
X-CRM114-Status: UNSURE (   8.14  )
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

Return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/mtd/devices/phram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 5b04ae6c3057..6ed6c51fac69 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -270,6 +270,7 @@ static int phram_setup(const char *val)
 	if (len == 0 || erasesize == 0 || erasesize > len
 	    || erasesize > UINT_MAX || rem) {
 		parse_err("illegal erasesize or len\n");
+		ret = -EINVAL;
 		goto error;
 	}
 
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
