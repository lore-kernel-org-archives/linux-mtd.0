Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FACC79FB7
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FYHVq0DrZ+VLeDGxQ83cIVgicT3/pIBMdHJaymy9QPc=; b=j6xUD/QJn2h4a1
	hp0jEirK2jgmxpQn0UEXTleRsGRa6YUU3B4c2pAurMwXah70/HMa76MjSmddSfoTyHVVGJ4G378zp
	tCkCwarDRqvifBPESoaddvR+Tw0tdEbM/+uVR2XTVAyxCV+YKd4SpmRXM5BY3Nb7+01LLsSx4N9FH
	LUkrl5e8KbKjFTo9a7be4zsTH2Vv7D67l0Gm8+/JggpPGJ8QbM/Y+/287LPzQEA8uFPJU2xELrZkT
	9mqcm0dhxrcj3wY3ocCOv7kQNEjJ7hZgLGqPoI337FNAENYSjfGTtktExfwEWg8SvoqOK8Uk0FVmk
	OrWH3W75ZV8eNG66CwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VKK-0000000DHDE-27he;
	Thu, 10 Sep 2026 03:19:52 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4VKC-0000000DHCt-0aKw
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 03:19:50 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-cbedf433a99so6131131a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 20:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010383; x=1789615183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q+3C5HAHgfZOcx9oT2fotA+oPFwWYseet/fp5oyt5ew=;
        b=IiMXEV+Xh+gglhhK4R1+kwhKKzMzcnfuGq9+J3H8RRsuxCDp3EprlgFRX/gkTju7hn
         aWvLcDgzAH5Gppd0N0wB1JjbqFha2V3zqoaL4to2ky0rtGdmSxWrhUq+bwAB4X7qB3Xo
         RGge2RXmw8bG2GvltvmIhIsW36aEC3cFl7/e09ve/1AHJIRWQje1/Nbj1qw0q+Fn8saO
         YHaQmvlisVVObZIkDSWhxRB7toUjuBZCvhS94QxeWp0wvHv4zMX9jb7YhizXdc3QsJAR
         wCS02XeAfmW2KZzFAi7sZyFXAnta14kZaEB4SVHdBnJXHGfm1DPH9h+P8rKEBWoy+CPt
         eMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010383; x=1789615183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q+3C5HAHgfZOcx9oT2fotA+oPFwWYseet/fp5oyt5ew=;
        b=WizOW3lrwzWvaGEi4Hn6JRzqRQY3HvZIfr0K8Wxo0wOnznV4nZEiumnHXtozfn4oZM
         S5VIe3PYHL5KmlPW2AZgmoJoKZXCwo6Yz1fJDYCGj8Lb40YeAesNkEpn0i+t/MphUKCZ
         Vt7pUYUN0Fxp4onB7wD6SKwIs2yQZ4tIPF7BYhPbmyVq6UZuOVFdOuDYdc3Lofe7zVOe
         76FY2akvNji77J+THDJ6b8HgHnVy6cX/EFq8XYbmuUXVkCM8qBa8PGObJ8nw3DSsNAyi
         aKQckFrnAhtG2+MYFCq1ghScfgFHpFKjUstncc7fx8CvUhPGVWvwfrI3kCHjy9JP4mUa
         tSUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGn3isfoM3BmGWriUqZHFc38iHMRbcTWHXfyBGYT8x3lAE+iVqvUM4DbJf4/9JhLbfkzCMLrqcaSY=@lists.infradead.org
X-Gm-Message-State: AFuF++nBuSURkkI2mqZ3JVbOiraPU53efnVSi/gQ7L6urNpNAvloZo+R
	NMR0rP4H2lrNXMaWyX7EDFZ2EIhFOKSb3GwUe3S07bD/6pta7pyrYuRw
X-Gm-Gg: AYBFou3iZT3jqYI6wh9mrgfQa7KN2JsU3+Plig8snDZv9tPyFL9REvmCq4XvV0u6DVP
	NQtmhTtkHpPOFWhu9WqfYrwxEJdiQOFR/JszC364xNMDoPQKjuHBGq9DSnFcVzg6UrMLwlFolPQ
	ewqtKvOJKri0n+6wlovChlH9Wq6BGQFB/DUYuF1LAdxUMWnYaq6IzaWpFOeNYLf5nfU2s+Cm7Dl
	ffB4VgD6mtGf/F0SUrSucRLOpZZXLAi/jFadlnet91r6j4SotA/2s27H5jom4Y2/gcDQDmzYd8X
	xeQ1kkuuXMQ7/cs0P9n1qcbfnzEps2bW743a+zTNxb99lBYA7HjW5s5s6/raBznMubbHlvpSC08
	qgbXwYHxb5BCnT+xN1/6VJFRZHTe4xgZFLrStB8+O/pK1GMljrsWMgVHqmraW5kU+sBZHIxua6a
	TMAjEVo/zFvKNrPgfOVl+VR9FA66UijO/2nwcxsWI0N/yY8GuA8PHdtVRrodN5AHwrPzxrMV/8r
	vAxqeEtbfKcn8I=
X-Received: by 2002:a17:90a:c106:b0:398:e1f4:bda1 with SMTP id 98e67ed59e1d1-39b2624cf3fmr60325042a91.21.1789010382848;
        Wed, 09 Sep 2026 20:19:42 -0700 (PDT)
Received: from lucas-inspiron153525.. ([181.81.132.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3397d6d1becsm10555546eec.22.2026.09.09.20.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 20:19:42 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: dwmw2@infradead.org
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH v2] jffs2: initialize inocache and target to NULL when allocating and initializing an jffs2_inode_info
Date: Thu, 10 Sep 2026 00:19:12 -0300
Message-ID: <20260910031912.2283174-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_201944_186130_5887C1E8 
X-CRM114-Status: GOOD (  12.66  )
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

When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
can retain stale values from its previous use.

If the new jffs2_inode_info object allocated retains an old reference to a
freed inocache, the function jffs2_new_inode may crash if either
jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
when calling iput() with the inode it will eventually attempt to free again
the inocache.

There is another failure path which is, if target is not null when allocating
the object in jffs2_alloc_inode, and immediately after returning the newly allocated object,
and if the 'inode_init_always' returns an error value (allocation failure for example)
then the vfs will attempt to free the inode and jffs2_free_inode will attempt to free f->target,
which can be a stale value from a previous allocation, generating a double free/use after free.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>

---

Changes in V2: initializing target field to NULL in jffs2_alloc_inode
---
 fs/jffs2/os-linux.h | 1 +
 fs/jffs2/super.c    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index 86ab014a349c..40f17218a276 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -52,6 +52,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 {
 	f->highest_version = 0;
 	f->fragtree = RB_ROOT;
+	f->inocache = NULL;
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba8..2343c21b49e6 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -42,6 +42,8 @@ static struct inode *jffs2_alloc_inode(struct super_block *sb)
 	f = alloc_inode_sb(sb, jffs2_inode_cachep, GFP_KERNEL);
 	if (!f)
 		return NULL;
+
+	f->target = NULL;
 	return &f->vfs_inode;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
