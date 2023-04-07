Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFE1C77B61
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Apr 2023 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7nCaIK+7Il2w+8PpjrHxwEXPMBmRb5+kXUj2ArwJdug=; b=U06lNsBycmu4yF
	E0ZtIFh0TJklrOYaINTxtDd7d6JvIU2Rbq4hqCeQm8IGTRwHX2VloNJT6ij80MGtdLq4m2EPLRSWu
	5BWk8XAQ+zo9S4yQy9aFnXVFMNC5aPuSDN+03XyRlDgR44DjIXD2axXA5CzZI+jJZI/na17CDer+P
	Vst/XAAiaSbztHiTwMKcrVYw0gcJlvf2hZPkvcQubLVrYwj+evOC5tSwJuzxstRvXJtms6dt0K8qF
	fJ+vdD08tHuyEWopMcRpfzcGM27L4LFvJsYjnNRwM9kKVFQcDnttUcM/1US0wxI1U7KYy5ZNXpUFq
	buxKM/ufLyhDI5pNHu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkpWH-00Am2Q-1T;
	Fri, 07 Apr 2023 17:05:01 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkpWF-00Am1p-0U
	for linux-mtd@lists.infradead.org;
	Fri, 07 Apr 2023 17:05:00 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55AEC21D72;
	Fri,  7 Apr 2023 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680887095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OP+WQoqp5N6LD5bTBcxYrhZCAveaV/0KikGNAEyK220=;
	b=Rl5rPqtWZskhI9Ty3Bk7hN3/0M3GBUF9uKToD4wVcKEd0o0uUr9rnL7alvC7FZoYg3J73r
	65nuOW38/cVxkB7kI9TsXHA/xAcLQ3cFCd2U4brzPx1P2s/GaxcX/d3s0HT5HjW97LaFIm
	RJNyNvr0NMtui5s0b4cOHc57dp98NqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680887095;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OP+WQoqp5N6LD5bTBcxYrhZCAveaV/0KikGNAEyK220=;
	b=akaAwtwzT4XP6KUz0DCzUUe08sh+JE8HKAjMiuke0R2hFKA2vmj6S7tj3cWabWyxZ4Uorc
	wxtiUUhpCbQChBCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B2ED133FE;
	Fri,  7 Apr 2023 17:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hOzGBDdNMGR4PAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Fri, 07 Apr 2023 17:04:55 +0000
Date: Fri, 7 Apr 2023 19:04:53 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Kyungmin Park
 <kyungmin.park@samsung.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: [PATCH RESEND] mtd: onenand: omap2: Drop obsolete dependency on
 COMPILE_TEST
Message-ID: <20230407190453.66efdf9d@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_100459_355837_0B96B413 
X-CRM114-Status: GOOD (  13.86  )
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

Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
is possible to test-build any driver which depends on OF on any
architecture by explicitly selecting OF. Therefore depending on
COMPILE_TEST as an alternative is no longer needed.

It is actually better to always build such drivers with OF enabled,
so that the test builds are closer to how each driver will actually be
built on its intended target. Building them without OF may not test
much as the compiler will optimize out potentially large parts of the
code. In the worst case, this could even pop false positive warnings.
Dropping COMPILE_TEST here improves the quality of our testing and
avoids wasting time on non-existent issues.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
---
Even though this was supposedly accepted a few months ago already, I
can't find this commit, neither upstream nor in the nand/next,
therefore resending.

 drivers/mtd/nand/onenand/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-6.2.orig/drivers/mtd/nand/onenand/Kconfig
+++ linux-6.2/drivers/mtd/nand/onenand/Kconfig
@@ -25,7 +25,7 @@ config MTD_ONENAND_GENERIC
 config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
 	depends on ARCH_OMAP2 || ARCH_OMAP3 || (COMPILE_TEST && ARM)
-	depends on OF || COMPILE_TEST
+	depends on OF
 	depends on OMAP_GPMC
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 SoC


-- 
Jean Delvare
SUSE L3 Support

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
