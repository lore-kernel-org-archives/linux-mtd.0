Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1114606A326
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 21:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUS5MT3c;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=DfQ1D8jq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/1Ab5Gxb+yUOH1reXh9gF113uID3AvEfvsBzT3JbT+8=; b=xUS5MT3cHhuJ7vbS6hNUZeDqMp
	KAVBZEM7SICb59W8tkQUDVQsJnRUiliZVweK+sy7la+cLsmolfleT4Em3b/0MFHgjQqU9GsV39HpZ
	URfw2tqX38j4SEw3NYTrlXRATnqL+f3K2SQx2LjW9fb8WBMdDNwim1XCariZGqF1TjDnV67G2dD4q
	g3hGnaiJRoyb75TlIH2o+xKbUqNMthyu+GQBMgU+IyaJ+/bNN+EmILyu7l2IqC8cWSxxbqeY7ljdM
	GLjv/VnEs0i9k6h5TXTCkD1N7Q4sZLpUm835tatoWiN/K6ZSAsgqT7UeLXxfePwhSj30NR9LVpwr8
	X1RekdWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR7b-0000000DeDQ-0h2x;
	Fri, 06 Nov 2026 21:05:15 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPR7V-0000000De4t-0NCb
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 21:05:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jLsBn5Srkz1XM0nt;
	Fri,  6 Nov 2026 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793999101; x=1796591102; bh=zEQFtyuBkdyKKBuW0Kh8GMzWm2rOcSjD9Nn
	36fEIIAs=; b=DfQ1D8jqexoyxiIZ07fqtjKqWkBrbl1UTvvzGlpspYlUyLcpex7
	dYkEkcwzcBQJDo9lsvY/Y2rl6+HU8vfqriX+GpT4wcIdjuF9s5XElKULJJ3DRupB
	T7Ty0J08oLMYtGhlkbOykWEELp8nMdbj8+oxHhgjGBgWHcA20gapSLmlj5cNZxeT
	UchkfRwjVcwAtgbaKSSC8UuiByWP+3mh4X5GNUIun9/mhtPeMwRYrOvbeLKhgatO
	foSkIJcQD9U8Ka5Z//Muy5U2BVgECSNIo1fuhGFrlgjgWNBsdzj67x6P2WiwxeBP
	mIC2dUg/KUc9O6/aV/ZAErxIF1h5rxRzxtQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0IBcUNscV8yE; Fri,  6 Nov 2026 21:05:01 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jLsBj3P2Xz1XM0nn;
	Fri,  6 Nov 2026 21:05:01 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
Date: Fri,  6 Nov 2026 13:04:53 -0800
Message-ID: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_130509_163556_6777090F 
X-CRM114-Status: GOOD (  13.79  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
called after spi_nor_ready() returns 0. If the flash is already ready on
the first status check, the function returns before reaching
cond_resched(). This happens e.g. under QEMU, where SPI NOR page
programs and sector erases complete synchronously during the MMIO write,
combined with a controller driver that polls without sleeping.
Consequently, multi-sector erases in spi_nor_erase() and multi-page
writes in spi_nor_write() may iterate over thousands of sectors or pages
without ever yielding the CPU on kernels built without
CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
This triggers soft lockup and RCU stall reports.

Move cond_resched() to the start of the polling loop such that every
call reschedules if needed, even if the flash is ready on the first
check. Doing this in the shared wait helper instead of in the
spi_nor_erase() and spi_nor_write() loops covers all callers that wait
for a program or erase operation to complete.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e..3e3b727d262e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -653,6 +653,8 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 	deadline = jiffies + timeout_jiffies;
 
 	while (!timeout) {
+		cond_resched();
+
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
@@ -661,8 +663,6 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 			return ret;
 		if (ret)
 			return 0;
-
-		cond_resched();
 	}
 
 	dev_dbg(nor->dev, "flash operation timed out\n");

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
