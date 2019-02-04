Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F976C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:36:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60DFB20815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GV5EI1De";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="i+FtYXqo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60DFB20815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QpsBCNPjjqVyLb8mt0SJMvLllA6dGlc4oEA0UWBpEoE=; b=GV5EI1DeImx/u/JjAPFY77cpXs
	b7RFCHREcnhe9Fh3iPootCS22xENiPNacB5l11rCa2SHfC3oicafsrdAOmjYT/HVQC5Ip+GuNHLlb
	nLSo7EZTYg3yWveRf0dz8f+SRwsuJMZtI4VA5WP7pDIhIrPiJN2HsQwrJljD1ktDP6fmHIfqNmBzY
	KqMl+gJKwuY5RXHlmVqF12Y8Wob0x9WASQFAquT+viocKqA1b0xyT8VIW8mYg4tQxGq3ByJW4neXQ
	nS44XHDReLOrhfXccMG8IxptQ5E0o02gkMaGY5RKISEx8xK0iFYW76GOk8NMHDpcdcAuxO+flr6Hy
	PjavavAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiAo-0002SM-V4; Mon, 04 Feb 2019 17:36:46 +0000
Received: from nh503-vm5.bullet.mail.kks.yahoo.co.jp ([183.79.56.191])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAk-0002Ps-ID
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:44 +0000
Received: from [183.79.100.140] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 17:36:40 -0000
Received: from [183.79.100.132] by t503.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:40 -0000
Received: from [127.0.0.1] by omp501.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:40 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 508262.79675.bm@omp501.mail.kks.yahoo.co.jp
Received: (qmail 78161 invoked by alias); 4 Feb 2019 17:36:40 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301800; bh=9Qk34ftMPJF3CmzWrOWRWWgHPESdAwfLnq6MzYE6TuA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=i+FtYXqoabOYw/9LaPgtN2nzEh0MloklETksb/Kq8ukJF1HbSFo/kpFGkbP7Iij58rkqQVTjBQujlvQnUzRMkMQKVWiRlAwYrV8vszwUZUPdXtX198CCow3tdMHf+D2XWmo0FM7rP6z2y+zX3Vn/Xj6CfgpQo8SHqHY6z7XvsTI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=GIUOsRmU1Q00WFZ26aOXO2jgXjsAjJyQ2O7315+JnstKQPEUiY1opbXs2vsNZNpQs3GYjvAELrOnzeq/VvaEiaSGQK6yE2Bya9a5pqunF1OdpLg+mkMtMw+KUKMEkStDt6mJfI5FPZ1bw0OOGu252qemTrhvTo3FoJzxZ4tfW/I=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:40 -0000
X-YMail-JAS: Sccm03EVM1nGHX4AuybR9DBnNv6hbX393ix2_uGwZZ3DpQHb6I0nJzNSlZ2VjBwvyrxGfYpVjpnoar0vAIonkwzEGjeSK.bRJlU.dleVkm7Cx1fnG8Dn1rjU5NoRXm9ZvoItOW04QA--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: gza3cnIVM1mSaP1NxwtG0gZWqUr1VOMpXtaB1Kf.g09lM9V
 5WMbl6la6HyAvWTFMgjbNoT.0F5skAD4jdcEoQ5s9qOPKoUjTRSPFaF8hZMZ
 V1OtqfKrqM1beIDmvs3Q9Aqfqt710RK7AIfoYcDvrGmB6kcW30qUqM342twR
 vAueLgqRaJZmDW2OPA1JQ._DOvQ3A3XfO4orrlukxfC2zhiuIDqaNzOwU6zB
 cHYgr1E7faNUD4tNxcPwj2ErZm2zJWpNsUmHkJmvGtGVvgAtl6b1xVqjY2sw
 S94G7xo_X99uHw.TBgb6b8YAswPX4j8aKB75oeecJeXRPwT_qKbbh5ZLkBRW
 cR_OglHuvlf470A4M5_6.RjLbbCSXB0eL6wTsOxpYemrQQTx8xkNO4ZhvsRs
 Ga0k52vtXnRSgIAs4bngJNVf.UvYGLzHmOcJ.UtW85W0YNu2aG_yffMIEe4h
 eXUDr4JSE1aUUPPKGxX9LaWAZR7TTwaZ91tFnR.RmMg4mRLiFeb133UAv0RD
 MBpLhl0vouCna23eZXJYtpPjkdavI1VLUlr3y6vWIctVOMszW9N8EfylnVZO
 mrO3W21YCXQhh__1PhWVRQknj8SKktBL308S6Wn3DYjAawEHl
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 03/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Tue,  5 Feb 2019 02:35:42 +0900
Message-Id: <20190204173550.29703-4-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093642_876261_FD16539A 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
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
