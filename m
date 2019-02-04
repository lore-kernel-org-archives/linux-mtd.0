Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6506EC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362C620815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M93BXlSo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="Bk6OyxFL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362C620815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l1oXBMzfMvtN47bWC8rprg2UPlADxMO0i/jpa+y50e8=; b=M93BXlSokhMORuMICMo9+o35jJ
	gLFU588ONyhx6DTP7le+2Pf09YeaPTgyomMjgbwXWMvX2owDpEzXjBNVVq7V4j9YONGD/QKjRq/5r
	g/ftNsJ+ecZrhC1kAbAnyUYgvnS6IHQQIbl/nt2btPke+azSrY8A2uwTxAGgmvxacaCimZRgpfYjv
	NgvbHVFP97rH675ewSgEI9+LyLky8o0H1axhWGPj0/VZWQdhGmXcu66ZXSpwBOINijVG3rVwX95jG
	dDoovmHpCBkIEJpdkMaQJGjfVFd8soLI5jBBrvzPWULIN52i+Wc1Xifi1ocFwMmC+JX22A8gp09Wo
	l6QmACgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiBp-0003OL-71; Mon, 04 Feb 2019 17:37:49 +0000
Received: from nh601-vm13.bullet.mail.ssk.yahoo.co.jp ([182.22.90.22])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAk-0002Pt-Qu
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:47 +0000
Received: from [182.22.66.104] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
Received: from [182.22.91.130] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
Received: from [127.0.0.1] by omp603.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:39 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 836437.67636.bm@omp603.mail.ssk.yahoo.co.jp
Received: (qmail 78141 invoked by alias); 4 Feb 2019 17:36:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301799; bh=DH6qiNYxrEx+VUpnP7rBZp4v0I5VNBzIjzt3L/Ng0u4=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Bk6OyxFL0Acu3KIVn6YWYShe6wyNtWuuAXbv/ZQ9wxrZfUCZb5mp1oVZU4dsQSBxQUkDLdW7S3TWfra/QIbsSr5jc1vOwdJQ5QBS2POe7oDmMnC7+nCP8zI1AnVn96QLbDSHyDoGMY/dlxCVx0h4Z9+ScfzRhbeFxZPM3sC5uWY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ADCZ41lEr/CFSpvq8vGVt6W9z+4+nZLPYtAcC14wxYu8xUjVYX1B+qrtETEGCvJ8/fcn2+gcG/xFerfKAeqqOune5yKPYlFe+JAqomarkRD2+k2QFJFGBU1N0rLWwlIyPEYuQPDXEX66g2GyhYJFPAYbFujsYhuqNoM43gOk1VE=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:39 -0000
X-YMail-JAS: idGjBp0VM1kLhlNCxVLK0vb5RUbiDm9d_rVe96_aTBC3gyk4krrA2N.c2a7P09kDVyCmhZqYyqTqB8d4uS.c23l9oxUIVAZTVWHWebh0YKJfV3msI00tFlZZKW53CuquawAZk1vAZg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: IuwPR2sVM1nVlTEbol_CtP4eaBdo_NF__fk12wCbdg2lkJQ
 HbGAALY0LooPNuz0qkIZEMygspmQCgN7TdUW8w3JdWbpshpHADPvvVoNCbjR
 QruZ7Q3_uoWLzPUsV17Jb7CVodYARxG44wbea4Up6n5KkHfdHSyimbTHV6do
 7hVDtVwrKKIKDR9f8DtGlMOu56zu6HqXuhtLu4ujGOorrgQMQWPPXRA.swVd
 BrQL0Zfzvz8alNE8aKumEL99pxF19kfIp.DeS4Ri5HaeQZlWpWCc.IORau6X
 tuUN9h2hS4MnoIFor4ncf6Q0PzHSwSxy2Az4FOs8qzxc0M_hgG4m0s7xUnqr
 vpYWW1woVL66SWq4wT3yi6aTjnrLw6eV8ojSUz9zzgKvweskQcQbx.DXmzoC
 iEK1lncJhiH.OuPMrpyrdqLjEJksk0GppMT8Z0CV0HgCoTWkHtkCV47Vrms8
 cvewfU05F8ObKvjnUYdbQ2kfb0MJc.zi04xStk5vK1f.Rw8.EzgNN9shsBE1
 LQupVi0i5DSQnSATfH49bguJDa_tZj86u97EI9WsSrEfJUUyllnBTOwTWixF
 YYUG70uV0OVsDvT5hx4ucvXYGZ6gHcEShxJYxlq4eHwJJhWQY
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 01/11] mtd: cfi_cmdset_0002: Use chip_good() to retry in
 do_write_oneword()
Date: Tue,  5 Feb 2019 02:35:40 +0900
Message-Id: <20190204173550.29703-2-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093643_166630_8E61DB81 
X-CRM114-Status: GOOD (  19.76  )
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
