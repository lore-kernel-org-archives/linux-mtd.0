Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C107C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A51C2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EXVxUCZr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="nowuFcCC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A51C2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hdVw3jpy4VueZhNHOXQRWlAmUYM4mJrwvnQ+ztfHGS8=; b=EXVxUCZrZCcyqw/FZucvgBTnGq
	92yg9J6u5honCd5xIkpC9lMahAYlQyPJVuCG+XbpAczq+brrk4NZsIEqJSmXLjGyWp01dpbe0GVbT
	t2/yJ0BMXdgyxS3C75KCbfaTLM05R3qSZzVpLCF3gSoOhwQJstYlFceOKI/bbnTmdXL2I0odDnsIB
	IMVjLlgmHpmdwLlf0NniaQMPXL8AcguPDi4eovhdNQMBT9OzhgNbaZlQoimi8ZIzTb3XfV7g+XH0r
	SxZpWN4I6k7h6lxgdGsUlQt6oifBSGibWQZkVzPVyPB47zVlHofc0f4iZIxndhc4QNiDU8u1joOHE
	AcIQL5pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1Q1-0007Oh-A1; Tue, 05 Feb 2019 14:09:45 +0000
Received: from nh503-vm6.bullet.mail.kks.yahoo.co.jp ([183.79.56.192])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PI-0006lQ-Hf
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:04 +0000
Received: from [183.79.100.141] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:54 -0000
Received: from [183.79.101.121] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:54 -0000
Received: from [127.0.0.1] by omp508.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:54 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 668476.79500.bm@omp508.mail.kks.yahoo.co.jp
Received: (qmail 45573 invoked by alias); 5 Feb 2019 14:08:54 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375734; bh=g8IUWPIVI8+eqErM+hfdHVesTIIEB5FfIE0lfM1MJ0E=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=nowuFcCCXoCgqp0FMiLrNYsqw6sMGiM4nVE2VQIthwl62G0XJAd1vmpXhdVc9OgPcg2LgcmIDS4pfu+aCNpd9ft5p4AK2eoxobFouBANX6dp28oLMxfEYhSRLPUAivInzr+Ob5OuqXe/sn5Tb+uhlh54siyAxPzT7Ys/ZC+a1Jo=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=TTjVw8DbVB1IydiUf0hkUIisYLVqgWHH2YmiA7wK/4zP5IXfhJwkkSyL1wY4DT1uMMtL8AI/NqsL1a3avtYxZDclnxFHnbumtxE3tgC942Bl74h769wFhV/a80H+wz+WJrVJuVwky4vNoJIR4VweghP/q9/9IQOa39JAnGiOvY0=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:54 -0000
X-YMail-JAS: yAzcHXUVM1l70vaPPPJiRSARrqFb_dkGKnmGHVREExTUoigRLv5SmqdsCLNXY1tE2NBOTSsDJNGwNgN7XT5.sSMqRRsDo4wK3uCONcoc.pSzxFD9.zOHEmIjpnmyq8lKW7munmR1bg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: zJMWKLUVM1nCu.79pH0x_R75vtSm7DELz_a8L2fg8DCLM2_
 4SPohL4OHOjm35tqFAQ3L1c15s3ltt4FvsfJhWB6lPhhMBIqlFo3e.rw5SmG
 Y3DjBuj492PuxR8UZHbJHe8L2BaFJebJP1cfeEO6q.c45S48MQVsucE00QCZ
 qBB.7bbEKuPinztkQKq.bIu3pM9pvikCHNYTOpIVI1Y2SHTjretSimu6QCqN
 vNI6La62DiGDnBMMrOp74FnKU.RMBdtrnDsFyYJE2mf.SWHWsQSrKf8bjGuK
 dl3P4NHXJ5wi5z7lzZnxRINcRvO..NyQKoszfg997dDiqyWpmEzLfogknUsI
 meM8hgjuwP4osZG84ATg8UvqqjN961ZBd1tXGZjBdMZZ_BfoHEK18bXjM26G
 _49g_4XBXN7H0LCqAPzZp.PGeGVMRdoLagZSWpUl2sSaXAlZ3rONKo5KfEDK
 z7baeVVAC1ZLBaXiJADFfrL5y607jZof7u9dpP1REnDpe3zAOH4ngAfT2ohn
 bIcnw5zuNSoJNVgfQLRLAmBBcIThLSl7n_AcoR1C5skTffU.L155AXqBeYUs
 ee1HkOVz2jhNvNm3z6D5l50fJmHoS1bwtxYjmN1njkbYqDE7t
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Tue,  5 Feb 2019 23:07:49 +0900
Message-Id: <20190205140759.2360-2-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060900_920266_705879AA 
X-CRM114-Status: GOOD (  20.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Felix Fietkau <nbd@nbd.name>
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

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Co-Developed-by: Hauke Mehrtens <hauke@hauke-m.de>
Co-Developed-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
Reported-by: Fabio Bettoni <fbettoni@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
Changes since v4:
- None.

Changes since v3:
- Update the commit message for the comments.
- Drop the addition of blanks lines around xip_enable().
- Delete unnecessary setting the ret variable to -EIO.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just update the commit message for the comment.

Changes since v1:
- Just update the commit message.

Background:
This is required for OpenWrt Project to result the flash write issue as
below patche.
<https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>

Also the original patch in OpenWRT is below.
<https://github.com/openwrt/openwrt/blob/v18.06.0/target/linux/ar71xx/patches-4.9/403-mtd_fix_cfi_cmdset_0002_status_check.patch>

The reason to use chip_good() is that just actually fix the issue.
And also in the past I had fixed the erase function also as same way by the
patch below.
  <https://patchwork.ozlabs.org/patch/922656/>
    Note: The reason for the patch for erase is same.

In my understanding the chip_ready() is just checked the value twice from
flash.
So I think that sometimes incorrect value is read twice and it is depended
on the flash device behavior but not sure..

So change to use chip_good() instead of chip_ready().

 drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
old mode 100644
new mode 100755
index 72428b6..91a491b
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1627,29 +1627,31 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr)){
+		if (chip_good(map, adr, datum))
+			break;
+
+		if (time_after(jiffies, timeo)){
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, adr))
-			break;
-
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
