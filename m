Return-Path: <SRS0=dr70=ZC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B295CC43331
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E6820842
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Nov 2019 15:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZUyClwi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E6820842
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GyohdJDq+24RAhhHtXBFlVZ5W3atTH2F1iPaGbcViM=; b=GZUyClwi2i7r8B
	Rp+IgQj+zrXsTGV5vNCIrry133dxFR5FtrWlNCa4GoB3HW3vssMaoolWgXQS2LfRxvmxRKdgadqFi
	OnY+sEpoI0YsnC78KzDt3RNaI3BUvrR8UTrLDF5Qz/Q8PYQI3Ca652oiiqfhxClMwn8XKMgZkpgku
	f/QI1B1Mwuz59TwWnabjc4eipQVFDgH8cva54Bj9pCGlC+kwOyNMbtmfotHw80qt9BEzlz/xzAjvy
	vL4SWq1vZ0MjhBbEDL2QRqc6f+aYohR0KEgEXA7EtO+24yGnLpJSADzd1KJWphQbmzx8XPam8SPSw
	k66A3NJz4/w/yh7CbPvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTpDL-0006cc-Dm; Sun, 10 Nov 2019 15:33:19 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTpCC-0005VA-Ke
 for linux-mtd@lists.infradead.org; Sun, 10 Nov 2019 15:32:11 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 28AF8181099F0;
 Sun, 10 Nov 2019 16:32:07 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DhLDJ7N5v8bU; Sun, 10 Nov 2019 16:32:06 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4qhnDwQXM2TL; Sun, 10 Nov 2019 16:32:05 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/15] mkfs.ubifs: free derived fscrypt context in
 add_directory error paths
Date: Sun, 10 Nov 2019 16:30:47 +0100
Message-Id: <20191110153059.28878-4-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
References: <20191110153059.28878-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_073208_838906_A4E0A5CF 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 33 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index ea0afee..87f7b4f 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2099,24 +2099,32 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 
 		if (S_ISDIR(dent_st.st_mode)) {
 			err = add_directory(name, inum, &dent_st, 1, new_fctx);
-			if (err)
+			if (err) {
+				free_fscrypt_context(new_fctx);
 				goto out_free;
+			}
 			nlink += 1;
 			type = UBIFS_ITYPE_DIR;
 		} else {
 			err = add_non_dir(name, &inum, 0, &type,
 					  &dent_st, new_fctx);
-			if (err)
+			if (err) {
+				free_fscrypt_context(new_fctx);
 				goto out_free;
+			}
 		}
 
 		err = create_inum_attr(inum, name);
-		if (err)
+		if (err) {
+			free_fscrypt_context(new_fctx);
 			goto out_free;
+		}
 
 		err = add_dent_node(dir_inum, entry->d_name, inum, type, fctx);
-		if (err)
+		if (err) {
+			free_fscrypt_context(new_fctx);
 			goto out_free;
+		}
 		size += ALIGN(UBIFS_DENT_NODE_SZ + strlen(entry->d_name) + 1,
 			      8);
 
@@ -2162,24 +2170,33 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 
 		if (S_ISDIR(nh_elt->mode)) {
 			err = add_directory(name, inum, &fake_st, 0, new_fctx);
-			if (err)
+			if (err) {
+				free_fscrypt_context(new_fctx);
 				goto out_free;
+			}
 			nlink += 1;
 			type = UBIFS_ITYPE_DIR;
 		} else {
 			err = add_non_dir(name, &inum, 0, &type,
 					  &fake_st, new_fctx);
-			if (err)
+			if (err) {
+				free_fscrypt_context(new_fctx);
 				goto out_free;
+			}
 		}
 
 		err = create_inum_attr(inum, name);
-		if (err)
+		if (err) {
+			free_fscrypt_context(new_fctx);
 			goto out_free;
+		}
 
 		err = add_dent_node(dir_inum, nh_elt->name, inum, type, fctx);
-		if (err)
+		if (err) {
+			free_fscrypt_context(new_fctx);
 			goto out_free;
+		}
+
 		size += ALIGN(UBIFS_DENT_NODE_SZ + strlen(nh_elt->name) + 1, 8);
 
 		nh_elt = next_name_htbl_element(ph_elt, &itr);
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
