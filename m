Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42618C5DF85
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Aug 2026 03:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlD8XC2xXak5CoOzuT4mzdYtcxuVR9VCDNrs8qvUwow=; b=4ZUDMvPdKsQTOH
	DhLgecoAUt96S3nTASWyROO9YgCL3SMF7v2ezDx9IaBrIYAw+zZCa835BUXDMIqzgejeIO5js/Qcx
	EjO8GqIT4I7Mx7KK/5tlzEyZFb1u2HAie7JTWN7GO0NBleMM5zlU5bKErHk+zsjualEjl+zbJHpM2
	NKNpOfjexgG+lpQbzxjYr5QsWovdrFkl55/8c5XIN7mgO7YZH3yS83Hu/u1fwnGYjpvLGRW0Gtqdb
	A0IU739SoAilU0zyLNxn8y6Hdz6u2xjXZo/Cq3W4hUrVj6Qijw/ss67T+gyO84sLCSrHEKq2wCYTw
	rn32yJCOL8sz7IpEaAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwtdL-0000000Amtb-2o1R;
	Thu, 20 Aug 2026 03:40:03 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwtdH-0000000Amsy-1lGz
	for linux-mtd@lists.infradead.org;
	Thu, 20 Aug 2026 03:40:00 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8486ac3f347so397372b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2026 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787197198; x=1787801998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7E/S4XB2acY/X3wyUH1G5tFQ1Y+acuzsI52bp9Wzh/E=;
        b=YKi3D+0lPLJ7JI4RQw7wVFeEM7iWjW2orFMC8vjdGEGszxieEqK9wfEwQQ63Mm+omv
         CbnBAzUUF3wPGvCV+xOJ6zw2LeXFsTPP8EpU87ZxblgLWSYsf8C2Aa+FXmnQOMrU3tJl
         DN9WnIafVy2+l2p196Oc4qwQyHHfwNpEuZ6nl7fONHhff3CzykQgkLL4BPDBPtg6Bb/L
         RxzvkhyAlgjPGTrwq66p2rLtgmKtjaULz+OFBZx3M55NzehIgCeQZtmOzMyO97NNofHb
         jWowam0eus4IWxfi3vbawMK4njkgzrFo6A9LTokC4ip5JX95MBc8ICqwIgOvLAMmt/7e
         /Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787197198; x=1787801998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7E/S4XB2acY/X3wyUH1G5tFQ1Y+acuzsI52bp9Wzh/E=;
        b=f9LG6oLTb0ChjK0tt6uUvPEGEcufifVXTqNW3xdn01CeXp91MRbCUTzCXK/dkLTuUU
         hZoibRT1/jRkH3/uA5VHQdbuiGDVm/fw/8/83yPwJuPBkv/KkrTAgbPXWImhEcBwrpd0
         mtV+/QUh7sGVqmgOMFUvyYL+Biy2Wr+6hd30qVw1k1ruD9yj0F7bYi3SKy/VBvo6s3P5
         wNQPn3j0/Kr8ewRKbbB3OymZgUv5kP70ryBvKd2oaMrmMDlcH1IUBH0DY3msDNFJ+wyz
         l/XCxE7HiUAltAgiMeetBg8FRFWr1GHsl7muzp51i4UjwK29Tai3RQxmBNETqkOKcEXO
         T+zw==
X-Forwarded-Encrypted: i=1; AHgh+RpV71+1ei+Sa4JOGu84iSpefISi7TWUsG37oAOXMU2A1eI0iGau1xJdXhhmZBpVheyHxxPwbMJ/4kM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWph2zHFKicr6rdqE9A6Vjjbx5BXwcq6BQYyWVYT/xZ7V/uHH9
	yZjROqTyZCZCkWSty9N+I/BixmU5taQ80W0m362Q93GNPu1wbV/8bByj
