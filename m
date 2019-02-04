Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA424C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA6A32176F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cmigr6Ap";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="VRzdI0Fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA6A32176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u8nsNlSOw2HD3YosuJSUrOkf/cxsTF8CklGdyE7DamQ=; b=cmigr6Apn0+IogI+H/E+ZhXyhL
	CLZdLsElNJq7zilPs7OLZtUvD/JNmWeziDzUMikshsjDaldf5UxDM6C/2ejwI1YlRjyEH81NQ1+U6
	F3d6ZngehwcMhRFGgz9cF88q6/uVmec/kjfiXNhhTiqPufEIInPQvp7Hw5ia7QJHXXakUXiglktt/
	rO3aiz8WukIPlIUoxIEt4EjMqv+EVBzLuSCZkEFiLrH01RLkFakyNmSwHzqVq0iEL1ZV7spwDdpyg
	zcsJdVFFnnaRBDesjqUPENBqt6wjGswccJ09iCl7W9ari0oqvmqc/TM8uQobrBxuNV2AZChw6DEZb
	49l4fTQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqisp-0007eH-5C; Mon, 04 Feb 2019 18:22:15 +0000
Received: from nh501-vm2.bullet.mail.kks.yahoo.co.jp ([183.79.56.132])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqs-0005k9-3y
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:26 +0000
Received: from [183.79.100.139] by nh501.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:20:12 -0000
Received: from [183.79.101.120] by t502.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
Received: from [127.0.0.1] by omp507.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 116496.18248.bm@omp507.mail.kks.yahoo.co.jp
Received: (qmail 42082 invoked by alias); 4 Feb 2019 18:20:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304411; bh=BadGgwCfMX3MjWz1WsInKqpgqXFex3PoMwLLq1FQe1M=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=VRzdI0FxjZ4ywM83J2cNrcaryuz8WhUXyMjCWAGiZ1bJvPxBHII+FqmzLf3ETSdekeQ6zuNxUJ1C2uyIEMfPr7BJ6/LDpjS2t8U3ES+y9aqdC72cjqk+8Y4zA/FMezrbmqkkife8Sguh6+91+88RmztXI5F2W0XYnlCx2k7SU7Y=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=WVM7OTpywIh29HJiB2xCtb0Qa2gpfxnTDs5/bGZzDYerWJ1xbXqgwIHAUgD26vWuGFdd63tYOu1C8fXTHRFRQsBKBo0JbKB2jX5vZY+4OPKu0TryvHuVboODMDtmE7/aoMmwxpSJiHabF61r7x5rn6cDfyCfGpCtpBI6P5xa2fA=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:11 -0000
X-YMail-JAS: UzMMa0gVM1mWms_LOl6Zur2Kd7FJjO1dtmucjlx3VPnMFohZJJBpwhNNUTjtyGrQseGx1dZo8LzS7fTtRmDluG09.qhgo2f9LTFydxl.SWHc81Q70xOwwE0gppefZq0Zj2Ljfj2Mrg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 2go2.BEVM1lnC4.UyTpBnLrLSWgKx4570eLPxCtx1fX9Z5L
 EG1JJw84nykuyhhX6rhB7PmLhrsZEjldci_nR9go_74PEvd9cI6kfkTa34pH
 6aElIZ60sfKYwk9uDbvZ2AMF2cjTEn_gafg62i9nxQa.WZ1cvhxDH3a1kTjk
 rS3knGDRKUT3QvwP91RFMOv.1rM9shrg1d3.Pel7uDfDgplWAVon0XY_9.x9
 bP_DnC7XFYP7zse3HzuV4CKsgrSKpHehZK4G7FbC_zaoCWvDRifjvQu6pg6r
 0ecpDqTpgwoXBLAP.R2uOTzaL7wGYvTqncdUsqhqpJDnPXbixDFKt.DSRmFa
 Lt6xYJv0gH_RFeKiAQDM5nRkeuyQ5wddCMVtSv7xsYTyBQp8vSm9inLpAPxZ
 q4IqyskrT2M6kou5xiWKiEqSQFzxSSoZG89eBURm.GkqvCDlpKyomEOx_tDO
 J8yXr8PbBzY74kL.Hoyi79lP_9TjWhSp9egfYTB33KyD90HFsqxXY6ikRVWy
 m7fRTUUWRnneTzzhffI1iZRqnU0pC0cM2a8VVEqGfPQUAsCQrKq8QHuFaoKt
 cXuIXI._tMxeCdAQbN4XqYCOrM9Tdx9KacFVPo5cAwaXZbWlL
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 09/11] mtd: cfi_cmdset_0002: Split write-to-buffer-reset
 sequence
Date: Tue,  5 Feb 2019 03:20:02 +0900
Message-Id: <20190204182004.29894-10-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102014_620006_17DF9AFC 
X-CRM114-Status: GOOD (  12.46  )
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
