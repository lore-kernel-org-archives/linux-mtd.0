Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CF9606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 04:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t6G5U9DP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=k6KARdvV+2f6TK/cxr8DJ4WdiaOiNyKN/T8SR/NONu4=; b=t6G5U9DPiikJy9Ez3Utxz7PUk9
	BuEp7Gr2c7QqPQEwEEhYyNoDqDAOtKS62Qkq2/YeqmPQeBFqp5uNvU485+ovTyMscBfDn1LindgOC
	n2zwzfCCAMjVqEqnA+z78nA4RucvB1poa6bNPASUbc70w9M5cV7ZkvHoYCJdXH6uWSXRm4Y13DbGg
	WS8UFJ8EsPLnsscyImDZmHh8kEEv9SJTmal03XVM+YI/rn/l9AIeJFY6czYDX6DBuGd8JyEB9E5LO
	qxlA+D4jXmcd5JnSxHwaSyI5ijUeLuRgDOZRQUIZ3MzjLG0a/9Vn8xSf3yayW8mstgWwbcatNLrWv
	Zem317CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAt0-00000004XdE-14TW;
	Tue, 17 Nov 2026 04:33:38 +0000
Received: from mail-oi1-f197.google.com ([209.85.167.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTAsx-00000004Xcj-2wyF
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 04:33:37 +0000
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4eb0b989f0eso743339b6e.0
        for <linux-mtd@lists.infradead.org>; Mon, 16 Nov 2026 20:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890014; x=1795494814;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIDj9/6TQbU1XFTPX19xQeVl5pX677A/6eYbiA/99p8=;
        b=t4VuJwYxS2aXQZ5cz5pej+Rdz8NbtSYUvBsIY/+G30ruKURrXt/e/12nBlJJV/XkS6
         L2FqvcLko7NqO9A9Jlb33w0hi9PwNHKALnChbTyU2NLKm22fRVoSkfkjAHyzsylGdhRZ
         ODsyhiRV+eMTFo7ua/DW6ofMhJA829nBYtrcFxGi9SceyGUNvUDFCrKWTRHV+8X0n5o2
         H/5O/o1lSKMRTHw2UWDrFpJHBSGn1S2IIP13FbDZKWcyaSUB71lUWdgXFi+B/eunKMnl
         /EHZDl8GiOE9ZLkQdDn2avpBuseJveCvftqJrC3VPFDJa/oO70k/bksfE+dPSUKhS4He
         9+lw==
X-Forwarded-Encrypted: i=1; AL+hErHDw7gAC4a0R45Mn0uUC1GH0orbAMEL3KxAif8QbZF5PIygFJvWo9oRoku9XsWosUSMRrqzUwj/dUw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Bg7f3bfqZ2Huu/adWKq0y/1Q0/i2Y6K122VVt+7wo9WqPFNFA
	cyWQIc0bEtUFuWCcvlZNQMEpssgQcPcAifhWZxI261jqQ4Sn5L3DGAYCb9eXhBXJ+xVNKYwqfhF
	VCFRQhv1noo+8Zzj/4ZOBzCj8rSA97/ZTf2Kxq6GS4JO2pLc9aLfzSXA8mLk=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10d3:b0:4ca:9850:4dd8 with SMTP id
 5614622812f47-575dd62825bmr1663844b6e.10.1794890014120; Mon, 16 Nov 2026
 20:33:34 -0800 (PST)
Date: Mon, 16 Nov 2026 20:33:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6afbd91e.e6a8accb.234e85.000a.GAE@google.com>
Subject: [syzbot] Monthly jffs2 report (Nov 2026)
From: syzbot <syzbot+list0fc9d5eaedfb6713a2f9@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_203335_743575_359C8B61 
X-CRM114-Status: UNSURE (   5.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.7 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello jffs2 maintainers/developers,

This is a 31-day syzbot report for the jffs2 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jffs2

During the period, 2 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 1 has already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 44      Yes   KASAN: slab-use-after-free Read in jffs2_xattr_delete_inode
                  https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
<2> 9       Yes   KASAN: invalid-free in jffs2_free_inode
                  https://syzkaller.appspot.com/bug?extid=675e84fdf3dde67b4946
<3> 14017   Yes   kernel BUG in jffs2_del_ino_cache
                  https://syzkaller.appspot.com/bug?extid=44664704c1494ad5f7a0
<4> 8       Yes   possible deadlock in jffs2_xattr_delete_inode
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
