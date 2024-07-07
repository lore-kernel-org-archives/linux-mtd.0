Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A0C3DA40
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Jul 2024 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S0Hx3CsiN0qd9KbY/MSFn5p+OLAdlEUs5AJgljliHQM=; b=GbJN+XeUoc5c8q
	cvov/gtaF5W36f2GlKrvu98efsaRf7g25PWkdj9lzDzYjF2bmkE1NBBqTL775XpWBeIYW+G/ruK13
	Sm0brOWXEWbxwBphi43SbE3OgtzivRufSnj5wbvXaLcgdsSr3XKOH1zvFFm/pG7J4/77Fd/LsilT6
	njg/8V4RJB9xq7SPmdlVQS56/Ycx1cY7O6MHxm8qlHjFILPB/cJl/YAxMz92bKW6ZHixRG7rNRPaR
	bwa8POH5WM+oY9nm30L98lL35fH+/8oIS+rksjiinW2nW7HTo2OduZHe3RAT93SJAdzsxS3CSMbcb
	bK1pUK4iR9BQHz2Z67fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQOQN-00000001bPV-48Kx;
	Sun, 07 Jul 2024 09:43:15 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQOQK-00000001bOe-07lg
	for linux-mtd@lists.infradead.org;
	Sun, 07 Jul 2024 09:43:14 +0000
Received: (wp-smtpd smtp.wp.pl 10092 invoked from network); 7 Jul 2024 11:43:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1720345387; bh=CVIbqEHK9s+AkubKdyBU6i0P/CUzIgLv+yRoav3XzW4=;
          h=From:To:Subject;
          b=ZCdogprdvtndoWuA5YoiHsc64bHbIHIhtkzq0tFMAvxJMAI5kJy9ZXLzd85pJUqVR
           TTA0o7A+sHKeJ8J032QJRJMquh87jhugLxzS8QnIOJn88xsLXxW/OyDmnGF6iv4OER
           hcJOVeGNF+DWvxEDctureWWXXHNeeUxKDWSNj7g8=
Received: from 83.5.245.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.245.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ms@dev.tdt.de>; 7 Jul 2024 11:43:07 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ms@dev.tdt.de,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linus.walleij@linaro.org,
	nico@fluxnic.net,
	olek2@wp.pl,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/1] mtd: cfi_cmdset_0001: Disable write buffer functions if FORCE_WORD_WRITE is 1
Date: Sun,  7 Jul 2024 11:43:02 +0200
Message-Id: <20240707094302.784948-2-olek2@wp.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240707094302.784948-1-olek2@wp.pl>
References: <20240707094302.784948-1-olek2@wp.pl>
MIME-Version: 1.0
X-WP-MailID: 9b284323245603c8a33756b45b75f870
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [UdNQ]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_024312_550731_BBDF11D1 
X-CRM114-Status: GOOD (  10.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Some write buffer functions are not used when FORCE_WORD_WRITE is set to 1.
So the compile warning messages are output if FORCE_WORD_WRITE is 1. To
resolve this disable the write buffer functions if FORCE_WORD_WRITE is 1.

This is similar fix to: 557c759036fc3976a5358cef23e65a263853b93f.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/mtd/chips/cfi_cmdset_0001.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index c10693ba265b..5404637e54e2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -62,8 +62,10 @@
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#if !FORCE_WORD_WRITE
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_writev(struct mtd_info *, const struct kvec *, unsigned long, loff_t, size_t *);
+#endif
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -305,6 +307,7 @@ static void fixup_use_point(struct mtd_info *mtd)
 	}
 }
 
+#if !FORCE_WORD_WRITE
 static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -315,6 +318,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		mtd->_writev = cfi_intelext_writev;
 	}
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /*
  * Some chips power-up with all sectors locked by default.
@@ -1720,6 +1724,7 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 }
 
 
+#if !FORCE_WORD_WRITE
 static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    unsigned long adr, const struct kvec **pvec,
 				    unsigned long *pvec_seek, int len)
@@ -1948,6 +1953,7 @@ static int cfi_intelext_write_buffers (struct mtd_info *mtd, loff_t to,
 
 	return cfi_intelext_writev(mtd, &vec, 1, to, retlen);
 }
+#endif /* !FORCE_WORD_WRITE */
 
 static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 				      unsigned long adr, int len, void *thunk)
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
