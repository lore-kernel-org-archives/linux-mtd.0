Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7122DC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:13:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19A520838
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNkzrAvh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nuviainc-com.20150623.gappssmtp.com header.i=@nuviainc-com.20150623.gappssmtp.com header.b="RRvj0DDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19A520838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nuviainc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DgbgBds/QhJl31vXjuWt3gfx/I2ZVR9AkQRwcPa7SWU=; b=sNkzrAvhmSximRJUB9kbtZD9WS
	FSw1TDYzeOe9ysGWXCeiyn4Y75Aq/TY7i/CGesqu7nKKE56BUQGCskGy49rXEQM/k45MCds7jhKGS
	zFYZ4uTjJUi5vBE9iFY/Rsu76h+lyQhOUFJrsgOllRUJ+hVKena6dZl/eifoFOH0Jfs9ryv/ppV61
	MiOjyUOi1GH8xxjX8g1+K5LSuuony5+DlUGqpLSPWsKzEH2F8laff2rGH/yrz+EcBqHdc3N95CBBx
	kVZ/I/Xi9As+jx9AxCWgKnmZTz6tgmuq8UtD0T6No4nb9S7VYhf7xkt0sJqTqF9hejGqNpjyE6BFQ
	E4g07FIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxcb-0002Wd-3x; Mon, 12 Oct 2020 13:12:13 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxcY-0002Vi-KN
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 13:12:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id x7so10532686wrl.3
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2020 06:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xHrCwOeFUOdY+ghi+2PkWNTng83J2EPiQz8sFTKEHGk=;
 b=RRvj0DDBMPcSo7aE8nZyWwHxxpN3+pfNPE/ZSxgT25Z0BQEjsLN9Hfr/9KkUBIVVww
 yJbsh1i0H3L9ObPuYqJWte+vXdiOh+Jm8obSBxv1OAcXc/5Mfjk8EAuvh5WCysRVbXPz
 A+5bmKc5bCMCzNF+Hhsttsd29TopwetYjz+2Hlqi/tj3DsNHpvn+YWHMiyO0/W7pOaPR
 bwpRN+zmnTIF3UeBsXOVWoJ3IrJuwZgOyvX+YiDBFB31coVVbJPvGjZTCZfAMeM1uSA3
 T3dEaM+BiblXprnDALriooz0fv+GMz+9mqzQs06sDdBvzWBuVq6L9n3GSGEbjASmxF44
 riuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xHrCwOeFUOdY+ghi+2PkWNTng83J2EPiQz8sFTKEHGk=;
 b=Mw6q5XUgjH/RpP6biYbjQs6Yt/8x3tu5CAZD8+G2LL6pjEzdJP2MFn4QUVQtk/6G7+
 DSXtmv7P0uc4n51j1sfAH5eS/HOXPQdy37lKWoA3iQLtmy+W9HqYpRLjvtjLvpdS6LHB
 dGvTXa/OGXAskvAH9sHdpWmpHZyGTopu8/VmZlbdSGTQ2KGExQjbsYi3vezOeC25Fq5v
 TTrDvpFYeatqkSx3xtONiKQuXpgbhd4PTtFg2df1Q/Vary/juVfQFSD1mk9f0pVEZ/VN
 e4tqvYmniZ+0ArVA2+Ye5/bdP40e12asD5l37/EmIUYIZ8c1hx2b0xh49kF1caWJFri9
 xmrQ==
X-Gm-Message-State: AOAM5319xiK52x1XDIeYxPadRHBDK7o8x+Fu5HHKPU3dZc4ULRt8elao
 Tb2vtO7aLArFkPi7Ot68tz9376Pp9yUZLhnZwbU+hPA58atRRQzjX6SqUJqWpfVlX4jN7eyCs8d
 hrsZHspo6N4jc651m34fvlJMyCt3lgUBYg/GrlyXLFLwOQ5W2ETjkTVurhKKL06X243YbJoA6Xf
 3Pyzk=
X-Google-Smtp-Source: ABdhPJxgo8bRZnKjtzzf2TeWpm/zMgFVCQGgCxcadmBdrCehef2NGvyiU4SeOVDNdOx4YAjjffStTg==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr29493616wrt.221.1602508326962; 
 Mon, 12 Oct 2020 06:12:06 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id c16sm25808738wrx.31.2020.10.12.06.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 06:12:06 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] jffs2: NULL pointer dereference in rp_size fs option
 parsing
Date: Mon, 12 Oct 2020 14:12:04 +0100
Message-Id: <20201012131204.59102-1-jamie@nuviainc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_091210_684280_60FD8DA4 
X-CRM114-Status: GOOD (  17.95  )
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
Cc: David Howells <dhowells@redhat.com>, Jamie Iles <jamie@nuviainc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

