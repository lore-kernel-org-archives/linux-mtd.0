Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8784CC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 21:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UY72J9/8vlH3dCe3aWpIyEdl0oNe2ZhvQUPFzfBGGic=; b=QmTTKy446F/u/h
	5f6gBuH95pznjpgMTHNoZU/FaSAznq3syaCUK4XfxS8f4I8YhQ9rLc2HM+bLozqEt6UllJClzVmbz
	ByBNkeKlhziR3gMsVtLp766QZMcUNr/qgZXnnvyHMHHeeVUmjno3OkJuC3yCJtHDVXnvOc9ebXYkj
	dBZZwy3JSZoDb1eH0YumfdtRd4DKebn5cvXuqvZj/virEaZRfAwdsUs4eJfg0J9LzD7yeiQ89ydkg
	c5nwwRsY/2xrLM/uBULrI5nm8QdNRKXShWv3ijvtWIewuQyHQWsV0g/gmqaiz8vCSJXvze50NwZs5
	4Ce4/90I8UrX3WBmTM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrW-00000000R6z-1hUh;
	Sun, 20 Sep 2026 21:14:14 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OrU-00000000R5o-1y0Z
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 21:14:13 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 00721157ae682-85d43f9b119so18579227b3.2
        for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 14:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938851; cv=none;
        d=google.com; s=arc-20260327;
        b=mLFIpYlfMBAoxpuLUymEwmpHbn4j+tLbSlDwXsG5eH83qd5UJ5Luz3ey8E2dCNho2d
         W/oYEcL+H3kG/dGjxrVAp7bf/32DjUMcTrc4bIm4jL2dbh0hspprNhAWwVIDKjnFtA48
         Xcs9xlsnQVWiPXtgtCLYc1J9E2IO3945riUoDDDbSAd+SaQcR5BH5cBQjgf6DGJEi3FP
         PkjLEtar07EVK5luEE/yuzjxyvU7OvvVJQtpOAHysJZpi24gF9tiC3LyGexOk5Nxw3jX
         U/PmJvXvAO05sstPBs+FQ6hZGQxsutR+ypCjmDZhTFJ1pifHUzzQ2rtXSxXtZYQSqPxf
         LoTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        fh=Yk4LX9uwNv7VNkQ0TxNoHBcLYqXDnAS6QlJDDaPQgQA=;
        b=RD/zCQhnQBEQnz3GOFfi7b7DELKDNw+VXcQZ35878Q0A8mtwL38Bn7kAVZ0FF31tXv
         UeA+Ny8oqvEQ2PJcuT/VI5F2/lr18RVLMONgrK2faORSZj/ZM5GlX7FEO6wAe+xPAk52
         dvTq8tZYneIOgvxYOQnVWjSqIejY49oqV6B4EmpJa7mCfmrdJtaf2Y93Y3xns625wowE
         HnK/FDhkbzIJSDCDbxpBQtBiehsUL2kje1TAArtO1zezSIxBAWduC0wIisGehWVX9HmE
         N+gX+h7bL+nxBWWystqi+xzou8TeJ43n6GzjxCgi0aMtTy2fyDYtKGeWTId25RVjvKgX
         vMNw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789938851; x=1790543651; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=Sbuu2BDTBwlBOPNxL86uYPeD115BiU/alSTDw27kBipKG3xoI6Zrxu1x6Sn9VeUpWE
         XNfwEEwGCOobeEiE0I+5E4b45DgVZ1TDAXsWTGDMsxV34u4usPyJYTWiV/MSICRaz4/+
         fiA/cwXCuTvN4Po2JFRNlxd8A5vREolRIPnDSvtw8KJJ4dWAx925zIk9fgTnSVAjpAzx
         5o8mdPC8ADjI1Rh5jxOIsVi6LVP3on6QDZrwlzNuueOtaTcbTvlhKWV7msT7tGdJsOh8
         ICCcJLQI7f0aNiNZVvJXcxFGqt2m5DUblqPwjtyuh6A0O3q/6jQkm/u5U6K9VbZhLMCN
         l4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938851; x=1790543651;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MspPu0+DEulTacQxx9QyZ/LDtlKZj0ul+YFa8hoOWcc=;
        b=yyMOdBz85C3TIhFDirGig5xKdsdC8T3HvYbqg00j3p3FW104P7AT5c9+W6BnhmFcVP
         M+4uEjDNsHjv3ekqHIpvlPAcQiJq2aIwRrinzT7x98/ZYYK4tXCAVjCnE4vahlpRtoVy
         bNqEKRFygIxPKTF7/9N/v/st1eynl+0mmzPxJ2/jhwlYfcUiB5nlgA+QutiL6t7TVZnF
         eeK0H1fESJberfqPqEiKl4Dj4ytDqmNpiP3/+cLfMJl3JP7WkFYUUubxD2J4WTTaMawz
         F+mUClmhXchrfy/cBmX9ArJyuw8nBUZfovraUjEF4asXlUzgdlYHOWaxVzfpKMsXI6AX
         8QHA==
