Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C109C54795
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aNK+NNWGGThd2hYgOZ7ocQx03OzVjQ0XVIPQrFHuNw8=; b=cSvB8SRuCfxEr/
	4IJaFJaW7xi4dcM5FmMTzpzHWey34Pc/roxqdmEDI9SJnnkVYkHsGbpWjrWg5v3rqfr5oiPPNIBvN
	tWGoA0BvN06Bv/YmabJ+KzOzFZzFuepv5y32YO3vlZPtRq4zNar/LSZ3wVJnL4TbJrAma7mtOPUcN
	8/a+HdXtlF4z/dCZKtUT89niQohGLGUP/D14w46hM+igzSuq1fJPhEUwooIW5aALQnINVYiVw3w5P
	CLligG3pO0mplKMmyikBTCTtBveBJSGf2beIi4dPwbX2pPbiDGRlpSk8Ilu2bwMfV8sWK5AiCLbzo
	WvY74fiV/PFcmIiPcsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEw8-0000000EhmR-1ueh;
	Wed, 28 Aug 2024 09:25:56 +0000
Received: from unicom146.biz-email.net ([210.51.26.146])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjEur-0000000EhV5-1Sgb
	for linux-mtd@lists.infradead.org;
	Wed, 28 Aug 2024 09:24:38 +0000
Received: from unicom146.biz-email.net
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id ZJB00028;
        Wed, 28 Aug 2024 17:24:28 +0800
Received: from localhost.localdomain (10.94.17.16) by
 jtjnmail201603.home.langchao.com (10.100.2.3) with Microsoft SMTP Server id
 15.1.2507.39; Wed, 28 Aug 2024 17:24:29 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <robh@kernel.org>, <miquel.raynal@bootlin.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>
CC: <christophe.leroy@csgroup.eu>, <naveen@kernel.org>,
	<tudor.ambarus@linaro.org>, <liuyanming@ieisystem.com>,
	<linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] mtd: powernv: Add check devm_kasprintf() returned value
Date: Wed, 28 Aug 2024 17:24:27 +0800
Message-ID: <20240828092427.128177-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.94.17.16]
tUid: 2024828172428dd2ba8bb9949c0c816bca59e4752b99e
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_022437_759264_A35EC285 
X-CRM114-Status: UNSURE (   7.60  )
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

devm_kasprintf() can return a NULL pointer on failure but this
returned value is not checked.

Fixes: acfe63ec1c59 ("mtd: Convert to using %pOFn instead of device_node.name")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/mtd/devices/powernv_flash.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 66044f4f5bad..10cd1d9b4885 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -207,6 +207,9 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	 * get them
 	 */
 	mtd->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
+	if (!mtd->name)
+		return -ENOMEM;
+
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_WRITEABLE;
 	mtd->size = size;
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
