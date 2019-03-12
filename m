Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC4C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858472087C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tK6ajHIf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n71M0j/7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CcX/NJUY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858472087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pfu4m0IHYSVNatgZBkhsiRj5dJRQkmVNBhFLFaI3LPU=; b=tK6ajHIfmFre8/
	SlbuAedu/45gl4QGDKYWI1woOKz1EYWVoNp75LvYuptzmqfBl9SbTwbtiX3RD5vEgJtR02rKdPqcX
	NX7r0HmHPAd/6OybxI2+r09drPOlwvyGaeo/fYx8vZv+pvQMQVgIRJ7jjOwac98YYP3NEBF8l3bW+
	5V6URRZ9Ue1gxMumUOs7/YBkmxy87lfuW+dJS9H07cKXaXMIqXlPOQ9+IylLiCWBZvJ/F0ovRSjFH
	/3rCp7vfd4lhcM3RxtD7I1+ycUlRZ194Y4DCIq7eYFDkvWbcV8SI1Qi/SxI2Ie28mkRppykRe9nWZ
	G2HHseKbFj7v7byjDQmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h40z9-0005Q2-R3; Wed, 13 Mar 2019 10:19:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40sD-0000lH-3N
 for linux-mtd@bombadil.infradead.org; Wed, 13 Mar 2019 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7oCK2bBSjJElYeA1ihvX+ozoLOyZerfA8IGPq/A1/T8=; b=n71M0j/7i13d71i8nDiVr325A
 57EtJ8AARfZHAn30izZ/zIsSGAwjHhx2Ozcu4AK987OOtBp8I7He2NGe5IIt3iK+uk0onXBwG0+01
 h3WazK+clThtHoSMfFCqhJ27WebzS/49cwv26rvqcOacvXSsjQGmBhYAodX4SIHdw7JK5Mq9uibuI
 dzVpHUpUT0C1m3BpUVSWPcNKhuInEj61JXtziHyhuKa+4b+6jgxbf7G71MfeCVC4TZlhMY2xoXuJE
 7Jgy8/CNojs7kyR2HsSkq4rgjZ7Vx31lQsZqzR/yi0iuJbCSo2r0/t5VOX8PtF+EW8eH6Mqj+Attu
 Keu7phnyA==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h40s5-0006dN-Mx
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 10:12:30 +0000
Received: by mail-lj1-x229.google.com with SMTP id z26so770519lja.13
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2019 03:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7oCK2bBSjJElYeA1ihvX+ozoLOyZerfA8IGPq/A1/T8=;
 b=CcX/NJUYUS/PzcPQOmiJRxxxzx/7kD3/OhTdlkZnRb1Vh50+bufppcz9JU2p+vYgHe
 +ZtmO07B+HqiItCnN5M5YmSLKD8uuYq1sQqpY7QSphTwMPi3q1HdVJvVTmjYJHoXDoGy
 eas/9slYLGfAP6p2puKcid6amGx5qo9Av+A1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7oCK2bBSjJElYeA1ihvX+ozoLOyZerfA8IGPq/A1/T8=;
 b=cQAUm+g/92aevsqNBAguO9PruAc6qF6gkPd2KTJz8xwf73oVnkXdtPRdkqTmsAn5Qb
 Ipwr/Ml8izRDMlPet0GOSa7Q6LbPxXH64HpPCqmi9PGM/s2gMaD2Sxs7heosPGro3rKf
 I7d7N6rs1u+VOBgYzsT/xE9rl7h3BREI9cD82/8vbzAnG/f37PpVuLPeV+F27iNkoIk/
 I5G0TYFNQ0ZFF10ygzXTP1vo7kku4hU0BnmmcyoBeRb2LGkYLhi8vFui4K1hu+d9uG4n
 gWjIZteNMPPYo00hXkFkHpHyGmh82KZV89kjG5XShI5H47WeJk9Y1gs3/0dgc4xa83Rf
 t05w==
X-Gm-Message-State: APjAAAVw//68jMcwnPkFCgyJJDPHwCb9t0Ka3H1foymmHVlkifk7NiRR
 6+uP8rEbKaPLZBRSmLSeVtw+xYwF2xs=
X-Google-Smtp-Source: APXvYqwMZEpqSxh3lADxvHd96UVdYyFnXRMIez9vNZOQtanIEySqEcsGb0AHrWxBjRsn5hC112QqHw==
X-Received: by 2002:a2e:9793:: with SMTP id y19mr20484223lji.194.1552429121316; 
 Tue, 12 Mar 2019 15:18:41 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id k23sm1553264ljk.69.2019.03.12.15.18.40
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Mar 2019 15:18:40 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id l5so3780684lje.1
 for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2019 15:18:40 -0700 (PDT)
X-Received: by 2002:a2e:8510:: with SMTP id j16mr13942668lji.2.1552429119879; 
 Tue, 12 Mar 2019 15:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <6283638.XALati16HY@blindfold>
In-Reply-To: <6283638.XALati16HY@blindfold>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 12 Mar 2019 15:18:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wixZBzR5nbPZ3Y1=VahyVDsqVZhRfRhewJybx2-yA_FEQ@mail.gmail.com>
Message-ID: <CAHk-=wixZBzR5nbPZ3Y1=VahyVDsqVZhRfRhewJybx2-yA_FEQ@mail.gmail.com>
Subject: Re: [GIT PULL] UBI/UBIFS updates for 5.1-rc1
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_101226_268892_25F4D0B3 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Mar 12, 2019 at 8:13 AM Richard Weinberger <richard@nod.at> wrote:
>
>   git://git.infradead.org/linux-ubifs.git tags/upstream-5.1-rc1

Pulling this thing is taking forever for me. I can _ping_ the site,
but the "git pull" has been hanging for a while.

I really tjhink people need to stop using infradead.org for git
hosting. It really is annoyingly slow.

If you don't have a kernel.org account, use github or gitlab or
something. But use something that isn't excruciatingly slow, ok?

I don't know _why_ infradead.org is so slow, and I don't much care.

It doesn't seem to be due to network issues, because quick look at
things, there's no real network traffic, it's just waiting for the
server to start sending git object information. And git tends to be
good about network bandwidth anyway. But git *does* require some
reasonable server-side resources, and they seem to be lacking in this
case.

                Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
