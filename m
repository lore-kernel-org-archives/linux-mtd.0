Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 968FAD68B33
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 15:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9wyg+wHKsUbgn3QNMUpA+7TWshYAk/Isc6YbiW6a/94=; b=JNwCzqmFGbeoHx
	YRDnzVRqdXnSERTQ38LetHTqF339QisKwrB7JXHz2fxI6ZMRvq4tJa4GXcsS1CGaPiUir0ErJDOV9
	ku1j4KMVv//rgpdtMnQhXpx31Do3jln3aQYGjkRoXSp76qeURFtCffnAPpYBw6eMFfpTWYtyHAacV
	A2SQ/3He7cenf4mkeDfu56PcDxCP9XI74gl/VuXhib4IyWRV+oqc+Cof4hpUelxcTHF7SB/x2NV2i
	LZYaqHDf0ZXUmA6ztoDy9ylE87d3BLRHPA8z0uqgfU+oync2SA1+/66YZFJ8YZbwFiHS7sRJByphU
	XZYvBVeTPEA5AncnV7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc1m-000000006Vp-0Pkc;
	Thu, 14 Nov 2024 15:45:02 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBc1k-000000006Tu-0Bs8
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 15:45:01 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9A9541F395;
	Thu, 14 Nov 2024 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731599096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hEaTFTPS7VTSPviuCZqEa/J5zdrMvi33ihFfVdd06hQ=;
	b=IJqN0dOYfQV/LHIndmzBQPkDJ1oA8TpQ9AVUIRjTCmSgLboQl3Ew9XUdZ3Ws9ae9tKIl74
	gjLLgDpaH41Tl28zghBKv9ZgzgvPnCyssQvST17qxuik2ZN82T3sop1zJ9TXmsp85DOT4D
	FcZSoPjtLI0UsUbjXybYgImvbc+C6N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731599096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hEaTFTPS7VTSPviuCZqEa/J5zdrMvi33ihFfVdd06hQ=;
	b=AhN6g7byLAzrYgH9f4jjBoa1ox2B3k3FPS1PAE/FiL3wcnf4Qmqt1jXn7Ltmciiq+RPxOr
	3WmsJhjwumxIfiBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1731599096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hEaTFTPS7VTSPviuCZqEa/J5zdrMvi33ihFfVdd06hQ=;
	b=IJqN0dOYfQV/LHIndmzBQPkDJ1oA8TpQ9AVUIRjTCmSgLboQl3Ew9XUdZ3Ws9ae9tKIl74
	gjLLgDpaH41Tl28zghBKv9ZgzgvPnCyssQvST17qxuik2ZN82T3sop1zJ9TXmsp85DOT4D
	FcZSoPjtLI0UsUbjXybYgImvbc+C6N8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1731599096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hEaTFTPS7VTSPviuCZqEa/J5zdrMvi33ihFfVdd06hQ=;
	b=AhN6g7byLAzrYgH9f4jjBoa1ox2B3k3FPS1PAE/FiL3wcnf4Qmqt1jXn7Ltmciiq+RPxOr
	3WmsJhjwumxIfiBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60DBA13794;
	Thu, 14 Nov 2024 15:44:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aR5MFvgaNmdhDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 14 Nov 2024 15:44:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Fabian Vogt <fvogt@suse.com>
Subject: [PATCH] mtd: phram: Add the kernel lock down check
Date: Thu, 14 Nov 2024 16:44:41 +0100
Message-ID: <20241114154442.25920-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.de:mid,suse.de:email];
	RCVD_TLS_ALL(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_074500_232727_77713503 
X-CRM114-Status: GOOD (  12.41  )
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

The phram MTD driver may map any memory pages no matter whether it's
reserved or whatever used for systems, which basically allows user
bypassing the lock down.

Add the check and abort the probe if the kernel is locked down for
LOCKDOWN_DEV_MEM.

Reported-by: Fabian Vogt <fvogt@suse.com>
Suggested-by: Fabian Vogt <fvogt@suse.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/mtd/devices/phram.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 1bf192f229d7..48abfb81ef66 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -30,6 +30,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/security.h>
 
 struct phram_mtd_list {
 	struct mtd_info mtd;
@@ -410,6 +411,10 @@ static int __init init_phram(void)
 {
 	int ret;
 
+	ret = security_locked_down(LOCKDOWN_DEV_MEM);
+	if (ret)
+		return ret;
+
 	ret = platform_driver_register(&phram_driver);
 	if (ret)
 		return ret;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
