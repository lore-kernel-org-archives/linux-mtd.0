Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F91C30653
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jul 2024 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GOjbNgh5uOmWdrKJUVn4zGW8TUxndv0kwtYQ1ivQkuI=; b=fO2aa79b8xUFwW
	5MqBj39WkFe3OLSUgfIMuCBNXQ5nEP1CeuP9/4opXB70kSVEGg4LE+ucZOAu8cv0RlSPsMXjXy8ta
	vF3dBc2zvD+a2avcGwQZXJG6TohkrkmZk16NPwY3veywKEO+qjVmjSCx+1GmOcuEmQC0dDKx0rhEE
	e72m21GrMwolf7Bk70E+ssyEKThefpLygRZf4su4lWB8vuW8iA1eEw+OL/9gLBCNHD6uOEpcpYfHi
	HcZ6c3ui0B1UH1yUc4KK4XXkFpmD8/VP2GLmTAsF+mIJTl1mh/WxSGBGvC/GLh3GbQXwxEsGqGWuU
	KCB2yh46LazvtOkgoqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPN3D-0000000DN9u-23uK;
	Thu, 04 Jul 2024 14:03:07 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPN3A-0000000DN8v-1se0
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jul 2024 14:03:05 +0000
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7f3d5b154f5so73982239f.2
        for <linux-mtd@lists.infradead.org>; Thu, 04 Jul 2024 07:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720101782; x=1720706582;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2MFu0Vvjl11woYTcFBgJSbf4fZOqby39eiMdbGhwcbY=;
        b=nebIMEwoOcT2WM9KyOIChHXShDelFnfdMfXVIliZKSmlsOjOJFAglazHfSWyDsOoQ2
         9W4lMJ3A1gYu2+yRLiGWWRBo3zFS1C3qNjziJ6d1uCMCjWsd+BEIFoBad2F5xDvNARg6
         3yimlzcFY3xl6bJXYQ6pHyG7rd9n/XEdLkcmFp4UiOULZV9jXj3wffmgGKd4a6TmyQ5Q
         X36sz4wSIihaGwH67NoRiIUg3MyOY5RCp/hIh6bAbUMi5GoPr3k27ExW0LCvJy5Tdm8X
         ZYmV8QWECCrP9ulLP5dmE6dOddWYv16Hx4BOd8aMCphhmR6Ek+s5Viw2CVcpqH+LhHxI
         RJpA==
X-Forwarded-Encrypted: i=1; AJvYcCViiOVYTpJJbIgQHWoRcvbnOFuAJ+6zyupuYAAK66X4Ih1j5oYQPcjphGq6il40xF7mvdEBncTx8QUrv6gIbxCAWar5Mr8OnvtrdFuzdQ==
X-Gm-Message-State: AOJu0Yx1jNQAV8VzJPTH56rGeu/ubCK9A17n1W++239xNiR99flJP+BM
	lbCdFRZXMToz3s84HL6t0l9Ku5Q7+NUdVjytwJ1UzIZw1U3vUIna85dPILqjNrI/bYhw9jaOHHU
	lRHQbViQSZgp9XaudSU+GmZzojoqmddfGl+vCnEWB0K+p021ZwwH3Wt0=
X-Google-Smtp-Source: AGHT+IG3z1yiP+WDt+Se4A168xPC8xr6NJzaqkmWzpP6rB2eaIoHhuGAgnV98AGH0YOdSfC3IF+/dJPQrpHi76LWi6BD+3sH3sci
MIME-Version: 1.0
X-Received: by 2002:a05:6638:9825:b0:4b9:685d:7f2a with SMTP id
 8926c6da1cb9f-4bf5fe43c39mr82395173.4.1720101782219; Thu, 04 Jul 2024
 07:03:02 -0700 (PDT)
Date: Thu, 04 Jul 2024 07:03:02 -0700
In-Reply-To: <00000000000093a8ec0615b682a9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b4fe57061c6c6774@google.com>
Subject: Re: [syzbot] [jffs2?] KASAN: slab-out-of-bounds Read in jffs2_sum_add_kvec
From: syzbot <syzbot+d7c218ea1def103f6bcd@syzkaller.appspotmail.com>
To: brauner@kernel.org, chengzhihao1@huawei.com, dev@elkcl.ru, 
	dwmw2@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, walmeida@microsoft.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_070304_508553_E4907ED1 
X-CRM114-Status: UNSURE (   4.55  )
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

syzbot suspects this issue was fixed by commit:

commit c6854e5a267c28300ff045480b5a7ee7f6f1d913
Author: Ilya Denisyev <dev@elkcl.ru>
Date:   Fri Apr 12 15:53:54 2024 +0000

    jffs2: prevent xattr node from overflowing the eraseblock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=12204ae1980000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=aef2a55903e5791c
dashboard link: https://syzkaller.appspot.com/bug?extid=d7c218ea1def103f6bcd
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1309ca57180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f9afeb180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jffs2: prevent xattr node from overflowing the eraseblock

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
