Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D0BC4345F
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2024 10:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iPZYZ7G5cv34T/MZJif3FVBI+IOEb9R3WvQJbqmp8P8=; b=iD8
	fOwE6I/WrXa5aoEr2MFopfdhZaouHfd2ZL6ptEPUEHuJZXV7MIdO7+Iv1HtxquFumNR5MGtNXKLGy
	2ncAA37mVq3/6uJRXeS213jRrsRfuX/DaRSp+X5lTUdD2e8/xD0zvTwkmaJjrIemSV1OjaTdQy2SZ
	egryI8+Gqkbj7KGEZxY9BHHL3ZmklfXa+a7tI/tMNB2bBp6pMEHdtW2C7LOvf7fs3CrH2rgtt2kx5
	wZt3HkEOk8fIm7RvuLHk75TpVYc3WZfmkEDEclXtdcpTKKMTD+6sIg/cdkuHjA/8grI3ILlHKgGr/
	qv8UWhgvjbHsbcjRDHGrk5oKXCOBkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvadV-00000002wuz-3CXO;
	Sat, 13 Apr 2024 10:29:29 +0000
Received: from mail-il1-f197.google.com ([209.85.166.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvadS-00000002wuB-3nEi
	for linux-mtd@lists.infradead.org;
	Sat, 13 Apr 2024 10:29:28 +0000
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-369f9e8863dso14059635ab.3
        for <linux-mtd@lists.infradead.org>; Sat, 13 Apr 2024 03:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713004164; x=1713608964;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLtKsq0VwINExJJun7o7HSXh8fWOT6rp0lewqu3Iurk=;
        b=stqqOYIMMGQZpeqCNzIouQD1zmj61x8gAcSuX/HkBYZP53upHH7RHSiUYRtqtN+RFK
         8VlR+uDa4FSiRk3v8s2C55BpO6QwPTxXaNAslTfw6dRiibuO6IhNJAZbxyqrGf6iurbS
         QhWFhPawcdjaLRnas5ge6ti6uPUilTtJUzgD8YdBrcUddDJPcRnRa4J7ZxdWca8AS1+q
         SR8f19T1ykU21rSZwm59y9lFm+muFu6j2rQkHrZRP8u0zMRdZPZLH6DDrGxIwyoHreqJ
         yswI26MBKZjOaL8JzeXifwU9g3fQVXADcERA5GP3zHCN26ZX7xhJPebvUmyLtWfv7Idx
         XvdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjteR7sLZOl/Z6JhZzm5/rLwVbRpeq4F/HJGU11TjSPj7EGWW/UgtpwVa2D8cJZ0oiVIho6KL6h/ufc1F5pLTPzWcroInFllewShAQeg==
X-Gm-Message-State: AOJu0YzIubDKYUJoMpma2h7tfd84GJa8cYhinAXg6I7EP6XOboDWkZYx
	aSut9PhhTuWPk0ty6Y8f2T4RDPzkspC+eSPkRgS149PcV1dsWXJLxXF063cDsgmJPgAKKhwl7TI
	QciIpj6DFom453SWLMXgyoHSaabKREQzmOk/rDO6qN5SjB54uFMtc5Ws=
X-Google-Smtp-Source: AGHT+IEbBv5golGdck82zYT7VdnqUxrDuq+0YFtaoJS4PcQHU4sgfH1SEXp7Ye8MxD8F0nCNKiPM93GrBg6wVk6VsKNLWYPChVRY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:13a8:b0:36b:7e8:3851 with SMTP id
 h8-20020a056e0213a800b0036b07e83851mr313392ilo.6.1713004163888; Sat, 13 Apr
 2024 03:29:23 -0700 (PDT)
Date: Sat, 13 Apr 2024 03:29:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b005380615f7dc07@google.com>
Subject: [syzbot] Monthly jffs2 report (Apr 2024)
From: syzbot <syzbot+list87c7a7f61f75d325f246@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_032926_968688_40C04613 
X-CRM114-Status: UNSURE (   3.11  )
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

During the period, 9 new issues were detected and 0 were fixed.
In total, 9 issues are still open and 1 has been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 616     Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<2> 12      Yes   KASAN: slab-use-after-free Read in jffs2_garbage_collect_pass
                  https://syzkaller.appspot.com/bug?extid=e84662c5f30b8c401437
<3> 7       Yes   KASAN: slab-out-of-bounds Read in jffs2_sum_add_kvec
                  https://syzkaller.appspot.com/bug?extid=d7c218ea1def103f6bcd

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
