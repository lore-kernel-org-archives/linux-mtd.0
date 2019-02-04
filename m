Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF82CC282CB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8262E2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eApw+lah";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="bpydIt9j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8262E2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l1oXBMzfMvtN47bWC8rprg2UPlADxMO0i/jpa+y50e8=; b=eApw+lahgyhDrOLfpPUKlnK/nY
	9joghZ18KWIADTBBaMXw9g8yPHNmqgdDcBig5363KM7PDDOiqAsuTGGcMX49D3FwV6wOzoU93eoZM
	Eys2gMNggCwgZruUuNqe+W7LvpaQcfMZO55gD/ZgCZo+WombJgGRK1JYd7JgOPNPkwsyTQa6sykF+
	/J9Hm0GbD4CU09h26S2njr+iTQytys3sAMdzuuvrZaohhKwQvZXFL7O9eB5vOyVFkUW+ggtpEonX8
	1KsduOW43NJaRpbauOafTMl9/BUSzxwbgxmLLAZY2mKIjTNQyBpbualPbNNscIQO9A/n/UoOkcuol
	3EmE55ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqimP-0001j6-3h; Mon, 04 Feb 2019 18:15:37 +0000
Received: from nh504-vm11.bullet.mail.kks.yahoo.co.jp ([183.79.57.97])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqim9-0001W6-DP
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:24 +0000
Received: from [183.79.100.141] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:18 -0000
Received: from [183.79.100.136] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
Received: from [127.0.0.1] by omp505.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:18 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 642916.3392.bm@omp505.mail.kks.yahoo.co.jp
Received: (qmail 96972 invoked by alias); 4 Feb 2019 18:15:18 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304118; bh=DH6qiNYxrEx+VUpnP7rBZp4v0I5VNBzIjzt3L/Ng0u4=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=bpydIt9jF6qUUF/WeI/92fXskUKaaHO2kN1OJa9PywP789gNwOeR8jtyLg59LHkSyt3t6isWit0Vi6VXWbPK8Xson7kV5oJExgv/UBUwveUgO/FDusnZJY8NQl/byheH3R04OTdUhCD8LtN/7bccJo/GYsWREvsSB68DrmhyK58=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=tRpxSHtdwof9V7skCup/j1q9d/2Oww9vHHWJFHgXOv+oK35fw4lYBQINMmDtR0P/0enUQAMUwZWqffL7N9TMs9XYfWUtPJz04EEqLtJySYajwScMzJS3L77N5DYUaZTzvRL1FYGsy5Y3eF1MsB3K0fTk7zclw+NI/BmRm6py6AQ=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:18 -0000
X-YMail-JAS: SxUIEoEVM1kg.X1K7qTcT_HMhgZoIs7r6OzRa95lDEVIPy0a4H7eHvxmgyg4Pp4vaMMaukzpTSVBm5FQY9J3kiNxRMoExvpU2QWoVjKk4p8bvA9yQiL3QXub_5yJEdFKeJ3ERf.scw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 9MerlrQVM1lQ9UJX3fJ656wcMfziw2X_SgHuVdIqfIYik2W
 tFuD7flBgxZuzkCwrlr_6oJLVGuubYFF0g5QpudZRwGkSsAA7w5V9RR.C0K_
 m7houIsE9tLvsxG3jm7uiZb7aLj28kZTm4N8X.LHgAMzNT_tvO3WGM5dL_vZ
 8Qfa4N3errCZWJ0gUbvnDxeuq1C9ahVlgzBGNXQwkir4jKXRQVETU1MO_Qgg
 vfYxQ1nSAos7Nq0bTL59ohflDs9bGA0oNsIPDpKM32cEGtVg.amFHZX8IecW
 nWRdnUaoDUH7kf7peXqB1bZIsBWxReW5e_21tLQEF8tP_Wf5qYd.RQAhxx7B
 H8RPcRY_uNmpMCi_cJ49qCwo0mupIhMCjM2M9dinkeT6I9OfnUURev2TNibk
 TG1LooxZMRT65CDKoaS29VSYdo91fi7LyWXJ7y9onfKsiu9kv1BFuXscUwe1
 nS82BwSs1bvsPTsnobpgh4bXiJeeJTv3D89A0vEOnnAdGPADOcmhJdsuoYzE
 NDGtaaHwLrClOQy4cdWpCCt34.6xhTCPdDKmJsaPdeR4AerlUkHdp2lco4.S
 2s2WAebt7Hp.xU.hUa64sfDRe6ZCmZDv1F3_zBn3VAc7UcqaW
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Tue,  5 Feb 2019 03:14:55 +0900
Message-Id: <20190204181505.29841-2-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101521_855972_DDF64D9C 
X-CRM114-Status: GOOD (  20.06  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org
---
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
