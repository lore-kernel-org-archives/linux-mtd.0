Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F11CE7A88
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Sep 2023 03:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VMfch6DQlBpjhcubQJOuaakAcNh1D3S6rso06W3r92E=; b=SP4p/NI5VNf948
	OHKtVuSTTGCAXLx1SCMG7QbpJDCYdI+gTTsJgbaTBKlntGmnHG07P4/kVx+lowH1eRqB1bib02hRN
	GhZ2vv7padPZBl56CC5bJEaSKx+mLnF0MCuePTUmb0lEqmw+nQsJ5/C6oigUBXNFD4utOsIw1fppM
	JQMY2ZRZApwZZBLOYhO1EHhf1+MODAcQgQFLB+KmBVSeS1fAmW+rJAfBnm3zOytrbg/VDm6z2/S5V
	racZnrSes0AwEjiextSB7bZ52Jf2tH/GhK8RZGyaafa33ihNeKkLbS0IcpW2kACj+QK+8AG7JYict
	+2yj7CURh2l2rxqaSiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjtQK-00AMjQ-2k;
	Sat, 23 Sep 2023 03:35:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjtQG-00AMio-06
	for linux-mtd@lists.infradead.org;
	Sat, 23 Sep 2023 03:35:14 +0000
Received: from kwepemm000013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RsvmH6jzlztSZt;
	Sat, 23 Sep 2023 11:30:39 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm000013.china.huawei.com
 (7.193.23.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sat, 23 Sep
 2023 11:34:56 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <roland.ruckerbauer@robart.cc>, <david@sigma-star.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<chengzhihao1@huawei.com>
Subject: [PATCH] ubifs: ubifs_link: Fix wrong name len calculating when UBIFS is encrypted
Date: Sat, 23 Sep 2023 11:28:59 +0800
Message-ID: <20230923032859.3857274-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_203512_263367_F6A95E61 
X-CRM114-Status: UNSURE (   9.90  )
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

The length of dentry name is calculated after the raw name is encrypted,
except for ubifs_link(), which could make the size of dir underflow.
Here is a reproducer:

 touch $TMP/file
 mkdir $TMP/dir
 stat $TMP/dir
 for i in $(seq 1 8)
 do
   ln $TMP/file $TMP/dir/$i
   unlink $TMP/dir/$i
 done
 stat $TMP/dir

The size of dir will be underflow(-96).

Fix it by calculating dentry name's length after the name is encrypted.

Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Reported-by: Roland Ruckerbauer <roland.ruckerbauer@robart.cc>
Link: https://lore.kernel.org/linux-mtd/1638777819.2925845.1695222544742.JavaMail.zimbra@robart.cc/T/#u
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/dir.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 2f48c58d47cd..5dc1ac4d826d 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -724,7 +724,7 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	struct inode *inode = d_inode(old_dentry);
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
-	int err, sz_change = CALC_DENT_SIZE(dentry->d_name.len);
+	int err, sz_change;
 	struct ubifs_budget_req req = { .new_dent = 1, .dirtied_ino = 2,
 				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	struct fscrypt_name nm;
@@ -748,6 +748,8 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	if (err)
 		return err;
 
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		goto out_fname;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
