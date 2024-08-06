Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5415C49EA1
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2024 12:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VBLM0pEB4O/znERpqHRCP+5JofWlM/HHx1UgUvc27Z0=; b=rQK
	rZuSFa20IiIgPGde5RkOpjl7dX8m6GCHUch71BSrqeZeGoM1HFjJfS+w7T81DpWDIrmqLdYcPgiqD
	X5zlooX8PVeOWCoEE/xv/ebiTESgm+O0is65QvkMFa+rhuMsG/BWrDGs5jPm+C4E2k2wF2tarjdZQ
	Iy/g5zn6mldarXPP//ct0MUTza1rQ9KImdl4lLNk5RR5dHPi05gZ1RLpa56j3WT/P2a+0CT30GDuy
	GveazEz0rqpWNne7LEn3sMr1MdOphZdscetmpjWk5XVzsp2Gd2WO62edLz3dRKhRiFSRq7imHcjwU
	f5HKXrvNXe5z71toXj/cWrdiSqYQcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJTR-00000001WtD-029N;
	Tue, 06 Aug 2024 12:39:33 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJTO-00000001Ws1-1TWq
	for linux-mtd@lists.infradead.org;
	Tue, 06 Aug 2024 12:39:31 +0000
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-81f8d1720ebso84024639f.2
        for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2024 05:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947968; x=1723552768;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIsK4Zhm8DeNTVyySFlh0qMMYw6ijS/N/XatwMsGdQE=;
        b=Zn3+VEwS2u2lxI1Sh9Ssxvhzo1SpKv7j/2nK2OAlyZQAxuOU0otaAxCqUn5t81ByCB
         sX753eVkDpQ6dT4C13PN82OwMpQDAiZPQRIOfMJVFoyr+hijADXAYPw4/0aZiaL474tt
         U8hoWTatKaBsiCfO/xWbAqabvKXRgUD/9ugmRqNE6sK9PF/PAewCj7JnQZ0VpqaoIJiQ
         bIETFsC00U+NKgrz0Fgza3kUA48pJY0GaFot5n22Fm4prdxVims88b6i+jKSJvGCY3b2
         1OwTDo7kamLWIqRspwuxrgqTdHjtB/txhHmzm3f/70mxpb90sa5/1IF+CSqyYgu5ptAj
         25FQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+b+XR5ALf+NbOFalh9Nm9Fk9kUGpOLcY7EIXcLz6vN3MUv4HWqC8FgYCV7fUtpE+ccTCBr3gvG5KTwYSrjVygwCo1vOoTrYDIY7ue2A==
X-Gm-Message-State: AOJu0YyU1f96KLiAIkGpsc3lonIv2iTz7YzKCee9kj1uxXMZNrPksHKN
	BIxiVWESJ1Lll5D7CF88QG7YFMSVv1RdjyyXhJaaC+Wj/Qgalh5c2Ij07B+yiZlNFHNh3S7ybGJ
	ZvIaFQWPFbKtpjrfiHqcjytoKj9VB1kVMnErYbBzqX1JuP25AwLTMFrE=
X-Google-Smtp-Source: AGHT+IGFR/jSOji8KiIQk8A8GUKQozz6fTjGvhbdsdH+fAhCdZu6unNrrCGgXIDP/yPM76dGkcwgEOja1BoxJyAl4wQXa6SydWMd
MIME-Version: 1.0
X-Received: by 2002:a92:c561:0:b0:381:c14:70cf with SMTP id
 e9e14a558f8ab-39b1fb6bed1mr13341315ab.1.1722947968517; Tue, 06 Aug 2024
 05:39:28 -0700 (PDT)
Date: Tue, 06 Aug 2024 05:39:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a15b4e061f031536@google.com>
Subject: [syzbot] Monthly jffs2 report (Aug 2024)
From: syzbot <syzbot+list5279c8c444a08dc01075@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_053930_410051_180FC83C 
X-CRM114-Status: UNSURE (   4.16  )
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
In total, 4 issues are still open and 1 has been fixed so far.

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
