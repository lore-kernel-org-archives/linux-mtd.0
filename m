Return-Path: <SRS0=TNJo=XS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63645C3A5A2
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:34:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3689A206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nngeu8ml";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7vN0mah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3689A206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=595u0DN1vv9X2hc83VirvYLlXn/exLRc3JHx8THqD9k=; b=nng
	eu8ml2VYanow1eC11HeRWMYsFCfyoxfz9DHqmWsI4um7/QfjVQQUb3BfMOfOv4SdKaV92s+By2fbB
	UiTjKPSclXDtC/cwTCFa7hHY9asZUCPobjkWv2teiAyCB+2ybU7pldr7Tc0G+7FzjMnGjkr4CNICK
	YIqip4P+f6X0bNS2gcR+IwOpEK8kdzplhnore2j8NY+tZ3D6Lsba861OSaykgpO31HE/9KX8j1TAp
	eEg7SWxX8q4byNxy86T+/VS0Ix5dS38CKzMwwkDCt6+qJ5JpEon0IrCK2v4sn98eQHp6DSgYi+Syo
	doVuPD+QGYWEAa4YMkblwEU13OURp/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCEB0-0001Eg-Gg; Mon, 23 Sep 2019 02:34:10 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCEAv-0001B9-Rg
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 02:34:08 +0000
Received: by mail-pg1-x543.google.com with SMTP id a3so7102490pgm.13
 for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2019 19:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=olfyRzbV8M+cZYIlrHmiKQMFSiGHjLyePCXwy/Ik6xI=;
 b=A7vN0mahL+iuOHpzHbGW4MXq1bsSSuAw8pWF+ah/HlvNRK9mWyQtxNUX0k+jZykDg2
 s/VPUxLUBcVJGE67k2UH1qgP1pyVFiEeQ/tZ5As7jfEvRag9FGwt0/RCvs69mhyzWJi3
 I5o8D4cW86dIY5cEATjk1xvnO6uuixF2jccioi19t2BuHSLa4BtyQ4DEPKfVEhmCOMHH
 q9PNTPCj8Or/wvPoAigQr229POnBohZLTMKR3+DaAVglVTwhlXzntyPIZEV5cZl/90pN
 T4M9CPghGm2amRXu18bX1h2DsiHwHvDe6kpyfxIdRVHewtG5l4LMuNzZ/gk0zAYmAI6v
 LyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=olfyRzbV8M+cZYIlrHmiKQMFSiGHjLyePCXwy/Ik6xI=;
 b=MzD0kxn4OgEboXp6BGMNih72GaGRAv6zX6t81stORdjtDS3zGMbOKyothi+8PvLtgj
 /mRP/laGrt/PVHOu1vx4ilLfjMnDpjqTVVW2DATWyT8IuqhcuDs07jjE0OkkHqMndPcI
 9+dkhfRSKupZqVJgyZGK1oVzeoivb6Wjd7/gZjxM9/bs6KBLdS3sec5g+Ymg+ONSLxI3
 fNcAwVznWZY6Kz4ZtGUqN7vKRwsBCq8/iq2wu4fjgUZWj6rvu1NtcZPmUz3DkVGCgIM1
 nRyU2QiKaWb5Wt1GyvwqUdcNcooUH5+TrgBYP8m9FO2vvCWI200oDy71G7uDQRabE5ry
 6RjQ==
X-Gm-Message-State: APjAAAXCY+nHutsxykDP/K5lptFgqoVPNho9vnYX7Bv5Ecc+UyAYnBON
 85OlGSdBkYd2UJQiSs3ZaN8=
X-Google-Smtp-Source: APXvYqyZm+iC57DXxob5AOei7j/ZUAQTRFyi21kwj/khROFMBah9Chtg618Lzz6LLLc5+ax5cClYjw==
X-Received: by 2002:a63:1009:: with SMTP id f9mr4787691pgl.124.1569206044921; 
 Sun, 22 Sep 2019 19:34:04 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id s7sm8697403pjr.23.2019.09.22.19.34.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Sep 2019 19:34:04 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Greg KH <greg@kroah.com>
Subject: [PATCH for 4.14.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Mon, 23 Sep 2019 11:33:58 +0900
Message-Id: <20190923023358.20279-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_193406_788289_427EBB38 
X-CRM114-Status: GOOD (  16.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

As reported by the OpenWRT team, write requests sometimes fail on some
platforms.
Currently to check the state chip_ready() is used correctly as described by
the flash memory S29GL256P11TFI01 datasheet.
Also chip_good() is used to check if the write is succeeded and it was
implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
checking").
But actually the write failure is caused on some platforms and also it can
be fixed by using chip_good() to check the state and retry instead.
Also it seems that it is caused after repeated about 1,000 times to retry
the write one word with the reset command.
By using chip_good() to check the state to be done it can be reduced the
retry with reset.
It is depended on the actual flash chip behavior so the root cause is
unknown.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
[vigneshr@ti.com: Fix a checkpatch warning]
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index af3d207c9cc4..e773dc6fdd3c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1628,29 +1628,35 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		/*
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_good(map, adr, datum))
 			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
 	/* Did we succeed? */
-	if (!chip_good(map, adr, datum)) {
+	if (ret) {
 		/* reset on all failures. */
 		map_write( map, CMD(0xF0), chip->start );
 		/* FIXME - should have reset delay before continuing */
 
-		if (++retry_cnt <= MAX_RETRIES)
+		if (++retry_cnt <= MAX_RETRIES) {
+			ret = 0;
 			goto retry;
-
-		ret = -EIO;
+		}
 	}
 	xip_enable(map, chip, adr);
  op_done:
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
