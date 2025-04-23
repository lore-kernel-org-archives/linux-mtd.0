Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8B7C369D7
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uk+QoUOEGq2hMNAP84ZEEp9tf1+X16k07RdD8zbmy8w=; b=k6nsXexVuDxp97
	DhwLkiMw1IflE0nbc23waMBfrb9qsjLBpf54LUofgX98iH8//XIO06kuBScpMrRxynMYBbu+Z6NZt
	o4fwg/zLz+vRMrhenczwAibxLoU3EDetTWpYCDRfyM8iZHMfg5WH+jXA+OTtDQDo4Bagjhw6rmNp6
	qkFR88oDfCgdOCLHKmnl0eJO9/wNlXFPqfqXD2HAi/hsOFZYFNd86glTPmDbwVEotPPLzHSGqU8At
	K/u5K+yjNhHIkjG0P2ClyX7Drh5C3kUYFhSErWLloD+IUvLjafX+5r/RxpEleUkMPKjidiKx1QqaQ
	X6sRfuTmB7s8ReUpXJMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqU-0000000BlOn-1tEU;
	Wed, 23 Apr 2025 19:33:22 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fq3-0000000BlCE-0Z3s
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 19:32:56 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso2249461fa.3
        for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2025 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436773; x=1746041573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ii5cwHF9ghnTeJsvB85dcnXrMjnihSfBctKt63IYmaA=;
        b=cwuflVRuIjxCJnoQpCHpri6A3Fb28eQ85uKx/D9jI6b0BcxjczEXyHSEXy3IqO730t
         a7AnbWKr91W3CtRsRFGzciD0s5SwduqZTKF1qPjPszjlq5KZwYEyOTtFeyMZfnJ+dnu4
         LNOGiot1CTrt+lELBOtmdBTjkwpHz+N5aYeLU6x8lMkmcLxuUuEW8aJXVuR4wEoRAIoT
         4C6qrDSzig3pOm/rb199AimxTNYbXjwJU12enQ2mG/9HMVoJbHdmInQ8AuBhuP/gH9Ww
         A+Wo7afEV7vuCL8MI2m73HN5vUTKNFSoUu0i2Tev3LhrML1tncIs8e9yRdK8redJFCTd
         7LMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436773; x=1746041573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ii5cwHF9ghnTeJsvB85dcnXrMjnihSfBctKt63IYmaA=;
        b=IqxjnO8gL/0loH1iuXF6BeT84f+jf1vxNNI4SKz4RVfMIAhmV0jHd89I4RSGKEpqiZ
         U9D97fGnJfRSXpATxsmVM7i4gtWth/91Vmn5dbMPy3kUEpkcl88J81A3gk1MzoE6V/u0
         ajfJoJiRdhX6BdPbp+rpjVtzyvNDCiOj8fSFyK0wBBJsdGlDZk3aVEDINKKaAsxVydj6
         8781sqmdzqrAYCvV8Nt+/ZEEp4rNMiB4lNBFRaaRx8gxxhzXAsTbirGeuDYUfabW2EWY
         cRCmvINgJq4VkOnJDclbDUwJU3Fvr+SlCUmhmrpdxsKjWINlc+lprhcZWCiLteQkk5VW
         jcBg==
X-Forwarded-Encrypted: i=1; AJvYcCVIm+eFtKMoxu2MmjamgC3wrfN9LoDua714Br2uI8qj13OBc7wrsR1F27udbltLM1FiCCSnSWuq430=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ7Sxclyon5wEqbefLe6p+svQuA0D68T5gZ72ZZSxxYqDOGN9w
	yvg6akSKIwFS5OqBvtiZyrt+GVOmHqKdC2iCNyg6LoFkr1sEyHWj
X-Gm-Gg: ASbGncuRD74/rPuatltSbGfrB34gipY4eJGFKUSSe89H0bYbApjDAZ1g8ONMN3YRGmo
	JtNW0lZbsSfdmG7DPidYBM3GmIRYqLtJFxu6O3OFsfUvp3wel4Q0T5DgiiZB8tOzmjwxLZgZ53o
	MGjRLqvQOXgXqXpCP4Dm+RzDjgPxE4ShJ5YTxu+OIhYN1C4oAxQlDB++jugLiTCkkmhN0TLvtg+
	G2PJ/08PWFfBHGm37kSdygxibiswpVUI9UBUyubXpy7Gi1Sh0mK0aqQiiqtTWclOdBADqmWd+nw
	HihxWQNheNDg7CrgeKnTbGGblYVlTa3bLzVWLPz/Aw==
