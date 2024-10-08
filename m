Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5907DCEF174
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=irMWVcTPnkyjqXWyP99YZzC++eLq5BD0irIDzUCSpyE=; b=u4QqL6LHE7arpr
	+SclJSTKLrsqGQQtUnPIYpPzC1L7soLxNElo62ZHHDArWvIBY9FeJQdWbvKH5qYADdnllscqnzlcy
	ItNY9vg/7FrPZJUYIwVIbv5cnwZlrQ7k9conDeRNBCTpkUGWyd/BhtMn+GHyVAtZOqtmMCgJUQXz6
	PKiP9xzmZ3LwDN1Ar2MjWMmcAoZ7phwmK9FWEUpVyLjcJu5D9kH2FsJB6DiPVz8FSm8H201OGD2HW
	h6dZ1oDGRa4OvKy7fRQ1kUJnX/z7Dt2aINtwyDDbxhoSJYtw6KbqtBRgyJVQuB18XMsrMoH8C/Vuj
	RSR6j8s2o2QDRjpWT0mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syASZ-00000006242-0kRD;
	Tue, 08 Oct 2024 13:41:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syALd-000000060cX-1oLC
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 13:34:00 +0000
From: Benedikt Spranger <b.spranger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728394434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6BgLtv//7VX3/T9mPQLCPe+CkxNyewsbkBQ2mYybJu8=;
	b=1LmxDvwlGEaHrglEMqiy/Y+W+vkoe4YCxWUPOYo0ol1UUeaCLF1tanFOaD217w9Fe3lRhz
	BAXsftwMwTj9TYGXl6R8tphZ4W1q7Y1UxM3vrJJc2vqZ3GkWYNadnsmOM1TlpykoigDuIM
	ARYhtoWWgmbrn9JN9t4PFSyAauSBUxXGEOpTiC+hRYh6bfU0lR3P+yZv0+Pkb7GmAr3Fln
	Lby/Lb3rX06FcIUxprm3cclsNFx0myH0SZtY3QO24rTMQklmXcchhwdBNj/VN+Lfx6YTIo
	bN7HF5huiSx3+455Vx79kZ903UopPnaRaPws4qrmj6/7dj3Xbx839zenMx2eeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728394434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6BgLtv//7VX3/T9mPQLCPe+CkxNyewsbkBQ2mYybJu8=;
	b=I/OhDTFNa1iQHtYFc6aVIAO1IykJefsblpB+gKkt6bwiVdL+AxNU57llKL8d8lzbPclcDD
	n4Qnx0jtDCIuHoAg==
To: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/1] ubifs: Try to recover from missing znode
Date: Tue,  8 Oct 2024 15:33:42 +0200
Message-Id: <20241008133342.1937674-1-b.spranger@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_063357_719671_C5AB1D2D 
X-CRM114-Status: GOOD (  13.26  )
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

After powercut on a system using ubifs mounting failed:

2024-09-30T12:38:26.880487+02:00 sonja kernel: UBIFS error (ubi0:0 pid 2178): ubifs_read_node [ubifs]: bad node type (255 but expected 9)
2024-09-30T12:38:26.880506+02:00 sonja kernel: UBIFS error (ubi0:0 pid 2178): ubifs_read_node [ubifs]: bad node at LEB 103:46920, LEB mapping status 0
2024-09-30T12:38:26.880509+02:00 sonja kernel: Not a node, first 24 bytes:
2024-09-30T12:38:26.880510+02:00 sonja kernel: 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff                          ........................

While traversing over zbranches during the journal replay one zbranch
points to a znode, which was not written to the flash and therefore the
flash is empty.

Try to recover from that by inserting an empty znode instead of failing.

Signed-off-by: Benedikt Spranger <b.spranger@linutronix.de>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
---
 fs/ubifs/io.c       | 16 ++++++++++++++++
 fs/ubifs/tnc_misc.c |  6 +++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 01d8eb170382..0bbb426f9006 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -1110,6 +1110,22 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 		return err;
 
 	if (type != ch->node_type) {
+		/*
+		 * While recovering, we may face lost data i.e. empty flash.
+		 * Give callsites a hint by returning -ENODATA.
+		 */
+		if (c->replaying) {
+			u8 *b = buf;
+
+			for (l = 0; l < len; l++) {
+				if (b[l] != 0xff)
+					break;
+			}
+			if (l == len) {
+				ubifs_errc(c, "no node, but empty flash");
+				return -ENODATA;
+			}
+		}
 		ubifs_errc(c, "bad node type (%d but expected %d)",
 			   ch->node_type, type);
 		goto out;
diff --git a/fs/ubifs/tnc_misc.c b/fs/ubifs/tnc_misc.c
index d3f8a6aa1f49..4d085fc1300f 100644
--- a/fs/ubifs/tnc_misc.c
+++ b/fs/ubifs/tnc_misc.c
@@ -300,7 +300,11 @@ static int read_znode(struct ubifs_info *c, struct ubifs_zbranch *zzbr,
 	err = ubifs_read_node(c, idx, UBIFS_IDX_NODE, len, lnum, offs);
 	if (err < 0) {
 		kfree(idx);
-		return err;
+		/*
+		 * While recovering we may face a non written znode.
+		 * Inject an empty znode in this case.
+		 */
+		return (err == -ENODATA) ? 0 : err;
 	}
 
 	err = ubifs_node_check_hash(c, idx, zzbr->hash);
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
