Return-Path: <SRS0=0Mf+=GU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6B7C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Jan 2021 16:15:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D83DE206FA
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Jan 2021 16:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83DE206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:Reply-To:Cc
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=p0f/sCgQRn2TL/mtIVBO//MlaG84Krutn7DNcHOOtnU=; b=kVPiZ3uHI+joivI5+51vSein1t
	V0cRwdLVNuXhQ5HiYYIGlEjazyl0l+eBvB6jjyu5BgTMz1rjfbZ5keCF0gAywc75I9IIlWNRPSCTf
	+syRgZk04G3RXnOfhs5ecHwoC4sWne/fkDv0fORbizcsCK6lyF1kH2ejoS/cy66k5bQw/Sah125Iz
	IsUE/c1GzZfy1n+B1BQ+dvLcLWTwCf6wPab1icNSjU42/pknP8RMo8ktGJLZT8aDccNEkm+OJ4zwQ
	8Yft5poDZE7KOimyPUxeTZELQAPgeOyVK8hkqI6jczGyDbZk3h2t2NuGWogxkVPatkrQVcm/Fcn6Y
	dQh6WJIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Ah1-0008Ue-Nj; Sun, 17 Jan 2021 16:14:19 +0000
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Agt-0008Tw-3B
 for linux-mtd@lists.infradead.org; Sun, 17 Jan 2021 16:14:12 +0000
Received: by mail-io1-f70.google.com with SMTP id a19so15298928ioq.20
 for <linux-mtd@lists.infradead.org>; Sun, 17 Jan 2021 08:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=7wRcMMariHwqlI4TwHzc8rWIHn72k7o7eSivI4COV+s=;
 b=HyD2O2oOOZjVAbFsUeP1lfBkTGpZT8/KYIUm3DxFf1HdSetP7FZ++afo0evOR4S4FP
 gC7NAoLdObnU+abb/tWBad2I3qL1aCqXS7VaDsZ35aTmRpAzBRIsxNrtFzFpZUfgwBTi
 ExrlLLM26l7EsU6tMi/OLV53KUgvMNoJ/mgl8k07VhWSbAwhXGNAeZ7msPNjtEuOm6DN
 cEVJfUKirlAsROb81OJErj1+5rzFOE4RTZ4HAN1P5W9VDayaQmDMwrqfAfNZwF04yB3F
 ow1oh4Pee5V9D2Y2GVGVdfpZFFcLz2R2vDcglNx48G/F4xMAwltmR+pK9FnGscj7u5BY
 n4vQ==
X-Gm-Message-State: AOAM531ks3z0XQD/3mDW9XNnyAa9rcHY8ZammIUBmD79dn3H/tH1AcKM
 +RcjQzGPobe7+BI/gpV3FtoXb3S2OGPnOpUBeciFPgX7aCIk
X-Google-Smtp-Source: ABdhPJxYKgANZp1DuXdut649JU//lEyIr6KJNP0VSqw14Skr4Rp0cfOAh8VJpIMTZzFsIgTS6ePeh8+kUYaRDfsqx8xDOZpenYGO
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1010:: with SMTP id
 n16mr17661202ilj.3.1610900047611; 
 Sun, 17 Jan 2021 08:14:07 -0800 (PST)
Date: Sun, 17 Jan 2021 08:14:07 -0800
In-Reply-To: <000000000000418c7705afcff2e1@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001b4eeb05b91ae518@google.com>
Subject: Re: general protection fault in jffs2_parse_param
From: syzbot <syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com>
To: anmol.karan123@gmail.com, dhowells@redhat.com, dwmw2@infradead.org, 
 jamie@nuviainc.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 lizhe67@huawei.com, richard@nod.at, sandeen@sandeen.net, 
 syzkaller-bugs@googlegroups.com, viro@zeniv.linux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_111411_185943_3A4D9CEA 
X-CRM114-Status: UNSURE (   5.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

commit a61df3c413e49b0042f9caf774c58512d1cc71b7
Author: Jamie Iles <jamie@nuviainc.com>
Date:   Mon Oct 12 13:12:04 2020 +0000

    jffs2: Fix NULL pointer dereference in rp_size fs option parsing

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cb91e7500000
start commit:   bf3e7628 Merge branch 'mtd/fixes' of git://git.kernel.org/..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=61033507391c77ff
dashboard link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d81f32500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13516852500000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
