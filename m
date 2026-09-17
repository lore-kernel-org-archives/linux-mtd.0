Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875B6C982D2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:In-Reply-To:
	Date:MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=S5Pk2hnoLzI8OuLgnqOj4Tc76KW5ItnrtxFzXw0ocig=; b=xbwCJ37y3q/SDx
	+ybSGF+nfNimYMhVIIsQoiq4qr2wuvgxlKFYRwU8/gpwdJjebS8tHVN4Y1kNy9D0H7bG9/Yk1DjR9
	SQSOTG4SODc+/basYz/HGzwY4SsIhfkRaFOH2j11dLZ4fAj/UPNnQhkTAt/H+3W1KyzWK1XtoguYT
	rKg1/NIx5ytB4MPiKk3AuClTlq26LINCeBI4q47PQE7G6AYPXbOv4IS2UEhUpIX7DDbKsJImjpPfy
	a3Y/DJ/HgmnK2spgRycs4a6J/Oq/pTsD1V0P3JQMTOzdpLrmOK74LmJq+lG/OR+LV/jjRRS3Q6po/
	+A4l3YUHQFVX5Uc3zfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77MH-0000000At07-4C8b;
	Thu, 17 Sep 2026 08:20:42 +0000
Received: from mail-qv1-f70.google.com ([209.85.219.70])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77MF-0000000AszS-1bPS
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 08:20:40 +0000
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91051512080so8953706d6.3
        for <linux-mtd@lists.infradead.org>; Thu, 17 Sep 2026 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633238; x=1790238038;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jLd9W0G+g0fEhC1pzO8g1eY0KUSU+n4SflMsM+Hy+ss=;
        b=2NIuapJU/OJ1sHHVY5n1rm+KOapOBB/drgtORUwxiDrREPsfboBBBQar08Ch1fMudo
         TvaGwKUpn9xNBV4M2PEQv1sHDxfEs9f4mr+pN+7XrA3lldlfME4vb0UIwk6hVZAltfAy
         7lCH4lQOUulhnqrmjqB8pgBAwxXWaC6tqvtqqhJl270GA3Wf3TV2urAq8F1zoGZvsg7g
         Vk2JyTKYjg5vayxw2IyMnc2XnJIf9xrDMeeWus1PiDRTXiAXouQ9UC+0D0xZnTMUSXpN
         ++BBiCMd4qligxK7BdWvJSSX2AxzyFCLdumbp7F/Xt7N/JJKdW1cOFbqQNk/bU5NkS5O
         MZsA==
X-Forwarded-Encrypted: i=1; AKwUvByq6PK6gd0G+ej1FMTswEZLoA4+31JngB8rsFUzS5ka1xkowWQ/zHVvYbn+e3GYptyg1G6T+9mbP+I=@lists.infradead.org
X-Gm-Message-State: AFuF++nhjL3S29oAxsSIKdAN6pcZX9h9VbXvTf0PtIjJBL2shNrXWhZj
	TUKrYBxollvDrnIFGbA74y4ntDoFKW9Z2t2XKSCF2jIzZtH4UdVHoKR7uLmxpysYbexlzC+nEBI
	Dd69K+My0d/tUcGXthT5cazJF7Tdg5MPI9asBgFI61DbHaWtsO9lSv7L+xNg=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:470c:b0:4b9:a829:f016 with SMTP id
 5614622812f47-4ca4c6aaf9fmr5278837b6e.34.1789632785213; Thu, 17 Sep 2026
 01:13:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:13:05 -0700
In-Reply-To: <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba111.b398a7c9.1f86be.0013.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@lazybastard.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, rafael@kernel.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_012039_417868_C1DE9BBB 
X-CRM114-Status: UNSURE (   3.83  )
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

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165358c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117a3bf9580000

Note: testing is done by a robot and is best-effort only.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
