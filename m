Return-Path: <SRS0=p/ok=GY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45289C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 08:44:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF63D2399C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jan 2021 08:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF63D2399C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5yFH7XAywD5QFiNe/0AkmJrRpj/Auaqhu4MAvo/kus=; b=t3Gy5DGgXKAbr/vIX9TftVrFD
	n5OWSSaVmpkWSe6wRRQK/UtDxyNbH2e4ykWtyQh2OGwbc2Vw6e2vNjMJWOORzbgAKY+xvsex5yQt4
	fKsT+PE7q1PdbHI6HXq4yLrMTWfC3o6xQ/JY7CgcQQihrV2nTvhPAj3rReHLSjjDZmSOx7AbAcIX3
	9tWxa6FupZM4W5EyV/2BiVoevr9+tAfKi0CBRmZ9ubiyjUkZUyloAiGfUGi4Gd9rmfoZf6dI1gkzc
	wAACGNmRQEcKYvjD7nCZudahofW7QhietbDUoCj03/Ffb5ETwy+kqnxEjAoFlS8lsNWAOFYVvW+yh
	iUSpFjQPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2VZA-00070c-Bc; Thu, 21 Jan 2021 08:43:44 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2VZ4-0006z2-4H
 for linux-mtd@lists.infradead.org; Thu, 21 Jan 2021 08:43:39 +0000
Received: by mail-io1-xd34.google.com with SMTP id x21so2427901iog.10
 for <linux-mtd@lists.infradead.org>; Thu, 21 Jan 2021 00:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIlZrNylKABGRhADiZfUff5utKrz9jANG/rx8atXzws=;
 b=nwZXOpVYUe5Tfm9x2JngaoGYUCxEhy4uaRT5wfFUlEiE1JfN/kiFGY81x2nTnDbM4E
 7NxCQwzGkT+hxc+6AHacLU1iuqyiwSIcWCyy8Ad4Oca2Tx34AVlAqFSilfwsOC6JJYNO
 BjS9vsH/XhIfFa/lYGE4URBISMjeenzi8z6e+lOBut6BL0q5tm5SiNKEk6jjNPMGJsex
 xa7OyA9fyCEcTSTbQeOrtD6g/ZtPZ07kM/Jvexs/fbq/Gv/J4Wn1gqbvw78W4+1uEQ9t
 5tHsQSt5ZCMtZHYCh/rMZQS3JErvG8PH5KGlRla9CXA+qzX1zBTjI/RvFMbDgfZQBdtY
 KtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIlZrNylKABGRhADiZfUff5utKrz9jANG/rx8atXzws=;
 b=jqSEg97U/q2LFFoXY9SePZBLBbpsB2o/CG1i2LtQwmtIj7nWLKLqBJFV88N2B311ys
 MpgCk4fy/HMtXAmDGQmHaO+hE6CEANBTjwg08teweZOYM34lKBdsO2fYCWPW1jqG4+GY
 +5SshcpJHZBGj2ssSDCftlB/WzcwAnK2C2GuOlw09WNC41vIjvuL7zzqtaGb4TDxqsMA
 AyC8W6O10BpsX1ASeW9VO3vUULVdAZL2717CbpRcIdrUJOBLl6M9Bp+stfA8RyQXFT32
 yxzCg5hzA+oqcv/9wFMCcXtJ+6gwEU5DpJBBsTR1ciXYf1A4SHrgMgLVvmGrPgWNABG4
 8QFw==
X-Gm-Message-State: AOAM530TjFEbMXfnoOi88gFOGP3sORKyczol9YgnLtDJKsMYKB13c3ZS
 D81m7OrWpB6bsURrP1YYPRh+Gn0xqNmPFIkB9w8=
X-Google-Smtp-Source: ABdhPJwnu2R63N462+ucITpfFNE4tGRMI83XjRzubGoAprF7ewYI5kpyEUwUBMkuPIAHd82jrMOVjzSWM1l0Q2yXRAU=
X-Received: by 2002:a6b:2d7:: with SMTP id 206mr9656309ioc.197.1611218613723; 
 Thu, 21 Jan 2021 00:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20210120133847.GA19063@pengutronix.de>
In-Reply-To: <20210120133847.GA19063@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Jan 2021 09:43:22 +0100
Message-ID: <CAFLxGvyQ1v17QTWGQbL0yHOZuguFWS9torO-yLWD2zGk3Rkazg@mail.gmail.com>
Subject: Re: ubifs: ubifs_purge_xattrs() wrongly called
To: Sascha Hauer <sha@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_034338_278132_84F65D13 
X-CRM114-Status: GOOD (  15.34  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Sascha,

On Wed, Jan 20, 2021 at 2:45 PM Sascha Hauer <sha@pengutronix.de> wrote:
>
> Hi All,
>
> I just noticed that ubifs_purge_xattrs() is wrongly called from
> ubifs_unlink() when a dentry is deleted. Deleting a dentry doesn't mean
> that the inode the xattrs are attached to is going away. Removing a file
> that has hardlinks will result in removing the xattrs when instead they
> should stay until the last link is removed.

you are right, that's a bug we need to address.

> ubifs_purge_xattrs() only removes the xattrs when their number exceeds
> ubifs_xattr_max_cnt(). Otherwise it does nothing, so it's unlikely to
> hit this bug in real life.

Yes. The idea is being able to remove inodes from old filesystems
where we didn't
had the limitation.

> I am not sure how to fix that. Maybe calling ubifs_purge_xattrs() from
> ubifs_evict_inode() would be correct, but I haven't looked deeper into
> this.

I can't remember right now why I didn't use the evict path.
Hmmm.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
