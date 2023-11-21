Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B66C54FB9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 12:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V/YSC9bJAXBkr71n0SsEAe6Sps9ukJYksTz2Ows3HE0=; b=eKjzglWbE3D+2x
	S4gtlyjiEyYDZouXnVkWILvgXsA4vntznUono9K34wepFelKi4FFtfhFAGPrI5fCjLCM5GEJV6Wbz
	wPkAeXqV40LaJc0P0Y9t3e7qO3AMN+bgxxRXSgPdgDngz6FuI3fRqiikihlGMMP8TdZY7o9b0+vxZ
	NIgTc6kE6hLF0P08hIGwTeEDlSrttt+N7vZ8RnfRXHYZi8RqZsFePVb/1HmYWH9J/dy5xhpHIzcEQ
	qOw3kBvOa69RFYBxglY3Kq/0h+kUdNCY0/vMo0GeDZ/46y4TfeNQ850KG6mcoqM5LBJAh4ZqmFPiy
	sAQLm82dUpWuGxEsMGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PlL-00GhHf-1F;
	Tue, 21 Nov 2023 12:21:55 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PlH-00GhFk-0Q
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 12:21:53 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D88D0FF;
	Tue, 21 Nov 2023 13:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700569308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XSaIh//1sW1Qx0Np8mxXzMKxe+O/bN1APeOE5rVVzyc=;
	b=dnXxHEcGFhRvcTCNfw3wnBfk0AH9scicWO8sMX+6CX4PDdoWLZYd29XOzjgV0xSd1UFOGL
	JEkcjjqgE+PJMAS6VBMDGg4vqqugHDAx9wlWMvHTSHYY8f+aBT1wugIK8mmS+hqOCgpAVh
	tBuNzmVoYEv92bgI4AZhrgWj6L6MElTLCg0sPz0bB+WoaVFi2FyMyaKOT5kWKp7CMyztP7
	tazZbGJtFLzJGCZIGBQrw4MU4mSNwJMY5biKcqXEhNN4ufT6um5JP7ajouX3PDw5rEfatD
	/zRrA3BcSfnnxuE4TRu1exlnI6yymFB7eCZePkac+u7UO0UwQGcNyO6sAV7SdQ==
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] MAINTAINERS: spi-nor: add myself as maintainer
Date: Tue, 21 Nov 2023 13:21:34 +0100
Message-Id: <20231121122134.1952738-1-michael@walle.cc>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_042151_324776_04F16779 
X-CRM114-Status: GOOD (  10.22  )
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

After being a reviewer for a while, add myself as a maintainer for the
spi-nor subsystem.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e55173ae5e39..64dbd84fc324 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20430,7 +20430,7 @@ F:	drivers/pinctrl/spear/
 SPI NOR SUBSYSTEM
 M:	Tudor Ambarus <tudor.ambarus@linaro.org>
 M:	Pratyush Yadav <pratyush@kernel.org>
-R:	Michael Walle <michael@walle.cc>
+M:	Michael Walle <michael@walle.cc>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 W:	http://www.linux-mtd.infradead.org/
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
