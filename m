Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B411BCCA463
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 04:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=4XhScvabpTR/QwfmzYx3UKidl6zereB3mOUwkAxFahg=; b=Nv6
	TGTzKtjxHE5o8tVTT1lsRZ8Q2Y6YVjEPLnb4dZOugCq8sC7UIzJbD+VTrKazN+BaYILJS70B9qCpP
	NZhSZVv+Z09bRbsCykxgSmwzbDGSQcwtsEyf1hr9+CHDzdmUATd+lc56HU5cCcmvvnkdQr4V3o4my
	QGZIf0tvEVcCmIjK95FbOyHKuIm5ukw9ukeW8TlsmSAWaHTkHE2xDgiPEkdPMYatVXyiT4EjU9CfV
	GwPOyX7yNBCx9FILhYZjmHmmhob9NY4XYgBljH63sIeOfspxGg2Xbyyu0dqSzvMEMkuAzxpsC1K3t
	8sHlcUB6TogxMZY/p2L1IhhPyvJ82vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHw6u-00000004Pts-0jKl;
	Sat, 17 Oct 2026 04:33:32 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHw6r-00000004PtB-3fAC
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 04:33:31 +0000
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso651605b6e.0
        for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2026 21:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792211607; x=1792816407;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=znQ/6erazSuBWZJFYK2t4/TYjjByImut22Yc7HPydfw=;
        b=bfvIQJFp2d8VlqfofhjbADb+q3dSedfe+xty9Pd+OKxCRm7Ei+Ki8CXCK3OPggx+Pw
         JuLaSGzUQDSreRoEXALXrT+rI7i+K4P5WEwIET+t1rfHHoG8Uk9TY1obcUaa6GuLmLLV
         fZ6McPEU6JPhZNevFu5P5cK69tX7huVxJOMB7P6JFryVC7DN7gEa7Z93xo5R1al7VvFu
         Cyh4WhhuUkWJMsMPBIVncWqsMHU26qag8m7bGAbPyCPSG826XobR8vb0bXxyPxBaDiKO
         gMex/vCKjpLTKCnW8v6828gEDABw5EUZ9trPv9XqLvIe/LJC1Qi/FwgwUX+4SPMAKj6v
         bB8Q==
X-Forwarded-Encrypted: i=1; AKwUvByxuRSOwhLbvJzqyhMBUaziopLT2HgmiNjrUTEyobPdp7LMT6pPCMF2vyG2hO3yn7wily+S7FYNuYg=@lists.infradead.org
X-Gm-Message-State: AFq9FYKDy4yXLyPz5JF479PkK5W38tbANUTvbff+0szTq2KGrZC4QmHO
	wSyNzWOzRd4UVMNTxfZKt6W9pR80BY7GOi+i4N6ovUyeUjONHXE85P1OzNoJyGMGI4oYUszGbAD
	OWf7Pgsb2wbVsVezJqK+xQnBaUjt588Yy+tU5eHen25SidFVJ38xmiGe9bq8=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f5f:b0:4b9:a88b:8889 with SMTP id
 5614622812f47-53ccdca144dmr1787696b6e.31.1792211607715; Fri, 16 Oct 2026
 21:33:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 21:33:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad2fa97.6814cce4.34c49f.002a.GAE@google.com>
Subject: [syzbot] Monthly jffs2 report (Oct 2026)
From: syzbot <syzbot+list0128a3c76429c868bdf8@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_213329_929817_2FB1B9E5 
X-CRM114-Status: UNSURE (   3.63  )
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
In total, 9 issues are still open and 1 has already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 25      Yes   KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
<2> 10523   Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<3> 7       No    possible deadlock in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=fdfd8fdf716c90baef0f

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
