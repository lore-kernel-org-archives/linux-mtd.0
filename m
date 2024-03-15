Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339A9C54E69
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2024 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSNAAjxmdCcaDv1ktEz2Qbpajcac3QqDFFqmefqFK7k=; b=YUYqqZxPHqt8Fj
	7cLcdtpbekjYYOtrMDGJ+QR5hpmkewQc/oQ5mJEBLc4MEZnDfH37/jfgVZLQe+Q/3MH+TWt7ZwLU6
	M4LdGZ87GtHOd5W7K/i0/1lGkq/A6MZ3tqxDFNy4ewmrkkV4LHF/85g5DuXBLd/gNUGqV7edzKgGS
	YOHdEY3PQQ+l9V7CQxv/U3XhHTK6uR3+PQllodttHWCIONGw/XIIoPK/TyDJ4ZVkrJIzPQY5nAOUu
	MhZKiuRXDXrraa0BZn2QyOJsrtc4M24tXjh8g7muXu4B3iopdxir2nVxoAAOxI6JJFbZCR7JfEUEP
	zJkvuSD3t9DNIFaNgrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl40w-0000000HKg0-3O5j;
	Fri, 15 Mar 2024 09:38:10 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl40t-0000000HKf4-0Tw9
	for linux-mtd@lists.infradead.org;
	Fri, 15 Mar 2024 09:38:09 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1710495479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7oC6Mh1rcfq5r9Zbg+eK8jpikSImT7CV2r1Rsy2JX/o=;
	b=IfEVdjhOZiZO+cU1tvhtj3Zn4UrXqUF6vBMlvzScIIhuqo8lxeAMZM7Jg37ld7nOO4fYpG
	lGxqwzHKD8l6j5tp1nqXMeXDbtLz3Gq8LZORfciq+rFP1/40SuiCYZulFynhX0t8rvx/rT
	BP+gjwCmKwFYTGRVwiv5IjDZD2lNHHU=
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	trufanov@swemel.ru,
	vfh@swemel.ru
Subject: [PATCH] mtd: partitions: redboot: Added conversion of operands to a larger type
Date: Fri, 15 Mar 2024 12:37:58 +0300
Message-Id: <20240315093758.20790-1-arefev@swemel.ru>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_023807_737543_1C99EBA5 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

The value of an arithmetic expression directory * master->erasesize is
subject to overflow due to a failure to cast operands to a larger data
type before perfroming arithmetic

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/mtd/parsers/redboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index a16b42a88581..3b55b676ca6b 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -102,7 +102,7 @@ static int parse_redboot_partitions(struct mtd_info *master,
 			offset -= master->erasesize;
 		}
 	} else {
-		offset = directory * master->erasesize;
+		offset = (unsigned long) directory * master->erasesize;
 		while (mtd_block_isbad(master, offset)) {
 			offset += master->erasesize;
 			if (offset == master->size)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
