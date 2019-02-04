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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7287FC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44EB42082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rksqObf0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="TvqMMk5h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44EB42082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NOXmu14kpQa3w0ScHir2muuRVnbBJNosVDy3OdNe3zI=; b=rksqObf0DS0D2NHsRGavSi8uQs
	Db6KxDT7IgGa5zHZbLqgN137iQs8q9FEnDA4603/x4XRtAoiI/Q4RqVBeiq/Y5c3xh4cU++TzRIh0
	8jo+FJLKcfmWTjKbTi+7abyH1pqogxDyzGmpnoHyB75zsuTnFEFB9fkGJI50Yyu+MzjV/yc9bduow
	fAhSIZoStsriTiSzOCTqUxyDQuSebCb2aacP73hUNCj5kxOmt3Uv8Q291li3nywerTrl/r3tCBjGd
	9zAx3bNKHHh2IbtDoltLeUL2gzUO0UF/itOb8CQKnYZlaGHY4TOj0AuDUl4RmD28liS1eNqMhXkRI
	OED982QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqir5-0005xM-1M; Mon, 04 Feb 2019 18:20:27 +0000
Received: from nh502-vm9.bullet.mail.kks.yahoo.co.jp ([183.79.56.154])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqp-0005j1-Ix
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:13 +0000
Received: from [183.79.100.138] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:20:10 -0000
Received: from [183.79.100.135] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [127.0.0.1] by omp504.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 12197.72111.bm@omp504.mail.kks.yahoo.co.jp
Received: (qmail 41983 invoked by alias); 4 Feb 2019 18:20:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304409; bh=cT/RzRsMc7GjixAZ+Fvp5ZUAth/zmhgBWQjnxnm4Uso=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=TvqMMk5hJZ99pLwS04/7U/vMLJ7vDpifps3Db6eEibVD+IWfJ80VUsH6XAlvpTJSCNDfV5nQdAYBBxkeLndAcumloN1KzOQ1RkONR/mAIZBVAlBdq7zxR5IBsxA2RDyFsacPhKCtfItovQ2nFZ5RC56MWRRY4lPumG6Ke3MaXgg=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=rztYiipjeBzP+8NIWyHG5GsSIBPqipaAWACwLajbyj5N07qIw8lTIvCSBK9hhSrR82NYwZMA8gTqOVmK0iTWYh+dG3SpEs9V6qKrQVonNSdPhDlesNMWciE19GDXRCznL/U4mkn0yYwoiggkGMANQKFl0JJLvV/5BUbVId7stjw=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:09 -0000
X-YMail-JAS: XsW4XckVM1klhOHepx7XMRmikxvgtfEt6CThK2ouEuIDbuRXKm3GjF7mVaJkwUaw8C1j2MhGcpoK4ynwOdZsAClSckPoxGsn2AFEO1BOhUmcj0JNQ_Pv.MHDgvTErmqfH9mP0rvb8w--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: bPuSYFYVM1kO0huKJsPSJLj5XvYAAwTfYY0rWdy_RsxH13L
 XmJ7Aoea4TVWGsa8h54jCg7CMHtFauQaDwj9Hx1BGfX71ZuU3HRAFtHJhsEe
 tIc8nuh_ymRzBgbtI3ng0xRnWrn_P6QisYFQP1T4EEdFQZaIe7lwvZDtUJ7v
 zbQ_pcv_dp9oH6qH59xPD63bnvjUYl2IfaS.Iyxbyd_tWwL9gQrGgiqCIfdT
 _I36pc3HuMBySgaD15tCLfGg5nfgsY44HQLT5s5unkjvfOtXQIjX9InqitDZ
 YVgoYp2XyyadjZCSICP.pNh8tl1aU7947hg_lHDaUCKBHgK9TyE0EBUombmi
 DyEWZkLWS1zfSyQf0TjIQZ81pNamcnIy_8u3zkFYTnHWOBQ8R6veJU.bhSTt
 6ukerH9ehXUX.W5Pr6NIOCRl3eqbLn5GH9AulMNWaI9HBElmXVpnE_NLbFTu
 hYRrRWpkO9GVx9q6d2.A4peBG6swjqtVEQOAzIni9GtfTu2hZFchxgBV82nN
 .Peps7n0wd.ewk8d59PGNxMG3DL9Of5gAb2DsVMMxGL2JUlQLKryzqXkqJd2
 yI6ae6Yqha7yJsvNySCaL4MVnwN2AQmGQhgj.E.HCPhdjVN5I
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Tue,  5 Feb 2019 03:19:54 +0900
Message-Id: <20190204182004.29894-2-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102011_887060_4049825C 
X-CRM114-Status: GOOD (  19.64  )
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
