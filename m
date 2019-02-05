Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB53C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E78E217D6
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XCMELbYM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="PEyJlTc2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E78E217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=djN9ncp3t44Ff63W7LsuqSnv0gH8MxZxNN29yo1PMQg=; b=XCMELbYMCdCV9xIM2sn3+9gbAL
	1kbS3wcpE5eOFiaDwxAHH5JlJzQSJUwIxS0iCBInGkh2egxU1+9WTfPscNzQ5LYWScfQEZ/J+y/qz
	DIsCH3CBOp8oZHv0PI3Q3uaW0udZsWBaDOegxXKGirtaHrxJIUrvUeAmP8tKL3+d1vg2ZgzctXuT3
	1a51F4VZSlUYlmUxAx+Hi7HrJOmF2wTk7JJL9HfyHNpXRtZxF/TqSOX77FEqu2LgY2UI4g2P8LREV
	bzSzHRly1ZtVB/9qkGaAtazoaSj+PzBtTmCkf4T03PagXnLJ9S/AGrFfSnxHniCviQVdSxvWAnSm5
	VFEwrtBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1bn-0006MR-St; Tue, 05 Feb 2019 14:21:55 +0000
Received: from nh504-vm4.bullet.mail.kks.yahoo.co.jp ([183.79.57.90])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PI-0006lW-GF
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:04 +0000
Received: from [183.79.100.138] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:55 -0000
Received: from [183.79.101.122] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:55 -0000
Received: from [127.0.0.1] by omp509.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:55 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 969433.8028.bm@omp509.mail.kks.yahoo.co.jp
Received: (qmail 45665 invoked by alias); 5 Feb 2019 14:08:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375735; bh=NamvOjmwD6jKAny9LHfGhwSwo18zvRoxQCQNSoMAYsg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PEyJlTc2x5pDXr91hygg4w1q09YRgQz4pbQPGq01xLvjfUTT+2EFJRfUHh1X4HJ8r3k4b5DDsBhmAh7lGv/WwI0bn5H8jlaRrHMlxD5glcupyxAW5USJTnzoCqutaL/t43q/xQnaASgRXLGwW5G98ZoeiKKRSnNR6WGlnzEPoo8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=cqrneiu7o47+WzzTfh/vBlw1TrwomNkCvh9RjaqqsF27Y7mZzM5TpiAEH8CkhWilljc+49TkI3w/AS7v//wu6aGlj3Y5AIdY7tzO08X7NO6ScB4TUj7aKmeFPOpLTeIz+uYBM5vpXaQqBHu8ipWRr4iKHGv2PTmBTQ+vIA3llW4=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:55 -0000
X-YMail-JAS: ELIXyV0VM1kzMnKZ2aphV5sUvj8tgX.Jv1.9ezxZ7EYrVSlEC5cqv9j8dGhA5NGhdi2PRCiNCBtOV_veOoVPcZtYwFwJQ_sXJLEK_L1cauADScOd4ABmNyBH0cyNr5SlMepTAFU_NQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: kR6SXWUVM1khdvKdh_4C2hKoUURinqg60AK2t7R0l05FhO0
 PuB1EPqqVpDTRZBIjy7TcaPohe0DhSEP1cD8aS.6x0jnUr9eGpxZCXyLj4h7
 mO5cpQhM8T5AjMo4Q3qmaxj68pi8FkLNcFLmiWy.RQ.AJhlssUnmonyjyC7T
 Io0yUFaqVT192nTE5mUsdYynKRfDJMXsSZhd.OB3q.2UpFH2yZNbeRHPrunO
 p42TQLEh9mffGYaEqQmpvITArlVU7Iqwf.cN26UlURijTDquCJBw.7rZOevK
 CpIZxOx1v1d.pTxIj_4L0.otuFyD8GyU.no10D0RyyHJ1EHUuONwpgk9ViqC
 ljRe7XWHc4MOmqf.h22Beh1MJGdXa0ppyWY6sUnRPQjcCbp7ohCrexh8Zrva
 J9i81SBPYn4uTCgVya4u592dLwq586PbgbeyPje1sQ9AcuJac_BCbfhz5LuI
 LFJ5apXF4ZUhoDSpxEdLS6hIAQByXs1Lr.6Z2p5wyo26fFKlrU01NK12gadL
 sfzBrvZGI8RMdpWrEcVBFpop4NEp6mht3yXU8.8B1NP_Q3_F4iNLCf6RpPzQ
 _BGMItOj3IUqt4e834DK4JCFkxraC6GaC.AjH49liY.EDHIK8
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 03/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Tue,  5 Feb 2019 23:07:51 +0900
Message-Id: <20190205140759.2360-4-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060900_771404_7E269533 
X-CRM114-Status: GOOD (  13.77  )
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

For a maintainability by reducing the goto statement remove it from
do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Split the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 46 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ca9d5fa..1aacf22 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1880,38 +1880,40 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
-			goto op_done;
+			break;
 		}
 
-		if (time_after(jiffies, timeo))
+		if (time_after(jiffies, timeo)) {
+			ret = -EIO;
 			break;
+		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/*
-	 * Recovery from write-buffer programming failures requires
-	 * the write-to-buffer-reset sequence.  Since the last part
-	 * of the sequence also works as a normal reset, we can run
-	 * the same commands regardless of why we are here.
-	 * See e.g.
-	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
-	 */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	xip_enable(map, chip, adr);
-	/* FIXME - should have reset delay before continuing */
+	if (ret) {
+		/*
+		 * Recovery from write-buffer programming failures requires
+		 * the write-to-buffer-reset sequence.  Since the last part
+		 * of the sequence also works as a normal reset, we can run
+		 * the same commands regardless of why we are here.
+		 * See e.g.
+		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+		 */
+		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		xip_enable(map, chip, adr);
+		/* FIXME - should have reset delay before continuing */
 
-	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
-	       __func__, adr);
+		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
+		       __func__, adr);
+	}
 
-	ret = -EIO;
- op_done:
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