X-Forwarded-Encrypted: i=1; AKwUvBzdB+fK8g2un+/Fa9jSuZBn743B5Yhf8v4ZaypUrTs9w3OMFf9hE+96t4tYbGp/jVg5O3sQCzIcxhQ=@lists.infradead.org
X-Gm-Message-State: AFuF++ncJavK5QUCTRBoT6KAzDcqMkz8QNadRLOU2MeEb9sldS0bJF9J
	Df+x8WymTWGJv4HTdlj14TZIjbM/PZfq8nQduF5mpbKh0agFVSWQWaybRCdxhsb0cxvc/4SbmIn
	ZrJep6Lpk7pgu2/UNAR4jWCqkjVkQCVEvKUD3hHA5Dl4=
X-Gm-Gg: AYBFou3yF84Xtnwf5bHs5/86kmCmcg/hnK6UE9HBI7nB06dt/RiCxiD79vUbuDndnBd
	sPa7mR12VwYriTwIlmkeDt8t6ku2fVu64lXNlPX3YG9gy7VtJU8iXLR6bfr8k4is5YUM/0A02Ou
	8M1Z2By819an+U3OHY/HxcqOrNQOmUeqVULz7mGn84lQ4rbOvVj1SGK9/YNU71/yCS2HFMF2kYW
	yzbcltUyrYtwEdfbKxPF3zWv+FGlZNq0WCrxAHIiV+tr4bF38ejE8lYSDracaxTtr5uxF4gtqgD
	5RgYRvSlF9/qE0hCI1ASAPvUh0iv9UQjg5v7uqO/xN3seGbd2kwAv2i1GNMsCsGMa+sPZxuSrfm
	ESuBjOiOjYuCPZd8I6RpCAOpQesqi4B/raD7a53DtlUlwsd+vJgNQ5saEt6BlimU0O8+6R6TXiN
	5MR4/ZcgieyndErg==
X-Received: by 2002:a05:690c:e681:10b0:863:e8cb:7773 with SMTP id
 00721157ae682-897346e315dmr20106047b3.32.1789938851178; Sun, 20 Sep 2026
 14:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
 <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com> <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
In-Reply-To: <muab72x3.7c175620-35e4-4686-b377-487e6c270ea9@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 02:43:56 +0530
X-Gm-Features: AcwNN1WbQLG4glywQGVIDhxD1uJUtzAMcMfTWSPukcrARUaPtDIjPzyQr6Yayyo
Message-ID: <CAE2Bdm1zFXr7UErCUR5KR-aGj=baCh--gaiDzZhjepF-_6H6ZA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_141412_533209_1C079338 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Richard

> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
> ...
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.

I have encountered some bugs with the sashiko bot. So, this gives me
the perfect opportunity to
re-design with your inputs and propose an RFC-style doc including a
bigger patch within the next
day.

Regards,
- Chris

"But how could you live and have no story to tell?"

On Mon, 21 Sept 2026 at 02:39, Richard Weinberger <richard@nod.at> wrote:
>
> Am Sat, Sep 19, 2026, 16:44 schrieb Chris Roy <iam@thechris.in>:
>
> > On Sat, Sep 19, 2026, Richard Weinberger wrote:
> > > While we're here, maybe it's time to add a decent configfs interface to
> > > this driver instead of configuring through module parameters.
> > > That way also multiple instances are possible.
> > >
> > > IMHO testing is the only use case. I use it regularly.
> >
> > I would love to look at this if you think it's worth the added
> > complexity. A couple of design questions before I start
> > on anything:
> >
> > - Does configfs coexist with the existing block2mtd= module param
> >   (for early-boot/cmdline compatibility), or replace it outright?
>
> Keeping the module parameters is not a hard requirement but would be nice.
> Ideally, the module parameters prove an initial configfs setting.
>
> > - For multiple instances, would a configfs group per device (backing
> >   path, erase size, label) match what you had in mind?
> >
>
> Yes. See how nvmet uses configfs. A similar, but simpler, approach
> will do it for block2mtd too.
>
> > Can sketch an RFC-style doc once I have a sense of the above.
>
> Sounds good.
>
> Thanks,
> //richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
