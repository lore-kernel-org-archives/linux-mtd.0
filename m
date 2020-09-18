Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A9AC43463
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 03:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE26421582
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 03:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="suNqBUFc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sChtpbih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE26421582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K1Zfgb8XzDchpAsdaONHbZMtctF84qy6VHbTijK+jD8=; b=suNqBUFcehbQpGiWF7WQwSErb
	/nv/wr4e8BKHmtHrCqN0vsfNqnVd4ehrhrzAFhBscMANFiDF/E73VRwFcc7Iie83+5fDQNLCsBFlU
	9sAm5lPeL90D8V+sULOtkbDa9lzQ4ksV/CJuJw+Nt3M4JbY38cCO4I6RBOm0Wm1rK7gsjIfIiNmL3
	64iEqglMbJ+q1aNFum1/JH3X4Ngg5z9tGXHOWNBqxBpaAvosnu4svPABeM7+gs0QH6WhfJGCEBQGG
	nNQHMpeQHqgz3fO59XiAPeTEp9FZOpEg/VTekCy5Wq8MuYqY+8nI8zqh1EkA3tAqxq+ODN3GTObBW
	Dol6ynDEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ6sh-0002Ty-EQ; Fri, 18 Sep 2020 03:16:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5mL-0003m8-Oz
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2020 02:05:38 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F33572388E;
 Fri, 18 Sep 2020 02:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394736;
 bh=JJUCyPfDfNdMfR68wl70LGUqR0ESBKrg7FR7xp4Y9QU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sChtpbih4Yzua+DWk2RvrEebOODtIJfNHhpcqN0P9NJ5SWVP2r68KCPDaX0j/OV6Z
 n3mNAjCoe6Hf6u9wjpaYM3xWjPSoH9mCS0ls+utXGl7MoEYcQt6VXLVhmsWAZWkjk3
 3uDnMzl7MnLFl+xapM1VFwlxtKPAx3NbWVSR9kyo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 217/330] ubifs: ubifs_jnl_write_inode: Fix a
 memory leak bug
Date: Thu, 17 Sep 2020 21:59:17 -0400
Message-Id: <20200918020110.2063155-217-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220537_896788_23096A86 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Richard Weinberger <richard@nod.at>,
 Zhihao Cheng <chengzhihao1@huawei.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Zhihao Cheng <chengzhihao1@huawei.com>

[ Upstream commit 81423c78551654953d746250f1721300b470be0e ]

When inodes with extended attributes are evicted, xent is not freed in one
exit branch.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Fixes: 9ca2d732644484488db3112 ("ubifs: Limit number of xattrs per inode")
Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/ubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a6ae2428e4c96..5f2ac5ef0891e 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -906,6 +906,7 @@ int ubifs_jnl_write_inode(struct ubifs_info *c, const struct inode *inode)
 				ubifs_err(c, "dead directory entry '%s', error %d",
 					  xent->name, err);
 				ubifs_ro_mode(c, err);
+				kfree(xent);
 				goto out_release;
 			}
 			ubifs_assert(c, ubifs_inode(xino)->xattr);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