X-Google-Smtp-Source: AGHT+IHYhkvmvfLA15BXO9JfM+4qofch0b3oi79VASt4f7Gmd7VAl74GUUx9CmpYJxYXC/JjKWgzCw==
X-Received: by 2002:a05:651c:2107:b0:30c:2590:124c with SMTP id 38308e7fff4ca-3179e6e74a9mr601471fa.11.1745436772518;
        Wed, 23 Apr 2025 12:32:52 -0700 (PDT)
Received: from leo-laptop.. ([85.89.126.105])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090783917sm19821821fa.41.2025.04.23.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:32:52 -0700 (PDT)
From: Leonid Arapov <arapovl839@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Leonid Arapov <arapovl839@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Ferenc Havasi <havasi@inf.u-szeged.hu>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: Decrease xattr length limit to avoid summary write error
Date: Wed, 23 Apr 2025 19:32:05 +0000
Message-ID: <20250423193209.5811-1-arapovl839@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_123255_186654_B038D3C4 
X-CRM114-Status: GOOD (  19.86  )
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

When fuzzing, the following error is observed:

jffs2: warning: (1096) jffs2_sum_write_sumnode: Empty summary info!!!
------------[ cut here ]------------
kernel BUG at fs/jffs2/summary.c:865!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 1 PID: 1096 Comm: syz-executor340 Not tainted
6.1.108-syzkaller-00007-g86fb5a1a71c9 #0
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 
04/01/2014
RIP: 0010:jffs2_sum_write_sumnode.cold+0x195/0x43b fs/jffs2/summary.c:865
Call Trace:
 jffs2_do_reserve_space+0xa18/0xd60 fs/jffs2/nodemgmt.c:388
 jffs2_reserve_space+0x55f/0xaa0 fs/jffs2/nodemgmt.c:197
 do_jffs2_setxattr+0x212/0x1570 fs/jffs2/xattr.c:1117
 __vfs_setxattr+0x118/0x180 fs/xattr.c:182
 __vfs_setxattr_noperm+0x125/0x600 fs/xattr.c:216
 __vfs_setxattr_locked+0x1d3/0x260 fs/xattr.c:277
 vfs_setxattr+0x13f/0x340 fs/xattr.c:309
 setxattr+0x14a/0x160 fs/xattr.c:617
 path_setxattr+0x19b/0x1d0 fs/xattr.c:636
 __do_sys_setxattr fs/xattr.c:652 [inline]
 __se_sys_setxattr fs/xattr.c:648 [inline]
 __x64_sys_setxattr+0xc0/0x160 fs/xattr.c:648
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:81

The error occurs when trying to create a new attribute of a file by xattr
syscall. Size and name of the attribure are set by user. Current limit of
total size of an attribute is equal to free size in a clean block and it
doesn't include space needed for summary data structures. So it is
possible to create an attribute whose size doesn't exceed the limit but
the total size of attribute and its summary data does. If requested size
of an attribute satisfies this condition, it leads to the following
behavior:

jffs2_do_reserve_space tries to reserve requested size for an attribute
and its summary. It fails to do so because even a clean block doesn't have
enough free space. Then it writes existing summary to the current block
and proceeds to the next block. Summary data is linked to a specific erase
block so it needs to be written to the current block before selecting
a new one.

Then this function is called again to reserve space in a new block.
It fails again and tries to write summary as the first time but at this
point collected summary for the block is empty and it leads to BUG() in
jffs2_summary_write_sumnode.

Decrease maximum allowed size of xattr buffer.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Signed-off-by: Leonid Arapov <arapovl839@gmail.com>
---
 fs/jffs2/xattr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index defb4162c3d5..7380f32e6d0f 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -1110,7 +1110,8 @@ int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
 		return rc;
 
 	request = PAD(sizeof(struct jffs2_raw_xattr) + strlen(xname) + 1 + size);
-	if (request > c->sector_size - c->cleanmarker_size)
+	if (request > c->sector_size - c->cleanmarker_size -
+	    JFFS2_SUMMARY_XATTR_SIZE - JFFS2_SUMMARY_FRAME_SIZE)
 		return -ERANGE;
 
 	rc = jffs2_reserve_space(c, request, &length,
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
