Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B059C5DF67
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Aug 2026 04:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8nzZpW9PTG+beFbtf9D9BakhrfGxQlPaGqHF+b6qT2A=; b=Ygb
	tHIxP07izVAlnes5niCyMp6jn3R0A730Vzubn8XUI3qOdMa/dfeMgmiI1o5H0Z5gwQJJc6rbjnhIt
	HSzSp7IXrfK2y59fkyBc/xUuRnJ3ZIpGA5hG696q+NSeOXKA+oo8B0TmMWro1e5omnbUChhezk5/f
	G5inev9nHX8PVgIpjnnQGDunvVqRCbpRGA25iL+2rX1TRSa/zzOsU5HVMrs0IBrYZznrBxBIPx0wA
	ifUGND3jrxhupDZ6bUwZ3dMYVI2qp/1Ux/gwEiFfb2bZM9qb8opjjRBfxTHbCNLp6FlJNgCTZ+v0t
	omZ5ncTrPHEMlabmL9Yb5Nu6TKOmzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv64U-00000003UMl-0dZZ;
	Sat, 15 Aug 2026 04:32:38 +0000
Received: from mail-oo1-f69.google.com ([209.85.161.69])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv64R-00000003UM7-0OW8
	for linux-mtd@lists.infradead.org;
	Sat, 15 Aug 2026 04:32:36 +0000
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b026a31fcdso1809174eaf.1
        for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2026 21:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786768353; x=1787373153;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlpiHYS9hkKV/3XNl67/QHKVeXdhVpzDhGsDeuamWkU=;
        b=g0iBeFy4++Tph13ZdU0LXW26VipNMfRH9ausGcXdFDuzyAl2UtTN73ahUKa5LlBb8e
         m02Hf9iYzeYZ5fWX9/zDyYHNejkqcyumW6rCe930k/MzKIzsUsLf9bUh2XgFotij8Rn+
         O4DE4tFAj3H/HyB0RaELZVLKRp/ZCbBt04Ahv3nEb8dIsCIiwsEa0hVzpjhY4hMd2xX1
         drZ0QCPugCalT+T2QJO71Apbs1ULM8QVsAZZThVLwhznYGeaKb/N0wAf+da+FZuRLJ8E
         T8hjb7GHYU3Vj/mGVWC3pbTwL8ZDEV8L4zJTYkob3pNDZ7FUX74zi7JcFjW+U1dUXIrg
         HSNA==
X-Forwarded-Encrypted: i=1; AHgh+RoPRZxvBnZjyUdViqExTMRXGoAkt1MdQxAk9j6aoUjy5LXBJX4mZ7wImohv6aBYDT9VwAdSylRWnTo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp+31qcHioMOTaR1fA189ezzGG5/4pCW0v5fixLKV9KEcmfiL8
	gkghVAl7cMjRe6HeYIAw/M74OUUDLeI1MC5vMfryl7LqRGT69CaA32hYzOC6Nb2cufGZRmS9A4P
	ZZyNo7SvQrHazXFvM0R18ks02XsUPESstFFjNDpsRTHKc0xXAkjUq2X+ZQsQ=
MIME-Version: 1.0
X-Received: by 2002:a4a:e841:0:b0:6ac:c22f:608 with SMTP id
 006d021491bc7-6b0d67524edmr9003526eaf.19.1786768353209; Fri, 14 Aug 2026
 21:32:33 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:32:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7febe1.9ebadd4d.20b15e.0009.GAE@google.com>
Subject: [syzbot] Monthly jffs2 report (Aug 2026)
From: syzbot <syzbot+list368dbb700bdc61d661c0@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_213235_135638_94DE2E27 
X-CRM114-Status: UNSURE (   3.72  )
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

During the period, 2 new issues were detected and 0 were fixed.
In total, 5 issues are still open and 1 has already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3       No    KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
<2> 2       No    kernel BUG in jffs2_garbage_collect_pass
                  https://syzkaller.appspot.com/bug?extid=9bbc6788187abbabb2ee
<3> 2237    Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0

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
