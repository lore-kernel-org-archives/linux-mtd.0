Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1C9C282EC
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Mar 2025 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ya3cpKwiG4EGTifH3bo7a77IV67h5Ydga7IfTR5fGg=; b=2zeR7u8PnHpwbX
	KihsDpz70b84DAd9I67eGi9A78C2QrLH+kq/M0TtbIWucVsPoDCiCJg3wVO2Px97beWjh3gGhgihT
	fjz6Cs5RUJfVekVuG3AxnonBUcbJr58JFcfZPb7Ykq3wn7y+50DgYA+PM4pSAAVNRu7S8U87dBB3o
	NTjr9fko+PrhuvKChHcyxo4ICLu8jlHMRsbT11iVksqrQz0VBEw1BP6ZCDP6HjSU/lPmFSJEFvhIH
	QmvbaBmaZQo84zophv+lc0LGnTjnvwbk7OwwBbw68UNNTHp5AWjOOu53nZ4KPi25TRdSOE/I5xqRX
	oUvdiF9g5X02BZ/um4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua3d-00000006a3t-1SHB;
	Tue, 18 Mar 2025 16:44:49 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZmZ-00000006WpP-2rIJ
	for linux-mtd@lists.infradead.org;
	Tue, 18 Mar 2025 16:27:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742315224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OjJiIwlMpkeH+xMiT4Dzt06RFe5u+6AUQfkA8y/in8M=;
	b=mPmAW/9ifLtaPSMmRvVg8pLI0qL8+fsy41lPvQgy0BYrjbZyoEkhrTfOWVpBa/VIe5+fb3
	eBYvUQGxTNLgkMtb2T+d9naDrBjkVGvIZLlwbF1QMWzhNMD1zAbo5PTgu4FDXj9rvBa/LF
	IuJD23BS76oFwiWDoplPU8ioxhUSY7A=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Fix grammar in error message
Date: Tue, 18 Mar 2025 17:25:59 +0100
Message-ID: <20250318162558.100462-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092712_155426_4C289617 
X-CRM114-Status: UNSURE (   8.18  )
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

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 36ba79fbd2ff..923c0bbff303 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -982,7 +982,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 	dbg_jnl("ino %lu, nlink %u", inode->i_ino, inode->i_nlink);
 
 	if (kill_xattrs && ui->xattr_cnt > ubifs_xattr_max_cnt(c)) {
-		ubifs_err(c, "Cannot delete inode, it has too much xattrs!");
+		ubifs_err(c, "Cannot delete inode, it has too many xattrs!");
 		err = -EPERM;
 		ubifs_ro_mode(c, err);
 		return err;
-- 
2.48.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
