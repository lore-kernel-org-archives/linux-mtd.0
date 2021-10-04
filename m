Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06936C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 06:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02396120F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 06:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C02396120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rgQ3ddZUaQann9LBjy3gh/jxQwNdQkxsQf834qhUCnk=; b=3k7ppUOsezNsTm
	Qgiqwf+dYjEqj1Tew7/GOxAm3am9YjKtfrzhRirkFicoC6+kH4ivjy27xT9FH+VZ7akIcI1Mv+ZOK
	oHJSLqwDugmTvQFx8ZYtMJbMVz6puOeK1uXwWFfGKeRHjdlP0XGQoLrpb+D/lXCH0Rt82FLthWcRt
	/Yj25kW1nCgy50o1vNYO/4lUz+BDBPMQhk6SIO0gk3dkPX10Im0qkkp40NPD9tGPvFXra4W22eLk6
	smf45ICpfd81+oS6yMRUGW1wuLt53n7x8SAQMfsQdYBgUyD3qGm4UnN9pNy1zJly15R1DFt1J1cAm
	XZCg9KhA7P8ixi5RYr1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXHuT-005PF7-Ea; Mon, 04 Oct 2021 06:57:13 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXHuQ-005PDt-Rq
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 06:57:12 +0000
Received: from zen.. (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id BA3F9B37B5;
 Mon,  4 Oct 2021 06:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1633330623; bh=Wz7aNGZ4h8K0IMIM6FbsYYWN7J3JFO9PsGOhVVuoFkY=;
 h=From:To:Cc:Subject:Date;
 b=AwD6f2E5sWwDs+CaLjRpQXJjc6jGgT6aLezeJEHWsymKs+ghV3r5iMaXOA+AbvMz0
 IHdQbehtMACeFORXsOHY+Gp8vtFwBK1tUEMHUTmA/335JbGx+8NQ6lu56o9s8BJuWh
 sYaziK8VfzdNKK71AYkQFD+Z8hF7j+Mr3Jan+Mbdd3l2ULVLwaYR6tcmL6wc7kucTL
 eN3T/uYHxZpvODBr3NJgjTJsq0LTbVxRjdt/uB6ZMaNfk9U6wND07dUj2Sv8OIVU2h
 necZ0ghakrsdoB+ynGgdW2Ka+OXFHfXyGr9JsQJ+SvB5RtWOy7AMfbl9g4QXlNI2MI
 9Ru28RmJDIp+A==
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Cc: Sean Nyekjaer <sean@geanix.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH] mtd: rawnand: use mutex to protect access while in suspend
Date: Mon,  4 Oct 2021 08:56:09 +0200
Message-Id: <20211004065608.3190348-1-sean@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_235711_092969_470AB688 
X-CRM114-Status: GOOD (  12.57  )
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

This will prevent nand_get_device() from returning -EBUSY.
It will force mtd_write()/mtd_read() to wait for the nand_resume() to unlock
access to the mtd device.

Then we avoid -EBUSY is returned to ubifsi via mtd_write()/mtd_read(),
that will in turn hard error on every error returened.
We have seen during ubifs tries to call mtd_write before the mtd device
is resumed.

Exec_op[0] speed things up, so we see this race when the device is
resuming. But it's actually "mtd: rawnand: Simplify the locking" that
allows it to return -EBUSY, before that commit it would have waited for
the mtd device to resume.

Tested on a iMX6ULL.

[0]:
ef347c0cfd61 ("mtd: rawnand: gpmi: Implement exec_op")

Fixes: 013e6292aaf5 ("mtd: rawnand: Simplify the locking")
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

I did this a RFC as we probably will need to remove the suspended
variable as it's kinda made obsolute by this change.
Should we introduce a new mutex? Or maybe a spin_lock?

 drivers/mtd/nand/raw/nand_base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 3d6c6e880520..0ea343404cac 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4567,7 +4567,6 @@ static int nand_suspend(struct mtd_info *mtd)
 		ret = chip->ops.suspend(chip);
 	if (!ret)
 		chip->suspended = 1;
-	mutex_unlock(&chip->lock);
 
 	return ret;
 }
@@ -4580,7 +4579,6 @@ static void nand_resume(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
-	mutex_lock(&chip->lock);
 	if (chip->suspended) {
 		if (chip->ops.resume)
 			chip->ops.resume(chip);
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
