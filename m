Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD4CCD8C9F
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0aD4Hfj7tnj7FDKnz8BzkDq85YJhKnia7JSHlJXj1iY=; b=coVoahnTB8rmZf
	3JDxBXbug2FunSawVd4GLl3kobdp6phFmzaoaOGLdCrP3w9xDuxw8V/q4N+WiWTEDINfQkHAL239y
	kH7KFs6wd35F34wW2PqJnj2fChzigU0ar9Non8zT2YuqKNbBHPmKZofodoYpWW4m4Koi08RK1pkrc
	J7sw5CihXDJtpV1Tvb1ktvZvnqccUBTYbVqS6/bKNj6qF7ov/j80R5bS1p/CEphjnRcIP3cFvwYoC
	3jSvU4ANua22Fth5RFoNR5rVI+4inCLK3QBGgniVd3KDxXjaXb9g2PTBKWjX5Tk4LGaeN24usy/+D
	EY+ZEmwhYjZ+5Dg+OmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWhy-00000003F5U-0fBa;
	Mon, 08 Jun 2026 09:55:50 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWhv-00000003F30-25dY
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 09:55:48 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhq-00BRyt-NW; Mon, 08 Jun 2026 11:55:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=W+yU8trTCS2ysnxcAjmBSgusy/BoMx22FcIeM28Wuc0=; b=mzwNQc
	pmRu7sNwWZKLmlabv3eCEsKsj28PEwTYVAgbmxU8WuxSlvJ2JHOFiuUnqLQtSIM7svHv+aSmbwe2g
	q/QLJoMJeKOkwQpCO8xICGWS/9ndod9XYJx3MPCXFLY24UW59iyyMk/Cd163saubfjwrdvly+Q/Y9
	FcIFmPEWM16YncIkVk+Cz68K6rygpaOaa8b0lZRJPBNd6trvQxWrGixndC/J3I7t5fZTn/ORmzqqY
	3rnnc14tGc1bINlHKUZ4SHD58ej6ZpYpFauw1wT3SlYdHurSmb1IZprBu9DqYA/2EEC2cYhWZR/MJ
	0lSOz3yiAeTn9Qm0IfERQh7Wgg+A==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhk-0003b8-U2; Mon, 08 Jun 2026 11:55:37 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wWWhh-00Ag6G-KJ;
	Mon, 08 Jun 2026 11:55:33 +0200
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
Subject: [PATCH next] drivers/mtd/parsers: Replace strcpy() into kmalloc()ed buffer
Date: Mon,  8 Jun 2026 10:55:04 +0100
Message-Id: <20260608095523.2606-20-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_025547_540820_823D748F 
X-CRM114-Status: GOOD (  16.03  )
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

The length of nullname is known (and used for the kmalloc) so use
memcpy() instead of strcpy() to copy it into place.

Use strscpy() and the length it returns to copy over the names.

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

 drivers/mtd/parsers/redboot.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index bf162c44eafe..e1e280b5fa40 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -249,7 +249,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	nullname = (char *)&parts[nrparts];
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 	if (nulllen > 0)
-		strcpy(nullname, nullstring);
+		memcpy(nullname, nullstring, nulllen);
 #endif
 	names = nullname + nulllen;
 
@@ -264,11 +264,13 @@ static int parse_redboot_partitions(struct mtd_info *master,
 	}
 #endif
 	for ( ; i < nrparts; i++) {
+		int len;
 		parts[i].size = fl->img->size;
 		parts[i].offset = fl->img->flash_base;
 		parts[i].name = names;
 
-		strcpy(names, fl->img->name);
+		len = strscpy(names, fl->img->name, namelen);
+		BUG_ON(len < 0);
 #ifdef CONFIG_MTD_REDBOOT_PARTS_READONLY
 		if (!strcmp(names, "RedBoot") ||
 		    !strcmp(names, "RedBoot config") ||
@@ -276,7 +278,8 @@ static int parse_redboot_partitions(struct mtd_info *master,
 			parts[i].mask_flags = MTD_WRITEABLE;
 		}
 #endif
-		names += strlen(names) + 1;
+		names += len + 1;
+		namelen -= len + 1;
 
 #ifdef CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED
 		if (fl->next && fl->img->flash_base + fl->img->size + master->erasesize <= fl->next->img->flash_base) {
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
