Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C980BC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:39:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3E720818
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:39:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDYp0krr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="U079N04b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3E720818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a4GvOC5ah3hIpLyh1inzSwdioTksjCCdcwcXCj6O8bA=; b=oDYp0krrgfYpjJ75tZdtusqW2R
	gG8NLHHSr+Od7RtQygqcF9peia17y8bnuQfQswCPMx70zMKmd0Qf6IL7OCbhKp6U1DIHl5CYBWLnL
	PQxXCZAvhPFkHWkLAAEGCCsdibxAycWEgZZrMMqvClMyaXx0bVvBV87HtBB+iKg7dqHNagbT2is+B
	KEMmvcu767Au7LlHM4rDN32c3A0wAsfZzf5X7+q82vY/xZH+c0HFmzUsj73/inZ2taVpbTsJ3UlKM
	WGiqlYhm/KiX2igPM0OWexsA6gzu7zeyZd+A9+b1p9Q2ZOmdtc2fVw5JtVr31sdftNf0cuE61G4P8
	u+KaG28A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiD4-0004fj-Md; Mon, 04 Feb 2019 17:39:06 +0000
Received: from nh604-vm11.bullet.mail.ssk.yahoo.co.jp ([182.22.90.68])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAn-0002Qm-4i
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:52 +0000
Received: from [182.22.66.105] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
Received: from [182.22.91.206] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:43 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 264155.14461.bm@omp609.mail.ssk.yahoo.co.jp
Received: (qmail 78258 invoked by alias); 4 Feb 2019 17:36:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301803; bh=z9g6QKg/BOEgpLT02uEWJrxw675rWoZ/FfHUE+Pf6YQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=U079N04bpznHGkRcwo8hTnscal/x2hfTuW7R8xHGF1ACkFTlysqMmxdr4MLD53R9+MHKwv9hbzUHeTebYKrTpwMTpWEP0B1fABn28ibCAtKJI6+W4jp6sDHPucKesg+FLaVt/ji2Cb3HwyJifihMFNRyrxKcMrk9peEuTbIVO/U=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=b64MdGkeKox//cXB6ytbf6L23/LHlE+YdriQtBLCB6NP/ZQAZPfVQkzJpPAdDw2StWIR415P2qjaLXl1VCJBIzvSzvctVsdloJeoTCwLRrJcZy0BkLIzOEz44zVWFlk0SqVPvFrLO9TW61JDfYwpbr5OlinoTOHtYaIS64HOit8=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:42 -0000
X-YMail-JAS: 8bTrFDUVM1kjI8eAiCJW66ghnSqZxAUn197J7xv_aRxMXZz_qmckdhSZXo69KWOHqZNZAWRxMyzWMin9u1dqYJYz5m_ZoB1RavjQd653k04jGN5ZqZ.PxyzSGESKInZD_R6kD_RFag--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: ayUxB30VM1lHf9bxXHnyEk6T1thNwgWY6WovBGOIOFqc1dj
 G78_PVFKQQYi2IpyGFhTiDAIJqOa1WRpSaI6eT7d1be6zOO06.lEId.HiBnm
 FcGRBSuH9p.vuYrrQ29HOLSpFcEsFxaMp7ZrvC8OOZVDbCfXmCjCNHYPJ3xr
 GlEv.qzcbPaFA0mVLsKtF0c3barpFmbtUAQnQ.zCaX5ODabhJl95i2Na8Fei
 Xo7wrwAXizMSDZaJ4QCfEymt86Wpu1cmNHE44WVxk_t_QI6W5kpD9eCuSrt6
 26ak7QNt4u3FYsqcLugF0aFfu9GYi3FISmW9p26TkEEzjyk3Unr3EZtbhYjh
 3e5n7k_s1ZhMN5rD7YNR1sP8NDIKl5b8n36a6_jlKvXjaUrUPooay.wxbiII
 KbHDgaKgBia5nRCtS1WInqqlNnS8.72cQcUw7RxMVGCmIFPYc1YOhg_4LWDP
 BD2nwKf.o72Fs0Jtth9ZV7xmFhDbIrlBpCkpppHnzLrDG9JIcvSmHTvF2tvC
 Y8Fn.AtcQL1MNlrEQVKH.0nafIy6IgsLQMmzwTGlCJmYBOfdbEiVkGz7_CRb
 j0ScMQnjSDF46UdHz1xJSL5.zaqcMJUA2SbZxe3ZzJ3WGeTjy
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 09/11] mtd: cfi_cmdset_0002: Split write-to-buffer-reset
 sequence
Date: Tue,  5 Feb 2019 02:35:48 +0900
Message-Id: <20190204173550.29703-10-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093645_580196_7B2B399D 
X-CRM114-Status: GOOD (  12.58  )
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
