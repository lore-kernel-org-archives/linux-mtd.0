Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05EEC88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 06:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H8WZ25wUKlgGgNzlsoyV4ZIu/3GKdueQudPkJFoq0jw=; b=Nkvma+H3hKWltD
	zA7sEtwtKFwQhAa7AjRQQhYZwjX256EJ+1jA1NnT1SYr6dIf3U995VQ4mUemfZYmu6Gab2pyB6dq6
	tIzaTctihEiw+bhudbUJiFahVrOgGfeAuCmKglSMTTHEmD+mHGNf3j2kT6XbMvfNrK0eHCdx9lCN/
	m3X74x5ul4mD2tTSIIQJ9xweJE50CTVaYQJoS5N+VZo0JsXT5nLoWEGLF+Qwg0UpQ6cfwIlD8pEtN
	umjY+m/BjuzeGsBDop6GkvkC6axdhyopl9P/659fxUxoQmk/fr7jm0nsA573BeEYNEzAH58YH18Ew
	SvSQ81kmCcFUFC4mLXKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mpw-00000005Mn6-0alC;
	Tue, 15 Sep 2026 06:40:12 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Mps-00000005Mln-2uCs
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 06:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=unkA0ssih9z87yxpeGe0v6wkVWdw3JKhLGifgjgbCQE=; b=K
	qGxrlaR/3tQwDIpeyKnfvT9G/+f3B4lLXNKrNgIbNEXwc2bKyBe0cuFw6W7aoJUf
	r7aqDDhCE/8FE+8GmT+u01HIQq1KTBKZYMcB0W7j4RRqsS2t4oDM9vGfTZHXGVru
	UGbZvXjTa+fXQgH47QNUYaFLSjoQ2CXGpfgPqAk6B0=
Date: Tue, 15 Sep 2026 14:39:39 +0800 (CST)
From: CJ <firefly0158@163.com>
To: dwmw2@infradead.org, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [BUG] jffs2: kernel BUG in jffs2_del_ino_cache
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2TC/ieu0ss7yeaYekdmEsTju82UcS4ufQl245Xc98Figbk+QAgeFpPNFDG1NiRKyuJkh+TdQFs6cJxc45/D9mcTQS6k5QcvGt6dplP9A==
MIME-Version: 1.0
Message-ID: <23469bd6.56e9.1a0a3caead6.Coremail.firefly0158@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: hygvCgD3378r6KhqN+4PAA--.21301W
X-CM-SenderInfo: piluvw1o1qikqy6rljoofrz/xtbC+QsJumqo6CtZKwAA3y
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_234009_236651_31D6BE5C 
X-CRM114-Status: UNSURE (   9.24  )
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


Hi,

I am reporting a kernel BUG in the jffs2 inode cache handling, triggered by a
syzkaller reproducer.  The issue is reproducible with HEAD commit
cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux 7.3.0-rc1).

The reproducer mounts devtmpfs, mounts the jffs2 filesystem found on
/dev/mtdblock0, and then sets a trusted.overlay.redirect extended attribute on
the mount point.  No crafted image is uploaded by the reproducer; the trigger is
the attribute operation on the jffs2 mount.

The console shows "kernel BUG at fs/jffs2/nodelist.c:462!" with an
invalid-opcode Oops and RIP in jffs2_del_ino_cache.  The path reaches it from
jffs2_do_clear_inode during inode eviction, when the inode cache entry is being
removed while the filesystem is still holding references related to the
attribute operation.

One possible cause is that the extended-attribute operation leaves an inode with
an unexpected cache state, so the removal path takes a branch that asserts the
inode is present in the cache list when it is not (or is present twice).  This
looks like a state-management problem in the jffs2 inode cache rather than a
bounds error.  I am reporting the assertion and the path as observed.

This appears to be a recurrence of the syzbot issue whose external id is
93f6bfed6a4a702b48cc.  It remains reproducible on v7.3-rc1.

Reproducer:

syz reproducer:
mkdirat(0xffffffffffffff9c, &(0x7f0000000000)='./dev\x00', 0x1ff)
mount(0x0, &(0x7f0000000000)='./dev\x00', &(0x7f0000000100)='devtmpfs\x00', 0x0, 0x0)
mkdirat(0xffffffffffffff9c, &(0x7f0000000200)='./mnt\x00', 0x1ff)
mount(&(0x7f0000000300)=@filename='./dev/mtdblock0\x00', &(0x7f0000000200)='./mnt\x00', &(0x7f0000000400)='jffs2\x00', 0x0, 0x0)
lsetxattr$trusted_overlay_redirect(&(0x7f0000000040)='./mnt\x00', &(0x7f0000000080), 0x0, 0x0, 0x0)

console output: https://pastebin.com/raw/wfCKUiUY
kernel config: https://pastebin.com/raw/1TiKKS9a

Kernel:

HEAD commit: cee9395acd8043be0644b25c34bfa86623f2b935
git tree: upstream (linux.git), tested through the v7.3-rc1 annotated tag object
           e5e04726cdd043e309677071ab1b65a4b18f422b
kernel version: 7.3.0-rc1 #1 PREEMPT(full)
tested tag: v7.3-rc1 (Linux 7.3-rc1, 2026-08-30)

Let me know if you need more details or testing.

Best regards,
Changjian
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
