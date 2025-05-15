Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82039C2D0CD
	for <linux-mtd@archiver.kernel.org>; Thu, 15 May 2025 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aOK5Xv3+uYqHwdyupFWiIfGrAaBf6IY4Lh4r7EKGbFI=; b=EGmkJrVh16M9ZH
	Uzuy8gfiMTuyfD9HmZ3g7TwgvtzaU3Hp+/HX0YRbCpHK5rL4jWmAlpA2GPo2CS1g94swJfRs7jxSd
	dS6dj2ESAXdKXxbeO46LfURT90QWcaDS4F8Rx2xBM0ztszHXTQWDM/sek8OO9HLCbSJ+Z2q/Bwuou
	i3MU48HBMIOK5ppk5abUtsgmgZzNuivi+odU+M3952PpV+CrjnH0pPZgdLNOflixjjJkCD1aKWLnR
	5XSs5spVUrdKz/T/MpR/Ou3XYlP0txXeHboxACbzUFbKk8TOE6ygXwoAGWZwClaBxgtibSyycrvLH
	Jgl1Fihn74z8LyfrqD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFceq-00000001SxR-3pAz;
	Thu, 15 May 2025 17:46:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFceo-00000001Sx5-2ulk
	for linux-mtd@lists.infradead.org;
	Thu, 15 May 2025 17:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 71097A4C89A;
	Thu, 15 May 2025 17:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C851C4CEE7;
	Thu, 15 May 2025 17:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747331169;
	bh=4CjC0kpInaRt8g4DK1s6fH4QyHh4X3fogsoj831c6zk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=tWrveDtS0Ds1HRVJkHRYU+xb7zPOB3EixSE5cw/k0Ikas7ECttrQa5QVxTNog7pIc
	 Qalo4djwRU2EQdfHi29t8v6nKIW9S3uv7jynLl511SixcJvl+zkC6MrSEx1e+6PVxq
	 FA33MdFWhxOIC0BQ7MCYHKPoJi4cg7DOAvi9JOonFkiHoLKITFysMwFVSrzGsPBKTf
	 Y4CP4PmAdeA6g3Jmnl0yKoDzps7FOTreP357z6Co5Q5aGaYytVkWQ//tsSmm0toUuJ
	 xzPEvjg+togkcPqvyofGNTTh7rTpggrXTnQXVKCYQWjzSgiFPb3/58aHZ2OWA/jOaZ
	 8RWbY43kysFyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D7BC2D0CD;
	Thu, 15 May 2025 17:46:09 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Thu, 15 May 2025 21:46:05 +0400
Subject: [PATCH] mtd: spinand: esmt: fix id code for F50D1G41LB
MIME-Version: 1.0
Message-Id: <20250515-spinand-esmt-v1-1-37507b7335b8@outlook.com>
X-B4-Tracking: v=1; b=H4sIAFwoJmgC/x3MQQqAIBBA0avErBNUMKmrRItBp5pFJk5EIN09a
 fkW/1cQKkwCU1eh0M3CZ2owfQdhx7SR4tgMVlunnXFKMidMUZEcl/LDGgZE9NqM0JJcaOXn383
 L+35eF3moXgAAAA==
X-Change-ID: 20250515-spinand-esmt-76fc6aaa7019
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Martin Kurbanov <mmkurbanov@salutedevices.com>, 
 Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 robimarko@gmail.com, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747331167; l=1761;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=Bw7bpiUiZpTxxhtD+xg0nBao9Wz8H2pesY3n+hLtv0Y=;
 b=TB7980Qcxb+4Xz2tPA3TAkYBEvGxcrLGn3YFB35SRxhwW3A2Ru/l1chsBs0UlKVw+R8PK3Z3j
 71BFt4VyfteB/5sxdDFUSzVxCRpVK1x9kGkLowFAggW5UNUGtf0o9O0
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_104610_879011_0EE813FE 
X-CRM114-Status: GOOD (  12.45  )
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
Reply-To: george.moussalem@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: George Moussalem <george.moussalem@outlook.com>

Upon detecting the ID for the ESMT F50D1G41LB chip, the fifth byte
returned is always 0x00 instead of the expected JEDEC continuation code
of 0x7f. This causes detection to fail:

[    0.304399] spi-nand spi0.0: unknown raw ID c8117f7f00
[    0.508943] spi-nand: probe of spi0.0 failed with error -524

So let's revert back to the 4 byte ID code for this chip
specifically.

Fixes: 4bd14b2fd8a8 ("mtd: spinand: esmt: Extend IDs to 5 bytes")
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
drivers/mtd/nand/raw/nand_esmt.c mentions that the 5th byte is used to
set ECC strength requirements for the detected chip, so no JEDEC
continuation code is actually expected. I don't know if this there was
a change in design or approach somewhere along the way, hence I fixed
the ID for this chip only.
---
 drivers/mtd/nand/spi/esmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 299d0e507c29fcde1c38d2fdebc0cc755825dade..9e286612a296c75831f7b95a010a5fe47579c36d 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -199,7 +199,7 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
 	SPINAND_INFO("F50D1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
-				0x7f, 0x7f),
+				0x7f),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,

---
base-commit: 484803582c77061b470ac64a634f25f89715be3f
change-id: 20250515-spinand-esmt-76fc6aaa7019

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
