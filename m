Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF14CD8C85
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jun 2026 20:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MK805yZGRZmQ4q1y71hKbhxaz02HJmIrGj9QCCPkQ70=; b=pKigV1GXX49BZq
	nxJgnQHWVw7pH3FNFSVOTEA4hQYcZmSp5jnhO7H48QE2djS+zzu9HO1st6D6PUMaYaaUuczokSlyt
	E8RW8/aE9pyHN/lZcIfMpejhowvAKkzBB/rDRCVbBKFaqp7KsLSRxctuTRULVfBh0jJYLUhT6pjXG
	lBhfLp88nixPRaO+WGIYmX77pVqYsMN0nqvRohLz83Rwq0kvWn5wATB9gnQFBX7e3ecTfMIkmEaJo
	FLHWt00iUuO1ueA9AXZYy6d0ZRSkAzlKrwwW0hiIGb8p+c1jDY3Fh/ivnqnKXQQ7tsbW+sfObYLfG
	e3cllv8om4SDyzFdvfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxcG-00000001oE3-0scQ;
	Sat, 06 Jun 2026 20:27:36 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVxcB-00000001oDg-0x5X
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jun 2026 20:27:33 +0000
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxc0-007NTZ-PW; Sat, 06 Jun 2026 22:27:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=d/9GTztrEzzPXewpLi5FMtWP2P8vhwjGmFMrZobrZ+E=; b=C5nqBy
	vCdtOKXayjTSILT/KY8/J23khkIaz9jxUa7FaZqqJg8Rehuzlk73faTUqByLiB4pMBNu3ruYxJC6K
	zVAjgVTWmYF1W3CRfVx5Q5JeYlvCtxrMs845MPpOS4bQt+kCBF7P+vXLzIH/MSiAnICKPjLiPUpS3
	RrZTBf/yM1QcfXWGw+zz0hKh7Dkcu6KXOvSlv3MsyjXhwxbQEBYae9YlShitvN5mGeKq8FY4SMAbz
	jKX6eeOlbeoUNq+yqSzKgQbUNnE04v28ubZCFy2B0v1NwxcV890chn1287/S2mxCSum4v6mPag0n3
	RLIjzHCZ+JqwA+tt2aVZSac4ns3g==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wVxbv-0000u8-6n; Sat, 06 Jun 2026 22:27:15 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wVxbp-006V18-2Y;
	Sat, 06 Jun 2026 22:27:09 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	Arnd Bergmann <arnd@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/mtd/devices/block2mtd: Replace strnlen() strcpy() pair with strscpy()
Date: Sat,  6 Jun 2026 21:26:33 +0100
Message-Id: <20260606202633.5018-39-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_132732_051061_34C19E93 
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

From: David Laight <david.laight.linux@gmail.com>

Use the result of strscpy() for the overflow check.

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

 drivers/mtd/devices/block2mtd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..466a061fa9bd 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -415,12 +415,11 @@ static int block2mtd_setup2(const char *val)
 	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
 	int i, ret;
 
-	if (strnlen(val, sizeof(buf)) >= sizeof(buf)) {
+	if (strscpy(buf, val) < 0) {
 		pr_err("parameter too long\n");
 		return 0;
 	}
 
-	strcpy(str, val);
 	kill_final_newline(str);
 
 	for (i = 0; i < BLOCK2MTD_PARAM_MAX_COUNT; i++)
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
