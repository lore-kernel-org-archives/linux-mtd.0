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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B86C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2529C2176F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M1g42yZp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="vUoCvj+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2529C2176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QpsBCNPjjqVyLb8mt0SJMvLllA6dGlc4oEA0UWBpEoE=; b=M1g42yZpeM5AV3zHlMRnD+WpoW
	GlCXGIY4N7AhNkzF+0miT1syEgjNXcCD8oIy5k4fgu01LiledyTWUHwtfehMKPO2uxiExZQuLRPJn
	Hl4h0SncIB9jJxpT2b8fj2idw60Pg33zoCdzFmaLvWzb4TPul4gIy2vWup24qmjOrVqQiRXx2sauo
	jfmIAduyvw3u+5jhuy5ukVKn1OF2mecW+OK03XC07/XZ+8pysdxTwvyVmYFmO6vPl34HbRsP0rQVm
	4PUiBEku8gJHMFh9O3vQ2DA98J1rjPRSMgq6ATD1V0vV9DbaS1FbrO1cyVAnRB0r4uc7oxOcp6UL8
	xTaJsFwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqinW-0002wk-Gl; Mon, 04 Feb 2019 18:16:46 +0000
Received: from nh501-vm12.bullet.mail.kks.yahoo.co.jp ([183.79.56.142])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimB-0001W9-L0
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:26 +0000
Received: from [183.79.100.140] by nh501.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:19 -0000
Received: from [183.79.101.122] by t503.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
Received: from [127.0.0.1] by omp509.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 348308.11959.bm@omp509.mail.kks.yahoo.co.jp
Received: (qmail 97005 invoked by alias); 4 Feb 2019 18:15:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304119; bh=9Qk34ftMPJF3CmzWrOWRWWgHPESdAwfLnq6MzYE6TuA=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=vUoCvj+cqwoViSYSY8bYmK4eniN45RvQlkOZWszaiHMaHBokQF6Gqv0Pu6MsfJ24Q//KP4dgcqV1QBRpJmv+iDvpH2Zu8Sne641V8Gq1i1YvgrSzQoENKFszy+FeSaaD4ArOUgvgrBt6VUL8+3HBrXCa47sDALnCMkg8P5xW+S8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=vM3mSFQlJ+f/CqgR8QNpqy0Jd8ve1nJFG+g01BCj+BIAlb/ZFIse7JNq8cM3bEN610ary9uf8AQIp67utQt201gXaaGGzl8gfQ0DNAnym9Y4beOSgx1IBxTTdp0ZMpJs997V/FL2wP5FoQHZe4Gq+Tipapf0fq5tfrZCAi6KhWs=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:19 -0000
X-YMail-JAS: T18F8y0VM1kX8Lut44qNDqRKqQXOtlWEgnYz4OPQqrKh_GnZATKBXc4qMcXkmcMq1BNYy.6HEqavlP2iK_Z7GN2Ji2egLfrgr7deoXOm7g3_TisNhStvOHJsKJwkvAISLswWgb1h2Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 2XnYS6AVM1k1iY8qsTs.zk5gHHMic4J924x_8Nu5hj1hKgJ
 JlZcAUgJcNuTyulStoZ7pugbGdnORXXBuQYhCGnC.IRw2XxPBCrdPz7GN9rJ
 _E6meox8kptggwgewy7PqG7a8AUEGr.ENxM2z22DTAPxpPMNLcfpFxnySll.
 ytfNjeTEVx8VymRZYG7.8PfyMpw3lsooaAZlglebO82HcKjYO9EvY4syZAIq
 KZW68dzeVPQv2MinwmeYqjOfY16bxEUS0uZuz.t3tYa4ozax_p1vTJnBv0Qv
 UQKa5hB_nDpWRiaasPL.HCIinBFDbromqfw6uqC1lLPbEeFaPPn3logkefNO
 zbotIOWw46q_MZqk6ZdK84de3eMk..X_D3VirjLJUPTWxBys0ye0cl3f.WC_
 DbaR_TrXTCwXs8Mwb6XGMzycalC1nfW2fadinlGZOFDBBf9vDsRn0wZaJIte
 ALFbUf1mNM68o_Ok1ndbRVTcU6yi3bCtHHR4urAONvYYmuhMUuAc_ZK9dA_6
 mfkB6n25Luf2aH49N.tQNXrHepOmhzeUEo5r6acHBvqT4YWO9dzAa4JIKKKC
 jW9idrZq4Xdv0oJ6DA.71wd9Q_0WLdOyy_oFrakoL9ijHISIG
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 03/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Tue,  5 Feb 2019 03:14:57 +0900
Message-Id: <20190204181505.29841-4-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101523_906769_2CBCABE5 
X-CRM114-Status: GOOD (  13.44  )
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
