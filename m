Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA41EC83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LTuNkBtQ0Zti5rTeC0lknsmTQORcmTSN7dst2E/Rvok=; b=FyiSnwiUCJpUnf
	D4AWn+32s0MDxVtMPsv6+YlnwKuEanUuFxcPgYiGXFqgviZ5ihD3AEJk5ofyizAkhlAG6+F800bF9
	XsPKTMlZGpCM4GZW3+k9qa9Yirk1n04oC3swQC++Q0yTrNnHYYrW3qGWnuxJ7xAYXYeyrLom6aRyy
	grhvtMRNBq4cOXiP1LmUsW7kG4rxi+lBVBRZFN+/9UxZ/CTA9TLX+f+tigOB0cXQypZsQok8OHhkX
	0YzatzE6xtlhyXahntZBAXL+cvLuiJGBbhiIOdF+8TZgwLMlny5JmsitpALquu88YcCBX9nvqqnyZ
	x3MIQASNWAq1DId3mT5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfZv-00FAxo-1l;
	Thu, 31 Aug 2023 11:11:11 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbfZr-00FAwr-1h
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 11:11:10 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EEB97211CE;
	Thu, 31 Aug 2023 11:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693480262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5wheN2WF79/65e5XgWEbwyIVrsSXq6pkvKaE0P14I0o=;
	b=C7C6uZ9Gar3iuAZ9mtJdJ9EjVqLCti2m9j/AS0WT+vJg9tGIiPA+Rv3pn6ILk5M0obqi/d
	tOeQ8QfAlBCK7RgR6MMr1xZ1l6PUYHt5s1o8cwRIA5gm7lN06rA1lsIcDhy6K28OiORN9A
	TFF4tWM7fYVCoe/BVBEuYqNSLbxlJik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693480262;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=5wheN2WF79/65e5XgWEbwyIVrsSXq6pkvKaE0P14I0o=;
	b=OY97HYQJBhEJo8Q/CsFZB12rRk2DsWx9rdRMy8thBhP9utqUxQWA+j2R4pjPoRZZ/Z6VIB
	7ZXSnJqHMBpLgrAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DFFEF13583;
	Thu, 31 Aug 2023 11:11:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yFayNkZ18GQQUgAAMHmgww
	(envelope-from <jack@suse.cz>); Thu, 31 Aug 2023 11:11:02 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 60D54A0767; Thu, 31 Aug 2023 13:11:02 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Jan Kara <jack@suse.cz>,
	Yu Hao <yhao016@ucr.edu>
Subject: [PATCH] ubi: Reject device with erasesize 0
Date: Thu, 31 Aug 2023 13:11:00 +0200
Message-Id: <20230831111100.26862-1-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2730; i=jack@suse.cz; h=from:subject; bh=Pvoi5EPr314+/3ikYLwHlQiRR3ivNCHyuMLvn9rJre4=; b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBk8HU9Yiv9SWsXDlRQpAEZ5jrqekT9OjMBVsHdAS+O P483ii2JATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZPB1PQAKCRCcnaoHP2RA2bZPCA DflpZxiPQ7KBK2uF37XWZpUXsZyE8rA+JVqQErtyzwhQNSVsIBtDmLyKTJG+iwPngCBID488hzEBj1 49aAu+jGIynMUVtjdlJZyS2o7hcyhbbWpZ4bwm4at9xTfGgm42QlEQTI0UARq6BfLRdNw77p+pR5Sd nl9T8J1QxCPdC6SMpY/lYBTzyVsgQlvunjykWjZbY4NDry9ff1u0iC860jiEL1YRu/QQWNuSSDrzaO MVxO6gxdB0RwtMPEdDvvQCH1SCTEpxNF37Pirsk9MqBwo8ca5OKgoZcYJWRan+87qeyQwIUa0EpYOt 2hMXE+EPnTW0A5WgjYufYufOBUdFuU
X-Developer-Key: i=jack@suse.cz; a=openpgp; fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_041107_725829_7003204C 
X-CRM114-Status: GOOD (  15.81  )
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

In principle MTD device with erasesize 0 can exist and it is possible to
create them e.g. via KVM. If that happens UBI layer currently crashes
with:

ubi7: attaching mtd147
divide error: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 20023 Comm: syz-executor.0 Not tainted 6.2.0 #6
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
RIP: 0010:mtd_div_by_eb include/linux/mtd/mtd.h:580 [inline]
RIP: 0010:io_init drivers/mtd/ubi/build.c:620 [inline]
RIP: 0010:ubi_attach_mtd_dev+0x77f/0x2fe0 drivers/mtd/ubi/build.c:955
Code: fc ff df 48 c1 ea 03 0f b6 14 02 4c 89 f0 83 e0 07 83 c0 03 38
d0 7c 08 84 d2 0f 85 1f 25 00 00 41 8b 4c 24 10 48 89 d8 31 d2 <48> f7
f1 48 89 c3 e8 b6 f3 1b fc 48 8d 85 40 17 00 00 48 89 c2 48
RSP: 0018:ffffc9000be0fd30 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff888047a49d40 RDI: 0000000000000002
RBP: ffff888024e1c000 R08: 0000000000000016 R09: fffff520017c1f47
R10: ffffc9000be0fa37 R11: fffff520017c1f46 R12: ffff88806545a000
R13: 0000000000000000 R14: ffff88806545a010 R15: 0000000000000007
FS:  00007fd45e85c700(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f64aeef53a4 CR3: 000000004f39a000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 ctrl_cdev_ioctl+0x303/0x3a0 drivers/mtd/ubi/cdev.c:1043
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x198/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Handle such devices gracefully and just reject attaching UBI to them
instead of crashing.

Reported-by: Yu Hao <yhao016@ucr.edu>
Link: https://lore.kernel.org/all/CA+UBctDsHRpkLG5ppdiuV8Msn4Dx-ZJ2xDrxfa48VMb7ZE+xBA@mail.gmail.com
Signed-off-by: Jan Kara <jack@suse.cz>
---
 drivers/mtd/ubi/build.c | 3 +++
 1 file changed, 3 insertions(+)

It doesn't seem the discussion linked above concluded in a patch. So is
anything wrong with the trivial approach here so that we can close the issue?

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8b91a55ec0d2..684273e13efb 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -613,6 +613,9 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 	if (ubi->vid_hdr_offset < 0)
 		return -EINVAL;
 
+	if (ubi->mtd->erasesize == 0)
+		return -EINVAL;
+
 	/*
 	 * Note, in this implementation we support MTD devices with 0x7FFFFFFF
 	 * physical eraseblocks maximum.
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
