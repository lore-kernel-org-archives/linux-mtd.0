Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EAF3C982CC
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2026 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=u8dX8PkrdvBoC2OXVeLGJKLueAgRbmAarXWJ/Mw+MRg=; b=2Vl10+bYr/J9Gk
	oMduVZJtCo2PVjFkngQw1DCXLLmkIJ0m6gx1WgaufqtUUTdiHf8AY7k1tfRkleMkjM4V6dIHIvXhE
	DKnobC4l/nnIVnfgKh+eux5nSxvGlzFqCa3X2FR8MPKJAZFq92nhkgjTHZZGnXbgYNR0gR6Rdtk4/
	OQWmcUxwafmPpHK6OwUAsAn2qy7HSwz5NhBXDZ3eygyS7eUvfgiPS2cs87YrAu9NNwsf0WIQHFSJe
	qZ2HTU0yHx2OFqJ8zUtFtBc/e/rsA0tWxgCi3BGWafXljAyouSAbSZptgAdLaWfnQSRIcVdXz+M6V
	7DaTcL1H1zaj5XObD+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7r2H-0000000G7Lw-3Yx1;
	Sat, 19 Sep 2026 09:07:05 +0000
Received: from mail-oa1-f70.google.com ([209.85.160.70])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7r2F-0000000G7LO-0hlW
	for linux-mtd@lists.infradead.org;
	Sat, 19 Sep 2026 09:07:04 +0000
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d81384b4bso1926736fac.3
        for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2026 02:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808821; x=1790413621;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x9yRw9D2gXRvIc/0u4uYuzMHzcogsHQUYAKktJ4OjqM=;
        b=YIwNJm/JljuuLWzbl7jBd86LJ1+MFZg1i+ruu/Y1zi7GHfL2ZWnSNhCh01VrY8HywD
         wcfd1GrMKBbkn9zVyWunhSnpSRjw63rsXPjlYh3SuUfas/v7l7K0v3ye8CWdqsbzTR3b
         c9kF59cEHDg/ce4Do/UxiCssZKpgz9DEoYldN4fYNEfBqHW/cbKC/5xOjlBfEMmrBj2r
         VgSTLbBn3+jozQIixyYo0tp/cFb+NYW6oAwOcYvYc3kdjBKL0Fo351N0TQox8QDTxAsW
         Oykh+NL2GmT5VGGwroa7LaEWa8zCT+4KBWisA4/KewkeyIaDJo+3zO7+9oAxXOT4U2nO
         alpw==
X-Forwarded-Encrypted: i=1; AKwUvBwsbAibMqwsQocVVKtWWed71KvYwAY/adCA5Z2JYSIp9Uo0oiXQc69yPygsgzM/ZigVg+u1mdbXoL0=@lists.infradead.org
X-Gm-Message-State: AFuF++niAL3EffSFox6GKjG2jCuTfnnjcla5jBIieHhmOsMNcFoBHGml
	88DAJPkU9p8p33/KsF7WWIie6m9Cu0GodL2tVprl+sCOXmu4bKqn1u9Uj3fOTIOtNSWJtrTgb/6
	f7ny+PhFuOIa2uXnDANjT2r9mseTlNNpy9FIklgVWIuofKHKX1ZMyR2cFcTo=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80c8:b0:6be:7782:5a51 with SMTP id
 006d021491bc7-6ca9a026f21mr4393980eaf.10.1789808821682; Sat, 19 Sep 2026
 02:07:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 02:07:01 -0700
In-Reply-To: <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae50b5.e548f532.1ca396.0003.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@barelysecure.org, joern@lazybastard.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, rafael@kernel.org, 
	richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_020703_226218_FA6D27C0 
X-CRM114-Status: UNSURE (   4.33  )
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

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         40288c92 Merge tag 'drm-fixes-2026-09-19' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169d2ff9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b52ff9580000

Note: testing is done by a robot and is best-effort only.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
