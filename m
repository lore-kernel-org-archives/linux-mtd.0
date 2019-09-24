Return-Path: <SRS0=X2Oj=XT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E94C432C1
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 06:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C6C6214D9
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2019 06:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d1wj736W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KdtBPpA/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C6C6214D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=po8zeu4RDGf4HZEsndro7QR3jTZEe3vlBN0c5J0TMEk=; b=d1wj736WYPP8Q/
	1iHrC59hu3vS8pD5BoEp2qmYXcELKS8bn8KsOpcU0hnJq/HQvHGilR4wLrwynofP7tBQeSq/zrsp8
	l9OfECt3eQoMmGft5GDuzPgN9mnIDDEPxkQCY5R3jcqj/YJigO9/GFN4ddhxM98q4wwzb0mWVnhwg
	SBpyCFYsgLV+v6UzF749GpyInxWShVlW6iceHLlT8SCf/S769vbwBqq6uAqupQ2GZpSuffDx0ibS7
	x/ymkyGyDk35Xb+hplGhnVvRTvhlwoEh5BfWSEgBHSVLn2rw2h2utLm8LySXWvDQypHMpTQiW6St8
	kiTOTp8fi2QM6AJWRFQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCecx-0003wn-RU; Tue, 24 Sep 2019 06:48:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCecv-0003wF-0n
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2019 06:48:47 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6299B2146E;
 Tue, 24 Sep 2019 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569307723;
 bh=2DjnDmpMwbnsg6BNHmEbYQhyGbKPIDucd9FLYyr21ZY=;
 h=Subject:To:Cc:From:Date:From;
 b=KdtBPpA/2VIFHr4c5qQM56xrnbo/Mg4gcHKSfpTpHO86usW0bpUmy3NpTUgM587mj
 G5GEWNuIkzqox5tG7xsZEBrZ7JsAyYc0gQ9SJTNT27cYk+zwR6oAbkhhyO85dPYTZv
 hqygN2JCfgLlwcHjoMUOPrndg+K//c/tQo2VVVTM=
Subject: Patch "mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()" has been added to the 5.3-stable tree
To: Joakim.Tjernlund@infinera.com, chris.packham@alliedtelesis.co.nz,
 fbettoni@gmail.com, gregkh@linuxfoundation.org, hauke@hauke-m.de,
 ikegami.t@gmail.com, linux-mtd@lists.infradead.org, nbd@nbd.name,
 vigneshr@ti.com
From: <gregkh@linuxfoundation.org>
Date: Tue, 24 Sep 2019 08:48:24 +0200
Message-ID: <156930770424770@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_234845_100948_ACF835AA 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()

to the 5.3-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mtd-cfi_cmdset_0002-use-chip_good-to-retry-in-do_write_oneword.patch
and it can be found in the queue-5.3 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 37c673ade35c707d50583b5b25091ff8ebdeafd7 Mon Sep 17 00:00:00 2001
From: Tokunori Ikegami <ikegami.t@gmail.com>
Date: Tue, 6 Aug 2019 04:03:18 +0900
Subject: mtd: cfi_cmdset_0002: Use chip_good() to retry in do_write_oneword()

From: Tokunori Ikegami <ikegami.t@gmail.com>

commit 37c673ade35c707d50583b5b25091ff8ebdeafd7 upstream.

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/mtd/chips/cfi_cmdset_0002.c |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1717,31 +1717,37 @@ static int __xipram do_write_oneword(str
 			continue;
 		}
 
+		/*
+		 * We check "time_after" and "!chip_good" before checking
+		 * "chip_good" to avoid the failure due to scheduling.
+		 */
 		if (time_after(jiffies, timeo) &&
-		    !chip_ready(map, chip, adr)) {
+		    !chip_good(map, chip, adr, datum)) {
 			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
 			xip_disable(map, chip, adr);
+			ret = -EIO;
 			break;
 		}
 
-		if (chip_ready(map, chip, adr))
+		if (chip_good(map, chip, adr, datum))
 			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
+
 	/* Did we succeed? */
-	if (!chip_good(map, chip, adr, datum)) {
+	if (ret) {
 		/* reset on all failures. */
 		cfi_check_err_status(map, chip, adr);
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


Patches currently in stable-queue which might be from ikegami.t@gmail.com are

queue-5.3/mtd-cfi_cmdset_0002-use-chip_good-to-retry-in-do_write_oneword.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
