Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B28C10F14
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 23:45:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF8720862
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 23:45:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TN+R5x8V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frXHPDCr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF8720862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Jh3Grw3WT2iOIh7ZnjIDqldNs5DBo/2765jJZQa50g=; b=TN+R5x8VszNGMe
	ZJU4md6aDt4caRy8AxHxwCuRfm1ft9AOxUws6pNIZ92A6FhFcKK3iaj3g/cqlSDRuWYzLKFWrqDS6
	YIeFtOdHGvLkqxn5+0NJrITfDYoYtQYvpSlgMlWpxGMfMdWqBl6uZMEhtT7tAMrK2uBaehwf5BdQW
	naIeb6R1jRHDG9vrSjCvGOBUs7D1SyRztsPBxCQF4tyL96UEc7jvUBDRBezkzODMU3aLN5U9oKmqy
	sF5jBbBrN6VUbv5a1d+OmVjbKSsTmsm+32O0qXpxMQKlI3yfUk5f5A4mEZFmFwWR57iR48jEs+fdK
	H1DSeV9TeXkmlB1bDdXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGAmm-0003Gc-50; Thu, 03 Oct 2019 23:45:28 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGAmj-0003Fk-7J
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 23:45:26 +0000
Received: by mail-qt1-x843.google.com with SMTP id u22so6087135qtq.13
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2019 16:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yNKu+dEJK/OmXkFRms//tEICevZH8AmAV/gDLbHBwPg=;
 b=frXHPDCrNpSOvIxd6UDDiT3QfhI7fLmGLwFeJmFR9KYOuYTv9RyZdE1VPDQ2KjtFzd
 LWkv4JAEPCdpDCBvGPYmhuDf1koZewJCIWVamwdaAuXYbexHb1KgXgfUcj1W3aJ6zZru
 mEszTHDT9yWYY8fgUqcSAmhN7K83vtMjBJHrCy2U/YfxS2J3KybS/LpQV2pR0Cvfrh1Q
 iCnZnof/ii7U/5QXMHNCb1nYD6CnneQ2waaJgcAP+D/DcRsAsx0bhp85HTIaJjKlgcNw
 GpfkaPjQ8DUgknQRwwhA4APPuLqHxOhOJ2HD9ZhNAXeW6NL5mPJ3WztIYraQILXRfbU7
 CEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yNKu+dEJK/OmXkFRms//tEICevZH8AmAV/gDLbHBwPg=;
 b=dCFLpKKgm1Xv6lGSfdvM27lP777pHOotwELzck8D11bYglSeFNm5vXe0ZoUy9YqlrI
 JiJTBI5YoGYQr8Gw/R1DOkDkuLsLv+YxtCZ25dEpJUOqGGBWFwctdzUAquHvj9ESiw7q
 EpFZz/v4xPuQASd9N51ceik8ooE8/sw23uMlw29N5WiYgtUgni1n9CE6jHA3Ve4n7o+O
 /lw8ZKJ2khkQlFtUoo/DcoPNEDwU6SxzuxaQVwcK6dpU0GHtTuogezcL3B0klr2glPcm
 StOcHR8NhqOYkekeej2OnjR3E6pFLHY8cmekfmErt9q+CowB/asOcD1FC1pj14hbL4Mr
 NKcg==
X-Gm-Message-State: APjAAAWw6+hdrYAjpCA80Mi0qkT0UqNLf62yNzRt3xk3ecRDU8CV4ppb
 /UcmjitBL93DWAOfxOKU/qeOZATEtkD/bJeiu5c=
X-Google-Smtp-Source: APXvYqxwkfQBhVgDPgt3npITZfhIBcnuTEyJqFRluZXsBrZhypn5rbYTzlBydjTVlgRqPclwT1f0hR4bdBy9ilKeWow=
X-Received: by 2002:a0c:f787:: with SMTP id s7mr11115939qvn.221.1570146320742; 
 Thu, 03 Oct 2019 16:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
 <CAFLxGvxg3dYoiiTy7=vNwC75s529akqx0DO3ozLrP_TbhATr_g@mail.gmail.com>
 <CAA=hcWTzAMU5GvGzcG2Ha5RH_=QUTEAa3gZkMoe=cgtZGG+h+Q@mail.gmail.com>
 <CAFLxGvwUK=hb6b_hX8HSTVzAZW7djBL_3bRWvTXcVUw+FuBTmw@mail.gmail.com>
 <CAA=hcWSYNtCyN460gw1LNJe3M2TCiXKUzv84_kCG3PO78BweDw@mail.gmail.com>
In-Reply-To: <CAA=hcWSYNtCyN460gw1LNJe3M2TCiXKUzv84_kCG3PO78BweDw@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 3 Oct 2019 16:44:44 -0700
Message-ID: <CALLGbRJKJYcwHKGML00GB9mWG7U_EjAnEUSL+HxmHmWXjZY1vw@mail.gmail.com>
Subject: Re: How the bad blocks occured in despite MTD manages the bad blocks
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191003_164525_289410_75597C21 
X-CRM114-Status: GOOD (  15.47  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 3, 2019 at 2:26 PM JH <jupiter.hce@gmail.com> wrote:
>
> On 10/3/19, Richard Weinberger <richard.weinberger@gmail.com> wrote:
> > On Thu, Oct 3, 2019 at 1:14 PM JH <jupiter.hce@gmail.com> wrote:
> >> I was told by hardware engineer, it was broken by bad block problem.
> >
> > Did he inspect the filesystem in detail?
> > If he said so based on the same information you shared with us, it was
> > pure guesswork.
>
> Yep, he did.
>
> >> After those lines, the boot stopped in an emergent mode in a prompt to
> >> suggest to log in by Ctl-D, but that could not work, I was not able to
> >> log into the file system, nor can I get kernel log. From your
> >> experience, what could be likely the causes, hardware or software?
> >
> > Without logs I cannot say anything, sorry.
>
> That's ok, as long as I learned it is not caused by bad blocks, I
> doubt the software caused meltdown, even the full of file system would
> not cause the damage if NAND. So, my finger would point to hardware
> problems.
>

Don't be so fast - you don't have enough information to determine what
the problem is. That it is or is not a hardware or a software problem.
You need real kernel logs from the system to even begin to have a
clue.  In my experience there's often many things wrong and you're
only going to figure out what the root cause is by understanding the
system. "it's not a software problem" and throwing it back over the
wall to the hardware team is just going to result in them turning
around and doing the same to you.

Honestly - it likely is a software problem. Configuration or bug or
process issue. But fundamentally you don't know because you don't have
meaningful error messages.

Your error messages should show on the bootup terminal output. If
you're suppressing the kernel log messages, change it so you can read
them, boot to failure and scroll back and see what's there.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