syzkaller found the following JFFS2 splat:

  Unable to handle kernel paging request at virtual address dfffa00000000001
  Mem abort info:
    ESR = 0x96000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    SET = 0, FnV = 0
    EA = 0, S1PTW = 0
  Data abort info:
    ISV = 0, ISS = 0x00000004
    CM = 0, WnR = 0
  [dfffa00000000001] address between user and kernel address ranges
  Internal error: Oops: 96000004 [#1] SMP
  Dumping ftrace buffer:
     (ftrace buffer empty)
  Modules linked in:
  CPU: 0 PID: 12745 Comm: syz-executor.5 Tainted: G S                5.9.0-rc8+ #98
  Hardware name: linux,dummy-virt (DT)
  pstate: 20400005 (nzCv daif +PAN -UAO BTYPE=--)
  pc : jffs2_parse_param+0x138/0x308 fs/jffs2/super.c:206
  lr : jffs2_parse_param+0x108/0x308 fs/jffs2/super.c:205
  sp : ffff000022a57910
  x29: ffff000022a57910 x28: 0000000000000000
  x27: ffff000057634008 x26: 000000000000d800
  x25: 000000000000d800 x24: ffff0000271a9000
  x23: ffffa0001adb5dc0 x22: ffff000023fdcf00
  x21: 1fffe0000454af2c x20: ffff000024cc9400
  x19: 0000000000000000 x18: 0000000000000000
  x17: 0000000000000000 x16: ffffa000102dbdd0
  x15: 0000000000000000 x14: ffffa000109e44bc
  x13: ffffa00010a3a26c x12: ffff80000476e0b3
  x11: 1fffe0000476e0b2 x10: ffff80000476e0b2
  x9 : ffffa00010a3ad60 x8 : ffff000023b70593
  x7 : 0000000000000003 x6 : 00000000f1f1f1f1
  x5 : ffff000023fdcf00 x4 : 0000000000000002
  x3 : ffffa00010000000 x2 : 0000000000000001
  x1 : dfffa00000000000 x0 : 0000000000000008
  Call trace:
   jffs2_parse_param+0x138/0x308 fs/jffs2/super.c:206
   vfs_parse_fs_param+0x234/0x4e8 fs/fs_context.c:117
   vfs_parse_fs_string+0xe8/0x148 fs/fs_context.c:161
   generic_parse_monolithic+0x17c/0x208 fs/fs_context.c:201
   parse_monolithic_mount_data+0x7c/0xa8 fs/fs_context.c:649
   do_new_mount fs/namespace.c:2871 [inline]
   path_mount+0x548/0x1da8 fs/namespace.c:3192
   do_mount+0x124/0x138 fs/namespace.c:3205
   __do_sys_mount fs/namespace.c:3413 [inline]
   __se_sys_mount fs/namespace.c:3390 [inline]
   __arm64_sys_mount+0x164/0x238 fs/namespace.c:3390
   __invoke_syscall arch/arm64/kernel/syscall.c:36 [inline]
   invoke_syscall arch/arm64/kernel/syscall.c:48 [inline]
   el0_svc_common.constprop.0+0x15c/0x598 arch/arm64/kernel/syscall.c:149
   do_el0_svc+0x60/0x150 arch/arm64/kernel/syscall.c:195
   el0_svc+0x34/0xb0 arch/arm64/kernel/entry-common.c:226
   el0_sync_handler+0xc8/0x5b4 arch/arm64/kernel/entry-common.c:236
   el0_sync+0x15c/0x180 arch/arm64/kernel/entry.S:663
  Code: d2d40001 f2fbffe1 91002260 d343fc02 (38e16841)
  ---[ end trace 4edf690313deda44 ]---

This is because since ec10a24f10c8, the option parsing happens before
fill_super and so the MTD device isn't associated with the filesystem.
Defer the size check until there is a valid association.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Cc: David Howells <dhowells@redhat.com>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 fs/jffs2/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 05d7878dfad1..a73a2190eb89 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -202,11 +202,7 @@ static int jffs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	case Opt_rp_size:
 		if (result.uint_32 > UINT_MAX / 1024)
 			return invalf(fc, "jffs2: rp_size unrepresentable");
-		opt = result.uint_32 * 1024;
-		if (opt > c->mtd->size)
-			return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
-				      c->mtd->size / 1024);
-		c->mount_opts.rp_size = opt;
+		c->mount_opts.rp_size = result.uint_32 * 1024;
 		break;
 	default:
 		return -EINVAL;
@@ -249,6 +245,10 @@ static int jffs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	c->mtd = sb->s_mtd;
 	c->os_priv = sb;
 
+	if (c->mount_opts.rp_size > c->mtd->size)
+		return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
+			      c->mtd->size / 1024);
+
 	/* Initialize JFFS2 superblock locks, the further initialization will
 	 * be done later */
 	mutex_init(&c->alloc_sem);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
