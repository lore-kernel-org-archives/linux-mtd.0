Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F952C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 09:37:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AAE922CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 09:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AAE922CAD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vRdz95aWRghTeohYC1ohY8cG1Rk29xwxsX5V7cMRJM8=; b=H30lyL1ViQzEYmk1ytmB87MK/
	GwVgyEGtfKJke71w6EPDKNIwuojfWCdu7MVSp9IBN4gCqaPTQut7jjseWN33RVCECJUDGt3QuqLUc
	mmmhW/yOhcMJtE3uy81XAcJLGXHsT9XAVaDL6F6sEAbUh+d61yR+aENoChB3Z2m3jpQnNa+G3FrN3
	+JDHwJgyenQ51eJ8BgkV30qgkpyjXIOTXEKa2MEMBp8F0zN0F8wjpMAZoFwjEYyuItKeZ53KGj7Y4
	d2rnly9/Ak7bVi6QwR8ZKFBED8z6vAH81ju8x+A/u/qQ+NVr+Hrbgdd4ae2NIUZ071dbL0O9wl+8J
	K1DNIzHbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3yIp-0002Ee-7J; Mon, 25 Jan 2021 09:36:55 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3yIm-0002Dq-Nc
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 09:36:53 +0000
Received: by mail-qt1-x835.google.com with SMTP id t14so5578368qto.8
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2021 01:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cRQosLm6C15KsdbC23z53ajS0ecGg4Tv0WOPnf4DcbI=;
 b=EHl79LcNBPa09vYmh5NvxQvwwidvVxnIqn3I/Hy/z9XHQ/fHzVwKPcucw1DHXOV3ug
 vYD3EbzHtHyuqjEgXkK0bduWkFxxoKGyzKX6qpt159lfypUoBN4LItQQc/6tyeHTDAHM
 7uOabEhAEHERLBY1WRTHE9SA17jPhFPTUJUalI0ZXPTDLuhkpDX1XkU61wMqvv9eNKec
 XZJO51qerZojWiNgdVnXAmlPwSY5ueaeAo+CcTYVWKVrEQlGbL0d0B9xBc1v3nvQ9M0f
 BcSaFnw4p/WvBfghFxU/VegTdjo93M6UIv5jZhhuhJLfg6foUVIr8U06lYJMe/QG8IIB
 Gn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRQosLm6C15KsdbC23z53ajS0ecGg4Tv0WOPnf4DcbI=;
 b=f/DffIfs5ufuMg36sWTGtpnsDcc101YJjp3UfyVdvZtw0hiX5ERfoO0/EGWQ9CP5kF
 ZsE8RqAwq3DaNnlDa6m/DUU/Ohli21PCrwyCEzGw9YWQtUSPHPeiuBAUp4O24nwp2y+7
 B6ECOPaJ4jIJVJxwQnmDW+gNT2wTVcAFSUOfxSNQxMhUHNbH7dXSUmCJMTaHLgjzKoKW
 oQSIs2eO7YqyWURWQUhNFO/4iVKPRZaypWfNoWHeCcMdxbG/jGIwB8AGUhGSss72Rhla
 u7DOCl8BhkqRZzeGiHHRWVGtRqky/ZRqvFCz5x4Apl5gSYcdOnYKwEvxOW6nk8bqAG8k
 AhZQ==
X-Gm-Message-State: AOAM533zy+3nJdBRon0ay9xadDp3CTABr6A0X33b9l3F++fGrL7Zj0NO
 87+XSb/+5rrpOTloxhSNmFsNaWg2lBNouaPzX2gDow==
X-Google-Smtp-Source: ABdhPJx/RY2g66p/t1/L0q/cqPmlQAgvBZkCf/KHiV6YEfYM36LT31LfSHFCetjbvDZYwqBG8g5Q4idYKqRctw+2qic=
X-Received: by 2002:ac8:e0e:: with SMTP id a14mr587226qti.66.1611567408146;
 Mon, 25 Jan 2021 01:36:48 -0800 (PST)
MIME-Version: 1.0
References: <000000000000418c7705afcff2e1@google.com>
 <0000000000001b4eeb05b91ae518@google.com>
In-Reply-To: <0000000000001b4eeb05b91ae518@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 25 Jan 2021 10:36:36 +0100
Message-ID: <CACT4Y+Y=rsqHVRGWtfcJmdd_8CAYw3W_tO72_YkpLiu6d9Qo6w@mail.gmail.com>
Subject: Re: general protection fault in jffs2_parse_param
To: syzbot <syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_043652_798585_C9134D92 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: lizhe67@huawei.com, anmol.karan123@gmail.com, dwmw2@infradead.org,
 jamie@nuviainc.com, Eric Sandeen <sandeen@sandeen.net>,
 LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>,
 Richard Weinberger <richard@nod.at>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jan 17, 2021 at 5:14 PM syzbot
<syzbot+9765367bb86a19d38732@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit a61df3c413e49b0042f9caf774c58512d1cc71b7
> Author: Jamie Iles <jamie@nuviainc.com>
> Date:   Mon Oct 12 13:12:04 2020 +0000
>
>     jffs2: Fix NULL pointer dereference in rp_size fs option parsing
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15cb91e7500000
> start commit:   bf3e7628 Merge branch 'mtd/fixes' of git://git.kernel.org/..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61033507391c77ff
> dashboard link: https://syzkaller.appspot.com/bug?extid=9765367bb86a19d38732
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d81f32500000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13516852500000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

#syz fix: jffs2: Fix NULL pointer dereference in rp_size fs option parsing

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
