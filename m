Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195BDC35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 16:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1FCA20674
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 16:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OZVHprrK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrbYUu3O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1FCA20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEJytBSnatij+vk0gV9dLfX6JAJUw0LmM9QMEwjvAS8=; b=OZVHprrK8oxUjN
	RZ6FfELWsRud0NTzD3JDmBPt5qtrOvfo6u4zkSvQSrHTqjGl4B/n6OFAPHK5yOqeU5HkaJEHaDTb8
	V3Qt1eCKOLNOERI2lc7ackNtU/FTp32oz/P435yo0cRn2rdXgxXsO+PD2Xj503IxKKYhqSsrjW88n
	1O3BSej4ZywAjnKmSUSYC3214eimLQGcuS4eZWfZhXTW4tmMwZtWmf3mXGZWESLTN0xVFKX9uX8L4
	TSS3T7Nka6jwB31gmiyMJBEPWDY8RhB4Y+qbSDzY+HTGXPgS1juWozgljh0511/MKKDPJKO91YBCM
	Rhl3iO7A6/vXRohP7/ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izNNv-0008GR-W2; Wed, 05 Feb 2020 16:18:39 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izNNs-0008Ae-NY
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 16:18:38 +0000
Received: by mail-qv1-xf42.google.com with SMTP id m5so1363024qvv.4
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 08:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=efpDDMmRyT0+iVAa0gbT0Ve+Zfg4zoluaCppXefKKxM=;
 b=MrbYUu3ONfI3Fu0XESj07YanmdN2hWUM9mcP8SKd2BB0hW7UKWe7g7+oeSmoWLs0xA
 Z5kGmw7XvyxQQvPOd91OLrBpFHGnE2bc9//L/Oja1QhlizXgyghamHqBWSyIkwRfiUvK
 D+mjuHQJYfOefHvtFRaQ3DW9i6PCqzOcAxeUIPHlu2yJz4mTMw5SysadYxtQGK352CIe
 X5A6RhI87J/LmRMCNSEzkETKjiqi3aAtQv0IMoILqvBqeS3110GNqwtBpvYeiWT+7ibw
 3ouB1UN509YM7kFa5ER1f31n6N0IZ7ynZGY6Rkdb6Oo6vZ5HRUzwplkvlEa+KI8KrVxX
 ExtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=efpDDMmRyT0+iVAa0gbT0Ve+Zfg4zoluaCppXefKKxM=;
 b=QQCuWyft5W40tLqs+YCTDYqmICXUGO3ctj5QVmUhgP/sCEOnkZJUugndewve9ToLmH
 IH47OWMLvChmyGlHsFUYBS2Yna1v9co+J+BVe75CspK07ce7S5TEODiaIHaypzFTrrdD
 IMzKIbI/RBCSEAvH+7xS4AQtlD9Y8CF41iNb2wO9wtWeh1rvCJmGw8n+bOZrBLTJeLn4
 wUmaa1JA2gMnKiBookVCKZ75PuH2UkFQGcMSH3RXsall7QiqvUCbCHwOT8vBToh81h0k
 L01s9hhWIb9H/zQdUUBlIrY1OhrsDs7zAyTDP5BWxBwoSLC/IzUDZfAt08qt0QaoKnSR
 BhKw==
X-Gm-Message-State: APjAAAXx3kblDzwr5uVBXzFEKbprdWpotYOoIyM2cS9V2SA4/MN6phCU
 bMQlBwY3YSnQ1drryfEeL9VzSVaiuaeGJNcxX02LO+hQ
X-Google-Smtp-Source: APXvYqzh2T1/NTXfqpemGbrnjn26sXHlpPgOivIJvt+TQ7Ae0Z+9/CFTcd7g79JMiNlfy3mkOMRlh2lTxtkK5t/20nM=
X-Received: by 2002:a0c:e34e:: with SMTP id a14mr32712906qvm.73.1580919514141; 
 Wed, 05 Feb 2020 08:18:34 -0800 (PST)
MIME-Version: 1.0
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
In-Reply-To: <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 5 Feb 2020 08:17:57 -0800
Message-ID: <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
Subject: Re: ubifs: mounting fails due to error in orphan file handling
To: Jef Driesen <jef.driesen@niko.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_081836_809618_826A7E70 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 5, 2020 at 7:25 AM Jef Driesen <jef.driesen@niko.eu> wrote:
>
> On 2/5/20 9:22 AM, Miquel Raynal wrote:
> > "Driesen Jef (JDI)" <Jef.Driesen@niko.eu> wrote on Tue, 28
> > Jan 2020 10:51:39 +0000:
> >> ...
> >>
> >> I'm not really sure what's going on under the hood, but it looks like a
> >> problem with the handling of the orphan files. With this knowledge, we
> >> are now able to reproduce the problem reliable, by doing a power cut
> >> while running the attached script. The scripts creates many files in a
> >> loop, keeps them all open and removes them again. With this approach we
> >> hit the problem about once every two attempts.
> >>
> >> The problem appeared for the first time after we switched from kernel
> >> v4.7 to v5.3. I tried with v5.4 and master too, in case we are hitting a
> >> problem that is already fixed, but they show the same problem. After
> >> doing some bisecting, this commit appears to have introduced the problem:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/ubifs/orphan.c?id=ee1438ce5dc4d67dd8dd1ff51583122a61f5bd9e
> >>
> >> How can we fix this?
> >
> > Just adding Richard into the loop, he is not available right now but
> > will probably be interested by this issue. On my side, I have no clue :)
>
> Thanks. If additional info is needed, or some extra testing is
> necessary, just ask. I'm happy to help to get this fixed.
>
> For now, we have reverted the above commit. That appears to work (e.g.
> no more device that fail to boot), but I'm not convinced it's a good
> long-term solution.
>

Looking at the comment in the mentioned commit: "This corner case
needs to get addressed in the orphans subsystem too."

Was it addressed?  Was there a second commit for that?  If so, is it
in your tree?

Beyond that, no ideas, it's not a chunk of code I am familiar with.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
