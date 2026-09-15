Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F77C88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 04:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Um2xbGLrRVPk33A9PQ3Rxhp/ONnX2U3Tttlpk/6LrQE=; b=ScK
	BbWNwkw4R1/oiCXR08VdzrjaXX7ZwBphE/BqqtoVU8cpTmUVSZiBJGg4obCNzA4qOTUaU9EagtjnM
	JyH0ureAMM+o8M67LrPFNZIoenjE8RTGbdlD68ZoRAVFkc0YqyZgwVm/ztGXOUum3sswnktr+6G40
	LRftyFvq6QEW0Si/jewft7P9X1XKMF36sjZmqiKYafaqJHMeFsGVtlOh4L3tENpJj4TvWMrW7GwbD
	8/GqyhlcTH7Jhl4IMADI7QQD2k7lfO8fIFbIfy1heqcElpf1sRYbd40KhwftgCepqJse8nllLdApM
	1b9xgAfyKd8my71BEhVTkmKHzHSjfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KrM-00000005Bvo-2SCg;
	Tue, 15 Sep 2026 04:33:32 +0000
Received: from mail-ot1-f72.google.com ([209.85.210.72])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KrI-00000005BvP-28eY
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 04:33:29 +0000
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80139a2495aso7320182a34.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 21:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789446806; x=1790051606;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLO/IjQiB0f5Xdimriq4y9hQ5MQFsJJx6R3N+ei4KlY=;
        b=QqZ5F6iodB5Pe0J02GiHnEc//3ODpWNuhxjbA+NRlZpgwMfKGuLdY4cLaLotl+MaTi
         6zm2EAZAVghkUkHkJiIx48q8GiwA2bXJd4LLKDean5BZiKHNsam+C/z8HrDz9konWgE5
         BYJwLucOVh/ks8miI+Om5p9zkxSuEF5Xrp99/QCaRs5IIGKd5YlTjKFaN+EBXI378ORM
         /Tlxu3lRvT+v0g/JLWHAetYZirs0uNdO243x5jQ6Mp+AUCnn2KC681bBeVvM1ExOGwal
         RpmHR/gLGWXkU8rJtY6CcJzPdEkdb2ZiMaNJ4zD89eu5bRupMHQXypMSkOa86JXi+/Ll
         38Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxb1zjXd3CvtmrtPiTi+rfGVW+fl1JdLA6DB8hLRlvOXYM+Jw2ZIt/KzpdxrIbyPNsKPx4x/46UN0A=@lists.infradead.org
X-Gm-Message-State: AFuF++m9xSSTKxnw65rc/UkbIODCK335r/VGEbW2TLGWnedg7C68AAU2
	wS5VZwWeugLPDMmiywKwhyenSneEEl/mL6daX1ZFJ+4WpbXguFCPpzZX1mf2IR1ba/krGO0bnM9
	P/U2134J+mxFeI3fFvyNCssWVSaZ7cTztv3XL5VIikpsfuyZ+cMKOBlAEWBc=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200e:b0:6c3:a421:5adc with SMTP id
 006d021491bc7-6c54008a613mr3208941eaf.22.1789446806610; Mon, 14 Sep 2026
 21:33:26 -0700 (PDT)
Date: Mon, 14 Sep 2026 21:33:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8ca96.a211d2ce.1a5198.02a5.GAE@google.com>
Subject: [syzbot] Monthly jffs2 report (Sep 2026)
From: syzbot <syzbot+list7c9a6d38f715693c2465@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_213328_550249_3D6CDDF0 
X-CRM114-Status: UNSURE (   5.07  )
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

During the period, 4 new issues were detected and 0 were fixed.
In total, 10 issues are still open and 1 has already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3       No    kernel BUG in jffs2_sum_write_sumnode (2)
                  https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
<2> 6973    Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<3> 6       No    possible deadlock in jffs2_xattr_delete_inode
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
