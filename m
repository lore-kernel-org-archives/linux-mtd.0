Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB7CD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 12:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=dPYAoellcuw09bT9ONezEt+zjcB5urngoX8Zc0GfYQQ=; b=fxin46gRNNgudJ
	wqMFj66H3V+j3sUDDjfna/yz/xBvguTFo0sfMsC7yqhfknVMqmpfqqkWsfLSqW4oKMTk6jr1MrvmV
	51wBE7UDRcs6Q3va0CpIRA9PV2QAR6fxw5xWc2ZE8mI0aRuXt6mgou96sD2h511iif6xHCDf7t/F6
	6U19rb6h9+FvZrYZaQJsQNu6LoTIkXjBbQ97TO8XbKbH6XdXVvZsVb5K2xfVcbGakETkn61e4BmEa
	OIYCNwoV167Qpgt5FThzd8oQkdEyee/5v2S7P9mlNWmPmfd7dt6+DHFbM7z514IRPUWVoDNMxF8ys
	nKmfB6+6h5T61ZFHMf1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiFu-00000006nVA-02ik;
	Fri, 05 Apr 2024 12:01:14 +0000
Received: from mail-io1-f72.google.com ([209.85.166.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiFq-00000006nTR-24Pz
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 12:01:12 +0000
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7d04135eb47so207774439f.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2024 05:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712318464; x=1712923264;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+2bGjZ5bXU5Jyjw/hPKObCDQon7IZrrva5+NdOfmYM=;
        b=Gi+RlO2VNN8P9VE9ohGLF1oy8fgY2pTisc5tppt0bn2QjlGPX3vJAaTPtErchk/zy1
         DUCK8kprDXsVQUqYe4mlPyinVcvOqv3Wy4wsybHSuQ/Fdkww1ctgJqMU26bKOfu1YyUu
         F4eiO7tZO0HjD5iJJF6Ivenmj4GQPgctEzU4haPZcKEDKisqTf4WsLbAtbDxVTtFaGU2
         Y9d2aRLrgm7IUR3UJt52Ga1X2e/eSbARsUabN+8NJ8nQvWjdlQEgchognbVELOXRZw4l
         NaiHqiXEs0jzppw472mkDdmYtEhYaySGJk39Z7GvlrqdL5tg7W1tNRZYsRt0V7ycM3l9
         l27A==
X-Forwarded-Encrypted: i=1; AJvYcCXcQmQNelW7M7hLY3nQCKducxyKk7ucMsQC/OUXHdkpaC4w7fzbbNPmZ4BaWDWLmOOCpb5GQ478WDCB6oV82rE0jadJXtITJpxr0Ap11A==
X-Gm-Message-State: AOJu0YwswJn7ZJHAKoLCNkPP0kjmzEHD489UDByTsleT9YmjFAXX2jR1
	ZK0VrDH41Qim8du7cUU4OE8axAREmLft+5xTXylpHAkgIYTExQOUra4qKSzltYIBQGDkmJVIggS
	y5L7x2isBLzqYzsK/VyInFkggMUraP5cEtyyPCV8ph2rgroKJWnvOzLQ=
X-Google-Smtp-Source: AGHT+IE1D/TEXf+4qApYpOoI8HPj3Ge9wGIYouUqObjPXJuA/Im15IdGe7ptIxsZ9IbWUIJP1Cs/fz+iW6j6BrQTUktydF+zKLHu
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2582:b0:47e:d240:4d82 with SMTP id
 s2-20020a056638258200b0047ed2404d82mr19208jat.1.1712318464427; Fri, 05 Apr
 2024 05:01:04 -0700 (PDT)
Date: Fri, 05 Apr 2024 05:01:04 -0700
In-Reply-To: <00000000000032adb00615568aee@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d099c506155835b9@google.com>
Subject: Re: [syzbot] [jffs2?] [nilfs?] KASAN: slab-use-after-free Read in jffs2_garbage_collect_pass
From: syzbot <syzbot+e84662c5f30b8c401437@syzkaller.appspotmail.com>
To: arnd@arndb.de, dhowells@redhat.com, dwmw2@infradead.org, 
	konishi.ryusuke@gmail.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-nilfs@vger.kernel.org, richard@nod.at, syzkaller-bugs@googlegroups.com, 
	viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_050110_565363_8462049C 
X-CRM114-Status: UNSURE (   3.59  )
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

commit 9c8ad7a2ff0bfe58f019ec0abc1fb965114dde7d
Author: David Howells <dhowells@redhat.com>
Date:   Thu May 16 11:52:27 2019 +0000

    uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=113c6b3d180000
start commit:   fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=133c6b3d180000
console output: https://syzkaller.appspot.com/x/log.txt?x=153c6b3d180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4d90a36f0cab495a
dashboard link: https://syzkaller.appspot.com/bug?extid=e84662c5f30b8c401437
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=141bc615180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=148423e3180000

Reported-by: syzbot+e84662c5f30b8c401437@syzkaller.appspotmail.com
Fixes: 9c8ad7a2ff0b ("uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
