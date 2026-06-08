Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56C9CD8C9F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cN/1L8x0OXnOZPeixgdf6Bgj1rqJJ+9syNTmFCuKKHs=; b=t8gWvCazl3qOe2
	0j6qXsGFxIFz0jGz9MYWHAkotZpGWzBdAq9tDcxI2PcpGUnuLVUJ/bIGAUqdCcI16fshJTeB3AbxD
	RjiW5F2aSxq8LSjmBMuoQEQtOvE2r5Y//OV4Hs5hdMJFFFa/Z70Bv4Zk2SpFoUUubXHlrak8a+esb
	R2psCS9bMQ5+QTqguxhoFexAi29L4Kovgwgqhe0hAo7zDWFILy/3zAp6+Z9mc5F8lmwX48yYHiT5+
	2fyGkuXwbAEvzFOl8GVqqMTxibgE6bIKMoYi4Rf/C8xNyID6L2QqGyOPjS9d0IBExRR5Pljjzxzv0
	wiR4hCqssugI1q6Ft41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWhe-00000003Eyq-3n3X;
	Mon, 08 Jun 2026 09:55:30 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWha-00000003Ex0-3F0f
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 09:55:29 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhR-00Bqzw-V8; Mon, 08 Jun 2026 11:55:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=dvVQtq6KmzTF2DSPmceFBElb1g/eXFZc7duQz7yINc4=; b=S4ch9n
	mN82TLI48npOG95U+9sDywV9FBPTkUkEH33/D3/2YWCdF1sV8y+7hUAnZF6Kt3KxK9c7iF9QVdDE1
	TZNHOlWe4ve3x1b9RXOqmPSf4wt0wm8s3YMpUGjz5RTQ3T3BosxUKOitkinsvXUJ3NWMbaHyJ+M1O
	ncVkEzD0f8TgiQgnGrADDw8lgOaPT70NgXdFRRiLmhoNQLOy9hkHDaJTN9w/nKQmFufOlmFGctz4+
	f1qGlPRbTz/u5A4Ev+/fH0Hxkc2wsUQe2bB05b8V+uw+b81hl2P0v5E/4IbTPk59FJI/V/tLauIQH
	FbW6c39U4MHQL2ZiwMnNih1D06mQ==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhR-0000C7-Dm; Mon, 08 Jun 2026 11:55:17 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wWWhF-00Afz8-Fp;
	Mon, 08 Jun 2026 11:55:05 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/mtd/ubi/build: Use strscpy() to copy strings into arrays
Date: Mon,  8 Jun 2026 10:54:58 +0100
Message-Id: <20260608095500.2567-3-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_025527_699865_B3377B4A 
X-CRM114-Status: GOOD (  14.44  )
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

From: David Laight <david.laight.linux@gmail.com>

Replacing strcpy() with strscpy() ensures that overflow of the target
buffer cannot happen.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/mtd/ubi/build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 674ad87809df..e7097d85035c 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1497,7 +1497,7 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 		return 0;
 	}
 
-	strcpy(buf, val);
+	strscpy(buf, val);
 
 	/* Get rid of the final newline */
 	if (buf[len - 1] == '\n')
@@ -1512,7 +1512,7 @@ static int ubi_mtd_param_parse(const char *val, const struct kernel_param *kp)
 	}
 
 	p = &mtd_dev_param[mtd_devs];
-	strcpy(&p->name[0], tokens[0]);
+	strscpy(p->name, tokens[0]);
 
 	token = tokens[1];
 	if (token) {
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
