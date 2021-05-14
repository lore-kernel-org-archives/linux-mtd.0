Return-Path: <SRS0=RMHD=KJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810B9C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 08:08:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A96161206
	for <linux-mtd@archiver.kernel.org>; Fri, 14 May 2021 08:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A96161206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqrs4ZrlPGaqAQu+IKVWDnRatS/uAGP2nzbJ1ZN74GU=; b=BDAlmnzwp6LL0b+sFj4f5RAGB4
	KpAkOzElPyQ8S3cYWMg+te39YMk0+qSkQKlXOtChHPH3+k12ykxZ3U3Kg04FWg4h9+HUm7rKsQ8VT
	aug8JMeNFWs2qWtGGm3C3Nz3FaZnDYixDsiQ38Kz2lV8K+Vvgy4dMaj8D3eWxKf3B0Rg6jgW9tsIx
	9Qv7eQBrJpJUWnjw8H39F3AP7rvltHbFJyIvYWWY52M8k54xUT0er7H/qJtQEDlwd/iVPDsKKuDrL
	LZcnDAZONaWS3C2FisI5xTR0MYYj2mLDIzX5O6tBJ5bfvuxr4ieXbw6FFF/A1K4QkD0NwII3OcHXE
	l3gIAj8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhSrP-007Rxg-Un; Fri, 14 May 2021 08:07:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSrM-007RxR-45
 for linux-mtd@desiato.infradead.org; Fri, 14 May 2021 08:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zYCG5CpxuiTgMWEA6okG6eEiJi2EYg+gmO5+2lhKN0k=; b=aXLJYgd+GN2NZ8HLHt7jeL2k8p
 ahE+9HpwuE5bKbS/TQKGT7OYL+Y6zkEoYH4wYyN1Puj0I+qG8hEh/w/chBzRThdscuYpr1sc+VClN
 Q91uuIVzLXg4v+DAwpW1YGK09EUC4ea9J6ZHdz0ljY0jck298yJb+K+yUNMqUsDm9w+gir9YPASs6
 gKmlnZeL1h65bPRyPp67SnPc2q9px0CBKvKKKevkbwfp1VdX/pM6OQ7J9IqtcaYUTcGYrww4cnCmL
 sed3a2w1sRK97WJISd3XL6mjEuKmr61Lb7i/8uPvYTsovg1aHgiNrwfYU+gtMMjBWJ2/QvEqGysMQ
 ussXj6pw==;
Received: from m12-18.163.com ([220.181.12.18])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSrJ-00Bnq0-CR
 for linux-mtd@lists.infradead.org; Fri, 14 May 2021 08:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zYCG5
 CpxuiTgMWEA6okG6eEiJi2EYg+gmO5+2lhKN0k=; b=fj/tOitB876jZaNX0NeO4
 I//mD66/7EikFIYwSAc9FVkMB6uqFxlxiqcDIrZA98VdR5Z0Sc9hJrTsuteVOZkg
 GAc0zHKYyRQeunFbswJKpvLQWRlb/YRbnJuaMMk74B9RhCLEGOWygPBdsu/pGXbq
 8Z8Qj6ff0bxuEDd94zk5p0=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp14 (Coremail) with SMTP id EsCowACHhcW+L55glSp1jQ--.18625S2;
 Fri, 14 May 2021 16:07:29 +0800 (CST)
From: dingsenjie@163.com
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH v2] mtd: devices: Remove superfluous "break"
Date: Fri, 14 May 2021 16:06:43 +0800
Message-Id: <20210514080643.21760-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EsCowACHhcW+L55glSp1jQ--.18625S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU78nYUUUUU
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/xtbBRQGSyFPALw2s9AAAs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_010745_773898_37CE0807 
X-CRM114-Status: GOOD (  10.19  )
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
