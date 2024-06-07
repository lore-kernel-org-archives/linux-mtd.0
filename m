Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9A5C27C53
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jun 2024 04:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JgTdle65cgrT03EQEuUzl5pajzI0gYBa9HbtN9Rpv8=; b=2hNyzM5rFa8R0H
	Q3gKRjqrlsgEhplHArrKnDU6X4xGwgJ3ZiFH0qxo6fMSUuvdiAGWAzvvuuUOBt0/cu8d2IUYpzr2w
	H1Cs9Zfhc+bdndmPNQBxAt0gWWUPv2GKItkGhaHrAC91BC2emCKFWgSRwZX+5+sY3OF1S3ORYGeM8
	t3eKpPSJQB37LCMa2u3CCtMLk6TojRmqAi/3B/O1Dw0Z8qP9uchEvIiHBGZ/Joqc1F7YzkhmcnglQ
	7BFUQLupLDBvxHjbYhBEx5mlqttJToOEyfhlNWFqVI0JVsj2zGH2/pTlPueK12DL5Wi5NKnSKgkTF
	xIiXx+QgS/+/YRnPiKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRDD-0000000CHSA-35bt;
	Fri, 07 Jun 2024 04:28:23 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFRBx-0000000CGLZ-3RT2
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jun 2024 04:27:14 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4VwShz6dzKzmXv6;
	Fri,  7 Jun 2024 12:22:27 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id BF71A140203;
	Fri,  7 Jun 2024 12:26:48 +0800 (CST)
Received: from huawei.com (10.175.104.67) by kwepemm600013.china.huawei.com
 (7.193.23.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 7 Jun
 2024 12:26:32 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <richard@nod.at>, <david.oberhollenzer@sigma-star.at>,
	<miquel.raynal@bootlin.com>, <yi.zhang@huawei.com>, <xiangyang3@huawei.com>,
	<huangxiaojia2@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH mtd-utils 009/110] mkfs.ubifs: Fix incorrect dir size calculation in encryption scenario
Date: Fri, 7 Jun 2024 12:24:34 +0800
Message-ID: <20240607042615.2069840-10-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607042615.2069840-1-chengzhihao1@huawei.com>
References: <20240607042615.2069840-1-chengzhihao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_212706_596773_EB6FFC75 
X-CRM114-Status: GOOD (  12.32  )
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

The size of directory should be the total length of encrypted entry name,
otherwise it could trigger errors while checking filesystem:
 dbg_check_filesystem [ubifs]: directory inode 89 size is 352, but
 calculated size is 400

Fixes: 4c55918dd747d ("Implement filename encryption")
Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 8bf073ce..25c49967 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1723,15 +1723,17 @@ static void set_dent_cookie(struct ubifs_dent_node *dent)
  * @name: directory entry name
  * @inum: target inode number of the directory entry
  * @type: type of the target inode
+ * @kname_len: the length of name stored in the directory entry node is
+ *	       returned here
  */
 static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
-			 unsigned char type, struct fscrypt_context *fctx)
+			 unsigned char type, struct fscrypt_context *fctx,
+			 int *kname_len)
 {
 	struct ubifs_dent_node *dent = node_buf;
 	union ubifs_key key;
 	struct qstr dname;
 	char *kname;
-	int kname_len;
 	int len;
 
 	dbg_msg(3, "%s ino %lu type %u dir ino %lu", name, (unsigned long)inum,
@@ -1749,7 +1751,7 @@ static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
 	set_dent_cookie(dent);
 
 	if (!fctx) {
-		kname_len = dname.len;
+		*kname_len = dname.len;
 		kname = strdup(name);
 		if (!kname)
 			return errmsg("cannot allocate memory");
@@ -1765,18 +1767,18 @@ static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
 		if (ret < 0)
 			return ret;
 
-		kname_len = ret;
+		*kname_len = ret;
 	}
 
-	dent_key_init(c, &key, dir_inum, kname, kname_len);
-	dent->nlen = cpu_to_le16(kname_len);
-	memcpy(dent->name, kname, kname_len);
-	dent->name[kname_len] = '\0';
-	len = UBIFS_DENT_NODE_SZ + kname_len + 1;
+	dent_key_init(c, &key, dir_inum, kname, *kname_len);
+	dent->nlen = cpu_to_le16(*kname_len);
+	memcpy(dent->name, kname, *kname_len);
+	dent->name[*kname_len] = '\0';
+	len = UBIFS_DENT_NODE_SZ + *kname_len + 1;
 
 	key_write(&key, dent->key);
 
-	return add_node(&key, kname, kname_len, dent, len);
+	return add_node(&key, kname, *kname_len, dent, len);
 }
 
 /**
@@ -2026,7 +2028,7 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 {
 	struct dirent *entry;
 	DIR *dir = NULL;
-	int err = 0;
+	int kname_len, err = 0;
 	loff_t size = UBIFS_INO_NODE_SZ;
 	char *name = NULL;
 	unsigned int nlink = 2;
@@ -2139,13 +2141,13 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 			goto out_free;
 		}
 
-		err = add_dent_node(dir_inum, entry->d_name, inum, type, fctx);
+		err = add_dent_node(dir_inum, entry->d_name, inum, type, fctx,
+				    &kname_len);
 		if (err) {
 			free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
-		size += ALIGN(UBIFS_DENT_NODE_SZ + strlen(entry->d_name) + 1,
-			      8);
+		size += ALIGN(UBIFS_DENT_NODE_SZ + kname_len + 1, 8);
 
 		if (new_fctx)
 			free_fscrypt_context(new_fctx);
@@ -2210,13 +2212,14 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 			goto out_free;
 		}
 
-		err = add_dent_node(dir_inum, nh_elt->name, inum, type, fctx);
+		err = add_dent_node(dir_inum, nh_elt->name, inum, type, fctx,
+				    &kname_len);
 		if (err) {
 			free_fscrypt_context(new_fctx);
 			goto out_free;
 		}
 
-		size += ALIGN(UBIFS_DENT_NODE_SZ + strlen(nh_elt->name) + 1, 8);
+		size += ALIGN(UBIFS_DENT_NODE_SZ + kname_len + 1, 8);
 
 		nh_elt = next_name_htbl_element(ph_elt, &itr);
 		if (new_fctx)
-- 
2.13.6


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
