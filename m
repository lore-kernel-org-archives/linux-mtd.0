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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8C3C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDB1C217D6
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmMRfHIT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="MfLELlEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDB1C217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pHORpggGU5xWGuuQKdPoVVHi4S+yWn/JyIh4u75Jy3I=; b=gmMRfHIT5Djwf4pBvBT8kIcdPW
	Fqe8McG/yavQQNQAqunaKEzMiQl1fAX6r4mY2UorYJ1knXIw0q6CRkHqNUBsHHKKRrpB9jStCaP4T
	HphmDPi7qn48jTENiPM5lHGKGC3BhLWckF1our1jH1mC+eTOKVFAmT2AgeV+y+t7cHZCdDKv9pqOt
	ujL6LMnK5oxurwrRdRm6v4itubbpVy2ahTWEqyiX3p+kxw0bc6GTjEQ3FlbKciiyD/r8zAwHf1R3R
	93FUMa7XYSib8LhKIImmXoFJHkeTE5DxnwtfSDvD8ohvpHaMUeg2Syg9OkKWHiw/qc70y7NoeAWyI
	2SDaYkJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1bt-0006S3-NP; Tue, 05 Feb 2019 14:22:01 +0000
Received: from nh604-vm7.bullet.mail.ssk.yahoo.co.jp ([182.22.90.64])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PK-0006me-7G
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:11 +0000
Received: from [182.22.66.103] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:00 -0000
Received: from [182.22.91.131] by t601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:00 -0000
Received: from [127.0.0.1] by omp604.mail.ssk.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:09:00 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 140948.93113.bm@omp604.mail.ssk.yahoo.co.jp
Received: (qmail 45871 invoked by alias); 5 Feb 2019 14:08:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375739; bh=zCEgMVlaGSDqMwIPyN9VYHHNZmjYbGspI+1FBumbMLo=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=MfLELlEj0qw6YQFKOabGHwDwXbMg8yB5dnylyaN7eTP7/fd4yqa/joqVoMCs7DRQSmOZX15/Ji0ZCEpGbF7iSOFTJNITxSyLzt9k7NZdnBSLk9IQro9IEhpCsjmnoUcMsoY19xwW32i63vWnTtd1WW2H0535OuTtlmv/X9cbPxw=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Y8BFJJsLKClIfBv5C2OXfBfLmCcf3ms1nSSMSzoQxIqWdkfLBYAPxOffPLfffS0mY9uCKEo+klcetOvuhuyX9BaHExtFoBHND9B+QsgmAdQ0uP5MJwNf//5zw3Top039xkuvajGZFnPk81D2XZnIYDIeB4WB6z9BRF90iZEq1+o=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:59 -0000
X-YMail-JAS: MeyelX0VM1mSxBoju.h4HOdwCh_ECAwEeS5p1NJ56vNPtrfToW95ROoI9Km2LzuxYTogesiVIpxLNLbqhx2R6W3zfH0isbI4tOBZ8vGn2YjEClxglFHRATfXER4j2_yE.nnPumiSGg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 48rnaDUVM1n0tpoBGwfvEe4KTzYOzLZGP4qFXxwFEgoOnfr
 X6ZiyOzzwYN2ozff6RFvA5cfFgxBADiToWAQJjyNzB9A1IGcbe2F_sJuwIm6
 Ujiaf80LCjwuA2TWu2qKuWoRtKsYoRgNPdphHP_Qq40kx1v.grRh0cFY4NgJ
 Nui9pARagFQ_6MNmSjsFvSVd0MC3HMYhN01mm67Q5bzT2tWQEf29tZUYgT5y
 _aDisMA1kXj.Kv.KvwSOvQqVY_I6skxbPTDG2IObSN7kkJMej8t9JzjqSu0t
 RU_LUfCktIZgoIikvBMiryIsHa4EYHUQslrOidsaBfb_v_525bgwhVeCh4o2
 XogdsK0VJZW522mr6qrTz8Eu80sI93rziXxrRvQPbHEQYY0bNbQKusDT15LY
 _6.PR_OkvjUijseSzbIDIoPBZaI9MuebVp4SJY22e8w0R_PjYN6OZoTh4pxf
 8Ili4g_GCBAyFTxH9p1X7Pe_qmowZbrPPb.DDFzJwuKPmq5WHfQKn3Gsohwx
 tdkJxUVjvCUaXCn_EtHsDBpcD1YFeYLiT7UAQH_h8WdWpXx3kBJRSrX8AWLt
 m81IJajFYfP8WnK13E_txF3_xmpMpdnnIU74qk81RnlubX84a
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 09/11] mtd: cfi_cmdset_0002: Split write-to-buffer-reset
 sequence
Date: Tue,  5 Feb 2019 23:07:57 +0900
Message-Id: <20190205140759.2360-10-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060902_667187_CDE0EEDF 
X-CRM114-Status: GOOD (  13.09  )
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

Just refactor to split the sequence from do_write_buffer().

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
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 38 +++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 81f5e5e..d5954bf 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1820,6 +1820,27 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static void __xipram do_write_buffer_reset(struct map_info *map,
+					   struct flchip *chip,
+					   struct cfi_private *cfi)
+{
+	/*
+	 * Recovery from write-buffer programming failures requires
+	 * the write-to-buffer-reset sequence.  Since the last part
+	 * of the sequence also works as a normal reset, we can run
+	 * the same commands regardless of why we are here.
+	 * See e.g.
+	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+	 */
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	/* FIXME - should have reset delay before continuing */
+}
 
 /*
  * FIXME: interleaved mode not tested, and probably not supported!
@@ -1922,22 +1943,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	}
 
 	if (ret) {
-		/*
-		 * Recovery from write-buffer programming failures requires
-		 * the write-to-buffer-reset sequence.  Since the last part
-		 * of the sequence also works as a normal reset, we can run
-		 * the same commands regardless of why we are here.
-		 * See e.g.
-		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
-		 */
-		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		/* FIXME - should have reset delay before continuing */
-
+		do_write_buffer_reset(map, chip, cfi);
 		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
 		       __func__, adr);
 	}
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
