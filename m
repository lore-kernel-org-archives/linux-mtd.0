Return-Path: <SRS0=tMSz=TG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FECC04A6B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 21:24:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8405F20830
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2019 21:24:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtZKw43U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjTo7E7P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8405F20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=UyRfyi9wsL/tvf9mgn7SO7cruo51Lrxf5xIQX5FTpYo=; b=rtZ
	Kw43UiMCyPd2MV08F3Mvar7Mc996uCSe5wDBYPcF++4FPzALTIX6QnPkPUneozmfVDF/qMM323/ZF
	ts97JvQ79owjW0oCjQ7ruRxU0Nwpw9qxgLWhzbSJkLRssq/u8c6nvpBqLcyj0ysPKBGGpSGFdoIXL
	6RntrDyfrZvTcapYgNN+1bjQp6TJoPuqWFAF2YUwkPKeV31YHS2E9jpLmV2vSg2fEQZf12c7wiaWl
	ohCet4kN+i5ElybmngFl9y6Y2wrKuE7Miov4UFg1KTSuy4odJnHNdm3twm92crGALL9EN39XMTj75
	h3jbByUeZD2TkiSADwuxxnwlB55qJcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNl5r-0001Nl-6q; Mon, 06 May 2019 21:24:15 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNl5n-0001N1-Ln
 for linux-mtd@lists.infradead.org; Mon, 06 May 2019 21:24:12 +0000
Received: by mail-pg1-x543.google.com with SMTP id i21so7081900pgi.12
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2019 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mcgpr1EbDMecE7rZGD6vwsoGUZztxKYeNBa1TJHRsqc=;
 b=jjTo7E7PRELtaKbiax6Ts7rsh4/BvAeWg+3CSjtwVD9iBAJ5XvpgEH5NkCZCHMMaYq
 pUxfABpU2w9NWVo+vpDZ90SSjhA8Ppgno5KHHcECq5uBILhrrLmSd4t6K31u8KyB4fQm
 wzisp6v64m7vFxMV5Pmzu2pxyrjHMcvv3rIJwdqGtHPO4LxsLYZ140eoE630Pqh9pwsS
 Mk1sb6eoWLIKJaIs0RweXo+S2/d/dd+hylIvqAb/dTIAuHJ6FtiRlwoFaGVNPq+BsWQU
 h0Hg6yy49zhC34CeWCIpu1KhQ9yNil47dDHAAxA3bveeoqDit2AOh/rMHXZHivMz1xIy
 Yigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mcgpr1EbDMecE7rZGD6vwsoGUZztxKYeNBa1TJHRsqc=;
 b=TBPhfDSdXRXHh2WP+bvFsdhbR/6r9twU2qOAvIixGWDkZqyLQL/cpQImp9qFVV+0kP
 10XbsdsY1g90giehkv9GXQXiEcq/vSLtVHTThZA8C/h55i5CP3aAneYWLSscWzYU+22/
 VJj6HVQvDXFsFUt8GzEk9IjtRay5sS4L5AfBqvYZTyOnXqYr2ZWEF01apRM08Buhc6EM
 iBNITMgn8rzfeahkzstpgiQnqLgOmL9DMQyfQNyjJV4vv8x4Bk3EKMSThN/986tNmBSq
 HkRoJ7JndhXCLHfrdt93c9w8KK0S++cZLAqRVsZabXkNZ67y842ryG+H135XtM77Z8Yn
 WO2g==
X-Gm-Message-State: APjAAAUrvbPZUcDFtplH0KAdcjB3sjmThqVLPi1DWVR1tmfg95HEyJM6
 eeKKHc3WOn1iXElA3PyTaTWqs+lXNCc=
X-Google-Smtp-Source: APXvYqyNXdy0gck+QiSXiwWgqIvLja5eUnY9VM/YdDEVYWyMtWhJNQcNz1nChR29KIyWIeWTWQeWlA==
X-Received: by 2002:a62:a513:: with SMTP id v19mr36199277pfm.212.1557177848733; 
 Mon, 06 May 2019 14:24:08 -0700 (PDT)
Received: from bnva-HP-Pavilion-g6-Notebook-PC.domain.name ([61.1.213.72])
 by smtp.gmail.com with ESMTPSA id v14sm14378469pfm.95.2019.05.06.14.24.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 14:24:07 -0700 (PDT)
From: Vandana BN <bnvandana@gmail.com>
To: richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs: ubifs: Resolve sparse warning for using plain integer as
 NULL pointer
Date: Tue,  7 May 2019 02:53:27 +0530
Message-Id: <20190506212327.6480-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_142411_739240_6AB36DB3 
X-CRM114-Status: GOOD (  10.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vandana BN <bnvandana@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

fs/ubifs/xattr.c:615:58: warning: Using plain integer as NULL pointer

Signed-off-by: Vandana BN <bnvandana@gmail.com>
---
 fs/ubifs/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index f5ad1ede7990..066a5666c50f 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -612,7 +612,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
 	int err;
 
 	err = security_inode_init_security(inode, dentry, qstr,
-					   &init_xattrs, 0);
+					   &init_xattrs, NULL);
 	if (err) {
 		struct ubifs_info *c = dentry->i_sb->s_fs_info;
 		ubifs_err(c, "cannot initialize security for inode %lu, error %d",
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