X-Gm-Gg: AR+sD135lugCeTXXNHJMCKYmUljgfU2vv8ZbkplMIfcQlsOTnjvathEEnG1on4tpeAd
	DtAqLGrh6MMpFDScus483HE7r6cNIJ6t3aXHRt9O4CJyEw6EXFOWjGnf3dvA6HCQKODKeRCGkAW
	/+ncOm9oaymy1YrHqQUQe9Ogz5otNHiDkHRss81gemgtAR5efgETdQ0LWHSwvl63rCu3gb57D57
	+8/XaShYmkky+a6BNlC9HGCEBRx3GpUME0J+LVgL9hxOAKGn6vgOHD+oiGLTzZAqymE5Aj0liY3
	zDojzJl/eOXKYH9dn5adPm3iwdycEJdAUVi0vIHXwTneokPPf1YXnv2a+KrrcQMhmRp23ylytVu
	jaIw9ruOUxXLWBG5572tDHUNOv4zpI8trAY3RM9251CECUWmYxCypWbkBnOxS2y+o4I/gnCNAS8
	2wlItKsUv7JUMjCPwJZQHC/xrgy+gDR8AuxEQPYFOLBnBEGMde3Hv5iu0z0tbtppTMmRqyFJeO
X-Received: by 2002:a05:6a00:f0c:b0:848:48d0:934 with SMTP id d2e1a72fcca58-851dfa91bbfmr3900215b3a.18.1787197197723;
        Wed, 19 Aug 2026 20:39:57 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1556a093dsm1260765a12.29.2026.08.19.20.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 20:39:57 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	dwmw2@infradead.org,
	linux-mtd@lists.infradead.org,
	richard@nod.at
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	eulgyukim@snu.ac.kr
Subject: Re: [BUG] general protection fault in jffs2_xattr_delete_inode
Date: Thu, 20 Aug 2026 11:39:49 +0800
Message-ID: <20260820033950.1045382-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
References: <20260819182805.4020838-1-jjy600901@snu.ac.kr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_203959_462090_45C80FD4 
X-CRM114-Status: GOOD (  10.83  )
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

On Thu, 20 Aug 2026 03:28:04 +0900, Jaeyoung Chung wrote:
> We have not analyzed the root cause, so we do not have a proposed fix
> to offer.

f->inocache is never initialised, and jffs2_new_inode() has two error paths
that evict the inode before it gets assigned.

Your log says it outright.  RSI is the ic argument:

  RSI: 6464646464646464
  RBX: 646464646464648c
  1f: 48 8d 5e 28   lea 0x28(%rsi),%rbx

0x64 is 'd', and th_churn() does memset(p + 1, 'a' + (idx & 7), 3998) with
idx 3.  So ic is not a stale pointer to anything, it is the pathname bytes
that thread left lying in the page the inode was later carved from.  With
CONFIG_JFFS2_FS_XATTR the 0x28 is pino_nlink, so the faulting access is the
ic->pino_nlink of xattr.c:602.

Nothing initialises that field.  jffs2_inode_cachep has a constructor, and
jffs2_i_init_once() only does mutex_init(), target = NULL and
inode_init_once().  jffs2_alloc_inode() allocates with plain GFP_KERNEL, so
no zeroing.  jffs2_init_inode_info() sets seven fields and inocache is not
among them.  inocache also sits before vfs_inode in the struct, so
inode_init_always() does not reach it.

On this path f->inocache is assigned only by jffs2_do_new_inode(),
write.c:35.  Both of these return before that, and both then do
make_bad_inode() and iput():

  fs.c:459  jffs2_init_acl_pre() fails
  fs.c:466  jffs2_do_new_inode() fails in jffs2_alloc_inode_cache(),
            write.c:28

Either is an allocation failure, so fail-nth reaches both.  The inode is
unhashed, so inode_generic_drop() makes iput() evict it, which is the
evict() -> jffs2_do_clear_inode() -> jffs2_xattr_delete_inode() in your
trace.  The mdelay() before new_inode() gives the churn threads a window to
leave their bytes where the inode is then carved from.

mtd/next has the same jffs2_init_inode_info(), so:

--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
+	f->inocache = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
 }

Both callers assign inocache immediately afterwards, jffs2_do_read_inode()
at readinode.c:1335 as its first act and jffs2_do_new_inode() at write.c:35,
and jffs2_xattr_delete_inode() returns early on a NULL ic, so the read path
is unaffected.

I have not run your reproducer, so please confirm it on your setup before
this goes out as a patch.

Thanks,
Zhan Xusheng

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
