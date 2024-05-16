Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64351C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Fp21g9NeTZvP3682HeBvWvBN0DXE+R1d2y9WwT9mIWM=; b=Iu6
	gLKrROhmphDQAcMhQny21ypM41eRSlfBHD1mT9DBg3E4nRwVqboRuRBuLZQ9FMaYt5Xj+ubzhykvm
	JPa/UKY5MjBuphKZY+PZAwlhm+igrHbP1IrCqk9MBbL+rrrqmwm07OV/ILQpzwzC/KySNFuT49Iza
	s9GKX0fEVOYs4Q0JjiKffmSTeNJuD6yWOYMh2948HjopFf9UHkLXrnVGZ2+cqXVf/D5XhUZJZzq/T
	nT1JN9G6+XeniSWogTUo3gYQ19LHpuJh6+3dg96yl0QDrKZQuBcsvjvBZLCOi46tgz1EOUQFayPFq
	+4pjQ7lSyVaWr2ovxxoja6/B2FXEHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aTP-00000004rhT-412m;
	Thu, 16 May 2024 12:44:39 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7aTM-00000004reF-0OpW
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 12:44:38 +0000
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e1db7e5386so587327439f.3
        for <linux-mtd@lists.infradead.org>; Thu, 16 May 2024 05:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715863473; x=1716468273;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fRwNaMQsPTmHLjomIgA9uFH3GtuMZTBSHhedZoUpFGo=;
        b=PIOs+PsN1UYyJtXxSkpD23soHpyjSm4wcBuFmU1UyRClsJYb4QsAUu28j169hACvAd
         mOuqo7B0U1O0sY5XLfwCPAcW7nD8vEYQ0egDrDvS4kCGQpvfBRHtvVop8F0TI9USaRcK
         7NX0CNeHJzjmYUPxA1Fh0oenAovYDOSVvywVZ3Dq5MhbPWqU6HKewVNZEYpvfS0qAjfu
         w233jThyYBnq01buUGmS1RKBqWaDjz6kzrevrm3iM/A8OcM0xtv2rDEECqH0FgxPH57j
         r5pJ9OYv0J8tfUFSgA6BbLscaYnGqcmYiquQq8TrQff7uS7/PwDaVbnwkT1/9q4JfA5Z
         0NZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ6PGj+5bH/zzOhvjZFsRo16xhziSaE6fBEnmOqgf7rEIU8wi/cceH+vDJ4KFZMnNkDzFjwKTzKwAFXBekyqxhlEx8VZaKWI0jFQMfDQ==
X-Gm-Message-State: AOJu0YzTPDrhSagmcquRGQx0W8GkDNmwftLNFnCMNzBrm8Ox3FP/bmK4
	dBqdRb8XLvjg5Yh3tkf7VOrxI2c0JS8FQm6NJVk1GdHwOn8rBAO5mRYGUDoQrWfWkImZUSV2Y5h
	whCCpEYqvcsAvLjel0Yl2EcnJ1s0QcHAuiUnjZxzJLqe76gUY8e0pMlY=
X-Google-Smtp-Source: AGHT+IFc+t0/Gyltub/EaQjO0BxplnBpjXnpbmFn+uaATFXJZox20R2LkW56zT2m5+K15ZUD2A+MW3E5pcQvuS4oUlqsqzpeCMew
MIME-Version: 1.0
X-Received: by 2002:a05:6638:8725:b0:488:5e26:ffb5 with SMTP id
 8926c6da1cb9f-48958694bafmr1329243173.2.1715863472835; Thu, 16 May 2024
 05:44:32 -0700 (PDT)
Date: Thu, 16 May 2024 05:44:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c81fe70618919881@google.com>
Subject: [syzbot] Monthly jffs2 report (May 2024)
From: syzbot <syzbot+list0f6d40430f0d17a567b7@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_054436_274616_5358877A 
X-CRM114-Status: UNSURE (   3.91  )
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

Hello jffs2 maintainers/developers,

This is a 31-day syzbot report for the jffs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jffs2

During the period, 0 new issues were detected and 0 were fixed.
In total, 10 issues are still open and 1 has been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 730     Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<2> 13      Yes   KASAN: slab-use-after-free Read in jffs2_garbage_collect_pass
                  https://syzkaller.appspot.com/bug?extid=e84662c5f30b8c401437
<3> 3       Yes   kernel BUG in jffs2_start_garbage_collect_thread
                  https://syzkaller.appspot.com/bug?extid=61a9d95630970eece39d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
