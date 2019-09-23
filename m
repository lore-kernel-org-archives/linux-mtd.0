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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1878FC3A5A6
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:33:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFBE6206C2
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 02:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xo1qQzKx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIPSxSGS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFBE6206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=c0PkwkjOPoGa+9NZaxeqaDmnNMRnTVDMekHx8n0GWTQ=; b=Xo1
	qQzKxpq3vHBzaYC+v+03eUbF1ujRaHzU98xKlWrttlB/nX+hVYaTzGDSKTY6OHc1cVX18pfUQlM5M
	dPrH+KCAErrisqH0NMsQS2Eea5ZaxCf6v1Z5+lch5WGsf0zgTrCBgXXQ/vwBoPf3gKjfh/nnIF7K/
	Vg2lhy4Zj7ZLCwoJeGU7nx0hLXuz2R7/vky1vzX+VchbudrfQTKZOs1khHkGOs0sIDB5u4FEkrjdF
	nG8XKI1M7ymf7KYZfACWMjf1CJdrAKV/T5cxvEgI/HfYPHLZSLJ+6l8O5tXTLQl2um4H+DHG+tuou
	64eo3wjYxtQQhNmG34vCV8J+KYAMdMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCEA0-0000ZT-LC; Mon, 23 Sep 2019 02:33:08 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCE9w-0000Yj-Gj
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 02:33:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id s17so4378694plp.6
 for <linux-mtd@lists.infradead.org>; Sun, 22 Sep 2019 19:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xoixj4WcbUR0QNe9dzuhd7SQ9clDGmTGtv+vABF9xr0=;
 b=RIPSxSGSGr8c2+Ai8oYcf6JV+2cV2Sba4bfL27UX/yYxkBma4CYhLdhEo8OgS3miLy
 OcKQzqumi8HPqvbe/rIZbshBtKk8chNvXrCUGDsv/X1xzi1LQZQY2eqmHxhN4hIi2o6j
 K64eB2+ALesrLwfUa3jB5Ew18maNMSo04BzvdEjc6wDlYrdpthFkqbTCejoPz2W2IxKp
 VaXeJRcVbsTjNsit+8AEvt1YJSQzE7tYWjKAt9F8bhmQ6I8PoMLj4ABar4Kt90CprtoV
 JUc6/+vtZ9eeytCYvJl5ZlTO817z/Xym8iBJUk8kL6/Qkmiav5naJwuWzFXtSt+s2o1X
 Am7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xoixj4WcbUR0QNe9dzuhd7SQ9clDGmTGtv+vABF9xr0=;
 b=oK7/hxRiV9/R6hq6wZTfMPRzUjMMeE3GM8Q7hXu+mvzzBk6t/FVFaeQ9Bbwx5uaxkP
 056d3Yk0yE/67xE2Q8iEWjAnCpd2dBDuR0lzcn79xfKnx73275JTZ/IwmqNXqcgnH6L5
 TLNNgD6MYpMWRQpdWHj3eV4G4NKXvZWB9ZCwFeaQ6rbFFj0/SLUm36ONItbv2GkqzcGO
 0tT72LqAb1UNxKf/hyLYTTKUPghI94WPk8acr04fYdIROdkgZt02tNSjKKLnroslY57r
 29A9WCkTS5xoMTiFOli7EIWRPiVq+Pq04qkqM88rMsOb7i5aXFwxZIfaQMvir5EWVstm
 Fq2w==
X-Gm-Message-State: APjAAAUneaodRakJnN18iL90j7eWpBf9FTIKZ5WWVV7wY7AgsrjMu3Ou
 Vk4U86n5lonA6DYNKpEC2cQ=
X-Google-Smtp-Source: APXvYqwA99vWR8wgnVNyo/j9SHbrLddwoCS/EfgFAC/OkckQuCpN7vOzu9zoj5wCWsl9vKXz0OKKHQ==
X-Received: by 2002:a17:902:a615:: with SMTP id
 u21mr28547709plq.4.1569205983038; 
 Sun, 22 Sep 2019 19:33:03 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o195sm13517299pfg.21.2019.09.22.19.33.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 Sep 2019 19:33:02 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Greg KH <greg@kroah.com>
Subject: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Mon, 23 Sep 2019 11:32:51 +0900
Message-Id: <20190923023251.20180-1-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190922_193304_585560_2DFA6FD0 
X-CRM114-Status: GOOD (  16.80  )
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
index c8fa5906bdf9..ed3e640eb03a 100644
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
 		map_write(map, CMD(0xF0), chip->start);
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
