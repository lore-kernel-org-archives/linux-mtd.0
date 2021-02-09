Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6DCC433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 19:43:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC7FC64E7D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 19:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC7FC64E7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SttCcH2vNlz9UtFjaNgjFMRfdzkrTzqjJQb1+xHMmAo=; b=LS3R0ODyEKHXTYWoSO0Y4XG3C
	tDwERX4uP5OJFuImYzcbR2eSGjcDQQCYNXhhXVFkcgkgqmJhnLxPV03FWUlcEGbn/OBqaBtIL69wL
	TEpnzq+BFerNCP+LMRjTI3xMMo7wG0MlDEAzfOjWaQWp2BqUZbV9UZkU7rsLTOOmMqGXMsXjANZQC
	rpZiZaCTmfC/tDc4lzRkKPJt+LNEiZHszCJtSGiROzwE6zLtjaKv5Q4AMUA9mHKl4juobmMS0vMwN
	4qQNXyFMTewGq5pPZvGeuq403locprvLKbyNwKGZZlP3DzwuvJ/1wG27qjfBe0GrMVKARtvCWfaUg
	k8+C8xneA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Ytx-0008Mz-Rh; Tue, 09 Feb 2021 19:42:21 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Ytv-0008Me-P4
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 19:42:20 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id d24so3636639vso.6
 for <linux-mtd@lists.infradead.org>; Tue, 09 Feb 2021 11:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVkeQ98gZC/WtM29syvVdUx6myl4MG6yxXdk4w7aNRA=;
 b=OJJXtGL9c7jgVhHGqmY3y6H4AfhaGCwQWX+BR76qw1BMHgZ9fHPifCSkfH1lySA53a
 ZJFzSpG9cYf+jJgStIOVP+nM5TysSLKLadf4pJ4DBl7p4KIwd4dhhKdKpNE64KFtw8aA
 thh9mA+G74hZhJnhthV9lhzQsQ7o6IrOGab1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVkeQ98gZC/WtM29syvVdUx6myl4MG6yxXdk4w7aNRA=;
 b=dVudTGEmjgGUpWXJgFXe6CIBqSJv39p/gKDa5duARtZV1xXi71iiIIQxyaxXsGwnso
 Doz+dq0+uPqbpurA4b14EYequL77UzC/aq3ounMlxX/WF8Z/wkL4hho7qN1YJTRceDOL
 5ZaI+S3UoQd9X/hIYBpSHy1ZBPcli4yLaneXPUBcJ6/Azs1WctjFsVByHs4kDMP3srLf
 aJixFN9pHrEdlyzXebS5sg6U0wvoP7HZfQOEn6TAcIacUQlnoCERKXTvn03RH0HNfbPy
 6jMcv3oPQq1xAHk1vV04hA+lciHat57seeiDZkV17ee1rMPjrY/fohy1SM5mYAEt53Vm
 LaGw==
X-Gm-Message-State: AOAM530kA3Khp0Nae83ewtBSq4lwrBTT2yumMbhthKK7291OPSwB1xU9
 Z5dhkSUb6aDvV5tW8fPwbWG/oZ6feEi5Yo44NPO6BDL/TC0=
X-Google-Smtp-Source: ABdhPJxGtm5AhIYFG7mwoNYSB5MZ2gRSgS3unJDW4SrX/3ZQi3am0dy2Qrn9lYwlZdhmt02q4UH085BD0g4Mf7JlBcQ=
X-Received: by 2002:a67:2283:: with SMTP id i125mr14546958vsi.21.1612899737896; 
 Tue, 09 Feb 2021 11:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
 <443281182.378615.1612885278254.JavaMail.zimbra@nod.at>
 <b2424246-d42b-d0bc-8951-8cefdf5b681d@studio.unibo.it>
 <1517729157.378701.1612886684264.JavaMail.zimbra@nod.at>
 <ad4fd822-016e-e11e-682c-077a1ced2a18@studio.unibo.it>
 <231074135.378774.1612888173941.JavaMail.zimbra@nod.at>
 <705c010b-653a-1dd0-87b9-f3cc83c21802@studio.unibo.it>
 <492787386.378826.1612889412476.JavaMail.zimbra@nod.at>
 <dc083537-fced-f502-f8b5-189b1827ab1b@studio.unibo.it>
In-Reply-To: <dc083537-fced-f502-f8b5-189b1827ab1b@studio.unibo.it>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Feb 2021 20:42:06 +0100
Message-ID: <CAJfpeguRtL=MwaCWpRVDWhVwqyTLHgp5FJ5Hb7PFALw+devDTw@mail.gmail.com>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Luca Risolia <luca.risolia@studio.unibo.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_144220_033521_8B9FE84B 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven <sven@narfation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 9, 2021 at 6:46 PM Luca Risolia
<luca.risolia@studio.unibo.it> wrote:
>
> On 09/02/21 17:50, Richard Weinberger wrote:
> > Well, I think having a generic mmap() for CUSE is hard to achieve.
>
> Hard or not it did work for what I can tell you. I was not the original
> author but I certainly contributed with testing that patch. Just to be
> clear, by "not considered" I meant both the patch and the request were
> completely ignored with no answers at all, silence in other words.

I don't have any bad feelings about CUSE mmap, it was definitely not a
personal thing.   But it also wasn't something that many people were
requesting, and the silence was probably at about the time that I was
taking a leave from paid maintainership.   So a number of factors.

Patches are still welcome, if it's something that is used in practice
(e.g. by Android) that's a plus point.

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
