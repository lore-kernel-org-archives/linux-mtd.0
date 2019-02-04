Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C94C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E094D2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:18:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H6oLqEBJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="R5GnSgAm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E094D2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a4GvOC5ah3hIpLyh1inzSwdioTksjCCdcwcXCj6O8bA=; b=H6oLqEBJOBV/wAWE6oAdI4tAyB
	0gVPw2+T4klji3f95xCy78d3vnalK2p0SVPYEuPDQp9dyrsNGLtoMo4Glic/djYM4BneJrT2iQhuL
	wJznoH662nft1Y4IF116o7OXQnFPYKATQWhHvmgzVF5UkrDIR08UesKIuI8WN78sJLKjKS9ldjAyf
	rFswhiTNmfF3iJtaLBkfgi3IrrLq3SlpO4Tb5AiqeeKRAjYoyPm+k/NMOSt4akoLRs0itEL9vgb89
	MljrujVTy8EHInxZEoaAs5V/SYpCnfeksoizfn4vkYnkD2WCoemypf3t8w/vgsNhOY9nKdViSsGCS
	ukkbUzHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiol-000476-Ip; Mon, 04 Feb 2019 18:18:03 +0000
Received: from nh602-vm12.bullet.mail.ssk.yahoo.co.jp ([182.22.90.37])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimB-0001WJ-Ql
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:36 +0000
Received: from [182.22.66.104] by nh602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
Received: from [182.22.91.131] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
Received: from [127.0.0.1] by omp604.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:21 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 151645.61971.bm@omp604.mail.ssk.yahoo.co.jp
Received: (qmail 97105 invoked by alias); 4 Feb 2019 18:15:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304121; bh=z9g6QKg/BOEgpLT02uEWJrxw675rWoZ/FfHUE+Pf6YQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=R5GnSgAmbzMz0L5aRheCuI8KBssqZ2TByK4QIqsKuHUAjnl+EGRHNT6C81cyfu8gAurxij5Ok8b3RHJ8XcUrOu7NfR3+HlAMtubjFzhE1pOIg40nA/ESaHhERxM1vdd7jYuHgALlhgTL1/I41cgeVADwOFMajBLAjsOxEj7kPns=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=fszgt62GH3rtTz+OI1ZJZfDwp9O4xCgWuFcSUKKeLUCbhrkcY1uAoJYvPYxYpSF5oh7MKcpNU0+C8zzZGEBudRS212638+CNFn5oC2Hvk1/ju5M3zDLweaLKDJz7x12oV9j12rrVMh3x41ThB6hBWcjHTmWsMifVEhFuIxKaGyw=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:20 -0000
X-YMail-JAS: bkZXRqYVM1kIISrwe6hp8k4IUojFcksmt376iI0TQGW.eVaNgzkBOk2LDPUjnY9tQkpb7NVt9IQ1X0ZMJdNvzueaDou8oW4062tOkdihRVWdaXunOZ.ueKTq1ngQGyHGvRjZKXJ3vg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: yB3lXwUVM1nntAKOq8qfFTJNgfQw8H0Fv6o6XwphE5sJDju
 By9bbZ_gJrRrFMg8XJxwF7c7p68ZlonlS6Op5.LJA1Uv1Cb4i4uhTqFWHAu6
 qFmhIjZAyz2joT4LHqL2aQE9MYOBpYZWZgwQ06AJVtkc.l7XQ22URwxTRthn
 BSNFe4b751hk.32rv3sQcftHxZKBx3jp9Y_SvMC814feee201MgRce7qhoOQ
 NKFugDjKk6KxsV5PwXOtskHNaC.II_jS0xr5bgWJ_f4wKeus8SYK7PZ12htU
 8zreMhGTs9xxc8Y_jx6kX2dD1OJ4BA2RSSkagXxK4LOHLgrryBC5uScyqOfj
 EXtUcnBItArFYnv1pvQrg4ePO3OUqtw9KGJXJ6RM39rTQUljeE7Ul.DNsgT6
 pl0jpIZ2LikFg.Z1sgNZsRnhbrO7j5VlwghL5iVzXTEf.6jyCUfGHj1OX03c
 d00u4PyuRixk9PpmICEMYMO4mov4N2hlPoDg5PDMC4V5.rQ.onTrSwVVDjax
 kIP_BEPWVF0Ijh4Q0lEKh._dq_uq2lVs7S1M4HtTNluwsNoDT.A_rUgfGWm5
 SYCQsbQ9K.i8g6b3hzU5c27YX6487qHom4YcKOjNlsJb3s4Es
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 09/11] mtd: cfi_cmdset_0002: Split write-to-buffer-reset
 sequence
Date: Tue,  5 Feb 2019 03:15:03 +0900
Message-Id: <20190204181505.29841-10-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101524_081388_BD2C1067 
X-CRM114-Status: GOOD (  12.87  )
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
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
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
