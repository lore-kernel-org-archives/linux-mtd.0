Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73877E64A80
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A0cybGbbhGHfTWfxYh67Fg4WPgcGxg9KepVdwAGGwkk=; b=oKoQtWZaHPkHWb
	3XElq8b6REJHBs5xuuQNaoiCXI/qn3YxHWAaYronm+zmdklSB9AQSPANEzB6N0qhCF+ZoQgWuMlwQ
	4LKy13NfU8fMJEc8oXcoZnt5JDi5rQOjUTzSEfduBIDuwzCnpg3ww55tQc3HTcn+YagAUFSGmTkeR
	cXQWYJjtBgLo5tsZxxa6pAnZzepBLtHNl8MlqlBj16nW5lJZXOYop7ReH7VmP24NOGzVUzZ5q/0xQ
	PbAVWRyT1a9Ie0dWfaaU+EHv7GvPCFC+/0EZuxeNk8iMTRjTF30AR+9vAYv1/NP3aPx5fU0Y0MCo3
	HeWVc3b3lintY275SfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRL2-00000009JTB-0Tj6;
	Tue, 03 Dec 2024 11:45:08 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIRKz-00000009JRq-44oz
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 11:45:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 466E62F25C4;
	Tue,  3 Dec 2024 12:45:00 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8VtyKen3NMH2; Tue,  3 Dec 2024 12:44:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DA52F2F25C3;
	Tue,  3 Dec 2024 12:44:59 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lXYm7QGBvPwX; Tue,  3 Dec 2024 12:44:59 +0100 (CET)
Received: from foxxylove.corp.sigma-star.at (unknown [82.150.214.1])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 933E42E612F;
	Tue,  3 Dec 2024 12:44:59 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	kinsey.moore@oarcorp.com,
	richard@nod.at,
	dwmw2@infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] jffs2: Fix rtime decompressor
Date: Tue,  3 Dec 2024 12:44:39 +0100
Message-ID: <20241203114439.6256-1-richard@nod.at>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_034506_153977_9EAF301E 
X-CRM114-Status: GOOD (  10.25  )
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

The fix for a memory corruption contained a off-by-one error and
caused the compressor to fail in legit cases.

Cc: Kinsey Moore <kinsey.moore@oarcorp.com>
Cc: stable@vger.kernel.org
Fixes: fe051552f5078 ("jffs2: Prevent rtime decompress memory corruption")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/compr_rtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 2b9ef713b844a..3bd9d2f3bece2 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -95,7 +95,7 @@ static int jffs2_rtime_decompress(unsigned char *data_in,
 
 		positions[value]=outpos;
 		if (repeat) {
-			if ((outpos + repeat) >= destlen) {
+			if ((outpos + repeat) > destlen) {
 				return 1;
 			}
 			if (backoffs + repeat >= outpos) {
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
