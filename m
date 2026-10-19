Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D52CCF2DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 05:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0ELLkaHWDJ72FpXqqr2PngJoRUCMsb3h7djMQPMQL2s=; b=hgW+U/FTnynDnw
	wU9a2oyc18D+ko/VYRpLJQrhWapeWI8XVYsvcexFC+1OMQVkNvjHrPZ88rrpOcu2RUVNTKh2ucvoD
	lECxX555Aqh9gSBfallCqLa7weHJhqdZ40JCmHCwXxDDI4rhUdhRBnANrexCoEuZibo8+bO7sZ8e7
	Acqkf7N6Fq7+0Yngx0k+nACGALU6hG++tjmCRKAEjOT1j/u+CZ0B1j1cHhuWHJvIRcZD+8KttvwsT
	dulVePFV6OXRO3iOEmefNdc9cRG9gmpaLhWk7r+/+qIP0kNWxHdWR7nkzjE5v9ugZtH0GZiw6cjsl
	RqAgICTRXr1yabDKe4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgJy-00000006f3w-1M2y;
	Mon, 19 Oct 2026 05:54:06 +0000
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgJv-00000006f3P-2hU6
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 05:54:04 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f9b643ae53so1492216b6e.3
        for <linux-mtd@lists.infradead.org>; Sun, 18 Oct 2026 22:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389242; x=1792994042;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1hWn9WlFALBXxXhElt5/Eo18vTu9PaxR/Ru42wA+dqw=;
        b=CkfehAfySrZPOObIN9SnlAArbJOGQ+AizN6711UdqGeRJm+swnZLIlVTP07viZBLLB
         xxMh+ulilZ+Itsogm8sL8oRQiK6FYJhEkRepY8cjSuXzKMNgftgfKvsbYqd4Czl3HCa8
         fLgALnzIS8UwzqXbwfFWtnA9fsR3ob/T3nO62QV1yPNee5j90HilS99VMLVPf/+IMbxS
         ZTrglnaww7xM7yLVn1ycBVkjN9+XMnHXeD+7GibTrYB/M5ketwExlKyp/aPXUfB3O16g
         +8FXD81XF2UREDT9oFDm+Z29a0Gmgseeyje2cN8o+aRULl9lmskLzTPpnpe7op6kAKYt
         uEgA==
X-Forwarded-Encrypted: i=1; AKwUvBxSCQD17h2csWiflll85ofjCDLQ6+1wISvFu+BEAlw7bde4KVlwPTHjyUohopsBv67jzHuzOPqj23c=@lists.infradead.org
X-Gm-Message-State: AFq9FYJjBlwMloIPVQhje0M2eCrlFycSHyRVYFvgWTm5qq/yE3ORe/iU
	H7e03w2N0xcHUvQAquhHHx/E6y2AIpDDVY5CmAixjYe9y3thgNvIrlTTIEO0dn7u+9n4vng3HNf
	txmlzVJad9wL0r3iybNQB2INjTqETNF1i+xguwhaN+SfJ/nmL7lSy7rZE1Fk=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2d8:b0:4d6:9232:b3bc with SMTP id
 5614622812f47-53cd0570542mr5676180b6e.51.1792389241864; Sun, 18 Oct 2026
 22:54:01 -0700 (PDT)
Date: Sun, 18 Oct 2026 22:54:01 -0700
In-Reply-To: <6a7bfdf7.ed659fcc.23056a.007f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad5b079.7f4e89eb.3d59aa.00bd.GAE@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
From: syzbot <syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, luquijeffrey@gmail.com, 
	miquel.raynal@bootlin.com, richard@nod.at, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, syzkaller-bugs@googlegroups.com, 
	troglobit@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_225403_707395_66D0AF4E 
X-CRM114-Status: UNSURE (   4.54  )
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

syzbot has bisected this issue to:

commit 7b09acdcb944a9be6acc38ab1aa8a0ffd08871c1
Author: Joachim Wiberg <troglobit@gmail.com>
Date:   Sat Oct 9 06:09:55 2021 +0000

    mtd: block2mtd: add support for an optional custom MTD label

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14e7b13e580000
start commit:   32c52ec87d62 x86/insn-eval: Fix shadowed segment index in ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16e7b13e580000
console output: https://syzkaller.appspot.com/x/log.txt?x=12e7b13e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17684bc9580000

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Fixes: 7b09acdcb944 ("mtd: block2mtd: add support for an optional custom MTD label")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
