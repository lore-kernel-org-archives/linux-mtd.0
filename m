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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6178FC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3602C20821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aDkzWXTJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="AikvGH5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3602C20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/4El77QxAUpvoOQJTpNdY74Az6k6IZINXq1me6JtpmY=; b=aDkzWXTJupb7ez0s91wxcP7rFp
	/MN/+rfPOUMXiS3tkUfUph6r/qPrG5okKGdI5P6761IfdGe+jV49pOYqndp3H61clfIN8TDQ+VhSF
	d+yzgc8LF0AZVOuOBdB9ktbW/o6A8iRnBTCN/N1yelw/7Sn6peBVCcBO/01/qs64G6cLnTc9sGgvM
	OLyZhRa8iPsAmusRqxAB+vENwrWJ0NLYUyEKbOOlTSIQvh377sx3koMsndQMTSyACBJp81gIK33Tt
	6xUU6rKTI/VLgS3Qq4NX08xGFD6PQTrs0i65XCAN+bgZx+YZDe3o4M/aBmCk/Teazzr758b+sw/aF
	UJEuvv7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqirj-0006aw-57; Mon, 04 Feb 2019 18:21:07 +0000
Received: from nh604-vm11.bullet.mail.ssk.yahoo.co.jp ([182.22.90.68])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqp-0005j2-Ki
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:15 +0000
Received: from [182.22.66.104] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [182.22.91.206] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:10 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 347249.36526.bm@omp609.mail.ssk.yahoo.co.jp
Received: (qmail 42006 invoked by alias); 4 Feb 2019 18:20:10 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304410; bh=g/S9K3qGzvMq7Ymh1omGf40u/Wj82T32UcnvQOcMhXE=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=AikvGH5jnEflPhpeF3ivXr5cl9BYofTFIIM0lo8TxtpEyb1ZSQr+WqtOZZiCt/vGjTXxBVKC0l6nXlC0MOiLUBgS91hBPwKEsn9jBawhjZj0i8vaU1w5Gzxn28+1ogzcZH4oY30vXcL3JnjagCgS1VJ5GR2Qh84EeUxrsvEVxXk=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=kUjtmApREJ/vj3Q/a+rw7dNQyxLVdlFG78sFDvzTNnrx/5wi0AYXveFXBbtlV0HGHdXqEsbj146QTX2aa3BWFXRNPOqT8MP5F1/xALcp5gm4XQGlla7JnprWUMvxPfh8ADC+pqMfcSmzz/TGgB9tZMq1yq+tMS270J8Z8AEAW20=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:10 -0000
X-YMail-JAS: RtmTJv4VM1nf4e1VQbHkp6qLbY3vmJfj2fQcSHUA6LwkhM0t8SSb3SEydt.pAJACsRifURPlY1qCnOBSvB0SgsGtVzi84vrE_PmGnKo9wUGOvfON2dnbHkpjohPTJdxxEBtG_texLw--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: HzYjqOgVM1kx6119mmVFl.iOechSy.85rNqJTJPW6wD.BKi
 GMSu5ujr1PBLnonEiKdn8bEzkYMN4ioYWGQBX.71kQLfZgsjNxt6JSHsgFvg
 8RZ7uvvexqU.XXrbd6lfRRrPtzyTeMQ594XUPRUByJKo1E9tou.6PGJL38Mo
 ZONp3KWzOYDAQOiDm.fm3lEHvSMouBJPismWbm8bemRBtoSCoPU9W5QcZ8cX
 r12FUCViohrc3usI43RL6K85URyEfxcM3hiPTaJ6N8cbio_4cb3e_4eh2LoO
 pQQmriyOSNDq4cSqmiM7pu5znSLYWpdI.9oryWOCiOASv6d.X2ynhQ3FvREg
 8S6ItsWyCUqIgoIY6T0CLA32e2ERX9D9tUYdEczCKgFpIs4TphsmHthP_UWN
 5PnvKDyTOlOUYU2I26upi3ccCNr2OqIQ40Hp2G6kCjgkmSEPK3DJkfv8GaRM
 emnKpPHIQgaCcZ7cZV7wPS2h_R8ZrOPAeOcNCYCvZFg.XFdMQ41rXOP2IvVD
 Zf6dnOsePSszygOxshvH7JSVaw3aDcwDzCV25P9Qo7h86aoB0X04OPZMrlbv
 sX6L9njeLavqvxC0XsQthCGvY_H9DhZ0l_5WfFl90Bt9fJa68
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 03/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Tue,  5 Feb 2019 03:19:56 +0900
Message-Id: <20190204182004.29894-4-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102011_913155_47774237 
X-CRM114-Status: GOOD (  13.13  )
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
