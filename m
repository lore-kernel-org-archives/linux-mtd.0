Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D276BC369C2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Apr 2025 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eO91Gwxfmj7DBAoP8zVKj+wqsSCRoE7SLY8bbb6O7Ec=; b=HkNAtO7JJG2bzE
	ZEUo14iYv/+AE1DbC+zdwwoHswQInGxIzZ+8G9WNvlCmX13Dpm204UC0+JExCzobzdMtVH+vsrPuF
	Q0+K4Khg+j/wldpL+M50J3LB8UNQ0xCC8pGs7s7uCuyuB1SsECWhof/FG2ALl9V7K0L0ayvxaaZmq
	G9FyNbfSkDKoiMkCccwADhQgf80SofMOFKG7Lq7HqNrXFAUmJorgt7/c9lFNWT4arM1Op1dMb8Z51
	wzOX2WQm967VXQm/7c840L5ZrspdfZyffcVzuGuvkrS7Jkf46nKozWCxau8fGc7HsFmdZ4uhNQwsd
	iZg35C5dn3BuYCZd/cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IXU-00000008CW1-0mnM;
	Tue, 22 Apr 2025 18:40:12 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7HjK-000000083OJ-3YUz
	for linux-mtd@lists.infradead.org;
	Tue, 22 Apr 2025 17:48:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745344098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WYSPz7L9vzvUPBLf1S2L+o4oz/bB8vL10hN5EymzT1w=;
	b=vll48WkiKVmtAfAFtgNO06a0TR057oCTAYgkQv21a9TfZ50PuxdiQt4SOIlScjzT/mgshg
	7QWia0KaMiRJT6/IzGiujyfTzE3gIJJXj8kX8snDkqiAdKe0sUHWQu8dm1nDG6VcZcI17m
	QPl5/NUiaJny6KYhY5mqKJ4E5DJioUg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ubifs: Fix grammar in error message
Date: Tue, 22 Apr 2025 19:47:57 +0200
Message-ID: <20250422174758.27483-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_104823_368568_5EF145FD 
X-CRM114-Status: UNSURE (   7.97  )
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

s/much/many/

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index ee954e64ce7f..e28ab4395e5c 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -985,7 +985,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
 	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
-		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+		ubifs_err(c, "Cannot delete inode, it has too many xattrs!");
 		err = -EPERM;
 		ubifs_ro_mode(c, err);
 		return err;
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
