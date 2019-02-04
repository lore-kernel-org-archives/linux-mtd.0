Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C78AC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1128C20815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEwOCS2J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="W09fPoSQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1128C20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+EXJG++2Ev+mcf2h8F7/Srk0o1wxz/NvN295/VGLz50=; b=VEwOCS2JGs1Zk6sJF5YqlQflnP
	LVwNK+RBKXHp0E0669enl02Y3S0UVh2QUNEcPdTaS7w6lfCZ74Xu3vy0NwQBNWmyfsb3iKaf7vKTU
	hzipmI5IgPZmbOioEfil3eo5YJH9Zc1sLnYcch4yYczdCq9p4mbCTxMEtHtL24DNnNzX8NljkpVwb
	0Yr94Ry+JauKJZEdtDCcfQSbGbVhpfh0PFZDZFE/qOWh004Z6qa5P3Bg2UMK0pnz5D5aMnDwvt1Fv
	pqyKWPMFYLaCJA9E+ax+2gKd5zOxmqdWIUNkFzu4t9Z6k80VkYIrBEURSicRagSrzjMWa+VhOYqKp
	Yu0iiNmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiBJ-0002vf-Ub; Mon, 04 Feb 2019 17:37:17 +0000
Received: from nh504-vm0.bullet.mail.kks.yahoo.co.jp ([183.79.57.86])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAm-0002Pr-9F
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:47 +0000
Received: from [183.79.100.141] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 17:36:40 -0000
Received: from [183.79.101.121] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:40 -0000
Received: from [127.0.0.1] by omp508.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:40 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 85825.59179.bm@omp508.mail.kks.yahoo.co.jp
Received: (qmail 78151 invoked by alias); 4 Feb 2019 17:36:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301800; bh=r1NOxrm1fye5ZsOQOG2rvKKSUvIFic4BvlecvMQq64A=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=W09fPoSQM2b5vj5zScXykyUsUgUfD7Dmrfqm4Yrq2fOiZuxnIAEBQnZtURFQ4SIK53lXI+8DzyffP9gx4l9HDYB4yq6Oww1ZVLpmBFIWBNtItMyBzBsERmTGYLARe3jpf9ySQJAXOuabT0aSkUJoYxe7uxLhbhjRQBVmMdLKI5U=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=sIq2C5csLWAFqynwd79eOEfxyN92Yo+dQiMegV6tmW8KjxC6UNWik9M+gbVUDPxsybuJqKIXmpaDJHCpbJB7kypmIq4SRgfUXGtNmiRy2He5rbLnPoIXnY/sTqMbQVvJ6oR7MVEWPstVbhJXxFly73QZ23/Y9J83n6dfMM0lSlI=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:39 -0000
X-YMail-JAS: idGjBp0VM1kLhlNCxVLK0vb5RUbiDm9d_rVe96_aTBC3gyk4krrA2N.c2a7P09kDVyCmhZqYyqTqB8d4uS.c23l9oxUIVAZTVWHWebh0YKJfV3msI00tFlZZKW53CuquawAZk1vAZg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: vfnm6ToVM1kZlQjQ85pW5zpTozw4JsS4NQ857mnZSD2elF_
 eITH5M1mHz3h_iz5iLHhuiVdUI2XERxNkw37cnSJmYHIXnGPAbhIhedBGq_I
 Tx7Js17RbZfj.Cj6PRLBhroS_bQ6c5LT4hdAPBcBkg_q3c85QV0NRhgz9nFQ
 CvHpcE2ZSyUGdUzx0p6Ow59UACHyYmekF2pidTNoVflt2Z5By3xWHsRwevu8
 bu7rtcCJqIfyGT_ud5RdMOs0Py0t8X929xoN9tXnrVRr54lNyYpY2t0sWxm0
 dvZQsWHkYSawfAEU0jc0cUUB0voWPMSgQ5gJ1GMSSb9MmpUNR8c860SxQ22V
 d5xKlKRp6R9bhr0hParSTi4KZxzgPWbdnIHl2WmSQXM4ybfd3mXZmbrhP4EX
 c51VLI7MlHca8IdhMZOLv6rAi3sQO1DNOB5TJDByt2aYuzUALH8eq3V53B_H
 hCJsWXygeZzfrzj6mzgRBoFnEf7fmCwchgLpJOcdHuFmYvXnRdSRSFqs5IoK
 BqNTorlFnM0LGkTNORc_ePv4K9oQ7BBx.E.cIojh55B3X_eD8BknxJqpB7cd
 jUVZHSjaBntlFEGE50npWwJ2I3bpXTz.inalKW5GPFe_405DY
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 02/11] mtd: cfi_cmdset_0002: Remove chip_ready() from
 do_write_buffer()
Date: Tue,  5 Feb 2019 02:35:41 +0900
Message-Id: <20190204173550.29703-3-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093644_603334_33699581 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

It is enough to use chip_good() only so chip_ready() is not necessary.
Since chip_good() is doing the same check chip_ready() is doing plus an extra
check to make sure we end up with the data we wrote.

For this change the order to check timeout also will be changed at same time.
The order is not a hard requirement, it's just better to avoid the case where
the data update happens just after the timeout has expired.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Update the commit message for the comment.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- None.

 drivers/mtd/chips/cfi_cmdset_0002.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 91a491b..ca9d5fa 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1878,14 +1878,14 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 			continue;
 		}
 
-		if (time_after(jiffies, timeo) && !chip_ready(map, adr))
-			break;
-
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
 			goto op_done;
 		}
 
+		if (time_after(jiffies, timeo))
+			break;
+
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
