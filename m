Return-Path: <SRS0=RMHD=KJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83C8C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 12:47:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79A07613AA
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 12:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79A07613AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TXpC+lyOBco9HfHrdsxmvcf4fc4Ed71WjGfiRWwd2/A=; b=Vk3VYT3xFYwjSjysTGvaFM2Rt/
	yhdKENP5fH7YJj3/dbkfRRJO1ca3GazVGRF7DVhqv5bVb2o/ZiOIeArK9BKujoCUDsF9lndIYZHE3
	1lZyXJzqaoEOvXM5Idvax4E+JvN5iZywG6xtCPPkN/l//dsNmJODi4WkA1V3XTc2dwCRa3Lunl0eE
	G6jHLdNxkqkNyPqjeAok+5RcFKvr6sB033iCUAzguThlKzUvVjYadgxWP4niUGy6SAfmIlUsxKD/Y
	9DvgCeZX8N0nug4hoK43EtVmms0XTryf2dM7yPQVoZO4zv47ZJ+0u4rtrlGqzwv5v33jMxm9diBZq
	l0LrGc5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhXCv-00848f-Vl; Fri, 14 May 2021 12:46:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXCt-00848Z-8M
 for linux-mtd@desiato.infradead.org; Fri, 14 May 2021 12:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=wj8yFuvdz6wX3h1KFrBZzeGfyq10Pzv0aY3aYB8oaU4=; b=prrgY9ahHjB8jxobY4vvKgMIQS
 6sadZHCaHvxzebcfjf+s4+vLkpuq1ddDvQ66n8P2YCHCBNrwFsX2UbG7aB87OejHTi4Xe9OlGvt93
 GN3/LnqixEUS6/Z6bWVn0rpnoyG9F91PygS30wiEDARuLjwmZ702kqQroQtASAyHk++MrFpDDR/J+
 NS2zYoD5m+FoAkQG3r4lR7WzJeb5Pn7T6rUZegtBG+ss1RRAgisZdpK5wey+0aqfGkevSkHNvqzIx
 RgCuvH7AWUVCuampC3tIIaPqjYIGjGfWKvGEbhSZiUT0hf4wuF+zBZHv8OjLlNniyMDPqVgkQtL7l
 3chPB29Q==;
Received: from m12-17.163.com ([220.181.12.17])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXC9-00BywX-82
 for linux-mtd@lists.infradead.org; Fri, 14 May 2021 12:46:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wj8yF
 uvdz6wX3h1KFrBZzeGfyq10Pzv0aY3aYB8oaU4=; b=PR045XLDgCmLFeiECnSts
 1xizUIttOIka/cUesR3qyevM3s+zHcQo5rVDUER3TITC/w+OBvazG7/NOoim51py
 Fo1yrqn57ELYFymS0Z9WYi9JLxCh5j8dVB+ixt4R4bGWcmAYck4WpKbuKQQBv8uF
 r/K1L01UiczLkQ/YdRBxiw=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowAB3f5_dcJ5gnMeM1A--.13288S2;
 Fri, 14 May 2021 20:45:18 +0800 (CST)
From: dingsenjie@163.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ding Senjie <dingsenjie@yulong.com>
Subject: [PATCH v3] mtd: devices: Remove superfluous "break"
Date: Fri, 14 May 2021 20:44:51 +0800
Message-Id: <20210514124451.20352-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowAB3f5_dcJ5gnMeM1A--.13288S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7f-PUUUUU
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/xtbBRRGSyFPALxMviwAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_054615_105260_4C1D0FA5 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Ding Senjie <dingsenjie@yulong.com>

Remove superfluous "break", as there is a "return" before it.

Signed-off-by: Ding Senjie <dingsenjie@yulong.com>
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
