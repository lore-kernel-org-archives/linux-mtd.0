Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7512FECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=am8Cb+lVg6Y6mLaDfOn0798ZVUVAh7nWbhN6/4gKAB4=; b=iWA
	PZwm9JHUZns9NJL7n2V1Qu//pDRiv/yHv7/dUNn0Meqf7uUdBH5E97+jjFmggGexJUuCRGGKtDaSZ
	7JhKt1JUzaQvlYkcUsh56qH2tIEp7H8oVoMwYdRpmg3S1WsSjPuNG0RoPxPnh8f9ByYb7d1H3lG/o
	sUmqE5hsaaihg+tWxJlKWuNz20a+vmjfB3qCmg/yofIaeRcB4Te75YycpzURqGARdNCDBW+KrG9Ne
	lfKU9Rj0bzn7FVrj06TwjKEhvIgxnsnk86RRtlnijQUMstjRwR/NTQ79zIqAwb3zvfIiXSMABSiyY
	rd8WVSg59sg4zG/SBq4we7siptCAjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZcv-000000013ES-36KW;
	Mon, 09 Sep 2024 08:20:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZVb-000000010jE-24s7
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 08:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=aBzsADE7wAvv4qzDRBCiIM7IGXakk3xrHFWAIbvePzw=; b=dbCH5zdKsqK2tqeQdoTAybC023
	Z3W8QggqKUDTTpyk54I5QbdGIcveOXDFoiQp66FPN3WCHKpXW0tE64hfRlQ60KUQavNeWECK1zk+4
	Pb2IuiCGUtfnVcm8cnQmM5szA5MskWYdraTe5doh+BpqYnq6W7I/LhCMTC7Clz09Kx0iqqUrt+PGp
	5DpqluaZCCqDg4qHceLcDp1OTOpf1eD0zqNLhiQTvRVMKwJzs63rpLlfNB0oElKIshyp4Sb2V6IOg
	vsc/Eiff3wYMzjOKRXlyTzRu/UKhKjQ7WkJ/zcejaS6R18fihPAG3J+Ko7bHk8HF9RhAbHXPEJGBV
	2RDNSVdQ==;
Received: from mail-io1-f69.google.com ([209.85.166.69])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZVX-00000000MJE-2qnD
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 08:12:26 +0000
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-82cdd759b8cso101822439f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 01:12:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869540; x=1726474340;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBzsADE7wAvv4qzDRBCiIM7IGXakk3xrHFWAIbvePzw=;
        b=ng7+cxdTgIJBbPVDTAVUz6AL5/sMFTCWtuAyyenXsvj8KLJ6guAeIxdYa3pHaT35q1
         hMA2d74lrEOYbkS6Yw44w9onglvwa5jGhnvjKfH5m5n7k8E1jzPkUB22VL3LLUSXBhDV
         g8zM/bWuwj60eDW17RmO2qc72TAHdnH31bvBBBYNMOXcV6n8hwMyzPfCecvi9KTaYpO0
         s18TR0M7rVueXNuRyc/pg+Ul005Ww59zTiufeiXqqS+rrIMp4h/hfWMMpXA8ollfJmXh
         AgxBB937Fgbgvk2vHlrnghoAUOMNXmEtPfi+kBvBmLTii8sNYIWEfq1FLcoSdDdnYxR6
         TsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5yZP8uPuOsk8pLJMsVxPcUQsd4U0X93fJRC5QNdHdLgxw8z1mwnJhGD5GmO7Dbp2MnssIgJbQRyI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrCxoBMJuhBdQs6wy6V41JGmS46PLggXUAUbg9cxUMLzdcMv4r
	YinCO4PFDqDTSNoUF/WAhXnjtSpLDhIeo2h7lM5BghvYu6ZaJoOGR1f+HLk4Y63fYcuSosEQuoT
	iorfjVJsSzH42sxZoFQjYlwhU3euzVgPSGfGotVvDmofxjOJXcSzBQM8=
X-Google-Smtp-Source: AGHT+IG8h5ubNHwxbEBVcvU+kMJDZzC/Me9UJrQzG1Fml/eTOkhW5WJxULANLFMhpVq6B9znhkKM/rOcQGK+B6oA0MvMLaKLQYI/
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27c5:b0:7f6:8489:2679 with SMTP id
 ca18e2360f4ac-82a955c2fadmr971788739f.8.1725869540413; Mon, 09 Sep 2024
 01:12:20 -0700 (PDT)
Date: Mon, 09 Sep 2024 01:12:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e2a5680621ab50ac@google.com>
Subject: [syzbot] Monthly jffs2 report (Sep 2024)
From: syzbot <syzbot+list2fe8d8294fea7add3c1f@syzkaller.appspotmail.com>
To: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_091223_815778_23DE3DC4 
X-CRM114-Status: UNSURE (   4.45  )
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
In total, 3 issues are still open and 1 has been fixed so far.

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
