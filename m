Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CA5C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:02:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57B564E77
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 17:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57B564E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mailfence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkewCA9Dmz/WVAp+Q/kaAnTR30nzdlbOFu6/VslG+C4=; b=B/gzrmi1M8b4oc2zr94XOSBYHI
	KEAnne4PsC3tc8K1jC2Lp5u2ft+vz+g5iudg9DdsDcMwiRMu4wN0YqXPmktglq7GOe6EEapWGRE51
	+kfWckMXlTyjPRkacr36azK68uTRh/d/CmaubHVCHCwFX0ROrdeJ70UFwq+agW5/vIqsqUYY5vm/v
	2sdWNXqZnVFJLtTp+IdbXOaK9PfBPVbJBKJjbOlTkqdU+bLlvXKvwlszei2B+w4XF/uQ22vE8B3QI
	huNM/+SD/CQezHDTmaaunowVrit0d8SssElr1PNQpOiimxUvaVv5EWwjMPsS2LlYMmDTaFncM05Mt
	kjwvJAXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEb3z-0005xc-W1; Tue, 23 Feb 2021 17:01:32 +0000
Received: from mail.kapsi.fi ([2001:67c:1be8::25])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEb3w-0005vl-R0
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 17:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2WJIFDcEDFP9WY83WwiGCFaHX35Xhcf/eXTXQ9sw7no=; b=OlVlY1/WyY215zNC4wUNNm/OnP
 h71zCxwZvJvl967156IbbGr3mAxc3ZGdCy3m2rXcB7/QRdfzk3dI71tFideO6ZAsIiLaavGXTz+EZ
 Ta0+Gtyvb59ZCx98KBUPQfZpTG3EX93YlpKCl2zSW3SOXf/YEkPDoYJjpbwYNpmqC93lauH7bR4rg
 09LN4gayjOMG7MIaa9chPspf3Wn8kWoEgHV57h0g62/9s0ljNWE7ndrW6rhmELhAvOv8Sza24SjIl
 FD3QInE0HHqUICbaWiI8E39fNjn5Ta+jIYTsrkfRck0EFqSeBYp8t6799+Oz3ubYkQn5+Rtwnu1R+
 OHAOmc8A==;
Received: from 194-168-191-90.dyn.estpak.ee ([90.191.168.194] helo=ubuntu)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <sandberg@mailfence.com>)
 id 1lEb3q-0005Ac-SS; Tue, 23 Feb 2021 19:01:23 +0200
Received: by ubuntu (sSMTP sendmail emulation); Tue, 23 Feb 2021 19:01:15 +0200
From: Mauri Sandberg <sandberg@mailfence.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: chips: AMD chip 0x2201 - write words not buffers
Date: Tue, 23 Feb 2021 19:00:52 +0200
Message-Id: <20210223170052.963927-1-sandberg@mailfence.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 90.191.168.194
X-SA-Exim-Mail-From: sandberg@mailfence.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_120129_161850_D7A22FD7 
X-CRM114-Status: GOOD (  13.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mauri Sandberg <sandberg@mailfence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CFI flash memory driver cmdset_0002 uses buffers for write operations.
That does not work with AMD chip with id 0x2201 and we must resort to
writing word sized chunks only.

This patch creates fixup mechanism that renders a chip to use word sized
write operation and adds that as the last item in a fixup table, shadowing
the entry that causes use of buffer writes.

Without the patch kernel logs will be flooded with entries like below:

MTD do_erase_oneblock(): ERASE 0x01fa0000
MTD do_write_buffer(): WRITE 0x01fa0000(0x00001985)
MTD do_erase_oneblock(): ERASE 0x01f80000
MTD do_write_buffer(): WRITE 0x01f80000(0x00001985)
MTD do_write_buffer_wait(): software timeout, address:0x01f8000a.
jffs2: Write clean marker to block at 0x01a60000 failed: -5
MTD do_erase_oneblock(): ERASE 0x01f60000
MTD do_write_buffer(): WRITE 0x01f60000(0x00001985)
MTD do_write_buffer_wait(): software timeout, address:0x01f6000a.
jffs2: Write clean marker to block at 0x01a40000 failed: -5

Signed-off-by: Mauri Sandberg <sandberg@mailfence.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a1f3e1031c3d..b8b564342062 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -279,6 +279,12 @@ static void fixup_use_write_buffers(struct mtd_info *mtd)
 }
 #endif /* !FORCE_WORD_WRITE */
 
+static void fixup_use_write_words(struct mtd_info *mtd)
+{
+	pr_debug("Using word write method\n");
+	mtd->_write = cfi_amdstd_write_words;
+}
+
 /* Atmel chips don't use the same PRI format as AMD chips */
 static void fixup_convert_atmel_pri(struct mtd_info *mtd)
 {
@@ -470,8 +476,10 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #if !FORCE_WORD_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers },
 #endif
+	{ CFI_MFR_AMD, 0x2201, fixup_use_write_words },
 	{ 0, 0, NULL }
 };
+
 static struct cfi_fixup jedec_fixup_table[] = {
 	{ CFI_MFR_SST, SST49LF004B, fixup_use_fwh_lock },
 	{ CFI_MFR_SST, SST49LF040B, fixup_use_fwh_lock },
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
