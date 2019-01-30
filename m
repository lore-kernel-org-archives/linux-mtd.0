Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF17FC282D7
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 11:56:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B062A20882
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 11:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D1sNwnfI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="g50rF8Yd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B062A20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VNTN4jGgTzlrTgevGwviyk5Z/jxeUjuuQ/S0/OXao5Y=; b=D1s
	NwnfIQuMWniTt/sGJNZ1cFwyjyvVYN/+BfPsjYnEYGoslUcAuSHs5ZfX2Jwrjxx7WO4TPfn1x6Bgb
	NPwP9D86hRWJrWJfnVuFQytq0CmfpfISOTHO3GW05PSpXrIPLFC4fDmJwz6vJ7j59kZ251qMdcIl+
	II3S4+xuFqEE0gvZKRwXSim43ZAo7Oz/Bh9tt9Ok01ND4zV2lDNfyC6LDzq60NbrAm1/tLd/5TZGT
	X8ZMkaS8OIHXEkQiRcP8MjpO32RrYPgkxHFBWXKRttGU/voFogtlZbQ5QU1TV71RumkUXddWL/zGZ
	MWzaMBftJSN8SoZ+4ILPWk/tGmU06Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gooTP-0007Qq-5l; Wed, 30 Jan 2019 11:56:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gooTL-0007QD-Qt
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 11:56:05 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FF1720855;
 Wed, 30 Jan 2019 11:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548849362;
 bh=SW+v5g3vVgunS9Kiw13bmPIXNmrcd+9uQEhthl5WBV0=;
 h=From:To:Cc:Subject:Date:From;
 b=g50rF8Yd9ahm9GPmJUmUy5Z+6Jy2vSANPn8qlwVBGi0w3gCKj4gM0BdA6bYolWkp6
 ZGtP6gPt3fq4+iu1wyXuBpJ3M3Mh0sF92a3uhKJH1+fxhW6pr46zQ0T26hj16o1hk6
 CULPA1kioKlyB0r20NKUEDV20ZifE44r0Rlf2eik=
From: Boris Brezillon <bbrezillon@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Make sure mtd->erasesize is valid even if the partition
 is of size 0
Date: Wed, 30 Jan 2019 12:55:52 +0100
Message-Id: <20190130115552.9610-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_035604_057462_FD0DEF6F 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent
erase properties") introduced a check to make sure ->erasesize and
->_erase values are consistent with the MTD_NO_ERASE flag.
This patch did not take the 0 bytes partition case into account which
can happen when the defined partition is outside the flash device memory
range. Fix that by setting the partition erasesize to the parent
erasesize.

Fixes: 33f45c44d68b ("mtd: Do not allow MTD devices with inconsistent erase properties")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: <stable@vger.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
---
 drivers/mtd/mtdpart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index e6d9467f6be0..37f174ccbcec 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -480,6 +480,10 @@ static struct mtd_part *allocate_partition(struct mtd_info *parent,
 		/* let's register it anyway to preserve ordering */
 		slave->offset = 0;
 		slave->mtd.size = 0;
+
+		/* Initialize ->erasesize to make add_mtd_device() happy. */
+		slave->mtd.erasesize = parent->erasesize;
+
 		printk(KERN_ERR"mtd: partition \"%s\" is out of reach -- disabled\n",
 			part->name);
 		goto out_register;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
