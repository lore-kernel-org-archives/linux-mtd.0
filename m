Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA0C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xvz7s79cblFKM5Tu6aL1XxmwEcGk2xpoLfclDwOY6Qo=; b=3El/avFnXX5QTe
	zsK/fOoTuH8JRVNUhLqAsbodNez5iO47U7CjmgdPbwfq3OgygNdzrpA33Um6e5Le5IYe0YkASQlPh
	+RN02uO+jw4Pf41DH8UJBoL1Rybp/m1EefsTCUHc6N+Rb4U5j0tj6kSnGMHhdYz1lrvZB6JGLPvMh
	bQq4WYf4/a2AhzlSjTdmvgZS62D4mDQ3p3bcRWkQOCYNYfic9rVmC0H+E0ajxpKBQt7lp0/iByrB0
	74oNNME7PmsbTIlqWd8hYMNnzY7xjnU65yYYV4TZ58qluDs9s8Cx1+MkbWSksxoYX8Kb9wa3NONN7
	YXGl46tfj3ZX+NlKjJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGYd-003BgY-Mq; Thu, 08 Sep 2022 12:22:59 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGYa-003BYw-QC
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 12:22:59 +0000
X-QQ-mid: bizesmtp89t1662639758tjqlery3
Received: from localhost.localdomain ( [182.148.14.0])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Sep 2022 20:22:37 +0800 (CST)
X-QQ-SSF: 0100000000200090C000B00A0000000
X-QQ-FEAT: hWIfutFPnzhdGfaSjJO/9RLXml8RanHD0cG/91rhA6FE+aTrN1nr5yLnQrv33
	qdJfCYVe/XNC5x2+JjeM3WanLyMhBd0QAtWj5v4l15vem8ea9iG8TqQbDFIrvynzMKWWQVr
	DoJkgajU7wpGEgxrf7tLpchCUSug2mNQKnGn1s//dKaT8A1oJp4eOKSxT6ogyxGimB8UJt/
	wTrkbOwZQB6DWxPG3ayid6IMTEnEZz6PehCDXdlr0xJq26tDtUrlF+XWEkPikqPNBNnibaD
	lYsCw9dv0XHhvJ3RI1JoSmFXF+bD3t3TPJUlNaQjX7CiWZ2Iqan4ICXp5aGPdvXKcds8Uye
	+JgVkuHe5hZOqJhu/B3EWCzXkdmotA+irNR4L7A5dy6JNGRAc8=
X-QQ-GoodBg: 0
From: wangjianli <wangjianli@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wangjianli <wangjianli@cdjrlc.com>
Subject: [PATCH] drivers/mtd: fix repeated words in comments
Date: Thu,  8 Sep 2022 20:22:29 +0800
Message-Id: <20220908122229.10814-1-wangjianli@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_052257_217187_4FCF4794 
X-CRM114-Status: GOOD (  10.60  )
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

Delete the redundant word 'in'.

Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
---
 drivers/mtd/mtdconcat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..193428de6a4b 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -836,7 +836,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 
 		/*
 		 * walk the map of the new device once more and fill in
-		 * in erase region info:
+		 * erase region info:
 		 */
 		curr_erasesize = subdev[0]->erasesize;
 		begin = position = 0;
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
