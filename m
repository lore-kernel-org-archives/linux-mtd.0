Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2021CC7EE22
	for <linux-mtd@archiver.kernel.org>; Sun, 14 May 2023 09:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVRDq45a+UelZigr2y66CQUzuJCff27htBpOgPcK5rg=; b=2wX4NqbPGkP3yB
	f6PyGFMElwfHN5GdhBH4ATaciR9zOImr4niXEybmls3VaJcr3LLBR2QNH8xcUBPfHcvNmff6HMFav
	raV+j2WKYUn4t72zOdqr4XPkB4OJofyGh/XmcoFMLz1nOtW/+k+BYhZwtfVqzNtTt/gOIn6Iz9o2H
	nZ4doog6sviPIcd7uuwigMG4FGUjEhCRvLV0/raqd8fyuuKrGwUhzYPfmWknfXNk3xVWCPw2cVOiV
	IRBLZ7NOUeQwhs1xyiH/9sLO7JrAkr85jSMZK1PQbQLYMTutsGpHTrJgK9UdzKo1oGyiDD26NWwha
	fGMFR8/FKpm9qHWChWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1py8Cp-00Grnr-02;
	Sun, 14 May 2023 09:39:55 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1py8Ck-00GrnI-2J
	for linux-mtd@lists.infradead.org;
	Sun, 14 May 2023 09:39:52 +0000
Received: (wp-smtpd smtp.wp.pl 30791 invoked from network); 14 May 2023 11:39:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1684057180; bh=9X4Aik96rC7qqmmYlE08FycZCCqFGLDNGNT88xeEStE=;
          h=From:To:Subject;
          b=eUjJuTeuXiTtdiQAQRm0+804WnQu0nvGYlwfsE3Yr12gCluTBDVQHs3ofLEFeDYqk
           hOINnJAmPIYXo2skqjhvvYdYeXnjwrTiw93hRjhuFKNWfnURv7BHiY9mwmXBANUI3d
           TVceNRWDaGk88xylTqIiAT/bPC9SbBkYurMp8fck=
Received: from 79.184.247.17.ipv4.supernova.orange.pl (HELO LAPTOP-OLEK.home) (olek2@wp.pl@[79.184.247.17])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <miquel.raynal@bootlin.com>; 14 May 2023 11:39:40 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	olek2@wp.pl,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: cfi_cmdset_0001: Disable write buffer functions if FORCE_WORD_WRITE is 1
Date: Sun, 14 May 2023 11:39:35 +0200
Message-Id: <20230514093935.4679-1-olek2@wp.pl>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-WP-MailID: 4044979a10be0e33303665ee941e3f2b
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [QdPk]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_023951_245221_A18B2942 
X-CRM114-Status: GOOD (  10.69  )
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
index 54f92d09d9cf..8f7223221db2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -61,8 +61,10 @@
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+#if !FORCE_WORD_WRITE
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_writev(struct mtd_info *, const struct kvec *, unsigned long, loff_t, size_t *);
+#endif
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -304,6 +306,7 @@ static void fixup_use_point(struct mtd_info *mtd)
 	}
 }
 
+#if !FORCE_WORD_WRITE
 static void fixup_use_write_buffers(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -314,6 +317,7 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 		mtd->_writev = cfi_intelext_writev;
 	}
 }
+#endif /* !FORCE_WORD_WRITE */
 
 /*
  * Some chips power-up with all sectors locked by default.
@@ -1703,6 +1707,7 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
 }
 
 
+#if !FORCE_WORD_WRITE
 static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    unsigned long adr, const struct kvec **pvec,
 				    unsigned long *pvec_seek, int len)
@@ -1931,6 +1936,7 @@ static int cfi_intelext_write_buffers (struct mtd_info *mtd, loff_t to,
 
 	return cfi_intelext_writev(mtd, &vec, 1, to, retlen);
 }
+#endif /* !FORCE_WORD_WRITE */
 
 static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 				      unsigned long adr, int len, void *thunk)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
